Write-Host "Enabling Windows Firewall on all profiles... Windows Tűzfal bekapcsolása minden profilon..." -ForegroundColor White
Set-NetFirewallProfile -All -Enabled True
Write-Host "Firewall is now active on Domain, Private, and Public networks. A tűzfal mostantól aktív minden hálózaton. (Tartomány,Privát, Publikus)" -ForegroundColor White
