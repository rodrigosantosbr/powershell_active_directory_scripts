Import-Module ActiveDirectory

# open this in Windows PowerShell as Administrator

$givenName = Read-Host -Prompt 'givenName'
$surname = Read-Host -Prompt 'Surname'
$name = $givenName + " " + $surname
$user = Read-Host -Prompt 'user'
$passwd = Read-Host -Prompt 'Password' -AsSecureString
if ($user) {
    New-ADUser -Name $name -GivenName $givenName -Surname $surname -SamAccountName $user -Path "CN=Users,DC=example,DC=com"
    Set-ADAccountPassword -Identity $user -Reset -NewPassword $passwd -PassThru
    Set-ADUser -Identity $user -ChangePasswordAtLogon $false -PasswordNeverExpires $true -Enabled $true
    Get-ADUser $user -Properties CanonicalName, Enabled, GivenName, Surname, Name, UserPrincipalName, samAccountName, whenCreated, PasswordLastSet  | Select CanonicalName, Enabled, GivenName, Surname, Name, UserPrincipalName, samAccountName, whenCreated, PasswordLastSet

} else {
    Write-Warning -Message "No user name input."
}