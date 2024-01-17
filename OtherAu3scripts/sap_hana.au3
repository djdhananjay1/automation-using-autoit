#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

[General]
EnableLogging=0
LogMethod=1
RunApp=C:\Program Files\Google\Chrome\Application\chrome.exe "https://account.hanatrial.ondemand.com/"
GlobalSequenceDelay=1500


[TaskSequence2]
SequenceDelay=2500
ObjectByName="j_username"
ObjectData=%username%
SendKeys=%username%

[TaskSequence3]
SendKeys={TAB}
SendKeys={ENTER}

[TaskSequence4]
SequenceDelay=2500
SendKeys={TAB}
SendKeys={TAB}

[TaskSequence5]
ObjectByName="password"
ObjectData=%password%
SendKeys=%password%

[TaskSequence6]
SendKeys={TAB}

[TaskSequence7]
SendKeysRaw=0
SendKeys={ENTER}

