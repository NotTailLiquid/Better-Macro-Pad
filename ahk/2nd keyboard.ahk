#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force
#Persistent
#include C:\Users\Ratsucksatmath\Documents\AutoHotkey\Lib\AutoHotInterception.ahk

AHI := new AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x32C2, 0x0012)
AHI.SubscribeKeyboard(keyboardId, true, Func("KeyEvent"))

return

KeyEvent(code, state){
	ToolTip % "Keyboard Key - Code: " code ", State: " state
}

^Esc::
	ExitApp