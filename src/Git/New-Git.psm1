function New-Git() {
    param(
        [switch] $Quiet,
        [switch] $Bare,
        [string] $Template,
        [string] $SeparateGitDir,
        [string] $ObjectFormat,
        [string] $BranchName,
        [string] $InitialBranch,
        [string[]] $SharedPermissions,
        [string] $Directory = "./"
    )

    $processArgs = [System.Collections.ArrayList]::new()

    [void] $processArgs.Add("init")

    if ($Quiet) {
        [void] $processArgs.Add( "--quiet" )
    }

    if ($Bare) { 
        [void] $processArgs.Add( "--bare" )
    }

    if (![string]::IsNullOrEmpty($Template)) { 
        [void] $processArgs.AddRange(@("--template", $Template))
    }

    if (![string]::IsNullOrEmpty($SeparateGitDir)) {
        [void] $processArgs.AddRange(@("--separate-git-dir", $SeparateGitDir))
    }

    if (![string]::IsNullOrEmpty($ObjectFormat)) {
        [void] $processArgs.AddRange(@("--object-format", $ObjectFormat))
    }

    if (![string]::IsNullOrEmpty($BranchName)) {
        [void] $processArgs.AddRange(@("-b", $BranchName))
    }

    if (![string]::IsNullOrEmpty($InitialBranch)) {
        [void] $processArgs.AddRange(@("--initial-branch", $InitialBranch))
    }

    if ($null -ne $SharedPermissions -and $SharedPermissions.Length -gt 0) {
        [void] $processArgs.Add("--shared")
        [void] $processArgs.AddRange($SharedPermissions)
    }

    [void] $processArgs.Add($Directory)

    start-process git -ArgumentList $processArgs -wait -NoNewWindow -PassThru
}

Export-ModuleMember -Function New-Git
