$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
Write-Host "Disabling Clipboard Cloud Sync... Vágólap felhő-szinkronizáció letiltása..." -ForegroundColor White

if (-not (Test-Path $path)) { New-Item -Path $path -Force | Out-Null }
New-ItemProperty -Path $path -Name "AllowClipboardHistory" -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $path -Name "AllowCrossDeviceClipboard" -Value 0 -PropertyType DWord -Force | Out-Null

Write-Host "Clipboard sync disabled. Vágólap szinkronizáció letiltva." -ForegroundColor White
