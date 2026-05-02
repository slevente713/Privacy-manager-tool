Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 1
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Remote Assistance' -Name "fAllowToGetHelp" -Value 0
