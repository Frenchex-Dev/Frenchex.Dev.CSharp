function Add-DotnetProject() {
    param(
        [parameter(Mandatory = $true)] [string] $Solution,
        [parameter(Mandatory = $true)] [string] $SolutionFolder,
        [parameter(Mandatory = $true)] [string] $Name,
        [parameter(Mandatory = $true)] [string] $CsProj
    )

    start-process "dotnet" -ArgumentList @("sln", $Solution, "add", "--solution-folder", $SolutionFolder, $CsProj) -PassThru -wait -NoNewWindow -WorkingDirectory ./
}

Export-ModuleMember -Function Add-DotnetProject