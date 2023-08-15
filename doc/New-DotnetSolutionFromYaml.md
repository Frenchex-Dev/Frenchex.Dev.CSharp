# New-DotnetSolutionFromYaml

Create a new `solution.yaml` file in the directory of your choice with following structure adapted to your needs

```yaml
solution:
  name: Frenchex.Dev
  global:
    sdkVersion: 7.0.400

projects:
  - name: Frenchex.Dev.Filesystem.Lib
    language: "C#"
    template: "fex:lib"
    template_extra_args: 
      - "--copyright"
      - "\"// Copyright Stéphane Erard\r\n// For Educational purpose only. \r\n// Commercial licensing & support : contact stephane.erard@gmail.com\""
      - "--param:project"
      - "Frenchex.Dev.Filesystem.Lib"
      - "--namespace"
      - "Frenchex.Dev.Filesystem.Lib"
    packages:
      - name: Microsoft.Extensions.DependencyInjection.Abstractions
        version: 7.0.0
    projects:
      - name: Frenchex.Dev.Filesystem.Lib.Domain
      - name: Frenchex.Dev.Filesystem.Lib.Infrastructure
    solutionFolder: Dotnet\Core\Filesystem
  - name: Frenchex.Dev.Filesystem.Lib.Tests
    language: "C#"
    template: "fex:test"
    template_extra_args: 
      - "--copyright"
      - "\"// Copyright Stéphane Erard\r\n// For Educational purpose only. \r\n// Commercial licensing & support : contact stephane.erard@gmail.com\""
      - "--param:project"
      - "Frenchex.Dev.Filesystem.Lib.Tests"
      - "--namespace"
      - "Frenchex.Dev.Filesystem.Lib.Tests"
    projects: 
      - name: Frenchex.Dev.Filesystem.Lib
    solutionFolder: Dotnet\Core\Filesystem
  - name: Frenchex.Dev.Filesystem.Lib.Abstractions
    language: "C#"
    template: "fex:domain.abstractions"
    template_extra_args: 
      - "--copyright"
      - "\"// Stéphane Erard\""
      - "--param:project"
      - "Frenchex.Dev.Filesystem.Lib.Abstractions"
      - "--namespace"
      - "Frenchex.Dev.Filesystem.Lib.Abstractions"
    solutionFolder: Dotnet\Core\Filesystem
  - name: Frenchex.Dev.Filesystem.Lib.Infrastructure
    language: "C#"
    template: "fex:infra"
    template_extra_args: 
      - "--copyright"
      - "\"// Stéphane Erard\""
      - "--param:project"
      - "Frenchex.Dev.Filesystem.Lib.Infrastructure"
      - "--namespace"
      - "Frenchex.Dev.Filesystem.Lib.Infrastructure"
    projects:
      - name: Frenchex.Dev.Filesystem.Lib.Domain
    packages:
      - name: Microsoft.Extensions.DependencyInjection.Abstractions
        version: 7.0.0
    solutionFolder: Dotnet\Core\Filesystem
  - name: Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests
    language: "C#"
    template: "fex:test"
    template_extra_args: 
      - "--copyright"
      - "\"// Stéphane Erard\""
      - "--param:project"
      - "Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests"
      - "--namespace"
      - "Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests"
    projects: 
      - name: Frenchex.Dev.Filesystem.Lib.Infrastructure
    solutionFolder: Dotnet\Core\Filesystem
  - name: Frenchex.Dev.Filesystem.Lib.Domain
    solutionFolder: Dotnet\Core\Filesystem
    template: "fex:domain"  
    language: "C#"
    template_extra_args: 
      - "--copyright"
      - "\"// Stéphane Erard\""
      - "--param:project"
      - "Frenchex.Dev.Filesystem.Lib.Domain"
      - "--namespace"
      - "Frenchex.Dev.Filesystem.Lib.Domain"
    packages:
      - name: Microsoft.Extensions.DependencyInjection.Abstractions
        version: 7.0.0
  - name: Frenchex.Dev.Filesystem.Lib.Domain.Tests
    solutionFolder: Dotnet\Core\Filesystem
    template: "fex:test"  
    language: "C#"
    template_extra_args: 
      - "--copyright"
      - "\"// Stéphane Erard\""
      - "--param:project"
      - "Frenchex.Dev.Filesystem.Lib.Domain.Tests"
      - "--namespace"
      - "Frenchex.Dev.Filesystem.Lib.Domain.Tests"
    projects:
      - name: Frenchex.Dev.Filesystem.Lib.Domain
```

Executing

```powershell
Import-Module FrenchexDev
New-DotnetSolutionFromYaml -yaml .\solution.yaml
```

Will generate following structure :

```powershell
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----          13/08/2023  6:13 PM                Frenchex.Dev.Filesystem.Lib
d----          13/08/2023  6:13 PM                Frenchex.Dev.Filesystem.Lib.Abstractions
d----          13/08/2023  6:14 PM                Frenchex.Dev.Filesystem.Lib.Domain
d----          13/08/2023  6:14 PM                Frenchex.Dev.Filesystem.Lib.Domain.Tests
d----          13/08/2023  6:14 PM                Frenchex.Dev.Filesystem.Lib.Infrastructure
d----          13/08/2023  6:14 PM                Frenchex.Dev.Filesystem.Lib.Infrastructure.Tests
d----          13/08/2023  6:14 PM                Frenchex.Dev.Filesystem.Lib.Tests
-a---          13/08/2023  6:14 PM           5686 Frenchex.Dev.sln
-a---          13/08/2023  6:12 PM           3663 solution.yaml
-a---          13/08/2023  6:13 PM             47 global.json
```

See [Test script](src/Dotnet/Solution/Solution.Tests.ps1) to check usage of this module.

