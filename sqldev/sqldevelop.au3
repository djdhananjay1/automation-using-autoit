#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.4
 Author:       Dhananjay Nidhonkar

 Script Function:
	AutoIt script for ps_PLSQL for PLSQL.

#ce ----------------------------------------------------------------------------
#include<Constants.au3>

If $CmdLine[0] <> 5 Then
   MsgBox($MB_OK, "Usage", "ps_sqldev <app_path> <username> <password> <ip> <port> <sid name>")
Else
   sqldev_login($CmdLine[1], $CmdLine[2], $CmdLine[3], $CmdLine[4], $CmdLine[5], $CmdLine[6])
EndIf

Func sqldev_login($apppath, $username, $password, $ip , $servicename , $port)
	; run the sqldeveloper.exe command
	Run($apppath)


	$win = WinWaitActive("Oracle SQL Developer")
	$hwnd = WinGetHandle("Oracle SQL Developer")

	Sleep(1000)
	Send("!f")
	Sleep(10)
	Send("!n")
	Sleep(10)
	;Send("connection")
	Sleep(10)
	Send("{ENTER}")

	$win = WinWaitActive("New / Select Database Connection")
	$hwnd = WinGetHandle("New / Select Database Connection")

	$conn = $servicename & '-' & $ip  

	Sleep(10)
	Send("!N")
	Sleep(10)
	Send($conn, 1)


	Sleep(10)
	Send("!u")
	Sleep(10)
	; Send the Username
	Send($username, 1)

	Sleep(10)
	Send("!p")
	Sleep(10)
	Send($password, 1)

	If(StringUpper($username) == 'SYS') Then
		Sleep(10)
		Send("!l")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{ENTER}")
	EndIf

	Sleep(10)
	Send("!a")
	Sleep(10)
	Send($ip, 1)

	Sleep(10)
	Send("!r")
	Sleep(10)
	Send($port, 1)

	Sleep(10)
	Send("!e")
	Sleep(10)
	Send("{TAB}")
	Sleep(10)
	Send("{TAB}")
	Sleep(10)
	Send($servicename, 1)

	Sleep(10)
	Send("{TAB}")
	Sleep(10)
	Send("{TAB}")
	Sleep(10)
	Send("{TAB}")
	Sleep(10)
	Send("{TAB}")
	Sleep(10)
	Send("{TAB}")
	Sleep(10)
	; Submit the credentials
	Send("{ENTER}")
	
	Sleep(500)
	 	
	$win = WinWaitActive("Connection Information ")
	$hwnd = WinGetHandle("Connection Information ")
	
	Sleep(10)
	Send("!p")
	Sleep(10)
	Send($password, 1)
	Sleep(10)
	Send("{TAB}")
	Sleep(10)
	Send("{TAB}")
	Sleep(10)
	Send("{ENTER}")

EndFunc ;==>sqldev_login()
