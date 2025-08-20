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
totalWidths := {K: 450, M: 450}  ; Adjusted width
columnX := {K: 10, M: 470}
starts := {K: 0, M: 10}
lowest := 80

OutputDebug % "Device Count: " DeviceList.Length()  ; Debugging device list population

Loop 2 {
    devType := (A_Index = 1 ? "K" : "M")
    Gui, Add, Text, % "x" columnX[devType] " y10 w" totalWidths[devType] " Center", % (devType = "K" ? "Keyboards" : "Mice")

    Loop 10 {
        i := starts[devType] + A_Index
        dev := DeviceList[i]
        if (!IsObject(dev)) continue

        vid := AHI.GetDeviceVID(dev.id)  ; Retrieve VID explicitly
        pid := AHI.GetDevicePID(dev.id)  ; Retrieve PID explicitly

        rowY := (marginY * 3) + ((A_Index - 1) * rowH)
        Gui, Add, Checkbox, % "x" columnX[devType] " y" rowY " w" idW " gCheckboxChanged", % "ID: " dev.id
        Gui, Add, Text, % "x" columnX[devType] + idW " y" rowY - vhOff, % "VID / PID:`t0x" FormatHex(vid) ", 0x" FormatHex(pid)
        Gui, Add, Text, % "x" columnX[devType] + idW " y" rowY + vhOff, % "Handle:`t`t" StrReplace(dev.Handle, "&", "&&")

        Gui, Add, Button, % "x" columnX[devType] + idW + totalWidths[devType] - copyW " y" rowY - vhOff " w" copyW " h20 gCopyClipboard", Copy
        Gui, Add, Button, % "x" columnX[devType] + idW + totalWidths[devType] - copyW " y" rowY + vhOff " w" copyW " h20 gCopyClipboard", Copy
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

ClearTooltip:
    ToolTip
return

FormatHex(num){
    return Format("{:04X}", num)
}

GuiClose:
ExitApp