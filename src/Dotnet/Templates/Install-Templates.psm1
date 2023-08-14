function Install-Templates() {
    param(
        [switch] $Install,
        [switch] $Uninstall,
        [string] $Name,
        [switch] $All,
        [switch] $Force,
        [string] $TemplatesDir = "$PSScriptRoot/templates",
        [string[]] $Only
    )
    
    if ($Uninstall) {
        Set-Location $Name
        dotnet new uninstall ./
        Set-Location -
    }
    
    if ($install) {
        Set-Location $Name
        dotnet new install ./  --force
        Set-Location -
    }
    
    if ($All) {
        $tpls = get-childitem -depth 0 $TemplatesDir
        
        foreach($tpl in $tpls) {
            Set-Location $tpl
            dotnet new uninstall ./
            dotnet new install ./
            Set-Location -
        }
    }
}

Export-ModuleMember -Function Install-Templates