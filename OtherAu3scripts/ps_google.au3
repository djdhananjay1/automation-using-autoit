#include <Constants.au3>
#include <IE_v1.au3>

If $CmdLine[0] < 2 Then
   MsgBox($MB_OK, "Usage", "ps_google <username> <password>")
Else
   google_login($CmdLine[1], $CmdLine[2])
EndIf

Func google_login($email, $password)
   Local $ie = _IECreate("https://accounts.google.com/logout", 1)

   If @error > 0 Then
	  Local $i = 0

	  Do
		 Sleep(500)
		 $i = $i + 1
		 $ie = _IEAttach("Google")
	  Until VarGetType($ie) == "Object" Or $i >= 10
   EndIf

   If VarGetType($ie) == "Object" Then
	  $hwnd = _IEPropertyGet($ie, "hwnd")
	  WinSetState($hwnd, "", @SW_MAXIMIZE)

	  $login_form = _IEFormGetObjByName($ie, "gaia_loginform")

	  $email_field = _IEFormElementGetObjByName($login_form, "Email")
	  $pass_field = _IEFormElementGetObjByName($login_form, "Passwd")

	  _IEFormElementSetValue($email_field, $email)
	  _IEFormElementSetValue($pass_field, $password)
	  _IEFormSubmit($login_form, 0)

	  WinWaitClose($hwnd)
   Else
	  MsgBox($MB_OK, "Google Login Failure", "Password Safe failed to automate the login to Google If this problem persists please contact your Password Safe Administrator.")
   EndIf

EndFunc ;==>google_login()
