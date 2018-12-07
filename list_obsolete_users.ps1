﻿# Find Obsolete Computer Accounts
get-adcomputer -filter "LastlogonTimestamp -gt 0" -properties * | select name,lastlogontimestamp,@{Name="LastLogon";Expression={[datetime]::FromFileTime($_.Lastlogontimestamp)}},passwordlastset | Sort LastLogonTimeStamp