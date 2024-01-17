#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:        Dhananjay Nidhonkar

 Script Function:
	Toad scrpit 

#ce ----------------------------------------------------------------------------

#include<Constants.au3>

If $CmdLine[0] <> 5 Then
	MsgBox($MB_OK, "Usage", "ps_runas <application_path> <username> <domain> <password> <server>")
Else
   run_as($CmdLine[1], $CmdLine[2], $CmdLine[3], $CmdLine[4],$CmdLine[5])
EndIf



Func run_as($application_path, $username, $domain, $password, $server)
; Launch SQL Server Management Studio

Run($application_path)


$win = WinWaitActive("Microsoft SQL Server Management Studio")
$hwnd = WinGetHandle("Connect to Server")
	

; Wait for the "Connect to Server" dialog box to appear

Sleep(5000)

WinWait("Connect to Server")

; Set the authentication method to "Azure Active Directory - Password"
;Send("{!a}")


Sleep(1000)
Send($server)

Send("{TAB}")

;Send("{ALT+a}")
Sleep(5000)
Send("{DOWN 3}")


; Enter your Azure AD account's email address
;Send("{!u}")
Send("{TAB}")
Sleep(1000)
Send($username & "@" & $domain )

; Enter your Azure AD account's password
Send("{TAB}")
;Send("{!p}")
Sleep(1000)
Send($password)

; Click the Connect button
Send("{!c}")
Sleep(1000)
Send("{Enter}")
EndFunc