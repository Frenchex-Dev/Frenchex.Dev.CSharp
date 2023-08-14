function Add-DotnetPackage(){
    param(
        [string] $CsProj,
        [string] $Package,
        [string] $Version
    )

    start-process dotnet -ArgumentList @("add", $CsProj, "package", $Package, "--version", $version) -Wait -NoNewWindow -PassThru
}

Export-ModuleMember -Function Add-DotnetPackage