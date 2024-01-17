#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

[General]
EnableLogging=0
LogMethod=1
RunApp=C:\Program Files\Google\Chrome\Application\chrome.exe "http://vbsca.ca/login/login.asp"
GlobalSequenceDelay=1500

[TaskSequence1]
SequenceDelay=2500
ObjectByName="txtUsername"
ObjectData=%username%
SendKeys=%username%

[TaskSequence2]
SendKeys={TAB}

[TaskSequence3]
SequenceDelay=2500
ObjectByName="txtPassword"
ObjectData=%password%
SendKeys=%password%

[TaskSequence4]
SendKeys={TAB}

[TaskSequence5]
SendKeysRaw=0
SendKeys={ENTER}
