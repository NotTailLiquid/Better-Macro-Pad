#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force
#Persistent
#include C:\Users\Ratsucksatmath\Documents\AutoHotkey\Lib\AutoHotInterception.ahk
;}

AHI := new AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x046D, 0xC337)
AHI.SubscribeKeyboard(keyboardId, true, Func("KeyEvent"))

return

KeyEvent(code, state){

if (state) & (code=38)
{
	SendInput, {Alt down}{F13}{Alt up}
}

if (state) && (code=3)
{
    SendInput, {Ctrl down}{F13}{Ctrl up}
}

if (state) && (code=4)
{
    SendInput, {Shift down}{F13}{Shift up}
}


if (state) && (code=5)
{
    SendInput, {LWin down}{F13}{LWin up}
}

if (state) & (code=8)
{
	SendInput, {Alt down}{F14}{Alt up}
}

if (state) && (code=9)
{
    SendInput, {Ctrl down}{F14}{Ctrl up}
}

if (state) && (code=10)
{
    SendInput, {Shift down}{F14}{Shift up}
}


if (state) && (code=26)
{
    SendInput, {LWin down}{F14}{LWin up}
}


if (state) && (code=310)
{
    SendInput, {Ctrl down}{F15}{Ctrl up}
}

if (state) && (code=28)
{
    SendInput, {Shift down}{F15}{Shift up}
}


if (state=1) & (code=49)
{
	SendInput, {Alt down}{F17}{Alt up}
}

if (state) && (code=25)
{
    SendInput, {Ctrl down}{F17}{Ctrl up}
}



if (state) && (code=30)
{
    SendInput, {Shift down}{F17}{Shift up}
}


if (state) && (code=26)
{
    SendInput, {LWin down}{F17}{LWin up}
}

if (state=1) & (code=34)
{
	SendInput, {Alt down}{F18}{Alt up}
}

if (state) && (code=31)
{
    SendInput, {Ctrl down}{F18}{Ctrl up}
}

if (state) && (code=35)
{
    SendInput, {Shift down}{F18}{Shift up}
}


if (state) && (code=36)
{
    SendInput, {LWin down}{F18}{LWin up}
}

if (state=1) & (code=51)
{
	SendInput, {Alt down}{F19}{Alt up}
}

if (state=1) & (code=52)
{
	SendInput, {f3 down}{F19}{f3 up}
}

if (state=1) & (code=16)
{
	SendInput, {f2 down}{F19}{f2 up}
}

if (state) && (code=37)
{
    SendInput, {Ctrl down}{F19}{Ctrl up}
}

if (state) && (code=47)
{
    SendInput, {Shift down}{F19}{Shift up}
}


if (state) && (code=52)
{
    SendInput, {LWin down}{F19}{LWin up}
}

if (state=1) & (code=17)
{
	Send, {f21}
}

if (state=1) & (code=18)
{
	Send, {f22}
}

if (state=1) & (code=19)
{
	SendInput, {Alt down}{F23}{Alt up}
}

if (state) && (code=40)
{
    SendInput, {Ctrl down}{F23}{Ctrl up}
}

if (state) && (code=52)
{
    SendInput, {Shift down}{F23}{Shift up}
}


if (state) && (code=27)
{
    SendInput, {LWin down}{F23}{LWin up}
}

if (state=1) & (code=83)
{
	SendInput, {Alt down}{F24}{Alt up}
}

if (state) && (code=331)
{
    SendInput, {Ctrl down}{F24}{Ctrl up}
}

if (state) && (code=333)
{
    SendInput, {Shift down}{F24}{Shift up}
}


if (state) && (code=336)
{
    SendInput, {Ctrl down}{f2}{Ctrl up}
}


if (state=1) & (code=23)
{
	Send, {Win}{i}
}


if (state=1) & (code=82)
{
	Send, {f20}
}


if (state=1) & (code=48)
{
	SendInput, {Alt down}{F16}{Alt up}
}

if (state) && (code=20)
{
    SendInput, {Ctrl down}{F16}{Ctrl up}
}

if (state) && (code=23)
{
    SendInput, {Shift down}{F16}{Shift up}
}



if (state=1) & (code=44)
{
	SendInput, {Alt down}{F15}{Alt up}
}

}

!F13::Run "C:\Users\Ratsucksatmath\Desktop"


^F13::Run "C:\Users\Ratsucksatmath\Pictures"


+F13::Run "D:\do not delete\videos"


#F13::Run "C:\Users\Ratsucksatmath\Documents"

!F14::Run "\\192.168.0.150"


^F14::Run "\\DESKTOP-2STEBL8\nas3"


+F14::Run % "C:\Program Files\Google\Chrome\Application\chrome.exe"


#F14::Run "C:\Users\Ratsucksatmath\AppData\Roaming\.minecraft"

^F16::Run % "C:\Users\Ratsucksatmath"


+F16::Run % "D:\do not delete\videos\screen record"

^F17::Send, +#c


+F17::Run % "https://www.youtube.com/@LinusTechTips/streams"


#F17::Run % "C:\Users\Ratsucksatmath\AppData\Roaming\.minecraft"



!F16::Run % "Notepad.exe"

!F17::Run % A_Temp

!F18::Send, #i

^F18::
Run % "C:\Users\Ratsucksatmath\AppData\Local\Stacher\Stacher.exe"
Run % "D:\do not delete\videos\downloaded"
Return


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


!F24::Run % "C:\Program Files\Google\NearbyShare\nearby_share_launcher.exe"

^F24::Send, +{5}


+F24::Send, +{1}

^F15::
Send, #m
Send, !{Tab}
Return


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


!F15::
Send, #v
loop_time_int_2869:=3
Loop %loop_time_int_2869% {
    Send, {Tab}
}
loop_time_int_2874:=4
Loop %loop_time_int_2874% {
    Send, {Left}
}
Send, {Enter}
Return

