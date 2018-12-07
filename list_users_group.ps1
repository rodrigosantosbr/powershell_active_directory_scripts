# Enumerate Members of a Group
Get-ADGroupMember "Domain Admins" -Recursive | Select DistinguishedName 
