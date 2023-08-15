# New-DotnetTemplateFromYaml

create a `templates.yaml` file with following structure adapted to your needs

```yaml
templates:
  - name: Frenchex.Dev.DotnetCore.Templates.DDD.Lib
    author: Stéphane Erard
    symbols:
      - name: license
        short: l
        type: parameter
        defaultValue: // Your Licensing
        replaces: (licensing)
      - name: project
        short: project
        type: parameter
        defaultValue: Your Project
        replaces: (project)
      - name: namespace
        short: ns
        type: parameter
        defaultValue: Your Namespace
        replaces: (namespace)
    shortName: "fex:ddd:lib"
    identity: "fex:ddd:lib"
    classifications: ["Frenchex", "Dev", "DDD", "Lib"]
    language: C#
    type: project
    packages: 
      - name: Microsoft.Extensions.DependencyInjection.Abstractions
        version: 7.0.0
  - name: Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Abstractions
    author: Stéphane Erard
    symbols:
      - name: license
        short: l
        type: parameter
        defaultValue: // Your Licensing
        replaces: (licensing)
      - name: project
        short: project
        type: parameter
        defaultValue: Your Project
        replaces: (project)
      - name: namespace
        short: ns
        type: parameter
        defaultValue: Your Namespace
        replaces: (namespace)
    shortName: "fex:ddd:lib.abstractions"
    identity: "fex:ddd:lib.abstractions"
    classifications: ["Frenchex", "Dev", "DDD", "Lib", "Abstractions"]
    language: C#
    type: project
  - name: Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Domain
    author: Stéphane Erard
    symbols:
      - name: license
        short: l
        type: parameter
        defaultValue: // Your Licensing
        replaces: (licensing)
      - name: project
        short: project
        type: parameter
        defaultValue: Your Project
        replaces: (project)
      - name: namespace
        short: ns
        type: parameter
        defaultValue: Your Namespace
        replaces: (namespace)
    shortName: "fex:ddd:lib.domain"
    identity: "fex:ddd:lib.domain"
    classifications: ["Frenchex", "Dev", "DDD", "Lib", "Domain"]
    language: C#
    type: project
    packages: 
      - name: Microsoft.Extensions.DependencyInjection.Abstractions
        version: 7.0.0
  - name: Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Infrastructure
    author: Stéphane Erard
    symbols:
      - name: license
        short: l
        type: parameter
        defaultValue: // Your Licensing
        replaces: (licensing)
      - name: project
        short: project
        type: parameter
        defaultValue: Your Project
        replaces: (project)
      - name: namespace
        short: ns
        type: parameter
        defaultValue: Your Namespace
        replaces: (namespace)
    shortName: "fex:ddd:lib.infra"
    identity: "fex:ddd:lib.infra"
    classifications: ["Frenchex", "Dev", "DDD", "Lib", "Infra"]
    language: C#
    type: project
    packages: 
      - name: Microsoft.Extensions.DependencyInjection.Abstractions
        version: 7.0.0
  - name: Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Tests
    author: Stéphane Erard
    symbols:
      - name: license
        short: l
        type: parameter
        defaultValue: // Your Licensing
        replaces: (licensing)
      - name: project
        short: project
        type: parameter
        defaultValue: Your Project
        replaces: (project)
      - name: namespace
        short: ns
        type: parameter
        defaultValue: Your Namespace
        replaces: (namespace)
    shortName: "fex:ddd:lib.tests"
    identity: "fex:ddd:lib.tests"
    classifications: ["Frenchex", "Dev", "DDD", "Lib", "Tests"]
    language: C#
    type: project
  - name: Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Domain.Tests
    author: Stéphane Erard
    symbols:
      - name: license
        short: l
        type: parameter
        defaultValue: // Your Licensing
        replaces: (licensing)
      - name: project
        short: project
        type: parameter
        defaultValue: Your Project
        replaces: (project)
      - name: namespace
        short: ns
        type: parameter
        defaultValue: Your Namespace
        replaces: (namespace)
    shortName: "fex:ddd:lib.domain.tests"
    identity: "fex:ddd:lib.domain.tests"
    classifications: ["Frenchex", "Dev", "DDD", "Lib", "Domain", "Tests"]
    language: C#
    type: project
  - name: Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Infrastructure.Tests
    author: Stéphane Erard
    symbols:
      - name: license
        short: l
        type: parameter
        defaultValue: // Your Licensing
        replaces: (licensing)
      - name: project
        short: project
        type: parameter
        defaultValue: Your Project
        replaces: (project)
      - name: namespace
        short: ns
        type: parameter
        defaultValue: Your Namespace
        replaces: (namespace)
    shortName: "fex:ddd:lib.infra.tests"
    identity: "fex:ddd:lib.infra.tests"
    classifications: ["Frenchex", "Dev", "DDD", "Lib", "Infra", "Tests"]
    language: C#
    type: project
```

Executing

```powershell
Import-Module FrenchexDev
New-DotnetTemplateFromYaml -Yaml templates.yaml` will create the following structure
```

Wil generate following structure :

```powershell
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----          15/08/2023  1:04 AM                Frenchex.Dev.DotnetCore.Templates.DDD.Lib
d----          15/08/2023  1:04 AM                Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Abstractions
d----          15/08/2023  1:04 AM                Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Domain
d----          15/08/2023  1:04 AM                Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Domain.Tests
d----          15/08/2023  1:04 AM                Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Infrastructure
d----          15/08/2023  1:04 AM                Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Infrastructure.Tests
d----          15/08/2023  1:04 AM                Frenchex.Dev.DotnetCore.Templates.DDD.Lib.Tests
```

## Generated project content

```powershell
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----          15/08/2023  1:04 AM                .template.config
d----          15/08/2023  1:04 AM                obj
-a---          15/08/2023  1:04 AM            853 Frenchex.Dev.DotnetCore.Templates.DDD.Lib.csproj
-a---          15/08/2023  1:04 AM            104 README.md
```

## Generated csproj

```xml
<Project Sdk="Microsoft.NET.Sdk">

    <ItemGroup>
      <None Include="README.md" Pack="true" PackagePath="\">
        <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
      </None>
    </ItemGroup>

    <ItemGroup>
      <PackageReference Include="Microsoft.Extensions.DependencyInjection.Abstractions" Version="7.0.0" />
    </ItemGroup>
  
    <PropertyGroup>
      <TargetFramework>net7.0</TargetFramework>
      <ImplicitUsings>enable</ImplicitUsings>
      <Nullable>enable</Nullable>
      <GeneratePackageOnBuild>True</GeneratePackageOnBuild>
      <IncludeSymbols>True</IncludeSymbols>
      <EnforceCodeStyleInBuild>True</EnforceCodeStyleInBuild>
      <PackageLicenseFile>README.md</PackageLicenseFile>
      <GenerateDocumentationFile>True</GenerateDocumentationFile>
    </PropertyGroup>
  
</Project>
```

## Generated README.md

```markdown
# (project-name)

`
(copyright)
`
    
## End-user Installation

## Developer Installation    
```

## Generated .template.config/template.json

```json
{
  "$schema": "http://json.schemastore.org/template",
  "symbols": {
    "project": {
      "type": "parameter",
      "defaultValue": "Your Project",
      "replaces": "(project)"
    },
    "license": {
      "type": "parameter",
      "defaultValue": "// Your Licensing",
      "replaces": "(licensing)"
    },
    "namespace": {
      "type": "parameter",
      "defaultValue": "Your Namespace",
      "replaces": "(namespace)"
    }
  },
  "shortName": "fex:ddd:lib",
  "author": "Stéphane Erard",
  "identity": "fex:ddd:lib",
  "tags": {
    "type": "project",
    "language": "C#"
  },
  "classifications": [
    "Frenchex",
    "Dev",
    "DDD",
    "Lib"
  ],
  "name": "Frenchex.Dev.DotnetCore.Templates.DDD.Lib"
}
```

## Generated .template.config/dotnetcli.host.json

```json
{
  "symbolInfo": {
    "project": {
      "shortName": null,
      "longName": "project"
    },
    "license": {
      "shortName": null,
      "longName": "license"
    },
    "namespace": {
      "shortName": null,
      "longName": "namespace"
    }
  }
}
```
