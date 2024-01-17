#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:        Dhananjay Nidhonkar

 Script Function:
	Toad scrpit 

#ce ----------------------------------------------------------------------------

#include<Constants.au3>

If $CmdLine[0] <> 5 Then
   MsgBox($MB_OK, "Usage", "ps_toad <app_path> <user> <password> <ip> <sid name>")
Else
   toad_login($CmdLine[1], $CmdLine[2], $CmdLine[3], $CmdLine[4], $CmdLine[5])
EndIf

Func toad_login($apppath, $user, $password, $ip , $servicename)
	; run the sqldeveloper.exe command
	Run($apppath)

	

	$win = WinWaitActive("Toad for Oracle Trail Version - Expires on 14-july-2022")
	$hwnd = WinGetHandle("Toad for Oracle Trail Version - Expires on 14-july-2022")

	Sleep(1000)
	

	$win = WinWaitActive("Toad for Oracle Database Login Login Version 16.0.90.1509")
	$hwnd = WinGetHandle("Toad for Oracle Database Login Version 16.0.90.1509")

	Sleep(10)
	Send("!u")
	Sleep(10)
	; Send the Username
	Send($user, 1)

	Sleep(10)
	Send("!a")
	Sleep(10)
	Send($password, 1)


	Sleep(10)
    Send("{LCTRL}+{TAB}")
	Send("!h")
	Sleep(10)
	Send($ip, 1)

	Sleep(10)
	Send("!s")
	Sleep(10)
	Send("{LSHIFT}+{TAB}")
	Sleep(10)
	Send("{TAB}")
	Sleep(10)
	Send($servicename, 1)

    If(StringUpper($user) == 'SYS') Then
		Sleep(10)
		Send("!c")
		Send("{DOWN}")
		Send("{DOWN}")
        Send("{DOWN}")
		Send("{ENTER}")
	EndIf

    Sleep(10)
	; Submit the credentials
	Send("{ENTER}")	

EndFunc ;==>sqldev_login()

