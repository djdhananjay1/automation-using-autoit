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
	; run the Toad.exe command
	Run($apppath)

	Sleep(3000)

	$win = WinWaitActive("Toad for Oracle Database Login Version 16.0.90.1509")
	$hwnd = WinGetHandle("Toad for Oracle Database Login Version 16.0.90.1509")

	Sleep(30)
	Send("!u")
	Sleep(30)
	; Send the Username
	Send($user, 1)

	Sleep(30)
	Send("!a")
	Sleep(30)
	Send($password, 1)

	Sleep(30)
    Send("{TAB}")	

	Sleep(30)
    Send("^{TAB}") ;("{LCTRL}"+"{TAB}")
	Send("!h")
	Sleep(30)
	Send($ip, 1)

	Sleep(30)
	Send("!s")
	Sleep(30)
	Send("+{TAB}")  ;("{LSHIFT}"+"{TAB}")
	Sleep(30)
	Send($servicename, 1)

    If(StringUpper($user) == 'SYS') Then
		Sleep(30)
		Send("!c")
		Send("{DOWN}")
		Send("{DOWN}")
        Send("{DOWN}")
		Send("{ENTER}")
	EndIf

    Sleep(30)
	; Submit the credentials
	Send("{ENTER}")	

EndFunc ;==>Toad_Login()

