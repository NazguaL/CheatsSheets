try {
	$status = Get-MPIOSetting | Select PathVerificationState

	if ($status.PathVerificationState -eq "Disabled") {
		Set-MPIOSetting -NewPathVerificationState Enabled
		$LastExitCode = 3}
	elif ($status.PathVerificationState -eq "Enabled"){
		$LastExitCode = 0}
}
catch [System.Management.Automation.CommandNotFoundException] {
  $LastExitCode = 2
}
catch [System.Exception] {
  $LastExitCode = 1
}
EXIT $LastExitCode