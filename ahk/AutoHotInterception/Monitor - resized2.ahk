#SingleInstance force
#Persistent
#include Lib\AutoHotInterception.ahk

OutputDebug DBGVIEWCLEAR
Gui, Margin, 10, 10
DeviceList := {}
filterMouseMove := 1
filterKeyPress := 0

AHI := new AutoHotInterception()
DeviceList := AHI.GetDeviceList()

marginX := 10
marginY := 10
idW := 50
vhOff := 7
copyW := 60
outputH := 400
rowH := 35
totalWidths := {K: 450, M: 450}
columnX := {K: 10, M: 470}
starts := {K: 0, M: 10}
lowest := 80

maxWidths := {K: 0, M: 0}  
strings := {}  

Loop 2 {
    devType := (A_Index = 1 ? "K" : "M")
    Gui, Add, Text, % "x" columnX[devType] " y10 w" totalWidths[devType] " Center", % (devType = "K" ? "Keyboards" : "Mice")

    Loop 10 {
        i := starts[devType] + A_Index
        dev := DeviceList[i]
        if (!IsObject(dev)) continue

        ; Retrieve VID/PID using AutoHotInterception
        AHI.SubscribeKeyboard(i, false, Func("ShowVIDPID").Bind(dev.VID, dev.PID))

        strings[A_Index] := {vid: dev.VID, pid: dev.PID, handle: dev.Handle}

        rowY := (marginY * 3) + ((A_Index - 1) * rowH)
        Gui, Add, Checkbox, % "x" columnX[devType] " y" rowY " w" idW " gCheckboxChanged", % "ID: " dev.id
        Gui, Add, Text, % "x" columnX[devType] + idW " y" rowY - vhOff, % "VID / PID:`t0x" FormatHex(strings[A_Index].vid) ", 0x" FormatHex(strings[A_Index].pid)
        maxWidths[devType] := UpdateWidth(hwnd)
        Gui, Add, Text, % "x" columnX[devType] + idW " y" rowY + vhOff, % "Handle:`t`t" StrReplace(strings[A_Index].handle, "&", "&&")

        fn := Func("CopyClipboard").Bind("0x" strings[A_Index].vid ", 0x" strings[A_Index].pid)
        xpos := columnX[devType] + idW + maxWidths[devType]
        Gui, Add, Button, % "x" xpos " y" rowY - vhOff " w" copyW " h20 hwndhwnd", Copy
        GuiControl, +g, % hwnd, % fn
        
        fn := Func("CopyClipboard").Bind(strings[A_Index].handle)
        Gui, Add, Button, % "x" xpos " y" rowY + vhOff " w" copyW " h20 hwndhwnd", Copy
        GuiControl, +g, % hwnd, % fn
    }
}

lowest += 2 * marginY

Gui, Add, CheckBox, % "x" columnX.K " y" lowest " gFilterPress", Only show key releases
Gui, Add, CheckBox, % "x" columnX.M " yp w" totalWidths.M " gFilterMove Checked", Filter Movement (Warning: Turning off can cause crashes)

lowest += 40

Gui, Add, Button, % "x" columnX.K " y" lowest " w" totalWidths.K " Center gClearKeyboard", Clear
Gui, Add, Button, % "x" columnX.M " yp w" totalWidths.M " Center gClearMouse", Clear

lowest += 40

Gui, Add, ListView, % "x" columnX.K " y" lowest " w" totalWidths.K " h" outputH " hwndhLvKeyboard", ID|Code|State|Key Name
LV_ModifyCol(4, 120)
Gui, Add, ListView, % "x" columnX.M " yp w" totalWidths.M " h" outputH " hwndhLvMouse", ID|Code|State|X|Y|Info
LV_ModifyCol(6, 120)

lowest += outputH
Gui, Show, % "w" 950 " h" (lowest + 50), AutoHotInterception Monitor

return

ShowVIDPID(vid, pid, code, state) {
    if (state = 1) {
        ToolTip, Pressed key from device:
        (LTrim
        VID: 0x%vid%
        PID: 0x%pid%
        )
        SetTimer, ClearToolTip, -1500
    }
}

ClearToolTip:
ToolTip
return

CheckboxChanged:
    ; Handle checkbox toggles
return

FilterMove:
    filterMouseMove := !filterMouseMove
return

FilterPress:
    filterKeyPress := !filterKeyPress
return

ClearKeyboard:
    Gui, ListView, % hLvKeyboard
    LV_Delete()
return

ClearMouse:
    Gui, ListView, % hLvMouse
    LV_Delete()
return

CopyClipboard:
    Clipboard := A_ThisLabel
    Tooltip Copied to Clipboard
    SetTimer, ClearTooltip, 1000
return

FormatHex(num){
    return Format("{:04X}", num)
}

UpdateWidth(hwnd){
    GuiControlGet, cp, pos, % hwnd
    return cpW
}

GuiClose:
ExitApp