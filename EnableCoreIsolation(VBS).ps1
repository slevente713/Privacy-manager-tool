$registryPath = "HKLM:\System\CurrentControlSet\Control\DeviceGuard"

Write-Host "Enabling Virtualization-Based Security (VBS)... Virtualizációalapú biztonság (VBS) engedélyezése..." -ForegroundColor White

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

New-ItemProperty -Path $registryPath -Name "EnableVirtualizationBasedSecurity" -Value 1 -PropertyType DWord -Force | Out-Null

New-ItemProperty -Path $registryPath -Name "RequirePlatformSecurityFeatures" -Value 1 -PropertyType DWord -Force | Out-Null

Write-Host "VBS has been successfully enabled. A VBS sikeresen engedélyezve lett." -ForegroundColor Green
Write-Host "We're done! Please restart your computer! Kész vagyunk. Indítsd újra a géped a folyamat befejezéséhez!" -ForegroundColor Yellow
