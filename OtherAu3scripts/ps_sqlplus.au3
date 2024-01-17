#include <AutoItConstants.au3>

If $CmdLine[0] < 2 Then
   MsgBox($MB_OK, "Usage", "ps_sqlplus <app_path> <connection> <username> <password>")
Else
   sqlplus_login($CmdLine[1], $CmdLine[2], $CmdLine[3], $CmdLine[4])
EndIf

Func sqlplus_login($apppath, $conn, $username, $password)
   ; run the sqlplus.exe command passing the connection details
   ; For some reason if you run the command directly from RemoteApp the password is visible in the Window Title
   Local $command_line = $apppath & " " & $username & "/" & $password & "@" & $conn

   Run($command_line)

EndFunc ;==>sqlplus_login()