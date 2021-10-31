$logsFolder = 'C:\Users\Public\Documents\git\dba\DOMAIN1\powershell\modules\MetaDataSync\Logs'

# Database Objects
$files_sync_database_objects = @()
$files_sync_database_objects = Get-ChildItem -Path $logsFolder -Name MetaDataSync__sync_database_objects_*
[System.Collections.ArrayList]$dbObjects = @()

# $file = $files_sync_database_objects[0]
foreach($file in $files_sync_database_objects)
{
    $words = $file -split '__'
    $server = $words[2]
    $database = $words[3]

    $contents = Get-Content (Join-Path $logsFolder $file)
    $patterns = @('create procedure','alter procedure','create function','alter function')
    $lines = $contents | Select-String -Pattern $patterns | Select-Object @{l='name';e={($_.ToString().Trim())}} | Select-Object -ExpandProperty name

    $lines.ForEach( {$obj = [PSCustomObject]@{ server=$server;database=$database;name=$_}; $dbObjects.add($obj)|out-null})

}

$dbObjects | ogv
#$dbObjects | Export-Excel "$logsFolder\dbObjects.xlsx" -Show
