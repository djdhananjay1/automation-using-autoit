#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=ps_test.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Constants.au3>
#include <IE_v1.au3>

If $CmdLine[0] < 2 Then
   MsgBox($MB_OK, "Usage", "ps_fortinet <username> <password>")
Else
   fortinet_login($CmdLine[1], $CmdLine[2])
EndIf

Func fortinet_login($email, $password)
   Local $ie = _IECreate("https://196.35.154.176/login", 1)

	Local $oIE = _IEAttach("Cert")
	_IELinkClickByText($oIE, "Continue to this website (not recommended).")

	If @error > 0 Then
	  Local $i = 0

	  Do
		 Sleep(500)
		 $i = $i + 1
		 $ie = _IEAttach("196.35.154.176")
	  Until VarGetType($ie) == "Object" Or $i >= 10
   EndIf

   If VarGetType($ie) == "Object" Then
	  $hwnd = _IEPropertyGet($ie, "hwnd")
	  WinSetState($hwnd, "", @SW_MAXIMIZE)

	  $login_form = _IEFormGetObjByName($ie, "login")

	  $email_field = _IEFormElementGetObjByName($login_form, "username")
	  $pass_field = _IEFormElementGetObjByName($login_form, "secretkey")
	  $login_button = _IEFormElementGetObjByName($login_form, "login_button")

	  _IEFormElementSetValue($email_field, $email)
	  _IEFormElementSetValue($pass_field, $password)
	  _IEAction($login_button,"click")

	  WinWaitClose($hwnd)
   Else
	  MsgBox($MB_OK, "Login Failure", "Password Safe failed to automate the login. If this problem persists please contact your Password Safe Administrator.")
   EndIf

EndFunc ;==>fortinet_login()
