function New-DotnetProjectFromYaml(){
    param(
        [parameter(Mandatory=$true)][object] $ProjectDescription,
        [parameter(Mandatory=$true)][object] $SolutionDescription
    )

    New-DotnetProject -Name $ProjectDescription.name `
                -Template $ProjectDescription.template `
                -Language $ProjectDescription.language `
                -ExtrArgs $ProjectDescription.template_extra_args

    foreach($package in $ProjectDescription.packages) {
        Add-DotnetPackage `
            -CsProj "$($ProjectDescription.name)\\$($ProjectDescription.name).csproj" `
            -Package $package.name `
            -Version $package.version
    }
}

function New-DotnetSolutionFromYaml () {
    param(
        [parameter(Mandatory=$true)] [string] $Yaml
    )

    Import-Module powershell-yaml
    $yamlContent = get-content -raw -encoding utf-8 $yaml | out-string
    $solutionDescription = ConvertFrom-Yaml -Yaml $yamlContent

    Write-Host "Generating Solution $($solutionDescription.solution.name)"
    New-DotnetSolution -Name $solutionDescription.solution.name

    Write-Host "Updating Solution $($solutionDescription.solution.name)"
    Update-DotnetSolution -SdkVersion $solutionDescription.solution.global.sdkVersion

    Write-Host "Generating Projects for Solution $($solutionDescription.solution.name)"
    foreach($projectDescription in $solutionDescription.projects) {
        Write-Host "Generating Project $($projectDescription.name) for Solution $($solutionDescription.solution.name)"
        New-DotnetProjectFromYaml -ProjectDescription $projectDescription -SolutionDescription $solutionDescription

        Write-Host "Adding Project $($projectDescription.name) to Solution $($solutionDescription.solution.name)"
        Add-DotnetProject -Name $projectDescription.name `
            -Solution "$($solutionDescription.solution.name).sln" `
            -SolutionFolder $projectDescription.solutionFolder `
            -CsProj "$($projectDescription.name)\\$($projectDescription.name).csproj"
    }

    Write-Host "Linking Projects"
    foreach($projectDescription in $solutionDescription.projects) {
        Write-Host "Linking Project $($projectDescription.name) for Solution $($solutionDescription.solution.name)"

        foreach($linkedProject in $projectDescription.projects) {
            Write-host "Linking Project $($projectDescription.name) to Project $($linkedProject.name) in Solution $($solutionDescription.solution.name)"
            Update-DotnetProject `
                -CsProj "$($ProjectDescription.name)\\$($ProjectDescription.name).csproj" `
                -DependencyCsProj "$($linkedProject.name)\\$($linkedProject.name).csproj"
        }
    }

    Write-Host "Building Solution $($solutionDescription.solution.name)"
    Build-DotnetSolution -Name "$($solutionDescription.solution.name).sln"
}

Export-ModuleMember -Function New-DotnetSolutionFromYaml