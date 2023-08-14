function Build-DotnetSolution(){
    param(
        [parameter(Mandatory=$true)] [string] $Name
    )

    start-process dotnet -ArgumentList @("build", $Name) -PassThru -Wait -NoNewWindow
}

Export-ModuleMember -Function Build-DotnetSolution
