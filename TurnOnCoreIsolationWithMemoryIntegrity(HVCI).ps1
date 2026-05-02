$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity"
$name = "Enabled"
$value = 1

Write-Host "Enabling Core Isolation (Memory Integrity)... Magelkülönítés (Memóriaintegritás) engedélyezése..." -ForegroundColor White

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Host "Core Isolation has been enabled. Please restart your computer! Kész van. Indítsd újra a gépet a folyamat befejezéséhez!" -ForegroundColor Yellow
