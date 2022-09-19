#See all providers and if there are any extra file systems
Get-PSDrive
Get-WmiObject -namespace root\wmi –class MSStorageDriver_FailurePredictStatus | Select InstanceName, PredictFailure, Reason

#See all providers and if there are any extra file systems
#Get-Disk
# example of output
#Number Friendly Name                                                   Serial Number                    HealthStatus         OperationalStatus      Total Size Partition 
#                                                                                                                                                               Style     
#------ -------------                                                   -------------                    ------------         -----------------      ---------- ----------
#0      VMware Virtual disk                                             23452345*********************** Healthy              Online                     100 GB MBR   

#Get-PhysicalDisk # for more info


#Get-PSDrive

#Get-CimInstance -ClassName Win32_LogicalDisk # Best way to obtain diskinfo

#Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,FreeSpace
#Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }}
#Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Measure-Object -Property 'FreeSpace (GB)' -Sum

Get-PhysicalDisk
Get-PhysicalDisk | Select-Object FriendlyName, HealthStatus
#Get-PhysicalDisk | Get-StorageReliabilityCounter| Select-Object ReadErrorsTotal, WriteErrorsTotal, Temperature 
# 
# Error was thronw so we can't access this
# Get-StorageReliabilityCounter : Access to a CIM resource was not available to the client.

# Need to change the names space
Get-WmiObject -namespace root\wmi –class MSStorageDriver_FailurePredictStatus | Select InstanceName, PredictFailure, Reason

$targetfolder='G:\SQLServer'
$dataColl = @()
gci -force $targetfolder -ErrorAction SilentlyContinue | ? { $_ -is [io.directoryinfo] } | % {
$len = 0
gci -recurse -force $_.fullname -ErrorAction SilentlyContinue | % { $len += $_.length }
$foldername = $_.fullname
$foldersize= '{0:N2}' -f ($len / 1Gb)
$dataObject = New-Object PSObject
Add-Member -inputObject $dataObject -memberType NoteProperty -name “foldername” -value $foldername
Add-Member -inputObject $dataObject -memberType NoteProperty -name “foldersizeGb” -value $foldersize
$dataColl += $dataObject
}
$dataColl | Out-GridView -Title “Size of subdirectories”

# Creating a function
function Get-FolderSize {
[CmdletBinding()]
Param (
[Parameter(Mandatory=$true,ValueFromPipeline=$true)]
$Path
)
if ( (Test-Path $Path) -and (Get-Item $Path).PSIsContainer ) {
$Measure = Get-ChildItem $Path -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum
$Sum = '{0:N2}' -f ($Measure.Sum / 1Gb)
[PSCustomObject]@{
"Path" = $Path
"Size($Gb)" = $Sum
}
}
}
$targetfolder='G:\SQLServer\Data'
ls $targetfolder
 
Get-FolderSize ($targetfolder)


Get-CimInstance -ClassName Win32_ComputerSystem

[System.Net.DNS]::GetHostByName('')

$env:COMPUTERNAME

Get-NetIPAddress | Format-Table

(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content