import-module $PSScriptRoot/Git.psm1 -Force

Describe "Git-Init" {
    It "should init a local git working copy" {
        $cwd = get-location
        $WorkingDirectory = "$PSScriptRoot/../../tests"
        Remove-Item -force -Recurse $WorkingDirectory
        mkdir $WorkingDirectory
        set-location $WorkingDirectory

        new-git
        set-git -configureuser -username "Stéphane Erard" -useremail "stephane.erard@gmail.com" -local
        set-git -setupstream -origin origin -upstream "ssh://git@github.com/frenchex-dev.git"

        $gitConfig = $(get-content .git/config | out-string -NoNewline).Trim()

        $gitConfig.Contains("stephane.erard") | should -be $true
        $gitConfig.Contains("Stéphane Erard") | should -be $true
        $gitConfig.Contains("ssh://git@github.com/frenchex-dev.git") | should -be $true

        Set-Location $cwd
    }
}