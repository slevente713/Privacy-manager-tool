Write-Host "ATTENTION! Your OLD Printers and Nases can only accesabble with its ip adresses! FIGYELEM! A RÉGI Nyomtatók és NAS-ok csak IP címmel elérhetőek. " -ForegroundColor Red
Write-Host "Disabling LLMNR and NetBIOS... LLMNR és NetBIOS letiltása a hálózati biztonságért..." -ForegroundColor White

$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient"
if (-not (Test-Path $path)) { New-Item -Path $path -Force | Out-Null }
New-ItemProperty -Path $path -Name "EnableMulticast" -Value 0 -PropertyType DWord -Force | Out-Null

$adapters = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces\Tcpip*"
foreach ($adapter in $adapters) {
    Set-ItemProperty -Path $adapter.PSPath -Name "NetbiosOptions" -Value 2
}

Write-Host "LLMNR and NetBIOS disabled. A hálózat mostantól védettebb a névfeloldási támadások ellen." -ForegroundColor Green
