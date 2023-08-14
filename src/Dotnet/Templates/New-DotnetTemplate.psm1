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

function New-DotnetTemplate () {
    param(
        [parameter(Mandatory = $true)] [string] $Name,
        [parameter(Mandatory = $true)] [string] $Author,
        [parameter(Mandatory = $true)] [string[]] $Classifications,
        [parameter(Mandatory = $true)] [string] $Identity,
        [parameter(Mandatory = $true)] [string] $ShortName,
        [parameter(Mandatory = $true)] [string] $Language,
        [parameter(Mandatory = $true)] [string] $Type
    )

    mkdir $name
    mkdir $name/.template.config

    $def = @{
        "`$schema" = "http://json.schemastore.org/template"
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

    $json = $def | ConvertTo-Json

    $json | out-file $name/.template.config/template.json


    $dotnetCliHost = @{
        symbolInfo = [System.Collections.ArrayList]::new()
    }

    $json = $dotnetCliHost | ConvertTo-Json

    $json | out-file $name/.template.config/dotnetcli.host.json

}

Export-ModuleMember -Function New-DotnetTemplate