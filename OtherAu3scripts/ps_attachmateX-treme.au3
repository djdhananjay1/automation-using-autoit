Local $sys = ObjCreate("EXTRA.System")

If IsObj($sys) Then
   Local $ses = $sys.Sessions.Open("AS400 Demo Session.EDP")

   $sys.TimeoutValue = 9000
   $ses.Visible = True
   $ses.Activate()

   Local $rc = $ses.Screen.WaitForString("User")
   MsgBox(0, "", ""+$rc)
   $ses.Screen.SendKeys("FOO<TAB>DEMO5250<ENTER>")
EndIf