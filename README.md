# Frenchex Dev

This repository is a set of `powershell core` scripts which helps to create a Dotnet solution, projects and templates.

## Installation

Open a `Powershell Core` shell and run the following

```powershell
git clone git@github.com:Frenchex-Dev/Frenchex.Dev.Csharp.git $env:USERPROFILE\Documents\PowerShell\Modules\FrenchexDev
```

## Installing Templates

```powershell
Import-Module FrenchexDev
Install-DotnetTemplates -All
```

## Functions

* [New-DotnetTemplateFromYaml](doc/New-DotnetTemplateFromYaml.md)
* [New-DotnetSolutionFromYaml](doc/New-DotnetSolutionFromyaml.md)

## Developers

Using Pester to test the module.

```powershell
Invoke-Pester
```

Will run the tests.
