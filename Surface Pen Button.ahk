#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

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
        send, {LWIN down}{LShift Down}{s}{LShift Up}{LWIN up}
        Return
    }   

    #F20::
    {   
        run, "C:\Program Files (x86)\Microsoft Office\root\Office16\ONENOTE.EXE"
        Return
    }
}

#IfWinExist ahk_exe ONENOTE.EXE    
{
    #IfWinActive ahk_exe ONENOTE.EXE
    {
        #F19::
        {
            sleep 50
	    send {alt}
	    sleep 50
	    send {5}
	    return
        }
        #F20::
        {
            sleep 50
	    send {alt}
	    sleep 50
	    send {6}
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
            WinActivate, ahk_exe ONENOTE.exe    ;Bring to Front
            Return
        }
    }
}