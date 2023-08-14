import-module $PSScriptRoot/../Dotnet.psm1 -Force
import-module $PSScriptRoot/../../New-TemporaryPath.psm1 -Force

Describe "Templates" {
    It "should install templates" {
        install-templates -all -install
    }
}

Describe "Solution" {
    It "should create a new solution with SDK Version and simple project with unit test" {
        $cwd = get-location
        $WorkingDirectory = "$PSScriptRoot/../../../tests"
        Remove-Item -force -Recurse $WorkingDirectory
        mkdir $WorkingDirectory
        set-location $WorkingDirectory

        New-DotnetSolution -Name "Frenchex.Dev"
        Update-DotnetSolution -SdkVersion "7.0.400"

        #region Lib
        New-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib" `
                -Template "fex:lib" `
                -Language "C#" `
                -ExtrArgs `
                    "--copyright", """// Copyright Stéphane Erard""", `
                    "--namespace",  "Frenchex.Dev.Filesystem.Lib", `
                    "--param:project", "Frenchex.Dev.Filesystem.Lib"

        Add-DotnetPackage -CsProj "Frenchex.Dev.Filesystem.Lib\\Frenchex.Dev.Filesystem.Lib.csproj" `
                -Package "Microsoft.Extensions.DependencyInjection.Abstractions" `
                -Version "7.0.0"

        Add-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib" `
                -Solution "Frenchex.Dev.sln" `
                -SolutionFolder "Dotnet\\Core\\Filesystem" `
                -CsProj "Frenchex.Dev.Filesystem.Lib\\Frenchex.Dev.Filesystem.Lib.csproj"

        New-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Tests" `
                -Template "fex:test" `
                -Language "C#" `
                -ExtrArgs `
                    "--copyright", """// Copyright Stéphane Erard""", `
                    "--namespace", "Frenchex.Dev.Filesystem.Lib.Tests", `
                    "--param:project", "Frenchex.Dev.Filesystem.Lib.Tests"

        Add-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Tests" `
                -Solution "Frenchex.Dev.sln" `
                -SolutionFolder "Dotnet\\Core\\Filesystem" `
                -CsProj "Frenchex.Dev.Filesystem.Lib.Tests\\Frenchex.Dev.Filesystem.Lib.Tests.csproj"

        #endregion

        #region Lib.Abstractions
        New-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Abstractions" `
                -Template "fex:domain.abstractions" `
                -Language "C#" `
                -ExtrArgs `
                    "--copyright", """// Copyright Stéphane Erard""", `
                    "--namespace",  "Frenchex.Dev.Filesystem.Lib.Abstractions", `
                    "--param:project", "Frenchex.Dev.Filesystem.Lib.Abstractions"

        Add-DotnetPackage -CsProj "Frenchex.Dev.Filesystem.Lib.Abstractions\\Frenchex.Dev.Filesystem.Lib.Abstractions.csproj" `
                -Package "Microsoft.Extensions.DependencyInjection.Abstractions" `
                -Version "7.0.0"

        Add-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Abstractions" `
                -Solution "Frenchex.Dev.sln" `
                -SolutionFolder "Dotnet\\Core\\Filesystem" `
                -CsProj "Frenchex.Dev.Filesystem.Lib.Abstractions\\Frenchex.Dev.Filesystem.Lib.Abstractions.csproj"
        #endregion 

        #region Lib.Domain
        New-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Domain" `
                -Template "fex:domain" `
                -Language "C#" `
                -ExtrArgs `
                    "--copyright", """// Copyright Stéphane Erard""", `
                    "--namespace",  "Frenchex.Dev.Filesystem.Lib.Domain", `
                    "--param:project", "Frenchex.Dev.Filesystem.Lib.Domain"

        Add-DotnetPackage -CsProj "Frenchex.Dev.Filesystem.Lib.Domain\\Frenchex.Dev.Filesystem.Lib.Domain.csproj" `
                -Package "Microsoft.Extensions.DependencyInjection.Abstractions" `
                -Version "7.0.0"

        Add-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Domain" `
                -Solution "Frenchex.Dev.sln" `
                -SolutionFolder "Dotnet\\Core\\Filesystem" `
                -CsProj "Frenchex.Dev.Filesystem.Lib.Domain\\Frenchex.Dev.Filesystem.Lib.Domain.csproj"

        New-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Domain.Tests" `
                -Template "fex:test" `
                -Language "C#" `
                -ExtrArgs `
                    "--copyright", """// Copyright Stéphane Erard""", `
                    "--namespace", "Frenchex.Dev.Filesystem.Lib.Domain.Tests", `
                    "--param:project", "Frenchex.Dev.Filesystem.Lib.Domain.Tests"

        Add-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Domain.Tests" `
                -Solution "Frenchex.Dev.sln" `
                -SolutionFolder "Dotnet\\Core\\Filesystem" `
                -CsProj "Frenchex.Dev.Filesystem.Lib.Domain.Tests\\Frenchex.Dev.Filesystem.Lib.Domain.Tests.csproj"

        #endregion

        #region Infrastructure
        New-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Infrastructure" `
            -Template "fex:infra" `
            -Language "C#" `
            -ExtrArgs `
                "--copyright", """// Copyright Stéphane Erard""", `
                "--namespace",  "Frenchex.Dev.Filesystem.Lib.Infrastructure", `
                "--param:project", "Frenchex.Dev.Filesystem.Lib.Infrastructure"

        Add-DotnetPackage -CsProj "Frenchex.Dev.Filesystem.Lib.Infrastructure\\Frenchex.Dev.Filesystem.Lib.Infrastructure.csproj" `
                -Package "Microsoft.Extensions.DependencyInjection.Abstractions" `
                -Version "7.0.0"

        Add-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Infrastructure" `
                -Solution "Frenchex.Dev.sln" `
                -SolutionFolder "Dotnet\\Core\\Filesystem" `
                -CsProj "Frenchex.Dev.Filesystem.Lib.Infrastructure\\Frenchex.Dev.Filesystem.Lib.Infrastructure.csproj"

        New-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests" `
                -Template "fex:test" `
                -Language "C#" `
                -ExtrArgs `
                    "--copyright", """// Copyright Stéphane Erard""", `
                    "--namespace", "Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests", `
                    "--param:project", "Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests"

        Add-DotnetProject -Name "Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests" `
                -Solution "Frenchex.Dev.sln" `
                -SolutionFolder "Dotnet\\Core\\Filesystem" `
                -CsProj "Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests\\Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests.csproj"

        #endregion

        #region Linking Projects

        # Lib
        Update-DotnetProject `
                -CsProj "Frenchex.Dev.Filesystem.Lib\\Frenchex.Dev.Filesystem.Lib.csproj" `
                -DependencyCsProj "Frenchex.Dev.Filesystem.Lib.Domain\\Frenchex.Dev.Filesystem.Lib.Domain.csproj"

        Update-DotnetProject `
                -CsProj "Frenchex.Dev.Filesystem.Lib\\Frenchex.Dev.Filesystem.Lib.csproj" `
                -DependencyCsProj "Frenchex.Dev.Filesystem.Lib.Infrastructure\\Frenchex.Dev.Filesystem.Lib.Infrastructure.csproj"

        Update-DotnetProject `
                -CsProj "Frenchex.Dev.Filesystem.Lib.Tests\\Frenchex.Dev.Filesystem.Lib.Tests.csproj" `
                -DependencyCsProj "Frenchex.Dev.Filesystem.Lib\\Frenchex.Dev.Filesystem.Lib.csproj"

        
        # Domain
        Update-DotnetProject `
                -CsProj "Frenchex.Dev.Filesystem.Lib.Domain\\Frenchex.Dev.Filesystem.Lib.Domain.csproj" `
                -DependencyCsProj "Frenchex.Dev.Filesystem.Lib.Abstractions\\Frenchex.Dev.Filesystem.Lib.Abstractions.csproj"

        Update-DotnetProject `
                -CsProj "Frenchex.Dev.Filesystem.Lib.Domain.Tests\\Frenchex.Dev.Filesystem.Lib.Domain.Tests.csproj" `
                -DependencyCsProj "Frenchex.Dev.Filesystem.Lib.Domain\\Frenchex.Dev.Filesystem.Lib.Domain.csproj"

        # Infrastructure
        Update-DotnetProject `
                -CsProj "Frenchex.Dev.Filesystem.Lib.Infrastructure\\Frenchex.Dev.Filesystem.Lib.Infrastructure.csproj" `
                -DependencyCsProj "Frenchex.Dev.Filesystem.Lib.Domain\\Frenchex.Dev.Filesystem.Lib.Domain.csproj"

        Update-DotnetProject `
                -CsProj "Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests\\Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests.csproj" `
                -DependencyCsProj "Frenchex.Dev.Filesystem.Lib.Infrastructure\\Frenchex.Dev.Filesystem.Lib.Infrastructure.csproj"

        #endregion

        Build-DotnetSolution -Name "Frenchex.Dev.Sln"
        Open-DotnetSolution -Name "Frenchex.Dev.Sln" -Vs

        Set-Location $cwd
    }
}

Describe "Generate Solution" {
    It "Should generate a complete solution from yaml file" {
        $cwd = get-location
        $WorkingDirectory = "$PSScriptRoot/../../../tests"
        Remove-Item -force -Recurse $WorkingDirectory
        mkdir $WorkingDirectory
        set-location $WorkingDirectory

        New-DotnetSolutionFromYaml -Yaml $PSScriptRoot/../../../test-resources/FrenchexDev.yaml

        Set-Location $cwd
    }
}

Describe "Generate DDD Solution" {
    It "Should generate a complete solution from a ddd yaml file" {
        $cwd = get-location
        $WorkingDirectory = "$PSScriptRoot/../../../tests"
        Remove-Item -force -Recurse $WorkingDirectory
        mkdir $WorkingDirectory
        set-location $WorkingDirectory

        New-DotnetSolutionFromYaml -Yaml $PSScriptRoot/../../../test-resources/FrenchexDev.yaml

        Set-Location $cwd
    }
}