Run("C:\Program Files (x86)\VMware\Infrastructure\Virtual Infrastructure Client\Launcher\VpxClient.exe")

; Wait for the window with this title to become active WinWaitActive("VMware vSphere Client") Local $hwnd = WinGetHandle("VMware vSphere Client")

; Got these using the AutoIt windows info tool $address = "[CLASS:Edit; INSTANCE:1]"
$uname = "[NAME:textUsername]"
$passwd = "[NAME:textPassword]"
$login = "[NAME:btnConnect]"

; Set the fields and click login
ControlSetText($hwnd, "", $address, "192.168.1.162") ControlSetText($hwnd, "", $uname, "root") ControlSetText($hwnd, "", $passwd, "passwd1") ControlClick($hwnd, "", $login)
