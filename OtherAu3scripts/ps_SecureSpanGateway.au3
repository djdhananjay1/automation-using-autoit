#include <Constants.au3>
#include <IE_v1.au3>

If $CmdLine[0] < 2 Then
   MsgBox($MB_OK, "Usage", "ps_SecureSpanGateway <address> <username> <password>")
Else
   ssg_login($CmdLine[1], $CmdLine[2], $CmdLine[3])
EndIf

Func ssg_login($address, $email, $password)
   Local $ie = _IECreate($address, 1)

   If @error > 0 Then
	  Local $i = 0

	  Do
		 Sleep(500)
		 $i = $i + 1
		 $ie = _IEAttach("WEB PAGE TITLE HERE")
	  Until VarGetType($ie) == "Object" Or $i >= 10
   EndIf

   If VarGetType($ie) == "Object" Then
	  $hwnd = _IEPropertyGet($ie, "hwnd")
	  WinSetState($hwnd, "", @SW_MAXIMIZE)

	  $login_form = _IEFormGetCollection($oIE, 0)

	  $uname_field = _IEFormElementGetObjByName($login_form, "username")
	  $pass_field = _IEFormElementGetObjByName($login_form, "password")

	  _IEFormElementSetValue($uname_field, $email)
	  _IEFormElementSetValue($pass_field, $password)
	  _IEFormSubmit($login_form, 0)

	  WinWaitClose($hwnd)
   Else
	  MsgBox($MB_OK, "Secure Span Gateway Login Failure", "Password Safe failed to automate the login. If this problem persists please contact your Password Safe Administrator.")
   EndIf

EndFunc ;==>ssg_login()
