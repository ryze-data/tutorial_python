$SqlServers = Get-Content 'C:\Users\mjeffs\Downloads\Inbox\sqlserverslist.txt'

foreach ($server in $SqlServers) {
	try {
		$null = Test-Connection -ComputerName $server -Count 1 -ErrorAction STOP
		Write-Output "$server - OK"
	}
	catch {
		Write-Output "$server - $($_.Exception.Message)"
	}
}

