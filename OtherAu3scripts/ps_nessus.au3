#include <Constants.au3>
#include "IE_v1.au3"

If $CmdLine[0] < 2 Then
   MsgBox($MB_OK, "Usage", "ps_nessus <username> <password>")
Else
   nessus_login($CmdLine[1], $CmdLine[2])
EndIf

Func nessus_login($email, $password)
   Local $ie = _IECreate("https://us-2a.svc.nessus.org/")

   If @error > 0 Then
	  Local $i = 0

	  Do
		 Sleep(100)
		 $i = $i + 1
		 $ie = _IEAttach("Nessus")
	  Until VarGetType($ie) == "Object" Or $i >= 100
   EndIf

   If VarGetType($ie) == "Object" Then
	  $hwnd = _IEPropertyGet($ie, "hwnd")
	  WinSetState($hwnd, "", @SW_MAXIMIZE)

	  Local $forms, $login_form, $email_field, $pass_field, $sign_in

	  $i = 0
	  Do
		 Sleep(100)
		 $i = $i + 1
		 $forms = _IEFormGetCollection($ie)
	  Until ( VarGetType($forms) == "Object" And $forms.length > 0 ) Or $i >= 100

	  For $form In $forms
		 If $form.className = "login" Then $login_form = $form
	  Next

	  $i = 0
	  Do
		 Sleep(100)
		 $i = $i + 1
		 $fields = _IEFormElementGetCollection($login_form)
	  Until ( VarGetType($fields) == "Object" And $fields.length > 0 ) Or $i >= 100


	  For $field In $fields
		 If $field.className = "required login-username" Then $email_field = $field
		 If $field.className = "required login-password" Then $pass_field = $field
	  Next

	  $sign_in = _IEFormElementGetObjByName($login_form, "sign-in")

	  _IEAction($email_field, "focus")
	  _IEAction($email_field, "selectall")
	  _IEFormElementSetValue($email_field, $email)
	  _IEFormElementSetValue($pass_field, $password)

	  _IEAction($sign_in, "click")

	  WinWaitClose($hwnd)
   Else
	  MsgBox($MB_OK, "Nessus Login Failure", "Password Safe failed to automate the login to Nessus If this problem persists please contact your Password Safe Administrator.")
   EndIf

EndFunc ;==>nessus_login()
