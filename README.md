# Privacy-manager-tool
This script enhances data protection using PowerShell. It includes many data protection tools and an AppLocker policy. ez a script növeli az adatvédelmet powershell segítségével. Van benne sok adatvédelmi eszköz és egy AppLocker Policy is.

## Changes in AppLocker Policies: Változások az AppLocker Policies.xml -ben: 

Import this XML file Group Policy Editor\Computer Configuration\Windows Settings\Security Settings\Application Control Policies. Then open the Windows Command promt as Administrator, and type in: "gpupdate /force". It updates your Group Policy policies, and now you have AppLocker. Please create a folder in C: with the name: AppLockerExcepcions. Importáld be ezt az XML-fájlt a Csoportházirendbe (Group Policy) ide: „Számítógép konfigurációja\Windows-beállítások\Biztonsági beállítások\Alkalmazás-ellenőrzési házirendek”. Ezután nyisd meg a Windows Parancssort rendszergazdaként, és írd be a következő parancsot: „gpupdate /force”. Ezzel frissíti a csoportházirend-beállításokat, és ezzel az AppLocker már használatra kész. Hozz létre egy mappát a C: meghajtón az AppLockerExceptions névvel.

*Executable rules* 

Disbles PowerShell, PowerShell ISE and PowerShell 7 outside original paths and AppLockerExcepcions folder. Letiltja a PowerShell-t, PowerShell ISE-t, és a Powershell 7-et az eredeti útvonalakon, és az AppLockerExcepcions mappán kívül.

Allows all EV signed software except Process Hacker, because malicius software can use it. Software that's not signed, can't run. Engedélyezi az összes EV-aláírással rendelkező szoftvert, kivéve a Process Hacker-t, mert azt használhatják káros szoftverek. Ha valamelyik szoftver nem rendelekzik aláírással, nem futtatható.

Allow VSCodium, Neonity XtremeShell (4.0, 4.3, 4.3.1, 4.4, 5.0, 5.1, 5.2) (Portable), Explorer Patcher, WinAero Tweaker, and 7zip because these don't have an EV signiture, but they are safe. Engedélyezi a VSCodium-ot, a Neonity XtremeShell-t (4.0, 4.3, 4.3.1, 4.4, 5.0, 5.1, 5.2) (telepítő + hordozható), Explorer Patcher-t, WinAero Tweaker-t és a 7zip-et, mivel ezek nem rendelkeznek EV-aláírással, de biztonságosak.

Disable all .scr (screen saver) files with no excepcions, because they are rarely used nowdays, and they are executables. Letiltja az összes .scr (screen saver/képernyővédő) fájlt, kivételek nélül, mert manapság ritkán használtak és az is Executable mint egy .exe.

Disable all MS DOS (.dos) files with no excepcions, because they're rarely used nowdays, but they are executables like .exe -s. Letiltja az összes .dos (MS DOS) fájlt, kivételek nélül, mert manapság ritkán használtak és az is Executable mint egy .exe.

Block NirCMD because its not updated since 2019, and its very vulnerable, and some malware use this. Letiltja a NirCMD-t mert nincs frisstve 2019 óta, nagyon sebezhető, és néhány vírus használhatja ezt.

Disable all .com (command) except those that are signed by Microsoft or Adobe, because they're executables too, and some malware use these files to trick users. Letiltja az összes .com (command/parancs) fájlt, kivéve azokat amik a Microsoft vagy az Adobe által alá van írva, mert ezek is executable fájlok mint a .exe-k, és sok vírus ezt használja hogy megtévessze a felhasználókat.


*Windows Installer (.msi) rules*

Only the EV signed .msi files can run, except for the Neonity XtremeShell installers (4.0, 4.3, 4.3.1, 4.4, 5.0, 5.1, 5.2). Csak az EV-aláírással rendelkező .msi aláírással rendelkező .msi fájlok futtathatóak, kivéve a Neonity XtremeShell telepítők (4.0, 4.3, 4.3.1, 4.4, 5.0, 5.1, 5.2) 


*Script rules (PowerShell, CMD and Batch, VBScript, and JavaScript)*

Block all non-EV signed script, except VSCodium's scripts, and PowerShell scripts that's in github.com/slevente713. Letiltja az összes scriptet aminek nincs EV-aláírása, kivéve a VSCodium scripjeit, és a github.com/slevente713 oldalon lévő PowerShell scripteket.

Block all init.ps1 files, even if these are signed, because if I run a file that's uses an init.ps1 file, if you open or edit this, the init.ps1 automatically executes itself. Blokkol minden init.ps1 fájlt, még akkor is, ha azok alá vannak írva, mert ha futtatok egy olyan fájlt, amely egy init.ps1 fájlt használ, és azt megnyitod vagy szerkeszted, az init.ps1 automatikusan lefuttatja magát.


*DLL rules*

Only EV signed DLLs can run. Csak az EV-aláírással rendelkező DLL-ek futtathatóak.

Allow all DLLs from Neonity XtremeShell (5.1, 5.2), 7zip, VSCodium, and WinAero Tweaker, because they're not signed but they are safe. Engedélyezi a Neonity XtremeShell (5.1, 5.2), a 7zip, a VSCodium, és a WinAero Tweaker összes DLL-fájlját, mivel ezek ugyan nincsenek aláírva, de biztonságosak.


*Packaged app rules (Microsoft store)*

Only EV-signed applications can run, from Microsoft store. Csak az EV-aláírással rendelkező alkalmazások futhatnak a Microsoft storeból.



## Changes in DisableAutoPlay.ps1: Változások a DisableAutoPlay.ps1 -ben:

Disables Auto Play. Letiltja az Auto Play -t.



## Changes in DisableMSEdgeTelementryAndAds.ps1: Változások a DisableMSEdgeTelementryAndAds.ps1 -ben: 

Disable Personalized ads, telementry, and sending opcional diagnostic data in Microsoft Edge. Letiltja a Microsoft Edge-ben a Telementry-t, személyre szabott hírdetéseket, és az opcionális diagnosztikai adatok gyűjtését.



## Changes in DisableNetBiosAndLlmnr.ps1: Változások a DisableNetBiosAndLlmnr.ps1 -ben: 

Disables NetBios protocoll and LLMNR protocoll, because they're rarely used nowdays, and they are very vulnerable. Letiltja a NetBIOS és LLMNR protokolokat, mert manapság nagyon ritkán hazsnáltak és nagyon sebezhetőek.

⚠️IMPORTANT NOTE: Your OLD printers and NASes can only accessable with IP adresses, not with GUI. FONTOS MEGJEGYZÉS: A RÉGI nyomtatóid és NAS-said nem működnek GUI-val, csak IP címmel.⚠️



## Changes in DisableRDP.ps1: Változások a DisableRDP.ps1 -ben: 

Disables Remote Dektop, and all Remote connections, even Quick Assist. Letiltja a Távoli asztalt, és az összes távoli kapcsolatot, még a Gyors Segítséget is.



## Changes in DisableRecall.ps1: Változások a DisableRecall.ps1 -ben: 

Disables Recall in Copilot+ PCs. Letiltja a Recall-t, a Copilot+ gépeken.

⚠️IMPORTANT NOTE: After a Windows Update (mainly feature upates), recall can be reactivate itself. FONTOS MEGJEGYZÉS: Egy Windows Update futtatása után lehet hogy visszaáll (főleg a funkciófrissítésekben).⚠️



## Changes in DisableSMBv1Protocol.ps1: Változások a DisableSMBv1Protocol.ps1 -ben: 

Disables SMBv1 protocol, that's WannaCry used to spread on the internet. Letiltja az SMBv1 protokollt, amit a WannaCry használt hogy terjedjen az interneten.



## Changes in DisableSendingOpcionalDiagnosticDataAndAds.ps1: Változások a DisableSendingOPcionalDiagnosticDataAndAds.ps1 -ben: 

Disables these features in Windows: Personalized offers, Allow Websites to acces my language list, Improve start and search results, sending opcional diagnostic data, improve inking and typing. A következő funkciókat letiltja a Windows rendszerben: Személyre szabott ajánlatok, A webhelyek számára engedélyezve a nyelvlista elérését, A kezdőképernyő és a keresési eredmények javítása, opcionális diagnosztikai adatok küldése, a kézírás és a gépelés személyre szabása.



## Changes in EnableCoreIsolation(VBS).ps1: Változások az EnableCoreIsolation(VBS).ps1 -ben: 

Enables Core Isolation (VBS) (Virtualization Based Security) without memory integrity. Engedélyezi a Core Isolation-t (VBS) (Magelkülönítés) (Virtualization Based Security) (Virtualizáció alapú biztonság) memóriavédelem (Memority Integrity) nélkül.



## Changes in EnableWindowsDefenderFirewallOnAllProfiles.ps1: Változások az EnableWindowsDefenderFirewallOnAllProfiles.ps1 -ben: 

Enables Windows Defender Firewall on Public Networks, on Domain Networks, and on Private Networks. Engedélyezi a Windows Defender tűzfalat a nyilvános hálozatokon, a privát hálózatokon, és a tartományi (domain) hálózaton.

Not recommended if you use a 3rd party firewall. Nem javasolt ha 3. fétől származó tűzfalat használsz.



## Changes in EnableWindowsSecurityRealTimeProtection.ps1: Változások az EnableWindowsSecurityRealTimeProtection.ps1 -ben: 

Enables Windows Security Real time protection. Engedélyezi a Windows Security valós idejű védelmet.



## Changes in RemovePowershell2.ps1: Változások a RemovePowershell2.ps1 -ben: 

Disables Powershell 2.0 with WindowsOptionalFeatures

Disables Powershell 2.0 with dism /online



## Changes in EnableCoreIsolationWithMemoryIntegrity(HVCI).ps1: Változások a EnableCoreIsolationWithMemoryIntegrity(HVCI).ps1 -ben: 

Enables Core Isolation (VBS) (Virtualization Based Security) with memory integrity (HVCI) (Hypervisor Protected Code Integrity). Engedélyezi a Core Isolation-t (VBS) (Magelkülönítés) (Virtualization Based Security) (Virtualizáció alapú biztonság) memóriavédelemmel (Memority Integrity) (Hypervisor Protected Code Integrity).
