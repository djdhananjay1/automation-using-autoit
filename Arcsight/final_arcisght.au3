 #cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:        Dhananjay Nidhonkar

 Script Function:
	ArcSight Admin Console 7.2.1.2648.0 script

#ce ----------------------------------------------------------------------------

Opt("WinDetectHiddenText", 1)

#AutoIt3Wrapper_icon=bt.icox
#AutoIt3Wrapper_Res_Description=AutoIT Automation Script to Run an Application with another User, developed by BeyondTrust Professional Services
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.0
#AutoIt3Wrapper_Res_Fileversion=1.0.0.16
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=Y
#AutoIt3Wrapper_Res_Field=ProductName|ps_WebLogin
#AutoIt3Wrapper_Res_LegalCopyright="© Copyright BeyondTrust Inc. 2018"

#include <Constants.au3>

If $CmdLine[0] <> 7 Then
	MsgBox($MB_OK, "Usage", "ps_runas  <application path> <title> <username> <domain> <password> <Console Hidden Y|N> <Maximized Y|N>")
Else
   run_as($CmdLine[1], $CmdLine[2], $CmdLine[3], $CmdLine[4],$CmdLine[5],$CmdLine[6],$CmdLine[7])
EndIf

Func run_as($path, $title, $username, $domain, $password, $Hidden, $Maximized)
	 $HideShow = @SW_SHOW
	 If ($Hidden == 'y' or $Hidden == 'Y') Then
		$HideShow = @SW_HIDE   
	 EndIf

	 $pid = ShellExecute("cmd.exe","","",$SHEX_OPEN,$HideShow)
	 sleep(200)
	 ;MsgBox($MB_OK, "before HWND","TEST")
	 $hWnd = WinGetHandle("[TITLE:ArcSight Console 7.2.1.2648.0]")
	 ;$hWnd = _GetHwndFromPID($pid)
	 ;MsgBox($MB_OK, "PID", $pid)
	 ;MsgBox($MB_OK, "Window Handle", $hWnd)
	 sleep(500)
	 ;ControlSend($hWnd,"",0,"runas /profile /user:" & $domain & "\" & $username & " """ & $path & """ {Enter}")
	 ;sleep(500)
	 ;ControlSend($hWnd,"",0,$password, $SEND_RAW)
	 ;ControlSend($hWnd,"",0,"{Enter}")
	 ;ControlSend($hWnd,"",0,"start " & $path & "{ENTER}")
	 
	 Sleep(7000)
	 Send($username)
	 
	 Sleep(2000)
	 Send("{TAB}")
	 Sleep(5000)
	 Send($password)
	 Sleep(5000)
	 Send("{ENTER}")
	 sleep(2000)

	 If ($Hidden == 'y' or $Hidden == 'Y') Then
		 
		ProcessClose($pid)
	 EndIf

	 WinWait($title)
	 $hWnd = WinGetHandle($title)

	 If ($Maximized == 'y' or $Maximized == 'Y') Then
		WinSetState($hWnd, "", @SW_MAXIMIZE)
	 EndIf



	; If @Compiled Then
	;	logoff()
	; EndIf
EndFunc 

Func Send_cred($title,$username,$password)
	
	If ($title) Then
		
		$hWnd = WinGetHandle($title)
		Sleep(30)
		Send($username)
		Sleep(30)
		Send("{TAB}")
		Sleep(30)
		Send($password)
		Send("{ENTER}")
		
		WinWaitClose($hWnd)
		EndIf
	EndFunc


Func logoff()
	Run("shutdown -l -f")
Endfunc

;Function for getting HWND from PID
Func _GetHwndFromPID($PID)
	$hWnd = 0
	$winlist = WinList()
	;MsgBox($MB_OK,"Windows Count", $winlist[0][0])
	;Do
		For $i = 1 To $winlist[0][0]
			;MsgBox($MB_OK,$i, $winlist[$i][0])
;			If $winlist[$i][0] <> "" Then
				$iPID2 = WinGetProcess($winlist[$i][1])
				If $iPID2 = $PID Then
					;MsgBox($MB_OK,"Was Here", $winlist[$i][1])
					$hWnd = $winlist[$i][1]
					ExitLoop
				EndIf
;			EndIf
		Next
	;Until $hWnd <> 0
	Return $hWnd
EndFunc;==>_GetHwndFromPID
 