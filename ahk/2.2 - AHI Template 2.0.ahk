#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force
#Persistent
#include C:\Users\Ratsucksatmath\Documents\AutoHotkey\Lib\AutoHotInterception.ahk
;}

AHI := new AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x32C2, 0x0012)
AHI.SubscribeKeyboard(keyboardId, true, Func("KeyEvent"))

return

KeyEvent(code, state){

if (state=1) & (code=55)
{
    SendInput, {Ctrl down}{F13}{Ctrl up}
}

if (state=1) & (code=71)
{
    SendInput, {F21}
}

if (state=1) & (code=72)
{
    SendInput, {F22}
}

if (state) && (code=74)
{
    SendInput, {Shift down}{F17}{Shift up}
}

if (state=1) & (code=75)
{
    SendInput, {F19}
}

if (state=1) & (code=76)
{
    SendInput, {F20}
}

if (state) && (code=81)
{
    SendInput, {Shift down}{F14}{Shift up}
}

if (state=1) & (code=77)
{
    SendInput, {Alt down}{F14}{Alt up}
}

if (state) && (code=73)
{
    SendInput, {Shift down}{F13}{Shift up}
}

if (state=1) & (code=78)
{
	SendInput, {Shift down}{F16}{Shift up}
}

if (state=1) & (code=309)
{
    SendInput, {Ctrl down}{F16}{Ctrl up}
}

if (state=1) & (code=79)
{
    SendInput, {Ctrl down}{F7}{Ctrl up}
}

if (state=1) & (code=80)
{
    SendInput, {Ctrl down}{F8}{Ctrl up}
}

if (state) && (code=14)
{
    SendInput, {Alt down}{F13}{Alt up}
}

if (state=1) & (code=83)
{
    SendInput, {Shift down}{F18}{Shift up}
}

if (state) && (code=325)
{
    SendInput, {Ctrl down}{F15}{Ctrl up}
}

if (state=1) & (code=284)
{
    SendInput, {Shift down}{F15}{Shift up}
}

if (state) && (code=82)
{
    SendInput, {Alt down}{F18}{Alt up}
}

    }



!F13::Run, %ComSpec% /c cd /d "C:\Users\Ratsucksatmath\Desktop\ahk\for_stream_shortcuts" && start "" "loading_epic.vbs", , Hide
return

^F13::
Run, %ComSpec% /c cd /d "C:\Users\Ratsucksatmath\Desktop\ahk\for_stream_shortcuts" && start "" "starting_soon.vbs", , Hide
return

+F13::
Run, %ComSpec% /c cd /d "C:\Users\Ratsucksatmath\Desktop\ahk\for_stream_shortcuts" && start "" "minecraft_window.vbs", , Hide
return
 
F21::
Run, %ComSpec% /c cd /d "C:\Users\Ratsucksatmath\Desktop\ahk\for_stream_shortcuts" && start "" "start_stop_recording.vbs", , Hide
return

F22::
Run, %ComSpec% /c cd /d "C:\Users\Ratsucksatmath\Desktop\ahk\for_stream_shortcuts" && start "" "pause_recording.vbs", , Hide
return

!F14::Run, %ComSpec% /c cd /d "C:\Users\Ratsucksatmath\Desktop\ahk\for_stream_shortcuts" && start "" "brb!.vbs", , Hide
return


+F14::Run % "https://www.youtube.com/@LinusTechTips/streams"


^F14::Run % "C:\Program Files\Google\Chrome\Application\chrome.exe"


^F16::Run % "\\192.168.0.150"


+F16::
Run, %ComSpec% /c cd /d "C:\Users\Ratsucksatmath\Desktop\ahk\for_stream_shortcuts" && start "" "screen_share_capture.vbs", , Hide
return

^F17::Send, +#c


+F17::
Run, %ComSpec% /c cd /d "C:\Users\Ratsucksatmath\Desktop\ahk\for_stream_shortcuts" && start "" "emergency_stream_stop.vbs", , Hide
return


#F17::Run % "C:\Users\Ratsucksatmath\AppData\Roaming\.minecraft"



!F16::Run "C:\Users\Ratsucksatmath\Documents"

!F17::Run % A_Temp

!F18::Send, {Media_Play_Pause}

^F18::Run "C:\Users\Ratsucksatmath\AppData\Roaming\.minecraft"


+F18::Run % "https://www.youtube.com/"


#F18::Run % "C:\Users\Ratsucksatmath\AppData\Roaming\.minecraft\screenshots"

^F19::Run % "C:\Users\Ratsucksatmath\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Chrome 應用程式\PairDrop.ink"


+F19::Run % "C:\Users\Ratsucksatmath\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools\Control Panel.lnk"


#F19::
Send, #r
Send, explorer.exe shell:RecycleBinFolder
Send, {Enter}
Return

!F19::
IfWinExist % "data ssd"
{
    IfWinNotActive % "data ssd"
        WinActivate
}
else
{
    Run % "D:\"
    WinWait % "data ssd"
    WinActivate
}
Send, ^+n
Return


^F24::Send, +{5}


+F24::Send, +{1}



+F15::Run % "C:\Users\Ratsucksatmath\Desktop\ahk\dns.bat"


^F23::Run % "C:\sd3.bat"

+F23::
IfWinExist % "Documents"
{
    IfWinNotActive % "Documents"
        WinActivate
}
else
{
    Run % A_MyDocuments
    WinWait % "Documents"
    WinActivate
}
Send, ^+n
Return

#F23::Run % "C:\Users\Ratsucksatmath\Desktop\ahk\sshserver.bat"

