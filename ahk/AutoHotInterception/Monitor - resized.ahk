#SingleInstance force
#Persistent
#include Lib\AutoHotInterception.ahk

AHI := new AutoHotInterception()

Gui +Resize
Gui, Margin, 10, 10

Gui, Add, CheckBox, vFilterKeys gToggleFilterKeys, Only show key releases
Gui, Add, CheckBox, vFilterMouse Checked gToggleFilterMouse, Filter mouse movement (Warning: May cause crashes if disabled)
Gui, Add, Button, gClearKeyboardSection, Clear Keyboard
Gui, Add, Button, gClearMouseSection, Clear Mouse

Gui, Add, ListView, vKeyboardLV w500 h200, ID|Code|State|Key
Gui, Add, ListView, vMouseLV w500 h200, ID|Code|State|X|Y|Info

Gui, Show, AutoSize, Simple Input Monitor
return

ToggleFilterKeys:
GuiControlGet, FilterKeys
return

ToggleFilterMouse:
GuiControlGet, FilterMouse
return

ClearKeyboardSection:
Gui, ListView, KeyboardLV
LV_Delete()
return

ClearMouseSection:
Gui, ListView, MouseLV
LV_Delete()
return

KeyboardEvent(id, code, state) {
    global FilterKeys
    if (FilterKeys && state)
        return
    Gui, ListView, KeyboardLV
    scanCode := Format("{:x}", code)
    keyName := GetKeyName("SC" scanCode)
    LV_Add(, id, code, state, keyName)
    LV_Modify(LV_GetCount(), "Vis")
}

MouseButtonEvent(id, code, state) {
    Gui, ListView, MouseLV
    LV_Add(, id, code, state, "", "", "Button")
    LV_Modify(LV_GetCount(), "Vis")
}

MouseAxisEvent(id, info, x, y) {
    global FilterMouse
    if (FilterMouse)
        return
    Gui, ListView, MouseLV
    LV_Add(, id, "", "", x, y, info)
    LV_Modify(LV_GetCount(), "Vis")
}

; Subscribe all devices at once for demo purposes
Loop, 20 {
    if (AHI.SubscribeKeyboard(A_Index, false, Func("KeyboardEvent").Bind(A_Index)))
        continue
}
Loop, 20 {
    if (AHI.SubscribeMouseButtons(A_Index, false, Func("MouseButtonEvent").Bind(A_Index)))
        AHI.SubscribeMouseMoveRelative(A_Index, false, Func("MouseAxisEvent").Bind(A_Index, "Rel"))
}

GuiClose:
ExitApp
