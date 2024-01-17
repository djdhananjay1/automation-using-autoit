
;============================================================
;             BeyondTrust Generic WebLogin
;             ------------------------------
; Created : May 2018
; Last Updated: 24th May 2018
; Written for Run As
; Creator: PSE BeyondTrust Inc.
;============================================================

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
	MsgBox($MB_OK, "Usage", "ps_runas <application path> <title> <username> <domain> <password> <Console Hidden Y|N> <Maximized Y|N>")
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
	 ;$hWnd = WinGetHandle("[CLASS:ConsoleWindowClass]")
	 $hWnd = _GetHwndFromPID($pid)
	 ;MsgBox($MB_OK, "PID", $pid)
	 ;MsgBox($MB_OK, "Window Handle", $hWnd)
	 sleep(500)
	 ;ControlSend($hWnd,"",0,"runas /profile /user:" & $domain & "\" & $username & " """ & $path & """ {Enter}")
	 ;sleep(500)
	 ;ControlSend($hWnd,"",0,$password, $SEND_RAW)
	 ;ControlSend($hWnd,"",0,"{Enter}")
	 ControlSend($hWnd,"",0,"start $path " "{Enter}")
	 Send($username)
	 Sleep(500)
	 Send($password,"{Enter}")
	  
	 
	 sleep(200)

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


