function Update-DotnetSolution() {
    param(
        [string] $SdkVersion
    )

    if (![string]::IsNullOrEmpty($SdkVersion)) {
        start-process dotnet -ArgumentList @("new", "globaljson", "--sdk-version", $SdkVersion, "--force") -Wait -PassThru -NoNewWindow
    }
}

Export-ModuleMember -Function Update-DotnetSolution