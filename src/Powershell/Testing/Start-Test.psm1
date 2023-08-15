function Start-Test() {
    param(
        [scriptblock] $Test
    )

    $cwd = get-location
    $WorkingDirectory = "$PSScriptRoot/../../../tests/"
    Remove-Item -force -Recurse $WorkingDirectory
    mkdir $WorkingDirectory
    set-location $WorkingDirectory

    try {
        $Test.Invoke()
    }
    catch {
        write-host $_

    }
    finally {
        set-location $cwd
    }
}

Export-ModuleMember Start-Test