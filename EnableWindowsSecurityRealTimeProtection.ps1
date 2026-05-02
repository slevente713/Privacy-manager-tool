Write-Host "Enabling Windows Security Active Protection... Windows Security aktív védelem bekapcsolása..." -ForegroundColor White
Set-MpPreference -DisableRealtimeMonitoring $false
Set-MpPreference -MAPSReporting Advanced
Set-MpPreference -SubmitSamplesConsent SendAllSamples
Set-MpPreference -PUAProtection Enabled
Write-Host "Active Protection is now ON. Az aktív védelem mostantól BE van kapcsolva." -ForegroundColor White
