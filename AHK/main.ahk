
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance Force ; No others
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;SetMouseDelay, 100
SetKeyDelay, 40
SetTitleMatchMode RegEx
Menu, Tray, Icon, 2hotstrings.ico

; You can use the WindowSpy script to get the names and classes of programs
; WindowSpy comes with AutoHotKey
GroupAdd, mail, Outlook (PWA)
GroupAdd, firefox, ahk_exe firefox.exe
GroupAdd, zoom, ahk_exe Zoom.exe

GroupAdd, editors, ahk_exe Rider64.exe
GroupAdd, editors, ahk_exe notepad++.exe

; Yay globals
g_mode := ""


Return ; END OF HEADERS

#Include hotstrings.ahk

; Some notes on hotkey modifier symbols
; # = Winkey
; + = shift
;   (hotkeys are otherwise case insensitive, c:: = C:: ≠ +c::
; ^ = ctrl
; ! = alt
; > = RIGHT modifier. >^c is "right ctrl + c"
;   good for not accidentally overriding builtin chords

; !!! IMPORTANT !!!
; These let you update and reload your config on the fly
; They are super, SUPER IMPORTANT
; (They also only work if you're running an .ahk file, not a compiled .exe)
#~Escape::Reload
#!,::Edit

; Format copy as markdown link
; Unfortunately there's no way to get selected text without copying it to the clipboard
; #!c::
; 	ctmp := clipboard
; 	clipboard := ""
; 	Send ^c
; 	ClipWait, 2
; 	clipboard := "[" . clipboard . "](" . ctmp . ")"
; Return

; Same as above, but use title too
; (I don't ever use this one)
; >^>!c::
; 	clipboard := ""
; 	Send ^c
; 	ClipWait, 2
; 	ctmp := clipboard
; 	Send ^l
; 	Sleep, 400
; 	clipboard := ""

; 	Send ^c
; 	ClipWait, 2
; 	clipboard := "[" . ctmp . "](" . clipboard . ")"
; Return



; For things that are unique
toggle_app(app, location) 
{
	if WinExist(app)   
	{
		
		if !WinActive(app)
		{
			WinActivate
		}
        else
		{
			WinMinimize
		}
	}
	else if location != ""
	{
		Run, %location%
	}
}



; This has to be a .lnk file because spotify is an app, not an .exe. It's weird.
>!s::toggle_app("ahk_exe Spotify.exe", "D:\Software\AutoHotKey\Lib\Spotify.lnk")

#!1:: GroupActivate, firefox, R
#!2:: GroupActivate, editors, R

#!e:: GroupActivate, mail, R
#!c:: GroupActivate, editors, R
#!z:: GroupActivate, zoom, R


RemoveToolTip:
ToolTip
return

RemoveTrayTip:
TrayTip
return


