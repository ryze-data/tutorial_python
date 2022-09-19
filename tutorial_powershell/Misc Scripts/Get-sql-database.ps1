$Server = "db1"
$Database = 'Master'
$Cred = Get-Credential

Get-SqlDatabase -ServerInstance $Server -Credential $Cred