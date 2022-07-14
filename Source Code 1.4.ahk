#SingleInstance, force
#Persistent
#NoEnv

/*
-------------------------------------------------- ■ --------------------------------------------------
                                                 START
*/



/*


								   ╔══◈*.·:·.★ ۩ ✦ ۩ ★･:･:*◈ ══╗

										   بسم الله الرحمن الرحيم

								   ╚══◈*.·:·.★ ۩ ✦ ۩ ★･:･:*◈ ══╝


								   ╔═══════════✦◈◉◈✦ ══════════╗

										   Surah Viewer v1.0

											 By Turbofan20

								   ╚═══════════✦◈◉◈✦ ══════════╝


								     https://github.com/turbofan20


*/



/*
---------------------------------------------------❃---------------------------------------------------
											 Question Boxes
*/

AtWhenBismillah = 0
AtCoordinates = 0
blank := ""

DoNotShowRequirementsLocation := A_Temp "\DoNotShowRequirementsAgain.tmp"

if !FileExist(DoNotShowRequirementsLocation)
{

RunRequirementsMessageBox:
{

{
SetTimer, ChangeButtonNames, 0
SetTimer, MoveRequirementsBack, -500
MsgBox, 262726, Requirements, This program is written in AutoHotKey.`n`nYou need AHK to use this application.`n`nIf you do not have AHK on your system`, download it here:`n`nhttps://www.autohotkey.com/download`n`n-------------------------------------------------------------------------------`n`nAlso make sure that you have Notepad++.`n`nIf you do not have Notepad++ on your system`, download it here:`n`nhttps://notepad-plus-plus.org/downloads/`n`n▶  Ensure sure that all text files in Notepad++ are closed before using this application ◀`n`n-------------------------------------------------------------------------------`n`nPlease read Readme.txt before using Surah Viewer

IfMsgBox, Cancel ; Exit
{
	ExitApp
}
IfMsgBox, TryAgain ; Don't Show Again
{
	FileAppend, %blank%, %DoNotShowRequirementsLocation%, UTF-16
	Goto SurahName
}
IfMsgBox, Continue ; Continue
{
	Goto SurahName
}
}

ChangeButtonNames:
{
WinGetPos , Xrequirements, Yrequirements, , , Requirements, , ,
WinMove, Requirements,, 10000, 10000
IfWinNotExist, Requirements
	return  ; Keep waiting.
ControlSetText, Button1, Exit    ; Cancel - Exit
ControlSetText, Button2, Don't Show Again ; Try Again - Don't Show Again
ControlSetText, Button3, Continue  ; Continue
ControlMove, Button1,135,,  ; Cancel - Exit
ControlMove, Button2,240,,150  ; Try Again - Don't Show Again
ControlMove, Button3,30,,  ; Continue
SetTimer, ChangeButtonNames, Off
return
}

MoveRequirementsBack:
{
	WinMove, Requirements,, Xrequirements,Yrequirements
	Return
}

}

}


SurahName:
{
	SetTimer, ontop, -50
	InputBox, Name, Surah Viewer - by Turbofan20, What is the name of the Surah?`n`nHold F1 to select text and copy upon release`n`nPress F2 to automatically paste and move onto next prompt`n ,,,,,,locale ; 1) Input Surah Name
	if ErrorLevel
		ExitApp
	else if (Name = "")
	{
		MsgBox Please enter a Surah Name
		goto SurahName
	}
}


SurahAHKPath := A_Desktop "\" Name ".ahk" ; Declares the location of the .ahk file and stores it in a variable

SurahEXEPath := A_Desktop "\" Name ".exe" ; Declares the (eventual) location of the .exe file and stores it in a variable
										  ; As of yet, automatic EXE compilation of the script will not be supported until
										  ; an adequate GUI interface is programmed in the hotkey generator


if FileExist(SurahAHKPath) ; Alerts the user if a file with the same name already exists on the desktop
{
	MsgBox, 262195, Surah Viewer File already exists, The Surah Viewer file for > %Name% < already exists. `n`nAre you sure you want to overwrite it?
						 ; ^ Asks the user if they want to procede with overwriting the existing file with new data
	IfMsgBox Yes		 ; Procedes with writing
		goto SurahLinkRequest

	IfMsgBox No 		 ; Asks the user again for a file name if they choose No
		goto SurahName

	IfMsgBox Cancel  	 ; Exits the application if cancel is pressed
		ExitApp
}


SurahLinkRequest:
{

MsgBox, 262180, Link?, Would you like to enter a Youtube URL for `n>  %Name%  < ?

IfMsgBox Yes
	goto SurahLink

IfMsgBox No
	goto AskNumVerses

return

}


SurahLink:
{
SetTimer, ontop, -50
Gui Font, s10, Segoe UI
Gui Add, Text, x86 y32 w392 h23 +0x200, What is the Youtube URL of %Name%?
Gui Font
Gui Add, Edit, x24 y83 w442 h21 vLink
Gui Add, Button, x24 y136 w98 h36, Continue
Gui Add, Button, x136 y136 w98 h36, Go Back
Gui Add, Button, x368 y136 w98 h36, Exit
Gui Add, Button, x248 y136 w105 h36, Do not use URL

Gui Show, w491 h190, Surah Viewer - by Turbofan20
Return



Gui, Show, w375 h175, Surah Viewer - by Turbofan20, What is the Youtube URL of %Name%?
return

msgbox %link%

buttonContinue:
Gui, submit
if (Link = "")
{
	MsgBox 0x10, Error, Please enter a URL or select "Do not use URL"
	gui, destroy
	gosub SurahLink
	return
}
else
{
gosub AskNumVerses
}
return

buttonGoBack:
Gui destroy
gosub SurahLinkRequest
return

buttonDonotuseURL:
Gui destroy
gosub AskNumVerses
return

buttonExit:
Gui destroy
exitapp
return

buttonCancel:
GuiClose:
ExitApp
}

AskNumVerses:
{
	Gui, destroy
	SetTimer, ontop, -50

Gui Font, s14, Segoe UI
Gui Add, Text, x0 y24 w384 h29 +0x200 +Center, How many verses are in %Name%?
Gui Font
Gui Font, s14, Segoe UI
Gui Add, Edit, vNumberOfVerses x120 y72 w126 h33
Gui Font
Gui Add, Button, gContinue x16 y128 w99 h44, Continue
Gui Add, Button, gEnterLink x136 y128 w99 h44, Enter Link
Gui Add, Button, gExit x256 y128 w99 h44, Exit

Gui Show, w372 h192, Surah Viewer - by Turbofan20
Return

Continue:
Gui, submit
if NumberOfVerses < 3
{
	msgbox Number of verses must be more than or equal to 3
	Gosub AskNumVerses
	return
}
else if NumberOfVerses is not integer
{
	msgbox Number of verses must be a whole number
	Gosub AskNumVerses
	return
}
else if NumberOfVerses > 286
{
	msgbox Number of verses must be less than or equal to 286
	Gosub AskNumVerses
	return
}
else:
	gosub atcoordinates
	return


EnterLink:
Gui destroy
gosub SurahLink
return

Exit:
Exitapp
return

If ErrorLevel
{
	exitapp
	return
}
}

atcoordinates:
{
	Gui, destroy
AtCoordinates = 1
}

if NumberOfVerses > 30
{

Gui, Destroy

hIconAsterisk := DllCall("user32\LoadIcon", Ptr,0, Ptr,32516, Ptr) ;IDI_ASTERISK := 32516

Gui, Add, Picture,x24 y48 w60 h60, % "HICON:" hIconAsterisk
Gui Font, s10, Segoe UI
Gui Add, Text, x105 y32 w456 h23 +0x200, Be aware that in long videos, you may not be able to accurately set the
Gui Font
Gui Font, s10, Segoe UI
Gui Add, Text, x105 y56 w456 h24 +0x200, coordinates of certain verses.
Gui Font
Gui Font, s10, Segoe UI
Gui Add, Text, x105 y88 w456 h24 +0x200, You could fix this by partitioning the video into smaller chunks, and
Gui Font
Gui Font, s10, Segoe UI
Gui Add, Text, x105 y112 w456 h24 +0x200, creating separate hotkey coordinates for those segments.
Gui Font
Gui Font, s12 q5, Segoe UI
Gui Add, Button, gContinueLargeNumVerses x27 y160 w129 h41, Continue
Gui Font
Gui Font, s12 q5, Segoe UI
Gui Add, Button, gGoBackLargeNumVerses x211 y160 w129 h41, Go Back
Gui Font
Gui Font, s12 q5, Segoe UI
Gui Add, Button, gExitLargeNumVerses x395 y160 w129 h41, Exit
Gui Font

Gui Show, w551 h228, Large Number Of Verses
Return

If ErrorLevel
{
	exitapp
	return
}

ExitLargeNumVerses:
ExitApp
return

GoBackLargeNumVerses:
AtCoordinates = 0
GoSub AskNumVerses
return

ContinueLargeNumVerses:
Gui, Destroy
gosub GotoWhenBismillah
return
}

GotoWhenBismillah:
{
SetTimer, EnableScreenCoordinates, -1
Settimer, OnePixelMove, -1
gosub WhenBismillah
return
}

WhenBismillah:
{
	Gui, destroy
	AtWhenBismillah = 1
	Gui Font, s10, Segoe UI
	Gui Add, Text, x8 y8 w364 h23 +0x200 +Left, What are the coordinates of Bismillah?
	Gui Font
	Gui Font, s10, Segoe UI
	Gui Add, Text, x8 y72 w177 h23 +0x200 +Center, > Must be in the form [x, y] <
	Gui Font
	Gui Font, s10, Segoe UI
	Gui Add, Text, x8 y40 w367 h23 +0x200 +Left, Please make sure that the video is fullscreen
	Gui Font
	Gui Font, s11, Segoe UI
	Gui Add, Edit, vBismillahCoordinates x8 y136 w392 h27
	Gui Font
	Gui Font, s10, Segoe UI
	Gui Add, Button, gBismillahCoordsOK x40 y176 w80 h23, OK
	Gui Font, s10, Segoe UI
	Gui Add, Button, gBismillahCoordsGoBack x168 y176 w80 h23, Go Back
	Gui Add, Button, gBismillahCoordsExit x296 y176 w80 h23, Exit
	Gui Font
	Gui Font
	Gui Font
	Gui Font, s10, Segoe UI
	Gui Add, Text, x8 y104 w268 h23 +0x200 +Left, There are %NumberOfVerses% verses in %Name%
	Gui Font
	Gui Show, w410 h212, Surah Viewer
	WinSet, AlwaysOnTop , On, Surah Viewer
	Return

if ErrorLevel
ExitApp

BismillahCoordsExit:
ExitApp
return

BismillahCoordsGoBack:
Gui, Destroy
SetTimer, Coordinateshelp, Off
Settimer, OnePixelMove, off
Tooltip
gosub AskNumVerses
return

BismillahCoordsOK:

Gui, Submit

if (BismillahCoordinates = "")
{
	MsgBox Please enter the coordinates of Bismillah
	Gui, Destroy
	GoSub WhenBismillah
}
else
{
	gosub AskCoordsOfEachVerse
	return
}
return
}

AskCoordsOfEachVerse:
{
	Loop
	if A_index > %NumberOfVerses%
		break
	else
    {
		WhenAtVerse:
		{
		SetTimer, ontop, -50
		InputBox, CurrentVerseCoordinates, Verse %A_Index%, What are the coordinates of Verse %A_Index%?`n`n> Must be in the form [x`, y] <`n`nPlease make sure that the video is fullscreen,,,,,,locale
			if ErrorLevel
				ExitApp
			else if (CurrentVerseCoordinates = "")
			{
				MsgBox Please enter the coordinates of Verse %A_index%
				goto WhenAtVerse
			}
		}

        VerseCoords%A_Index% := CurrentVerseCoordinates


	}


SendLevel 1
Send {Esc}
SendLevel 0

Goto RunTextFile

}

/*
---------------------------------------------------❃---------------------------------------------------
											   Subprograms
*/

/*
-------------------------❃-------------------------
			  Hotkeys for Word Questions
*/


F1Check:
{
#if AtWhenBismillah = 0
F1::
MouseClick, left,,, 1, 0, D  ; Hold down the left mouse button.
Loop
{
    Sleep, 0
    if !GetKeyState("F1", "P")  ; The key has been released, so break out of the loop.
        break
    ; ... insert here any other actions you want repeated.
}
MouseClick, left,,, 1, 0, U  ; Release the mouse button.
SendInput ^c
return
}



Ctrl & 1::ExitApp ; for some reason this doesn't work when it is at the bottom of the script

/*
-------------------------❃-------------------------
		   Hotkeys for Coordinate Questions
*/

EnableScreenCoordinates:
{
	#if AtWhenBismillah = 1
	Tooltip
	Esc Up::
	If !ON := !ON { ; Change this to "If ON := !ON" if you don't want tooltip to show on startup
	 SetTimer, Coordinateshelp, Off
	 ToolTip
	 Return
	} Else SetTimer, Coordinateshelp, 0

	Coordinateshelp:
	CoordMode, Mouse, Window
	MouseGetPos, A, B
	CoordMode, Mouse, Screen
	MouseGetPos, x, y
	ToolTip , x: %x%` `ny: %y%`nF1 to copy`nF2 to paste `nWASD to move by 1 pixel`nPress x to click`nEsc to toggle this box, A+25, B+32, 1
	Return

	; Detects SCREEN mouse coordinates and pastes it into clipboard AFTER WORD QUESTIONS

	F1 Up::
		CoordMode, Mouse, Screen
		MouseGetPos, x, y
		Clipboard := "", Clipboard := x ", " y
		ClipWait, 0
		/*
		If ErrorLevel
			 MsgBox, 48, Error      , An error occurred while waiting for the clipboard.
		Else MsgBox, 64, Coordinates, %Clipboard%
		*/
		SoundBeep, 523, 225
		Return

	F2:: ;THIS IS ONLY WHEN COORDINATES OF VERSES ARE NEEDED IE. AFTER THE WORD QUESTIONS
		Mouseclick, left
		sleep 10
		SendInput ^v
		sleep 10
		SendInput {enter}
		return
}

Ctrl & 1::ExitApp ; Ctrl + 1 to quit the application

OnePixelMove:

Hotkey, If, AtWhenBismillah = 1

Changetopixelmove:
{
	#if AtWhenBismillah = 1

	w::MouseMove,0,-1,0,R ;Moves the mouse cursor 1 pixel down from its current position.

	a::MouseMove,-1,0,0,R ;Moves the mouse cursor 1 pixel left from its current position.

	s::MouseMove,0,1,0,R ;Moves the mouse cursor 1 pixel up from its current position.

	d::MouseMove,1,0,0,R ;Moves the mouse cursor 1 pixel right from its current position.

	x::MouseClick
}

ontop:
WinSet, AlwaysOnTop, On, A
return

/*
---------------------------------------------------❃---------------------------------------------------
					   Opens up Notepad to display the hotkeys and other information
*/


RunTextFile:

{

SetTimer, Coordinateshelp, Off

Tooltip

TempFileforTextHotkeys := A_Temp "\tempfile4surahgen.txt" ; This is where the temporary file will be made

if !FileExist(TempFileforTextHotkeys)
	FileAppend, %blank%, %TempFileforTextHotkeys%, UTF-16

if  FileExist(TempFileforTextHotkeys)
	FileDelete, %TempFileforTextHotkeys%
	FileAppend, %blank%, %TempFileforTextHotkeys%, UTF-16

SetTitleMatchMode, 2

sleep 150

FileDelete, %SurahAHKPath%

sleep 200

IfWinExist Notepad++
	MsgBox, 262193, Close all text files, Make sure that all text files in Notepad++ are closed
	ifMsgBox, Cancel
		ExitApp

WinKill Notepad++

sleep 100

WinMinimizeAll

sleep 250

Run, %TempFileforTextHotkeys%,,Max

sleep 50

}

/*
---------------------------------------------------❃---------------------------------------------------
							Checks if the text file is open before writing
*/


active = 0

while active = 0 ; Uses a condition instead of a timer
{
	if WinActive(TempFileforTextHotkeys)

	{
		active = 1
		goto DeleteEverythingInFile
	}
	else
	{
		SetTitleMatchMode, 2
		WinActivate, tempfile4surahgen
	}
}


/*
---------------------------------------------------❃---------------------------------------------------
									 Text Contents of Generated File
*/

DeleteEverythingInFile:

{

SendInput ^{a}
SendInput {Backspace}

sleep 20

}

clipboard =
(
/*

-------------------------------------------------- ■ --------------------------------------------------
                                                 START
*/

/*


								    ╔══◈*.·:·.★ ۩ ✦ ۩ ★･:･:*◈ ══╗

									 	    بسم الله الرحمن الرحيم

								    ╚══◈*.·:·.★ ۩ ✦ ۩ ★･:･:*◈ ══╝


								    ╔═══════════✦◈◉◈✦══════════╗

											 Surah Viewer

										 	 By Turbofan20

								    ╚═══════════✦◈◉◈✦══════════╝


									  https://github.com/turbofan20


*/

/*

----------------------------------------------------

    Surah Name : %Name%

----------------------------------------------------

*/

#SingleInstance, force
#Persistent
#NoEnv
SetDefaultMouseSpeed 0
SetMouseDelay 1


/*
---------------------------------------------------❃---------------------------------------------------
                                   Instant Changeable Hotkey Settings
*/

TurnBeepOn = True

VerseNumberHotkeyLevel = 0

GoSub, AskOpeninBrowser   ; GoSub, AskOpeninBrowser

InstantHotkeysAndBeeps:

{

CoordMode, Mouse, Screen

BeepFrequency = 600
BeepDuration = 125

F1::
Tooltip
MouseClick, left, `%A`%, `%B`%
;SoundBeep, , BeepDuration
return

F2::
Tooltip
MouseClick, left, `%C`%, `%D`%
;SoundBeep, , BeepDuration
return

F3::
Tooltip
MouseClick, left, `%E`%, `%F`%
;SoundBeep, , BeepDuration
return

F4::
Tooltip
MouseClick, left, `%G`%, `%H`%
;SoundBeep, , BeepDuration
return

F5::
MouseGetPos, A, B

if TurnBeepOn = True
{
 SoundBeep, BeepFrequency+400, BeepDuration
 return
}
else
return

F6::
MouseGetPos, C, D
if TurnBeepOn = True
{
 SoundBeep, BeepFrequency+150, BeepDuration
 return
}
else
return

F7::
MouseGetPos, E, F
if TurnBeepOn = True
{
 SoundBeep, BeepFrequency, BeepDuration
 return
}
else
return

F8::
MouseGetPos, G, H
if TurnBeepOn = True
{
 SoundBeep, BeepFrequency-200, BeepDuration
 return
}
else
 return
return

}


/*
---------------------------------------------------❃---------------------------------------------------
                                              Other Hotkeys
*/

x::MouseClick

a::MouseMove,-1,0,0,R ;Moves the mouse cursor 1 pixel left from its current position.

d::MouseMove,1,0,0,R ;Moves the mouse cursor 1 pixel right from its current position.

^!s::
 Suspend
 	if (A_IsSuspended)
    {
     settimer, SuspendedTooltip, 20
     SetTimer, GlossaryCorner, Off
     Tooltip, , , , 2
     Tooltip, , , , 3
     SetTimer, ShowHotkeyNumberLevel, Off
     SuspendedTooltip:
     {
     MouseGetPos, x, y, Screen
     Tooltip, Script is suspended``nPress Ctrl+Alt+S to reactivate hotkeys, (x+37), (y-5), 1
     return
   }
  }
  else
  {
   settimer, SuspendedTooltip, off
     settimer, SuspendedTooltipOff, 20
     settimer, getridofsuspend, -1000
     SuspendedTooltipOff:
     {
     MouseGetPos, x, y, Screen
     Tooltip, Hotkeys Activated, (x+37), (y-5), 1
     return
    }
   getridofsuspend:
   {
   settimer, SuspendedTooltipOff, off
   Tooltip, , , , 1
  }
  if GlossaryOn = True
	GlossaryOn = False
else
	GlossaryOn = True
   gosub NumpadAdd
   return
  }

return



/*
---------------------------------------------------❃---------------------------------------------------
                                           Toggle Beep Sounds
*/

Pause::
{
 if TurnBeepOn = True
 {
  TurnBeepOn = False
   return
  }
 else if TurnBeepOn = False
 {
  TurnBeepOn = True
  return
 }
}

/*
---------------------------------------------------❃---------------------------------------------------
                                             Question boxes
*/

AskOpeninBrowser:
{

Link = %Link%

if (Link = "")
{
 Goto NoPressed
}

MsgBox, 262179, Open in browser?, Would you like to open > %Name% < in your default browser?



IfMsgBox Yes
{
    Run, `%Link`%
    Goto YesPressed
   }
IfMsgBox No
    Goto NoPressed

 IfMsgBox Cancel
    ExitApp
}

/*
---------------------------------------------------❃---------------------------------------------------
                                             Tooltip Guides
*/


/*
-------------------------❃-------------------------
                  Initial Tooltip
*/

/*
---------------------------------------------------
                 If "Yes" was pressed
*/

YesPressed:
{

 firstdone = 0

 TimeForInitialTooltip := 1000*(   5.5   ) ; Number in brackets indicates how long the initial tooltip will last for in seconds

 SetTimer, InitialTooltipTimerWhenYesIsPressed, -`%TimeForInitialTooltip`%

 ; ▶✦◀ alhamdulillah

 IfMsgBox Yes
 {

 Loop
 {
 CoordMode, Mouse, Window
 MouseGetPos, x, y
 Tooltip, -----------▶  Surah Viewer  ◀------------``n``n-----------▶  By Turbofan20  ◀-----------``n``n■  Press Ctrl + 1 to exit when finished  ■``n``n      >  Loading Video and Settings...  <,(x+30), (y-10), 1
 } Until firstdone = 1 ; does not close the initial tooltip until "first done" is equal to 1,
                       ; which will happen after 5.5 seconds (cf. TimeForInitialTooltip - Line 190)
                       ; This is a custom timer that had to be made because tooltip doesn't have one built in (but msgBox does for some reason)

 return
 }

 InitialTooltipTimerWhenYesIsPressed:
 {
     firstdone = 1
 }

gosub OpenGlossaryUponStartup

return
}


/*
---------------------------------------------------
                 If "No" was pressed
*/

NoPressed:

{
Countdown = 4

 (IfMsgBox No) OR (Link = "")
 {
   TooltipForNo:
   {
       Loop
       {
           CoordMode, Mouse, Window
           MouseGetPos, x, y
           Tooltip, -----------▶  Surah Viewer  ◀------------``n``n-----------▶  By Turbofan20  ◀-----------``n``n■  Press Ctrl + 1 to exit when finished  ■``n``n                               >  `%Countdown`%  <,(x+30), (y-10), 1
           sleep 20
           if Countdown > 3
               gosub Timer
       }
       until countdown = -1
	   Tooltip
       gosub OpenGlossaryUponStartup
   }

   Timer:
      {
         {
         SetTimer, DecreaseTimer, 1000
         }
         DecreaseTimer:
         {
             Countdown -= 1
             return
         }
      }

 }
}


/*
-------------------------❃-------------------------
                Tooltip Guide Settings
*/

OpenGlossaryUponStartup:
{
goto NumpadAdd
}

NumpadAdd::
{
if GlossaryOn = True
	GlossaryOn = False
else
	GlossaryOn = True


{
gosub Glossary
return
}
return

}

Glossary:
{


if GlossaryOn = True
{
GlossaryCorner:
Tooltip, [F1-F4]     Click at saved position   |     [A and D]   Move Cursor 1px``n[F5-F8]     Save Custom Position   |   [Numpad+]     Toggle Help``n[Pause]        Toggle Save Sound     |   [Numpad *]            Vol+``n[X]                       Click Mouse          |   [Numpad - ]            Vol-``n[W]            Turn Hotkey Level Up   |      [S]   Turn Hotkey Level Down``n[Ctrl+Alt+S]     Pause Hotkeys        |      [Ctrl + 1]    Exit Surah Viewer, 0, 53, 3
return
}

else
{
 ToolTip, , , , 3
 Return
}

return
}


NumpadMult::

{

SetTimer, GlossaryCorner, Off

SoundSet +1

SoundGet, master_volume
CorrectedVolume:=Round(master_volume)

SetTimer, ToolTipVolume, 20
SetTimer, RemoveVolumeToolTip, -750


SetTimer, Glossary, -740

return

}



TooltipVolume:
{
MouseGetPos, x, y, Screen
Tooltip, Volume → `%CorrectedVolume`%```%, (x+37), (y-5), 1
Return
}


RemoveVolumeToolTip:
{
SetTimer, ToolTipVolume, Off
Tooltip
return
}


NumpadSub::

{

SetTimer, GlossaryCorner, Off

SoundSet -1

SoundGet, master_volume
CorrectedVolume:=Round(master_volume)

SetTimer, ToolTipVolume, 20
SetTimer, RemoveVolumeToolTip, -750


SetTimer, Glossary, -740

return

}

#If

#InputLevel 1

NumpadEnter::Space
Numpad0::0
Numpad1::1
Numpad2::2
Numpad3::3
Numpad4::4
Numpad5::5
Numpad6::6
Numpad7::7
Numpad8::8
Numpad9::9 ; Converts numpad to regular numbers

#InputLevel 0

W::
{

if VerseNumberHotkeyLevel < 28
{
VerseNumberHotkeyLevel += 1
HotkeyLevelToVerseRange := `% 10*VerseNumberHotkeyLevel+1 " - " 10*(VerseNumberHotkeyLevel+1)
}


SetTimer, ShowHotkeyNumberLevel, 20
SetTimer, RemoveHotkeyNumberLevel, -1000

return
}


S::
{

if VerseNumberHotkeyLevel > 0
{
VerseNumberHotkeyLevel -= 1
HotkeyLevelToVerseRange := `% 10*VerseNumberHotkeyLevel+1 " - " 10*(VerseNumberHotkeyLevel+1)
}

SetTimer, ShowHotkeyNumberLevel, 20
SetTimer, RemoveHotkeyNumberLevel, -1000

return
}

RemoveHotkeyNumberLevel:
{
SetTimer, ShowHotkeyNumberLevel, Off
Tooltip, , , , 2
return
}

ShowHotkeyNumberLevel:
{
CoordMode, Mouse, Screen
MouseGetPos, x, y, Screen
if VerseNumberHotkeyLevel = 0
{

Tooltip, `% ("     Level ")("0")("``n")("Verses ") (10*(VerseNumberHotkeyLevel)+1) (" - ") (10*(VerseNumberHotkeyLevel+1))(""), x-43 , y-45, 2
return
}


else if ( 0 < VerseNumberHotkeyLevel AND VerseNumberHotkeyLevel <= 8)
{

Tooltip, `% ("      Level ")(VerseNumberHotkeyLevel)("``n")("Verses ") (HotkeyLevelToVerseRange)(""), x-45 , y-45, 2
return


}
else if ( 8 < VerseNumberHotkeyLevel AND VerseNumberHotkeyLevel <= 27)
{

Tooltip, `% ("         Level ")(VerseNumberHotkeyLevel)("``n")(" Verses ") (HotkeyLevelToVerseRange)(" "), x-57 , y-45, 2
return
}
else
{

Tooltip, `% ("         Level ")(VerseNumberHotkeyLevel)("``n")(" Verses 280 - 286")(" "), x-57 , y-45, 2
return


}

}

/*

---------------------------------------------------❃---------------------------------------------------
											 Verse Hotkeys
*/

CoordMode, Mouse, Window

---------------

#If, VerseNumberHotkeyLevel = 0

---------------
``::

/*
 ╔═════════════════════╗
 ║                     ║
 ║      Bismillah      ║
 ║	                   ║
 ╚═════════════════════╝
*/

Tooltip

MouseClick, left, %BismillahCoordinates%

Return


)

sleep 50

sendInput ^v ; Special box for Bismillah

Loop ; Generates verse templates up to the number that the user specified
{

	if Mod(A_Index, 10) = 0
	{
		Hotkey%A_index% = 0
	}
	else
	{
	Hotkey%A_index% := SubStr(A_index, 0 , 1)
	}

	if A_index > %NumberOfVerses%
		break
	else
		SendInput, % ("---------------`n/*`n╔═══════════════╗`n`n {backspace} `; | Verse ") A_index (" | `;`n {backspace} `n{backspace}{backspace}╚═══════════════╝`n`n*/`n`n") Hotkey%A_index% ("::")(" `n`nMouseClick`, left`,") VerseCoords%A_Index% ("`n`nReturn`n`n")


	if Mod(A_Index, 10) = 0
	{

		SendInput, % ("---------------`n`n═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═`n`n")("{#}If, VerseNumberHotkeyLevel = ") SubStr(A_Index, 1, 1) ("`n`n═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═-═`n`n")

	}


}

SendInput /*`n`n-------------------------------------------------- ■ --------------------------------------------------`n`n*/{Up}                                                  END{Down}{Enter}`n`n

SendInput,
(
Ctrl & 1::
Suspend, Permit
ExitApp
)

SendInput `n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n

/*
-------------------------------------------------- ■ --------------------------------------------------
											End of Text File
*/

Sleep 50

SendLevel 100
SendInput ^{s} ; Saves the generated hotkey file
SendLevel 0


/*
-------------------------❃-------------------------
	      Check if the text file has updated
*/

CheckFileChange(TempFileforTextHotkeys):

{

lastFileContent := ""
setTimer, checkFile, 20
return

checkFile:
fileread newFileContent, %TempFileforTextHotkeys%
if(newFileContent != lastFileContent)
{
    lastFileContent := newFileContent
	gosub CloseAndCopy

}
else
	return
return
}

CloseAndCopy:
{

SetTitleMatchMode 2
While WinExist("tempfile4surahgen")
{
	SendInput {Ctrl Down}{w}{Ctrl Up}
	sleep 10
	WinKill ; Closes the text file once everything is done
}

DestinationFile := A_Desktop "\" Name ".ahk"

FileCopy, %TempFileforTextHotkeys%, %DestinationFile%

MsgBox, 262208, Surah Viewer Done, ▶  %Name%  ◀  has been created and placed on your desktop.`n`n✦  جزاك اللهُ خيرا for using Surah Viewer  ✦`n`n◾  By Turbofan20  ◾`n`n◾  https://github.com/turbofan20  ◾

}

Clipboard =

/*
-------------------------------------------------- ■ --------------------------------------------------
                                                  END
*/

ExitApp ; Exits the program after everything is done




