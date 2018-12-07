Import-Module ActiveDirectory

# open this in Windows PowerShell as Administrator

$user = Read-Host -Prompt 'user'
if ($user) {
    Write-Host "We can now use the user name [$user] in our code"
    remove-aduser $user
} else {
    Write-Warning -Message "No user name input."
}