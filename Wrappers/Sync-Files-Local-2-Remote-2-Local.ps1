<# BEGIN: Sync git files from Local to DBMONITOR #>
$Local_DOMAIN1 = 'C:\Users\Public\Documents\git\dba\DOMAIN1\powershell\modules\MetaDataSync\'
$Local_ARC = 'C:\Users\Public\Documents\git\dba\DOMAIN2\powershell\Commons\Modules\MetaDataSync\'

$Remote_DOMAIN1 = '\\dbmonitor.contoso.com\E$\Ajay\git\dba\DOMAIN1\powershell\modules\MetaDataSync\'
$Remote_ARC = '\\dbmonitor.lab.com\D$\Ajay\git\dba\DOMAIN1\powershell\modules\MetaDataSync\'

robocopy "$Local_DOMAIN1" "$Remote_DOMAIN1" /XD "$($Source).git" /e /it /is /MT:4
#robocopy "$Remote_DOMAIN1" "$Local_DOMAIN1" /XD "$($Source).git" /e /it /is /MT:4
#robocopy "$Local_DOMAIN1" "$Local_ARC" /XD "$($Source).git" /e /it /is /MT:4
#robocopy "$Local_DOMAIN1" "$Remote_ARC" /XD "$($Source).git" /e /it /is /MT:4
<# END: Sync files & folder from dbmonitor to Local #>