Remove-Module MetaDataSync -ErrorAction SilentlyContinue; Remove-Module DbaHelpUtil -ErrorAction SilentlyContinue;
Get-Variable -Scope local | Remove-Variable -ErrorAction SilentlyContinue; $Error.Clear(); Clear-Host;

E:\Ajay\git\dba\DOMAIN1\powershell\modules\MetaDataSync\Wrappers\Wrapper-SyncMetaData.ps1 -Environment DOMAIN1 `
        -OutputPath 'E:\Ajay\git\dba\DOMAIN1\powershell\modules\MetaDataSync\Logs' `
        -WhatIf #-Debug

#C:\Users\Public\Documents\git\dba\DOMAIN1\powershell\modules\MetaDataSync\Wrappers\Wrapper-SyncMetaData.ps1 -Environment DOMAIN1 -WhatIf #-Debug
#C:\Users\Public\Documents\git\dba\DOMAIN2\powershell\Commons\Modules\MetaDataSync\Wrappers\Wrapper-SyncMetaData.ps1 -Environment DOMAIN2 -WhatIf #-Debug
#D:\Ajay\git\dba\DOMAIN2\powershell\Commons\Modules\MetaDataSync\Wrappers\Wrapper-SyncMetaData-Dev.ps1 -Environment DOMAIN2 #-WhatIf #-Debug

<#
Import-Module C:\Users\Public\Documents\git\dba\DOMAIN1\powershell\modules\MetaDataSync\MetaDataSync.psm1 -DisableNameChecking
sync_meta_data -WhatIf `
        -primary_server 'SQLPROD1DS6' -dr_server 'SQLDR1DS6' `
        -OutputPath 'E:\Ajay\git\dba\DOMAIN1\powershell\modules\MetaDataSync\Logs' `
        -LogFile 'E:\Ajay\git\dba\DOMAIN1\powershell\modules\MetaDataSync\Logs\sync_meta_data - 2021-08-25 04.45.53.txt' `
        -Debug
#>
<#
Remove-Module MetaDataSync
Remove-Module DbaHelpUtil

import-module C:\Users\Public\Documents\git\dba\DOMAIN1\powershell\modules\MetaDataSync
#>
