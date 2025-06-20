#NoEnv
#SingleInstance, Force

Gui,1:+AlwaysOnTop
Gui, New
Gui, Color, 0xDAA520
Gui, Font, Sans
Gui, Add, Button, x100 y100 w200 h50 gMyButton BackgroundTrans, Emergency Close
Gui, Add, Text, x120 y60 w380 BackgroundTrans, Hold F1 for AutoClicker!
Gui, Add, Text, x30 y10 w380 BackgroundTrans, Open With notepad for instructions on how to use
Gui, Add, Text, x80 y35 w380 BackgroundTrans, You can have this menu minimized

Gui, Add, Button, x350 y250 w50 h50 gMySite, Github


if FileExist(A_ScriptDir . "\SOlair_Standing.png")
    Gui, Add, Picture, x130 y160 w200 h150, %A_ScriptDir%\SOlair_Standing.png
else
    Gui, Add, Text, x130 y160 w200 h50 Center BackgroundTrans, Image not found
Gui, Show, x200 y200 w400 h300, c6shys Macro

;If this works right, if you somehow run this file without autohotkey installed, it should go to the page for it, prolly not tho, I cant test it :(
*F1::
{
    RegRead, ahkPath, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey, InstallDir
    if ErrorLevel {
        if !FileExist("C:\Program Files\AutoHotkey\AutoHotkey.exe") and !FileExist("C:\Program Files (x86)\AutoHotkey\AutoHotkey.exe") {
            Run, https://www.autohotkey.com/download/
            MsgBox, 64, AutoHotkey Required, AutoHotkey is not installed. Opening download page...
            return
        }
    }
; {If you want your keybind to start it, Change the F1. If you want to cahnge the Keyboard input, change b. Sleep adjusts the speed.}
    while GetKeyState("F1", "P") {
        Send, b
        Sleep, 25  
        Click
        Sleep, 25 
    }
}
return

MySite:
MsgBox yes
return

;{Emergency Stop}
MyButton:
MsgBox, 64, Message, Stopped (Closing Program) , 2
Sleep, 100
ExitApp
return

F3::ExitApp

Test_Button_Press:
MsgBox, Button was pressed!
return

