$serviceName = "DiagTrack"

$service = Get-Service -Name $serviceName

if ($service) {

    Write-Host "Shutting Down Connected User Experiences and Telementry... Csatlakoztatott felhasználói élmények és telemetria leállítása..." -ForegroundColor White
    Stop-Service -Name $serviceName -Force -PassThru

    Write-Host "Disabling Connected User Experiences and Telementry... Csatlakoztatott felhasználói élmények és telemetria letiltása..." -ForegroundColor White
    Set-Service -Name $serviceName -StartupType Disabled

    Write-Host "Connexted User Experiences and Telementry got succesfully stopped and disabled. A Csatlakoztatott felhasználói élmények és telemetria sikeresen leállítva és letiltva." -ForegroundColor White
}

$serviceName = "WerSvc"

$service = Get-Service -Name $serviceName

if ($service) {

    Write-Host "Shutting Down Windows Error Reporting Service... Windows hibajelentési szolgáltatás leállítása..." -ForegroundColor White
    Stop-Service -Name $serviceName -Force -PassThru

    Write-Host "Disabling Windows Error Reporting Service... Windows hibajelentési szolgáltatás letiltása..." -ForegroundColor White
    Set-Service -Name $serviceName -StartupType Disabled

    Write-Host "Windows Error Reporting Service got successfully stopped and disabled. A Windows hibajelentési szolgáltatás sikeresen leállítva és letiltva." -ForegroundColor White
}

$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
$name = "AllowTelemetry"
$value = 0

Write-Host "Setting diagnostic data levels... Diagnosztikai adatok küldési szintjének beállítása..." -ForegroundColor White

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null

    Write-Host "Diagnostic data transmission has been restricted. A diagnosztikai adatok küldése korlátozva lett." -ForegroundColor White
}

$registryPath = "HKCU:\Software\Microsoft\Siuf\Rules"
$name = "NumberOfDays"
$value = 0

Write-Host "Changing Feedback Frequency to Never... A visszajelzési gyakoriság átállítása Soha értékre..." -ForegroundColor White

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Host "Feedback Frequency has been successfully set to Never. A visszajelzési gyakoriság sikeresen átállítva Soha értékre." -ForegroundColor White

$path1 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo"
Write-Host "Disabling Advertising ID... Hirdetésazonosító letiltása..." -ForegroundColor White
if (-not (Test-Path $path1)) { New-Item -Path $path1 -Force | Out-Null }
New-ItemProperty -Path $path1 -Name "Enabled" -Value 0 -PropertyType DWord -Force | Out-Null

$path2 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
Write-Host "Disabling Settings recommendations... Gépház javaslatok letiltása..." -ForegroundColor White
New-ItemProperty -Path $path2 -Name "SubscribedContent-338393Enabled" -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $path2 -Name "SubscribedContent-353694Enabled" -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $path2 -Name "SubscribedContent-353696Enabled" -Value 0 -PropertyType DWord -Force | Out-Null

$path3 = "HKCU:\Control Panel\International\User Profile"
Write-Host "Disabling Start and Search improvement... Start és keresés javításának letiltása..." -ForegroundColor White
New-ItemProperty -Path $path3 -Name "HttpAcceptLanguageOptOut" -Value 1 -PropertyType DWord -Force | Out-Null

Write-Host "Disabling website language list access... Webhelyek nyelvlista-hozzáférésének letiltása..." -ForegroundColor White
New-ItemProperty -Path $path3 -Name "HttpAcceptLanguageOptOut" -Value 1 -PropertyType DWord -Force | Out-Null

$path5 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy"
Write-Host "Disabling Personalized Offers... Személyre szabott ajánlatok letiltása..." -ForegroundColor White
if (-not (Test-Path $path5)) { New-Item -Path $path5 -Force | Out-Null }
New-ItemProperty -Path $path5 -Name "TailoredExperiencesWithDiagnosticDataEnabled" -Value 0 -PropertyType DWord -Force | Out-Null

Write-Host "All privacy settings have been successfully disabled. Minden adatvédelmi beállítás sikeresen letiltva." -ForegroundColor White

# A Registry útvonala a kézírás és gépelés személyre szabásához
$registryPath = "HKCU:\Software\Microsoft\InputPersonalization"
$registryPath2 = "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore"

Write-Host "Disabling Custom Inking and Typing Dictionary... Egyéni kézírási és gépelési szótár letiltása..." -ForegroundColor White

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
New-ItemProperty -Path $registryPath -Name "RestrictImplicitInkCollection" -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $registryPath -Name "RestrictImplicitTypingCollection" -Value 1 -PropertyType DWord -Force | Out-Null

if (-not (Test-Path $registryPath2)) {
    New-Item -Path $registryPath2 -Force | Out-Null
}
New-ItemProperty -Path $registryPath2 -Name "HarvestContacts" -Value 0 -PropertyType DWord -Force | Out-Null

Write-Host "Custom Inking and Typing Dictionary has been successfully disabled. Az egyéni kézírási és gépelési szótár sikeresen letiltva." -ForegroundColor White
Write-Host "We're done! (Restart not required). Kész vagyunk! (Újrtaindítás nem szügséges)." -ForegroundColor White
