function New-DotnetSolution () {
    param(
        [parameter(Mandatory = $true)] [string] $Name,
        [string] $WorkingDirectory = "./"
    )

    start-process dotnet -ArgumentList @("new", "sln", "--name", $Name, "-o", $WorkingDirectory, "--force") -Wait -PassThru -NoNewWindow -WorkingDirectory $WorkingDirectory
}

Export-ModuleMember -Function New-DotnetSolution