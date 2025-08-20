#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force
#Persistent
#include <AutoHotInterception>

AHI := new AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x1A2C, 0x2124)
AHI.SubscribeKeyboard(keyboardId, true, Func("KeyEvent"))

global shapeROW=1 ; Initial ROW position of selection in the "Shapes" window in Paint
global shapeCOL=1 ; Same for COLUMN
global Current_Selected_Size:=2 ; By default the size #2 is selected in paint. Unfortunately there is no straightforward way to reset this selection so for the script to work correctly you should try not to use any other means of changing the size to not desync the stored value in Current_Selected_Size with the actual selected size. If you happened to mess up, just reload the script and manually set the initial selected size to the size #2.

return

KeyEvent(code, state){

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;{%%%%%%%%%%%%%%%======= Shapes =======%%%%%%%%%%%%%%%
;{======= Line ================== PRESS 1 ============
if (state) & (code=2)
{
	Send, {alt}{H}{P}{1} ; A trick with enabling a random tool to reset the selection in the "Shapes" window
	sleep, 200
	
	Send, {alt}{H}{S}{H} ; Accessing the "Shapes" window
	sleep, 200
	
	Destination_col := 1	; cCOLUMN position of a line tool in the "Shapes" window
	Destination_row := 1	; same for ROW position
		
	Current_Column_Selection := 1 ; declares an iterator for the while cycle 
		
	While(Current_Column_Selection < Destination_col) 
	; Condition: as soon as Current_Column_Selection = Destination_col the cycle stops as we reach the destination column.
	{
		Current_Column_Selection++ ; Increases the Current_Column_Selection by 1 with each iteration af the while cycle
		Send, {Right} ; Moves the selection inside of the Paint with the right arrow key.
	}	
		
	Current_Row_Selection := 1	
	
	While(Current_Row_Selection < Destination_row)	; Same logic with this condition.
	{
		i++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Curve ================= PRESS 2 ============
if (state) & (code=3)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	
	Send, {alt}{H}{S}{H}
	sleep, 200
	
	Destination_col := 2	
	Destination_row := 1
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection < Destination_col) 
	; Condition: as soon as Current_Column_Selection = Destination_col the cycle stops as we reach the destination column.
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
	
	While(Current_Row_Selection < Destination_row)	; Same logic with this condition.
	{
		i++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Oval ================== PRESS 3 ============
if (state) & (code=4)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	
	Send, {alt}{H}{S}{H}
	sleep, 200
	
	Destination_col := 3	
	Destination_row := 1
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection < Destination_col) 
	; Condition: as soon as Current_Column_Selection = Destination_col the cycle stops as we reach the destination column.
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
	
	While(Current_Row_Selection < Destination_row)	; Same logic with this condition.
	{
		i++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Rectangle ============= PRESS 4 ============
if (state) & (code=5)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	
	Send, {alt}{H}{S}{H}
	sleep, 200
	
	Destination_col := 4	
	Destination_row := 1
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection < Destination_col) 
	; Condition: as soon as Current_Column_Selection = Destination_col the cycle stops as we reach the destination column.
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
	
	While(Current_Row_Selection < Destination_row)	; Same logic with this condition.
	{
		i++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Rounded Rectangle ===== PRESS 5 ============
if (state) & (code=6)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	
	Send, {alt}{H}{S}{H}
	sleep, 200
	
	Destination_col := 5	
	Destination_row := 1
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection < Destination_col) 
	; Condition: as soon as Current_Column_Selection = Destination_col the cycle stops as we reach the destination column.
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
	
	While(Current_Row_Selection < Destination_row)	; Same logic with this condition.
	{
		i++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Polygon =============== PRESS 6 ============
if (state) & (code=7)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	
	Send, {alt}{H}{S}{H}
	sleep, 200
	
	Destination_col := 6	
	Destination_row := 1
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection < Destination_col) 
	; Condition: as soon as Current_Column_Selection = Destination_col the cycle stops as we reach the destination column.
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
	
	While(Current_Row_Selection < Destination_row)	; Same logic with this condition.
	{
		i++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Triangle ============== PRESS 7 ============
if (state) & (code=8)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	
	Send, {alt}{H}{S}{H}
	sleep, 200
	
	Destination_col := 7	
	Destination_row := 1
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection < Destination_col) 
	; Condition: as soon as Current_Column_Selection = Destination_col the cycle stops as we reach the destination column.
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
	
	While(Current_Row_Selection < Destination_row)	; Same logic with this condition.
	{
		i++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Arrow Right =========== PRESS T ============
if (state) & (code=20)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	
	Send, {alt}{H}{S}{H}
	sleep, 200
	
	Destination_col := 5	
	Destination_row := 2
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection < Destination_col) 
	; Condition: as soon as Current_Column_Selection = Destination_col the cycle stops as we reach the destination column.
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
	
	While(Current_Row_Selection < Destination_row)	; Same logic with this condition.
	{
		i++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Lightning ============= PRESS Q ============
if (state) & (code=16)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	
	Send, {alt}{H}{S}{H}
	sleep, 200
	
	Destination_col := 2	
	Destination_row := 4
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection < Destination_col) 
	; Condition: as soon as Current_Column_Selection = Destination_col the cycle stops as we reach the destination column.
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
	
	While(Current_Row_Selection < Destination_row)	; Same logic with this condition.
	{
		i++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;{%%%%%%%%%%%%%%%======= Brushes =======%%%%%%%%%%%%%%%%%
;{======= Brush 1 ================ PRESS Numpad1 ========
if (state) & (code=79)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	Send, {alt}{H}{B}
	sleep, 200
	
	Destination_col := 1
	Destination_row := 1
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection<col)
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
		
	While(Current_Row_Selection<row)
	{
		Current_Row_Selection++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Brush 2 ================ PRESS Numpad2 ========
if (state) & (code=80)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	Send, {alt}{H}{B}
	sleep, 200
	
	Destination_col := 2
	Destination_row := 1
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection<col)
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
		
	While(Current_Row_Selection<row)
	{
		Current_Row_Selection++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Brush 3 ================ PRESS Numpad3 ========
if (state) & (code=81)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	Send, {alt}{H}{B}
	sleep, 200
	
	Destination_col := 3
	Destination_row := 1
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection<col)
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
		
	While(Current_Row_Selection<row)
	{
		Current_Row_Selection++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Brush 4 ================ PRESS Numpad4 ========
if (state) & (code=75)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	Send, {alt}{H}{B}
	sleep, 200
	
	Destination_col := 1
	Destination_row := 4
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection<col)
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
		
	While(Current_Row_Selection<row)
	{
		Current_Row_Selection++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Brush 5 ================ PRESS Numpad5 ========
if (state) & (code=76)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	Send, {alt}{H}{B}
	sleep, 200
	
	Destination_col := 1
	Destination_row := 2
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection<col)
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
		
	While(Current_Row_Selection<row)
	{
		Current_Row_Selection++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Brush 6 ================ PRESS Numpad6 ========
if (state) & (code=77)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	Send, {alt}{H}{B}
	sleep, 200
	
	Destination_col := 2
	Destination_row := 2
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection<col)
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
		
	While(Current_Row_Selection<row)
	{
		Current_Row_Selection++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Brush 7 ================ PRESS Numpad7 ========
if (state) & (code=71)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	Send, {alt}{H}{B}
	sleep, 200
	
	Destination_col := 3
	Destination_row := 2
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection<col)
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
		
	While(Current_Row_Selection<row)
	{
		Current_Row_Selection++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Brush 8 ================ PRESS Numpad8 ========
if (state) & (code=72)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	Send, {alt}{H}{B}
	sleep, 200
	
	Destination_col := 4
	Destination_row := 2
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection<col)
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
		
	While(Current_Row_Selection<row)
	{
		Current_Row_Selection++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;{======= Brush 9 ================ PRESS Numpad9 ========
if (state) & (code=73)
{
	Send, {alt}{H}{P}{1}
	sleep, 200
	Send, {alt}{H}{B}
	sleep, 200
	
	Destination_col := 1
	Destination_row := 3
		
	Current_Column_Selection := 1
		
	While(Current_Column_Selection<col)
	{
		Current_Column_Selection++
		Send, {Right}
	}	
		
	Current_Row_Selection := 1	
		
	While(Current_Row_Selection<row)
	{
		Current_Row_Selection++
		Send, {Down}
	}	

	Send, {Enter}
}
;}
;}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

;{======= Pencil ================ PRESS Insert ==========	
if (state) & (code=338)
{
		Send, {alt}{H}{P}{1}
}
;}	
;{======= Bucket ================ PRESS Home ============	
if (state) & (code=327)
{
	Send, {alt}{H}{K}
}
;}	
;{======= Text ================== PRESS Page Up =========	
if (state) & (code=329)
{
		Send, {alt}{H}{T}
}
;}	
;{======= Eraser ================ PRESS Delete ==========	
if (state) & (code=339)
{
		Send, {alt}{H}{E}{R}
}
;}	
;{======= Color Picker ========== PRESS End =============	
if (state) & (code=335)
{
		Send, {alt}{H}{D}
}
;}	
;{======= Zoom ================== PRESS PageDown ========	
if (state) & (code=337)
{
		Send, {alt}{H}{M}
}
;}

;{======= Select ================ PRESS PrtSc ===========
if (state) & (code=311)
{
		Send, {alt}{H}{S}{E}{R}
}
;}
;{======= Crop ================== PRESS ScrLk ===========
if (state) & (code=70)
{
		Send, {alt}{H}{R}{P}
}
;}	

;{======= Line Size ============= PRESS F1-F4 ===========
if (state) & (code=59)
	{
		Send, {alt}{H}{S}{Z}
		
		Destination_Size := 1
		
		Current_Size_Selection := 1
		
		While(Current_Size_Selection < Destination_Size) {
			Current_Size_Selection++
			Send, {Down}
		}
		
		Current_Selected_Size := 1
		
		Send, {Enter}
	}
	
if (state) & (code=60)
	{
		Send, {alt}{H}{S}{Z}
		
		Destination_Size := 2
		
		Current_Size_Selection := 1
		
		While(Current_Size_Selection < Destination_Size) {
			Current_Size_Selection++
			Send, {Down}
		}
		
		Current_Selected_Size := 2
		
		Send, {Enter}
	}
	
if (state) & (code=61)
	{
		Send, {alt}{H}{S}{Z}
		
		Destination_Size := 3
		
		Current_Size_Selection := 1
		
		While(Current_Size_Selection < Destination_Size) {
			Current_Size_Selection++
			Send, {Down}
		}
		
		Current_Selected_Size := 3
		
		Send, {Enter}
	}
	
if (state) & (code=62)
	{
		Send, {alt}{H}{S}{Z}
		
		Destination_Size := 4
		
		Current_Size_Selection := 1
		
		While(Current_Size_Selection < Destination_Size) {
			Current_Size_Selection++
			Send, {Down}
		}
		
		Current_Selected_Size := 4
		
		Send, {Enter}
	}
;}
;{======= Increase the Size ===== PRESS F6 ==============
if (state) & (code=64)
	{
	if (Current_Selected_Size < 4)
		{
		Send, {alt}{H}{S}{Z}
		
		New_Size_Selection:=1
		
		;Condition: the cycle will go until New_Size_Selection becomes bigger than Current_Selected_Size (by 1)
		While (New_Size_Selection <= Current_Selected_Size) 
		{
		New_Size_Selection++
		; Down key is getting pressed until we get to a selection that is bigger than Current_Selected_Size (by 1)
		Send, {Down} 
		}
		
		Current_Selected_Size++ ; Increases the Current_Selected_Size by 1
		
		Send, {Enter}
		}
	}
;}	
;{======= Reduce the Size ======= PRESS F5 ==============
if (state) & (code=63)
	{
	if (Current_Selected_Size>1)
		{
		Send, {alt}{H}{S}{Z}
		
		New_Size_Selection:=1
		
		;Condition: the cycle will go until New_Size_Selection becomes smaller than Current_Selected_Size (by 1). Rhis is a tricky one, but try and count it yourself to make sure you agree with it :)
		While (New_Size_Selection <= Current_Selected_Size - 2) 
		{
		New_Size_Selection++
		; Down key is getting pressed until we get to a selection that is smaller than Current_Selected_Size (by 1)
		Send, {Down} 
		}
		
		Current_Selected_Size-- ; Increases the Current_Selected_Size by 1
		
		Send, {Enter}
		}
	}
;}	

;{======= Reload the script ===== PRESS NumEnter ========


if (state) & (code=284)
	{
		Reload
	}
;}	

;{======= OBS ===========================================
if (state) & (code=55)
	{
		Send, {Insert down}
		sleep,100
		Send, {Insert up}
	}
	
if (state) & (code=74)
	{
		Send, {Home down}
		sleep,100
		Send, {Home up}
	}
	
if (state) & (code=82)
	{
		send, ^{i}
	}
;}
}

;------ Maintenance shortcuts
^!p::Pause    ; Pause script with Ctrl+Alt+P
^!s::Suspend  ; Suspend script with Ctrl+Alt+S
^!r::Reload   ; Reload script with Ctrl+Alt+R

^Esc::ExitApp	; Exit the script with Ctrl+Esc