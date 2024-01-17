#include <Constants.au3>

If $CmdLine[0] < 3 Then
   MsgBox($MB_OK, "Usage", "ps_extra <session> <username> <password>")
Else
   extra_login($CmdLine[1], $CmdLine[2], $CmdLine[3])
EndIf

Func extra_login($edb, $username, $password)
   Local $command_line = """C:\Program Files (x86)\Attachmate\EXTRA!\ebrun.exe""" & "ps_extra.ebm " & $edb & "~" & $username & "~" & $password

   Run($command_line)

EndFunc ;==>extra_login()