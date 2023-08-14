function Open-DotnetSolution() {
    param(
        [switch] $Vs,
        [switch] $Code,
        [parameter(Mandatory = $true)]  [string] $Name
    )

    if ($code) {
        code $WorkingDirectory -n
    }

    if ($vs) {
        . "C:\Program Files\Microsoft Visual Studio\2022\Preview\Common7\IDE\devenv.exe" /rootSuffix Exp $Name
    }

}

Export-ModuleMember -Function Open-DotnetSolution