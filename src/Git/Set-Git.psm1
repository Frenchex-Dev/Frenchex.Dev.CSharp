function Set-Git(){
    param(
        [string] $UserName,
        [string] $UserEmail,
        [switch] $ConfigureUser,
        [switch] $Global,
        [switch] $Local,
        [string] $Upstream,
        [string] $Origin,
        [switch] $SetUpstream
    )

    $GlobalOrLocalSwitch = if ($Global -or !$Local) { "--global" } elseif ($Local) { "--local" }

    if ($ConfigureUser) {
        git config $GlobalOrLocalSwitch user.name $UserName
        git config $GlobalOrLocalSwitch user.email $UserEmail
    }

    if ($SetUpstream) {
        if ([string]::IsNullOrEmpty($Origin)) {
            throw new "Origin is null or empty"
        }

        if ([string]::IsNullOrEmpty($Upstream)) {
            throw new "Upstream is null or empty"
        }

        git remote add $origin $Upstream
    }

}

Export-ModuleMember -Function Set-Git