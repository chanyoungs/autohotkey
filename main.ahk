#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#MaxHotkeysPerInterval 9999
;-------------------Caps-Lock->Control--------------------------------

GroupAdd, winTest, ahk_class Emacs
GroupAdd, winTest, ahk_class Chrome_WidgetWin_1
GroupAdd, winTest, ahk_class MozillaWindowClass
GroupAdd, winTest, ahk_class Qt5151QWindowIcon
return

;WinGetClass, Title, A
;MsgBox, The active window is "%Title%".

;ActiveHwnd := WinExist("A") ; to assign Active windo id to 'ActiveHwnd' use... ActiveHwnd := WinExist("A")
;MsgBox, The active window is "%ActiveHwnd%" ; to print a message box use... MsgBox, The active window is "%ActiveHwnd%".

#IfWinNotExist ahk_class Emacs
{
    ^!e::
        Run C:\Users\chany\Documents\Programming\emacs\emacs-26.3-x86_64\bin\emacsclientw.exe -c -n -a "" -f C:\Users\chany\Documents\Programming\emacs\.emacs.d\server\server
    return
}

#IfWinActive, ahk_group winTest
    {
        Capslock::Control ; make Caps Lock the control button
        #IfWinActive, ahk_exe Code.exe
            {
                ^WheelUp::f
                ^WheelDown::b
                !WheelUp::f
                !WheelDown::b
                #if GetKeyState("CapsLock","P")
                {
                    WheelUp::f
                    WheelDown::b
                }
            }

        }

        ;-------------------VSCode Scroll wheel--------------------------------
        ;#IfWinActive ahk_class Chrome_WidgetWin_1
        ;^WheelUp::f
        ;Capslock & WheelUp::f
        ;f::b
        ;return

        ;-----------------------Surface Pen hotkeys--------------------------
        #IfWinExist, ahk_class screenClass
            #F20::
            Send {PgDn}
        Return
        #F19::
            Send {PgUp}
        Return

        #IfWinActive, ahk_class MangaMeeya
        #F20::
            Send {Right}
        Return
        #F19::
            Send {Left}
        Return

        #installkeybdhook
        #singleinstance force
        settitlematchmode, 2

        #IfWinNotExist ahk_exe ONENOTE.EXE
        {
        #F19::
            {
                send, {LWIN down}{LShift down}{s}{LShift up}{LWIN up}
                Return
            } 

        #F20::
            { 
                run, "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"
                Return
            }
        }

        #IfWinExist ahk_exe ONENOTE.EXE 
        {
            #IfWinActive ahk_exe ONENOTE.EXE
                {
                    #F19::
                        {
                            send {Ctrl down}{z}{Ctrl up}
                            return
                        }
                    #F20::
                        {
                            sleep 50
                            send {alt}
                            sleep 50
                            send {d}
                            sleep 50
                            send {p}
                            return
                        }
                    }

                    #IfWinNotActive ahk_exe ONENOTE.EXE
                        {
                            #F19::
                                {
                                    send, {LWIN down}{LShift Down}{s}{LShift Up}{LWIN up}
                                    Return
                                }

                            #F20::
                                { 
                                    WinActivate, ahk_exe ONENOTE.exe ;Bring to Front
                                    Return
                                }
                            }
                        }

                        ;-------------------------Remove en-UK-----------------------------------
                        ; Ctrl+Win+Space removes en-UK
                        ^#Space:: run, "./Remove_en-UK.bat",, Hide

                        ;-------------------------Wake Ubuntu-----------------------------------
                        ; Ctrl+Win+u wakes Ubuntu
                        ^#u:: run, "./wake_ubuntu.bat",, Hide