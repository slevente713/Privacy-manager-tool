$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
Write-Host "Disabling Autoplay... Auto Play letiltása..." -ForegroundColor White

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

New-ItemProperty -Path $registryPath -Name "NoDriveTypeAutoRun" -Value 255 -PropertyType DWord -Force | Out-Null

Write-Host "Autoplay has been successfully disabled. Az Auto Play sikeresen letiltva." -ForegroundColor White
