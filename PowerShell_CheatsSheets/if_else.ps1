$status = Get-MPIOSetting | Select PathVerificationState

	if ($status.PathVerificationState -eq "Disabled") {
		Set-MPIOSetting -NewPathVerificationState Enabled
		$LastExitCode = 3}
	elif ($status.PathVerificationState -eq "Enabled"){
		$LastExitCode = 0}