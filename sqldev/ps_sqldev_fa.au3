#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.4
 Author:         Furqan Asghar

 Script Function:
	AutoIt script for ps_PLSQL for PLSQL.

#ce ----------------------------------------------------------------------------

#AutoIt3Wrapper_icon=BT.ico
#pragma compile(Compatibility, win7)
#pragma compile(UPX, False)
#pragma compile(FileDescription, AutoIt script for PL SQL Developer)
#pragma compile(ProductName, ps_PLSQL)
#pragma compile(ProductVersion, 1.0)
#pragma compile(FileVersion, 1.0.0.0, 1.0.0.0) ; The last parameter is optional.
#pragma compile(LegalCopyright, © BeyondTrust Inc)
#pragma compile(LegalTrademarks, 'BeyondTrust ProServ')
#pragma compile(CompanyName, 'BeyondTrust Inc.')

#include<Constants.au3>

If $CmdLine[0] <> 6 Then
   MsgBox($MB_OK, "Usage", "ps_sqldev <app_path> <username> <password> <ip> <port> <service name>")
Else
   sqldev_login($CmdLine[1], $CmdLine[2], $CmdLine[3], $CmdLine[4], $CmdLine[5], $CmdLine[6])
EndIf

Func sqldev_login($apppath, $username, $password, $ip, $port, $servicename)
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

	$conn = $servicename & '-' & $ip & '-' & $port

	Sleep(10)
	Send("!n")
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
	Send($servicename, 1)

	Sleep(100)
	; Submit the credentials
	Send("{ENTER}")
EndFunc ;==>sqldev_login()