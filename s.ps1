# Owner of the Script Inderkang

$INTRO = @"
                                                               
 ######   ##      ##       ##    ##    ###    ##    ##  ######   
##    ##  ##  ##  ##       ##   ##    ## ##   ###   ## ##    ##  
##        ##  ##  ##       ##  ##    ##   ##  ####  ## ##        
##   #### ##  ##  ##       #####    ##     ## ## ## ## ##   #### 
##    ##  ##  ##  ##       ##  ##   ######### ##  #### ##    ##  
##    ##  ##  ##  ##       ##   ##  ##     ## ##   ### ##    ##  
 ######    ###  ###        ##    ## ##     ## ##    ##  ######
                                                              
"@
Write-Host $INTRO; & {Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False | Out-Null}

# My Variables
$jsonFilePath = "D:\a\_temp\_github_workflow\event.json"
$jsonContent = Get-Content -Path $jsonFilePath -Raw
$jsonObject = $jsonContent | ConvertFrom-Json
$VTYPE = $jsonObject.inputs.version
$code = $jsonObject.inputs.code
$code = [string]$code
$code = $code.Substring(0, $code.Length - 17)
$RepoName = $jsonObject.repository.name
$ffserver = $jsonObject.inputs.ffserver
$PASS = $Env:COMPUTERNAME
$PASS1 = "8454786"
$PASS2 = $PASS.SubString(0,2)
$PASS3 = $Env:USERNAME
$PASSW = $PASS2 + $PASS1 + $PASS3 + $RepoName
$currentTime = (Get-Date).ToUniversalTime().AddHours(5.5).ToString("hh:mm") 
$INSTANCE = $RepoName + $currentTime
$crdpin = " -pin=123456"
$crdcode = $authCode + $INSTANCE + $crdpin
$MYFOLDER = "C:\Users\$Env:USERNAME\Desktop\GWKANG"
$NINJARIPPER = "C:\Users\$Env:USERNAME\Documents\ninjaripper\x86\ninjaripper.exe"
$SMARTGAGA = "C:\Users\$Env:USERNAME\Documents\ProjectTitan\Engine\ProjectTitan.exe"
$NOESIS = "C:\Users\$Env:USERNAME\Documents\noesis\Noesis64.exe"
$LNKSMARTGAGA = "C:\Users\$Env:USERNAME\Desktop\Free Fire.lnk"
$LNKNINJARIPPER = "C:\Users\$Env:USERNAME\Desktop\Ninjaripper.lnk"
$LNKNOESIS = "C:\Users\$Env:USERNAME\Desktop\Noesis.lnk"
$sevenZipPath = "C:\Program Files\7-Zip\7z.exe"
$archivePath = "C:\Users\$Env:USERNAME\Documents\ffripper.zip"
$destinationPath = "C:\Users\$Env:USERNAME\Documents"

# Authorization
if($PASSW -eq 'fv8454786runneradminFreeFireRipper'){
   write-host("WELCOME TO FFRIPPER BY GW KANG")
}else {
   write-host("MAY BE YOU ARE NOT AUTHORISED OR HAVE YOU EDITED THIS CODE????"); write-host("SETUP TERMINATED"); exit
}

# Code Blocks
$BASICCMD = {
   choco install chrome-remote-desktop-host -y -r --no-progress --ignore-checksums > $null 2>&1 
   Write-Output "Setting Up Resources Done"
   Invoke-Expression $code
   $i = 360
   do {
       Write-Host $i
       Sleep 60
       $i--
   } while ($i -gt 0)
   exit
}

$PROCMD = {
   cd C:\Users\$Env:USERNAME\Documents; write-host("Started Downloading Resources...")
   Start-BitsTransfer -Source 'https://drive.usercontent.google.com/download?id=1IsuJKnkSQ7wI6_kEjNmV9ixRRA0ozZcd&export=download&authuser=0&confirm=t&uuid=43d2e2a7-36ea-4dcb-bbd8-feaf9a61dbce&at=AIrpjvNtjLgoWaO3g4z8CglSi_um%3A1736506793305' -Destination ffripper.zip
   Write-host("Downloading Resources Done"); Write-Host "Setting Up Resources..." ; 7z x ffripper.zip -y > $null 2>&1
   choco install chrome-remote-desktop-host -y -r --no-progress --ignore-checksums > $null 2>&1
   New-Object -ComObject WScript.Shell | %{ $_.CreateShortcut("C:\Users\$Env:USERNAME\Documents\GWKANG.lnk") } | %{ $_.TargetPath = "C:\Users\$Env:USERNAME\Desktop\GWKANG"; $_.Save() } > $null 2>&1
   New-Item -Path $MYFOLDER -ItemType Directory > $null 2>&1; Start-Process $NINJARIPPER; New-Item -ItemType SymbolicLink -Target $NINJARIPPER -Path $LNKNINJARIPPER > $null 2>&1; New-Item -ItemType SymbolicLink -Target $NOESIS -Path $LNKNOESIS > $null 2>&1; New-Item -ItemType SymbolicLink -Target $SMARTGAGA -Path $LNKSMARTGAGA > $null 2>&1
   Write-Output "Setting Up Resources Done"
   Write-Output "Logging in $ffserver server"; Invoke-WebRequest -Uri "https://drive.usercontent.google.com/download?id=1IsuJKnkSQ7wI6_kEjNmV9ixRRA0o" -OutFile ffserver.7z ; 7z x ffserver.7z -y > $null 2>&1 ; adb push "C:\Users\$Env:USERNAME\Documents\ffserver\$ffserver" "/storage/emulated/0/com.garena.msdk/guest100067.dat" ; Remove-Item -Path "C:\Users\$Env:USERNAME\Documents\ffserver" -Recurse -Force
}

# Running Code Block
if($VTYPE -eq 'FreeFireRipper-Basic'){
   write-host('Version Type : Basic'); &$BASICCMD
}elseif ($VTYPE -eq 'FreeFireRipper-Pro'){
   write-host('Version Type : Pro'); write-host 'Coming Soon !'; exit
}elseif ($VTYPE -eq 'FreeFireRipper-Advanced'){
   write-host('Version Type : Advanced'); write-host 'Coming Soon !'; exit
}
