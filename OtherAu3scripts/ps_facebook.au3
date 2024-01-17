#include <Constants.au3>
#include <IE_v1.au3>

If $CmdLine[0] < 2 Then
   MsgBox($MB_OK, "Usage", "ps_facebook <username> <password>")
Else
   facebook_login($CmdLine[1], $CmdLine[2])
EndIf

Func facebook_login($email, $password)
   Local $ie = _IECreate("https://www.facebook.com/login.php", 1)

   If @error > 0 Then
	  Local $i = 0

	  Do
		 Sleep(500)
		 $i = $i + 1
		 $ie = _IEAttach("Log in to Facebook")
	  Until VarGetType($ie) == "Object" Or $i >= 10
   EndIf

   If VarGetType($ie) == "Object" Then
	  $hwnd = _IEPropertyGet($ie, "hwnd")
	  WinSetState($hwnd, "", @SW_MAXIMIZE)

	  $login_form = _IEFormGetObjByName($ie, "login_form")

	  $email_field = _IEFormElementGetObjByName($login_form, "email")
	  $pass_field = _IEFormElementGetObjByName($login_form, "pass")
	  $login_button = _IEFormElementGetObjByName($login_form, "login")

	  _IEFormElementSetValue($email_field, $email)
	  _IEFormElementSetValue($pass_field, $password)
	  _IEFormSubmit($login_form, 0)

	  WinWaitClose($hwnd)
   Else
	  MsgBox($MB_OK, "Facebook Login Failure", "Password Safe failed to automate the login to facebook. If this problem persists please contact your Password Safe Administrator.")
   EndIf

EndFunc ;==>facebook_login()
