function NotImplNew-DotnetTemplate () {
    param(
        [parameter(Mandatory = $true)] [string] $Name,
        [parameter(Mandatory = $true)] [string] $ShortName,
        [string[]] $TemplateArgs,
        [string] $TemplatesDir = "./templates",
        [string] $Output,
        [switch] $DryRun,
        [switch] $Force,
        [switch] $NoUpdateCheck,
        [switch] $Project,
        [string] $Verbosity,
        [switch] $Diagnostics
    )

    $processArgs = [System.Collections.ArrayList]::new()

    [void] $processArgs.AddRange(@("new", "create"))

    $processArgs.Add($ShortName)

    if ($null -ne $TemplateArgs -and $TemplateArgs.Length -gt 0) {
        $processArgs.AddRange($TemplateArgs)
    }

    if (![string]::IsNullOrEmpty($Output)) {
        $processArgs.AddRange(@("--output", $Output))
    }

    $processArgs.AddRange(@("--name", $Name))

    if ($DryRun) {
        $processArgs.Add("--dry-run")
    }

    if ($force) {
        $processArgs.Add("--force")
    }

    if ($NoUpdateCheck) {
        $processArgs.Add("--no-update-check")
    }

    if (![string]::IsNullOrEmpty($project)) {
        $processArgs.AddRange(@("--project", $project))
    }

    if (![string]::IsNullOrEmpty($Verbosity)) {
        $processArgs.AddRange(@("--verbosity", $Verbosity))
    }

    if ($Diagnostics) {
        $processArgs.Add("--diagnostics")
    }

    start-process dotnet -ArgumentList $processArgs -wait -NoNewWindow -PassThru
}

function New-DotnetTemplateFromYaml() {
    param(
        [parameter(Mandatory = $true)] [string] $Yaml
    )

    Import-Module powershell-yaml
    $yamlContent = get-content -raw -encoding utf-8 $yaml | out-string
    $templatesDescriptions = ConvertFrom-Yaml -Yaml $yamlContent

    if ($null -eq $templatesDescriptions.templates) {
        throw "templates is null"
    }

    foreach ($templateDescription in $templatesDescriptions.templates) {
        New-DotnetTemplate `
            -Name $templateDescription.name `
            -Author $templateDescription.author `
            -Classifications $templateDescription.classifications `
            -Identity $templateDescription.identity `
            -ShortName $templateDescription.shortName `
            -Language $templateDescription.language `
            -Type $templateDescription.type `
            -Symbols $templateDescription.symbols `
            -Packages $templateDescription.packages
    }

}

Export-ModuleMember -Function New-DotnetTemplateFromYaml

function New-DotnetTemplate () {
    param(
        [parameter(Mandatory = $true)] [string] $Name,
        [parameter(Mandatory = $true)] [string] $Author,
        [parameter(Mandatory = $true)] [string[]] $Classifications,
        [parameter(Mandatory = $true)] [string] $Identity,
        [parameter(Mandatory = $true)] [string] $ShortName,
        [parameter(Mandatory = $true)] [string] $Language,
        [parameter(Mandatory = $true)] [string] $Type,
        [object] $Symbols,
        [object] $Packages
    )

    mkdir $name
    mkdir $name/.template.config

    $def = @{
        "`$schema"      = "http://json.schemastore.org/template"
        author          = $author
        classifications = $Classifications
        identity        = $identity
        name            = $Name
        shortName       = $ShortName
        tags            = @{
            language = $Language
            type     = $type
        }
    }

    if ($null -ne $Symbols) {
        $def.symbols = @{}
        foreach ($symbol in $Symbols) {
            $symbolDef = @{
                type         = $symbol.type
                defaultValue = $symbol.defaultValue
                replaces     = $symbol.replaces
            }
            $def.symbols[$symbol.name] = $symbolDef
        }
    }

    $json = $def | ConvertTo-Json

    $json | out-file $name/.template.config/template.json


    $dotnetCliHost = @{
        symbolInfo = @{}
    }

    if ($null -ne $Symbols) {
        foreach ($symbol in $Symbols) {
            $symbolDef = @{
                longName  = $symbol.name
                shortName = $symbol.shortName
            }
            $dotnetCliHost.symbolInfo[$symbol.name] = $symbolDef
        }
    }

    $json = $dotnetCliHost | ConvertTo-Json

    $json | out-file $name/.template.config/dotnetcli.host.json

    switch($Type) {
        "project" {
            New-DotnetTemplateProject -name $name -packages $Packages
        }
    }

}

function New-DotnetTemplateProject(){
    param(
        [string] $Name,
        [object] $Packages
    )

    $csProj = @"
<Project Sdk="Microsoft.NET.Sdk">

    <ItemGroup>
      <None Include="README.md" Pack="true" PackagePath="\">
        <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
      </None>
    </ItemGroup>
  
    <PropertyGroup>
      <TargetFramework>net7.0</TargetFramework>
      <ImplicitUsings>enable</ImplicitUsings>
      <Nullable>enable</Nullable>
      <GeneratePackageOnBuild>True</GeneratePackageOnBuild>
      <IncludeSymbols>True</IncludeSymbols>
      <EnforceCodeStyleInBuild>True</EnforceCodeStyleInBuild>
      <PackageLicenseFile>README.md</PackageLicenseFile>
      <GenerateDocumentationFile>True</GenerateDocumentationFile>
    </PropertyGroup>
  
</Project>
"@

    $csProj | out-file $name/$name.csproj

    $readme = @"
# (project-name)

```
(copyright)
```
    
## End-user Installation

## Developer Installation    
"@

    $readme | out-file $name/README.md

    if ($null -ne $Packages) {
        Set-Location $name
        foreach($package in $packages) {
            Add-DotnetPackage -CsProj $name.csproj -Package $package.name -Version $package.version
        }
        Set-Location -
    }
}

Export-ModuleMember -Function New-DotnetTemplate