#include <Constants.au3>
#include <IE_v1.au3>

If $CmdLine[0] < 2 Then
   MsgBox($MB_OK, "Usage", "ps_o365 <username> <password>")
Else
   o365_login($CmdLine[1], $CmdLine[2])
EndIf

Func o365_login($email, $password)
   Local $ie = _IECreate("https://login.microsoftonline.com/login.srf")

   If @error > 0 Then
	  Local $i = 0

	  Do
		 Sleep(500)
		 $i = $i + 1
		 $ie = _IEAttach("Microsoft")
	  Until VarGetType($ie) == "Object" Or $i >= 10
   EndIf

   If VarGetType($ie) == "Object" Then
	  $hwnd = _IEPropertyGet($ie, "hwnd")
	  WinSetState($hwnd, "", @SW_MAXIMIZE)

	  $login_form = _IEFormGetObjByName($ie, "credentials")

	  $email_field = _IEFormElementGetObjByName($login_form, "cred_userid_inputtext")
	  $pass_field = _IEFormElementGetObjByName($login_form, "cred_password_inputtext")

	  _IEFormElementSetValue($email_field, $email)
	  _IEFormElementSetValue($pass_field, $password)
	  _IEFormSubmit($login_form, 0)

	  WinWaitClose($hwnd)
   Else
	  MsgBox($MB_OK, "O365 Login Failure", "Password Safe failed to automate the login to Office 365 If this problem persists please contact your Password Safe Administrator.")
   EndIf

EndFunc ;==>o365_login()
