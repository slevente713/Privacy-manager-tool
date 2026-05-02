$path = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
Write-Host "Disabling Edge Telemetry and Ads... Edge telemetria és reklámok letiltása..." -ForegroundColor White

if (-not (Test-Path $path)) { New-Item -Path $path -Force | Out-Null }

New-ItemProperty -Path $path -Name "MetricsReportingEnabled" -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $path -Name "PersonalizationReportingEnabled" -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $path -Name "EdgeShoppingAssistantEnabled" -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $path -Name "HideFirstRunExperience" -Value 1 -PropertyType DWord -Force | Out-Null

Write-Host "Edge has been succesfully debloated. Az Edge sikeresen megtisztítva." -ForegroundColor Green
