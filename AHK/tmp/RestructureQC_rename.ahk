#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

~Escape::Reload

::;rename::
ctmp := clipboard ; what's currently on the clipboard
clipboard := "JBO-1392 rename ``" . ctmp . "`` to ````"
Send ^v ; Paste
Sleep 100
clipboard := ctmp
Return ; ends a multiline command