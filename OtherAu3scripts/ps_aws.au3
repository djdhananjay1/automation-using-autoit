#include <Constants.au3>
#include <IE_v1.au3>

If $CmdLine[0] < 3 Then
   MsgBox($MB_OK, "Usage", "ps_aws <aws_id> <username> <password>")
Else
   aws_login($CmdLine[1], $CmdLine[2], $CmdLine[3])
EndIf

Func aws_login($aws_id, $username, $password)
   Local $ie = _IECreate("https://" & $aws_id & ".signin.aws.amazon.com/console/", 1)

   If @error > 0 Then
	  Local $i = 0

	  Do
		 Sleep(500)
		 $i = $i + 1
		 $ie = _IEAttach("Amazon Web Services")
	  Until VarGetType($ie) == "Object" Or $i >= 10
   EndIf

   If VarGetType($ie) == "Object" Then
	  $hwnd = _IEPropertyGet($ie, "hwnd")
	  WinSetState($hwnd, "", @SW_MAXIMIZE)

	  $login_form = _IEFormGetObjByName($ie, "signin_form")

	  $email_field = _IEFormElementGetObjByName($login_form, "username")
	  $pass_field = _IEFormElementGetObjByName($login_form, "password")

	  _IEFormElementSetValue($email_field, $username)
	  _IEFormElementSetValue($pass_field, $password)
	  _IEFormSubmit($login_form, 0)

	  WinWaitClose($hwnd)
   Else
	  MsgBox($MB_OK, "Amazon Web Services Login Failure", "Password Safe failed to automate the login to Amazon Web Services If this problem persists please contact your Password Safe Administrator.")
   EndIf

EndFunc ;==>aws_login()
