#include <Constants.au3>
#include "IE_v1.au3"

If $CmdLine[0] < 2 Then
   MsgBox($MB_OK, "Usage", "ps_google <username> <password>")
Else
   twitter_login($CmdLine[1], $CmdLine[2])
EndIf

Func twitter_login($email, $password)
   Local $ie = _IECreate("https://twitter.com/logout")

   If @error > 0 Then
	  Local $i = 0

	  Do
		 Sleep(100)
		 $i = $i + 1
		 $ie = _IEAttach("Twitter")
	  Until VarGetType($ie) == "Object" Or $i >= 100
   EndIf

   If VarGetType($ie) == "Object" Then
	$hwnd = _IEPropertyGet($ie, "hwnd")
	WinSetState($hwnd, "", @SW_MAXIMIZE)

	_IENavigate($ie, "https://twitter.com/login")

	$forms = _IEFormGetCollection($ie)
	Local $login_form

	For $form In $forms
		If $form.action = "https://twitter.com/sessions" Then
			$login_form = $form
		EndIf
	Next

	  _IEFormElementCheckBoxSelect($login_form, 0, "remember_me", 0, "byIndex")
	  $email_field = _IEFormElementGetObjByName($login_form, "session[username_or_email]")
	  $pass_field = _IEFormElementGetObjByName($login_form, "session[password]")

	  _IEFormElementSetValue($email_field, $email)
	  _IEFormElementSetValue($pass_field, $password)
	  _IEFormSubmit($login_form, 0)

	  WinWaitClose($hwnd)
   Else
	  MsgBox($MB_OK, "Twitter Login Failure", "Password Safe failed to automate the login to Twitter If this problem persists please contact your Password Safe Administrator.")
   EndIf

EndFunc ;==>twitter_login()
