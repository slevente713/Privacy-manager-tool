Write-Host "Attempting to completely remove PowerShell 2.0... A PowerShell 2.0 teljes eltávolítása folyamatban..." -ForegroundColor White

Write-Host "Running DISM removal... Eltávolítás DISM használatával..." -ForegroundColor White
dism.exe /online /disable-feature /featurename:MicrosoftWindowsPowerShellV2Root /norestart
dism.exe /online /disable-feature /featurename:MicrosoftWindowsPowerShellV2 /norestart

Write-Host "Checking Windows Optional Features... Ellenőrzés a Windows szolgáltatásoknál..." -ForegroundColor White
try {
    Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root -NoRestart -ErrorAction Stop
    Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2 -NoRestart -ErrorAction Stop
} catch {
    Write-Host "Some features might already be removed. Néhány összetevő már eltávolításra kerülhetett." -ForegroundColor Gray
}

$check = Get-WindowsOptionalFeature -Online | Where-Object { $_.FeatureName -like "*PowerShellV2*" }

if ($check.State -ne "Disabled" -and $check.State -ne "DisabledWithPayloadRemoved") {
    Write-Host "Warning: PowerShell 2.0 state is: $($check.State). Figyelem: A státusz még nem 'Disabled'." -ForegroundColor Yellow
} else {
    Write-Host "PowerShell 2.0 has been successfully disabled/removed. A PowerShell 2.0 sikeresen leállítva/eltávolítva." -ForegroundColor Green
}

Write-Host "A restart is recommended to complete the process. A folyamat befejezéséhez ajánlott a gép újraindítása." -ForegroundColor Cyan
