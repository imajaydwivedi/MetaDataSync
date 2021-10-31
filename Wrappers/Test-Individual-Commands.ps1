# Clear session variables & Remove module from Memory
Remove-Module MetaDataSync -ErrorAction SilentlyContinue; Remove-Module DbaHelpUtil -ErrorAction SilentlyContinue;
Get-Variable -Scope local | Remove-Variable -ErrorAction SilentlyContinue; $Error.Clear(); Clear-Host;

# Import Module
$ModulePath = 'E:\Ajay\git\dba\DOMAIN1\powershell\modules\MetaDataSync'
Import-Module (Join-Path $ModulePath "MetaDataSync.psm1") -DisableNameChecking
Import-Module "$MDS_DbaHelpUtilPath\DbaHelpUtil.psm1" -DisableNameChecking
Get-ChildItem -Path $MDS_LogsPath | Remove-Item -Force

# Execute one function for Server Pair
$LogFile = (Join-Path $MDS_LogsPath "sync_meta_data - $Dtmm.txt")
sync_meta_data -ErrorAction Stop `
        -primary_server 'SQLPROD1DS6' -dr_server 'SQLDR1DS6' `
        -OutputPath $MDS_LogsPath ` `
        -LogFile $LogFile `
        -WhatIf #-Debug

<#

# Execute all function for Server Pair
$LogFile = (Join-Path $MDS_LogsPath "sync_meta_data - $Dtmm.txt")
sync_meta_data -ErrorAction Stop `
        -primary_server 'SQLPROD1DS6' -dr_server 'SQLDR1DS6' `
        -OutputPath $MDS_LogsPath ` `
        -LogFile $LogFile `
        -WhatIf

# Execute one function for Server Pair
$LogFile = (Join-Path $MDS_LogsPath "sync_SQL_logins - $Dtmm.txt")
sync_SQL_logins -ErrorAction Stop `
        -primary_server 'SQLPROD1DS6' -dr_server 'SQLDR1DS6' `
        -OutputPath $MDS_LogsPath ` `
        -LogFile $LogFile `
        -WhatIf

# Execute one function for Server+Database Pair
$LogFile = (Join-Path $MDS_LogsPath "Create-LinkedServerOnDR - $Dtmm.txt")
sync_database_objects -ErrorAction Stop `
        -primary_server 'SQLPROD1DS6' -dr_server 'SQLDR1DS6' -database 'DBA' `
        -OutputPath $MDS_LogsPath ` `
        -LogFile $LogFile `
        -WhatIf

#>