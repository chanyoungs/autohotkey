#Warn  ; Enable warnings to assist with detecting common errors.
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.
#SingleInstance force
SetTitleMatchMode 2

;---------------------- Define window group ----------------------
GroupAdd "winTest", "ahk_class Emacs"
GroupAdd "winTest", "ahk_class Chrome_WidgetWin_1"
GroupAdd "winTest", "ahk_class MozillaWindowClass"
GroupAdd "winTest", "ahk_class Qt5151QWindowIcon"

;------------------- Ctrl+Alt+E: Launch or activate Emacs ----------------
^!e:: {
    if !WinExist("ahk_class Emacs")
        Run "C:\Users\chany\Programming\emacs\emacs-27.2-x86_64\bin\emacsclientw.exe", "-c -n -a `` -f C:\Users\chany\Programming\emacs\.emacs.d\server\server"
    WinActivate "ahk_class Emacs"
}

;------------------- Context-sensitive hotkeys for Code/Emacs/Chrome/Mozilla ----------------
#HotIf WinActive("ahk_group winTest")
#HotIf WinActive("ahk_exe Code.exe")
^WheelUp:: Send "f"
^WheelDown:: Send "b"
!WheelUp:: Send "f"
!WheelDown:: Send "b"
#HotIf  ; Reset context

;----------------------- Surface Pen hotkeys --------------------------
#HotIf WinExist("ahk_class screenClass")
F20:: Send "{PgDn}"
F19:: Send "{PgUp}"
#HotIf WinActive("ahk_class MangaMeeya")
F20:: Send "{Right}"
F19:: Send "{Left}"
#HotIf  ; Reset context

;----------------------- OneNote hotkeys --------------------------
; When OneNote is not running
#HotIf !WinExist("ahk_exe ONENOTE.EXE")
F19:: Send "{LWin down}{LShift down}s{LShift up}{LWin up}"
F20:: Run "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"
#HotIf ; reset

; When OneNote is active
#HotIf WinActive("ahk_exe ONENOTE.EXE")
F19:: Send "{Ctrl down}z{Ctrl up}"
F20:: {
    Sleep 50
    Send "{Alt}"
    Sleep 50
    Send "d"
    Sleep 50
    Send "p"
}
#HotIf ; Reset context

;----------------------- Miscellaneous --------------------------
^#Space:: Run "./Remove_en-UK.bat", , "Hide"
^#u::      Run "./wake_ubuntu.bat", , "Hide"
