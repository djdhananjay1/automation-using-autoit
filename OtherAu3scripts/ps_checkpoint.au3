#include <Constants.au3>

; AutoIt Version: 3.0
; Author		: BeyondTrust
; Platform		: Windows
; Script Function:
; 				Launch the Checkpoint SmartView Monitor (R77.10) and authenticate

If $CmdLine[0] < 3 Then
	MsgBox($MB_OK,"Usage","ps_checkpoint <hostname> <username> <password>")
Else
	checkpoint_login($CmdLine[1],$CmdLine[2],$CmdLine[3])
EndIf

Func checkpoint_login($host, $user, $pass)
	; Run the client
	Run("D:\Program Files (x86)\CheckPoint\SmartConsole\R76\PROGRAM\CPAppStart.exe 3");

	; Wait for the client dialog to become active
	WinWaitActive("Check Point Smart View Monitor");

	ControlSetText("Check Point Smart View Monitor", "", "[CLASS:Edit; INSTANCE:1]", $user)
	ControlSetText("Check Point Smart View Monitor", "", "[CLASS:Edit; INSTANCE:2]", $pass)
	ControlSetText("Check Point Smart View Monitor", "", "[CLASS:Edit; INSTANCE:3]", $host)
	ControlClick("Check Point Smart View Monitor", "", "[CLASS:AfxWnd100; INSTANCE:2]", "left", 1)
EndFunc ;==>checkpoint_login


