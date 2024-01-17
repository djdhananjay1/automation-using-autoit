#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:         Dhananjay Nidhonkar

 Script Function:
	Opening  putty application

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include<Constants.au3>

If $CmdLine[0] <> 2 Then
   MsgBox($MB_OK, "Usage", "<app_path> <ip>")
Else
   putty_login($CmdLine[1], $CmdLine[2])
EndIf

Func putty_login($apppath, $ip)
	; run the putty.exe command
	Run($apppath)

	
	Sleep(1000)
	Send("!n")
	Sleep(10)
	Send($ip, 1)

	
	Sleep(1000)
	Send("!o")
	
		

EndFunc ;==>putty(login)

