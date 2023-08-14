function New-DDDSolutionFromYaml () {
    param(
        [parameter(Mandatory=$true)] [string] $Yaml
    )

    Import-Module powershell-yaml
    $yamlContent = get-content -raw -encoding utf-8 $Yaml | out-string
    $solutionDescription = ConvertFrom-Yaml -Yaml $yamlContent
    
}

Export-ModuleMember -Function New-DDDSolutionFromYaml
