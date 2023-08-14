import-module frenchexdev -Force

describe "New-DotnetTemplate" {
    it "creates a new template" {
        $WorkingDirectory = "$PSScriptRoot/../../../tests"
        Remove-Item -force -Recurse $WorkingDirectory
        mkdir $WorkingDirectory

        set-location $WorkingDirectory
        
        New-DotnetTemplate -name test -Author test -Classifications test,tag,test1 -Identity test:lib -ShortName tl -language "C#" -type "project"

        set-location -
    }
}