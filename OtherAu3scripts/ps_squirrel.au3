
If $CmdLine[0] < 3 Then
   MsgBox($MB_OK, "Usage", "ps_squirrel <alias> <username> <password>")
Else
   squirrel_login($CmdLine[1], $CmdLine[2], $CmdLine[3])
EndIf

Func squirrel_login($alias, $username, $password)
   Run("c:\Program Files (x86)\squirrel-sql-3.7\squirrel-sql.bat")

   ; Wait for the user to try to connect to the database
   $win = WinWait("Connect to: " & $alias)

   If $win Then
	  WinActivate($win)
	  ; Ensure we are in the Username field
	  Sleep(10)
	  Send("{TAB}")
	  ; Send the Username
	  Send($username, 1)
	  Sleep(10)
	  ; Ensure we are in the Password field
	  Send("{TAB}")
	  Sleep(10)
	  ; Send the Password
	  Send($password, 1)
	  Sleep(10)
	  ; Submit the credentials
	  Send("{ENTER}")
   EndIf

EndFunc