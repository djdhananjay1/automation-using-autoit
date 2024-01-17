#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:        Dhananjay Nidhonkar

 Script Function:
	ArcSight Admin Console 7.2.1.2648.0 script

#ce ----------------------------------------------------------------------------

#include<Constants.au3>

If $CmdLine[0] <> 3 Then
	MsgBox($MB_OK, "Usage", "ps_ArcSight_login <app_path> <username> <password>")
Else
   ArcSight_login($CmdLine[1], $CmdLine[2], $CmdLine[3])
EndIf

Func ArcSight_login($apppath, $username, $password)
	; run the ArcSight Admin Console.exe command
	Run($apppath)

	Sleep(2000)

	$hwnd = WinGetHandle("ArcSight Admin Console ")

	Sleep(30)
	Send($username, 1)

	Sleep(30)
    Send("{TAB}")	
	
	Sleep(30)
	Send($password, 1)

    Sleep(30)
	; Submit the credentials
	Send("{ENTER}")	

EndFunc ;==>ArcSight_login()

