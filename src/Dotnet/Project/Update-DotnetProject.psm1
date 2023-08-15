function Update-DotnetProject() {
    param(
        [switch] $AddProjectReference,
        [string] $CsProj,
        [string] $DependencyCsProj
    )

    if ($AddProjectReference) {
        if ([string]::IsNullOrEmpty($CsProj)) {
            throw new "-CsProj is null or empty"
        }

        if ([string]::IsNullOrEmpty($DependencyCsProj)) {
            throw new "-DependencyCsProj is null or empty"
        }
        
        start-process "dotnet" `
            -ArgumentList @("add", $CspRoj, "reference", $DependencyCsProj) `
            -Wait `
            -PassThru `
            -NoNewWindow
    }
}

Export-ModuleMember -Function Update-DotnetProject