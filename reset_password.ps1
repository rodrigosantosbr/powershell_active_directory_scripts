Import-Module ActiveDirectory

# open this in Windows PowerShell as Administrator

$user = Read-Host -Prompt 'user'
$passwd = Read-Host -Prompt 'Password' -AsSecureString
if ($user) {
    Write-Host "We can now use the user name [$user] in our code"
    Set-ADAccountPassword -Identity $user -Reset -NewPassword $passwd -PassThru
    Set-ADUser -Identity $user -ChangePasswordAtLogon $false -PasswordNeverExpires $true
} else {
    Write-Warning -Message "No user name input."
}