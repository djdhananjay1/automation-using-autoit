
If $CmdLine[0] < 2 Then
   MsgBox($MB_OK, "Usage", "ps_sqldev <app_path> <connection> <username> <password>")
Else
   sqldev_login($CmdLine[1], $CmdLine[2], $CmdLine[3], $CmdLine[4])
EndIf

Func sqldev_login($apppath, $conn, $username, $password)
   ; run the sqldeveloper.exe command
   Run($apppath)

   ; Wait for the user to try to connect to the database
   $win = WinWaitActive("Connection Information - [" & $conn & "]")
   ; Ensure we are in the Username field
   Send("!p")
   Sleep(10)
   Send("!u")
   Sleep(10)
   ; Send the Username
   Send($username, 1)
   Sleep(10)
   ; Ensure we are in the Password field
   Send("!p")
   Sleep(10)
   ; Send the Password
   Send($password, 1)
   Sleep(10)
   ; Submit the credentials
   Send("{ENTER}")

EndFunc ;==>sqldev_login()