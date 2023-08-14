Import-Module $PSScriptRoot/Project/Project.psm1 -Force
Import-Module $PSScriptRoot/Solution/Solution.psm1 -Force
Import-Module $PSScriptRoot/Templates/Templates.psm1 -Force
Import-Module $PSScriptRoot/DDD/DDD.psm1 -Force

$env:DOTNET_CLI_UI_LANGUAGE = "en-US"
