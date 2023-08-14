function New-DotnetProject() {
    param(
        [parameter(Mandatory = $true)]  [string] $Name,
        [parameter(Mandatory = $true)]  [string] $Template,
        [parameter(Mandatory = $true)]  [string] $Language,
        [string[]] $ExtrArgs
    )

    $processArgs = [System.Collections.ArrayList]::new()
    [void] $processArgs.AddRange(@("new", $Template, "--language", $Language, "-o", "${Name}", "--name", "${Name}"))

    if($null -ne $ExtrArgs -and $ExtrArgs.Length -gt 0) {
        [void]  $processArgs.AddRange($ExtrArgs)
    }

    start-process "dotnet" -ArgumentList $processArgs -PassThru -wait -NoNewWindow -WorkingDirectory ./

    Move-Item $Name/*.csproj $Name/$Name.csproj
}

Export-ModuleMember -Function New-DotnetProject
