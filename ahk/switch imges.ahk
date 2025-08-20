SetTitleMatchMode, 2

#IfWinActive, Nomacs
{
    ; "[" to simulate the left arrow key
    [:: 
    {
        ; Activate the Nomacs window
        WinActivate, Nomacs
        ; Send the left arrow key
        Send, {Left}
        return
    }

    ; "]" to simulate the right arrow key
    ]:: 
    {
        ; Activate the Nomacs window
        WinActivate, Nomacs
        ; Send the right arrow key
        Send, {Right}
        return
    }
}
