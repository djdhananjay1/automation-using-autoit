#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.4
 Author:         Dhananjay  Nidhonkar

 Script Function:
	AutoIt script for DBeaver.

#ce -----------------------------------------------------------------------------

#include<Constants.au3>

If $CmdLine[0] <> 2 Then
   MsgBox($MB_OK, "Usage", "ps_dbeaver <app_path> <sid name>")
Else
   dbeaver_login($CmdLine[1], $CmdLine[2])
EndIf

Func dbeaver_login($apppath, $servicename)
	; run the dbeaver.exe command
	Run($apppath)


	$win = WinWaitActive("DBeaver 22.1.0")
	$hwnd = WinGetHandle("DBeaver 22.1.0")

	Sleep(1000)
	Send("!d")
	Sleep(10)
	Send("{ENTER}")
	Send("Oracle")
	Sleep(10)
	Send("{ENTER}")
	Sleep(10)
	Send("{ENTER}")

	Sleep(100)
	$win = WinWaitActive("Connect to a database")
	$hwnd = WinGetHandle("Connect to a database")


	Sleep(10)
	Send("{Tab}" [, flag = 6])
	;Send("connection")
	Send($servicename, 1)

	
EndFunc ;==>dbeaver_login()

