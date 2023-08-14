function Update-DotnetProject() {
    param(
        [parameter(Mandatory = $true)] [string] $CsProj,
        [parameter(Mandatory = $true)] [string] $DependencyCsProj
    )

    start-process "dotnet" -ArgumentList @("add", $CspRoj, "reference", $DependencyCsProj) -Wait -PassThru -NoNewWindow
}

Export-ModuleMember -Function Update-DotnetProject