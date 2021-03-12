#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include ..\TrayIcon.ahk

~Escape::Reload




;myReload(){
;    Reload
;    trayIcons := TrayIcon_GetInfo()
;
;ListVars
;Pause
;    if (trayIcons.Length() = 0) {
;        Menu, Tray, Icon, *
;        
;    } else {
;    
;        trayIcon := trayIcons.Pop()
;        if InStr(trayIcon.tooltip, "sonrisa") > 0 {
;            SetTrayIconToSON()
;        } else if InStr(trayIcon.tooltip, "apfeff") > 0 {
;            SetTrayIconToJUM()
;        } else {
;            Menu, Tray, Icon, *
;        }
;        
;    }
;    
;    
;}


#!s:: ; win+alt+s
SwitchToSON()
return

#!j:: ; win+alt+j
SwitchToJUM()
return

; ----------------------------------------------------------------

SwitchToSON() {
    switchToSonrisa = C:\git\gh\development-environment\AHK\VPN\sonvpn.bat
    CMD = %A_WinDir%\System32\cmd.exe 
     
    Run *RunAs "%CMD%" /c "%switchToSonrisa%"
    SetTrayIconToSON()
}

SetTrayIconToSON() {
    Menu, Tray, Icon, 1SON.ico
}

SwitchToJUM() {
    switchToJumio = C:\git\gh\development-environment\AHK\VPN\jumvpn.bat
    CMD = %A_WinDir%\System32\cmd.exe 
     
    Run *RunAs "%CMD%" /c "%switchToJumio%"
    SetTrayIconToJUM()
}

SetTrayIconToJUM() {
    Menu, Tray, Icon, 1JUM.ico
}