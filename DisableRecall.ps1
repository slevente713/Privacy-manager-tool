$featureName = "Recall"
Write-Host "Attempting to disable and remove Windows Recall... A Windows Recall letiltása és eltávolítása folyamatban..." -ForegroundColor White
Write-Host "Running DISM removal... Eltávolítás DISM használatával..." -ForegroundColor White
dism.exe /online /disable-feature /featurename:$featureName /norestart
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
$name = "DisableAIDataAnalysis"
$value = 1
Write-Host "Applying Registry policy to block Recall... Registry szabály alkalmazása a Recall blokkolásához..." -ForegroundColor White
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null
$userRegistryPath = "HKCU:\Software\Policies\Microsoft\Windows\WindowsAI"
if (-not (Test-Path $userRegistryPath)) {
    New-Item -Path $userRegistryPath -Force | Out-Null
}
New-ItemProperty -Path $userRegistryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null
Write-Host "Windows Recall has been successfully removed and disabled. A Windows Recall sikeresen eltávolítódott és letiltódott." -ForegroundColor White
Write-Host "Please Restart your computer! Kérlek indítsd újra a géped!" -ForegroundColor Red
