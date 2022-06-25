# Surah Viewer - Memorize the Quran with Ease 📗 ✔️

<a href="url"><img src="https://user-images.githubusercontent.com/55412194/175779248-a9d7477f-0f50-4b4e-81e7-1938ffabb529.png" align="left" height="350" width="1200" ></a>
 
---

Surah Viewer is a convenient and user-friendly program that allows you to set custom hotkeys on your keyboard which when pressed, will jump to a certain verse or a certain point in a verse in a Surah in a Youtube video. The word "Surah" in Arabic means a chapter in the Quran. There are exactly 114 Surahs in the Quran, so this tool is likely to be of great benefit throughout Hifz (lit. Guardianship of the Quran).

The program works by using pixel coordinates to go to the corresponding location of a verse or a point in the Youtube video, via the progress bar upon the user pressing a hotkey.

The program will instruct the user what to do along the way to generate their desired hotkey macro for a requested Surah.

The program will first ask the user to input the name of the Surah. (eg. 103 - Surah Al Asr)

It will then ask for the Youtube URL of the video that plays the Surah (eg. https://www.youtube.com/watch?v=-I2RkWeQvuo).

It will then ask for the individual coordinates of the verses of the Surah (dependent on monitor dimensions)[^1].

For example, if Verse 5 started exactly half way through the video, the user would enter the coordinates of the midpoint of the progress bar of the video. The user can then press "5" on their keyboard (top row or Numpad) which will cause the computer to automatically click at the midpoint of the progress bar, ie. the beginning of verse 5. 
If the user pressed "9", it would click the coordinates on the progress bar that would send them to verse 9, or any other verse [^2].
If the user pressed "0", it would take them to the "Bismillah" at the beginning of the Surah. 
This intuitive design allows users to easily go to a verse that they need to hear (repeatedly), which greatly aids in memorization.

# Why memorize the Quran? 💖

Would you like VIP protection in this life and the next?

Allah says in the Quran,

>وَنُنَزِّلُ مِنَ ٱلْقُرْءَانِ مَا هُوَ شِفَآءٌۭ وَرَحْمَةٌۭ لِّلْمُؤْمِنِينَ ۙ وَلَا يَزِيدُ ٱلظَّـٰلِمِينَ إِلَّا خَسَارًۭا
> And We send down from the Quran that which is a healing and a mercy to those who believe, and it increases the Zalimun (polytheists and wrong-doers) nothing but loss.
--
>Surah Isra 17:82
>--

--

>إِنَّا نَحْنُ نَزَّلْنَا ٱلذِّكْرَ وَإِنَّا لَهُۥ لَحَـٰفِظُونَ
> Verily We: It is We Who have sent down the Dhikr (i.e. the Quran) and surely, We will guard it (from corruption).
--
>Surah Hijr 15:9
>--


This does not strictly refer to the physical existence of the Quran, but also that which has been guarded within the heart. This means that by making an effort to memorize (and understand) the Quran, you are essentially making an agreement to the One who created you for protection from all evil and also for an increase in His awareness, which will bring about a lot of reward and protection from calamities (inshaAllah). Therefore, your best bet of absolute protection is by memorizing and understanding the Quran. 

This on its own is excellent motivation, not even taking into account the immense health and psychological benefits and blessings that follow as a result.

I haven't done justice in fully expressing the blessings of memorizing the Quran as I've only said a fraction of the rewards that will follow. Watch the following video:
https://www.youtube.com/watch?v=AKVwCOy6DYY&t=1135s

Reading the Quran digitally is arguably beter than in book, as the translation can be easily read in conjunction to the verse and the audio can be readily and conveniently listened to. It is much easier to learn verses by repeatedly listening to it on audio or sound than other methods. Mufti Menk said it himself:
https://www.youtube.com/watch?v=4k2_Ukgg_-Y

[^1]: See Issue 8
[^2]: See Issue 4
[^3]: See Issue 15
[^4]: See Issue 14
------------------------------------------------------
# Features ⚡ ✨
- Program is written in AutoHotKey - Intuitive and friendly UI
- Dynamic hotkeys allow you to set custom points in a verse rather than only at the beginning of the verse - perfect for memorizing large verses. These can be changed at the user's liking
- Macro generation is fully automated [^2]
- Copy and paste at the press of a button - very convenient
- Generated Surah macro is both easily readable and easy to modify according to the user's liking 
- Precision - Ensure that you are exactly at the location of the Surah where you would like to be.[^3] You can move 1 pixel at a time using the WASD/AD keys.
- When saving dynamic hotkeys, a discernible sound is made to confirm that a save is done. This sound can be easily turned off, whilst still allowing the user to save custom locations
- Freely accessible source code - change the program to your liking and contribute to the source code such as by fixing bugs
- Generated macros are saved on the desktop so that they can be easily opened an closed at anytime[^4]. There is no need to make the macro again each time you want to listen to a Surah
- And more

------------------------------------------------------
# Simplicity and Customisability ⚙️ 🛠️
The design of this program aims to be as intuitive and user friendly as possible because Quran memorization is easy inshaAllah. 

The user is guided along every step of the way on how to get their hotkey script up and running - just answer a few basic questions and let the machine do the rest.

The user can create custom dynamic coordinates where they can save and change the location of temporary coordinates. Perfect for memorizing long verses by breaking them up into smaller segments. There is a discernable "beep" sound that indicates the coordinates have been saved into the dynamic hotkey. This sound can be easily turned off at user will (dynamic saving and loading will still work).

There are also useful tooltips next to the cursor, providing information about the program and controls. These tooltips can be easily turned off at any time at the press of a button if they are acting as a distraction.

------------------------------------------------------
# Download ⬇️

### You will need Notepad++ and AutoHotkey v1+ to use Surah Viewer

### [Download AutoHotKey](https://www.autohotkey.com/download/)

### [Download Notepad++](https://notepad-plus-plus.org)

### [Download Surah Viewer](https://github.com/turbofan20/Surah-Viewer/raw/main/Surah%20Viewer%20v1.2.2.zip)

---
# Issues and Bugs ⚠️ 🛠️

Alhamdulillah I am impressed at what was produced within 10 days despite knowing nothing about AutoHotKey less than 2 weeks ago. In every program, however, there are bound to be some bugs and issues.

1)	There is currently no button to suspend all hotkeys temporarily (Ctrl + 1 exits the script though)

2) Despite the interactive tooltip, there is no information menu that displays all of the controls of the program at once

3)	There is no way to rebind the controls of the program unless third party scripts are used

4)	There are no specific hotkeys for verses 10 and over. For Surahs that have over 10 verses, the user would have to go into the generated hotkey file and manually change the specific hotkey numbers (# ::) to another key. A partial solution this is that after verse 9, the user could move on to letters. Eg. 10 -> Q , 11 -> W, 12 -> E, .... , 35 -> M. However the two major downsides to this is that the user would have to replace the hotkeys manually, and there will still be a limit to the number of verses that this could be set to (as the user wouldn't be able to make hotkeys for Surahs over 50 verses long unless they combine hotkeys or split the surah in chunks).

5)	If progress bar changes size (for whatever reason), all hotkeys become useless (one potential workaround this would be to use a local video player such as VLC, however see issue # 6).

6)	~~The user is forced to enter a Youtube URL. This will hopefully be changed sometime in the future so that the user is given the option to enter a URL (such as if they want to play the video locally on VLC for example instead of being fully restricted to Youtube).~~

	> 6) Fixed in version 1.2.2

7)	The user has to manually input the number of verses of a given Surah, instead of the program automatically figuring out how many verses are in that Surah (would require a dictionary in the program so it's easier just for the user to input the number of verses themselves).

8)	Verse locations are based on the absolute coordinates of the pixels on the user's screen. This will make individual scripts unusable on monitors that have different dimensions, as the location where the mouse will click on the progress bar will vary from monitor to monitor (unless they are the same dimensions).

9)	I used basic input boxes to get input from the user. While this did get the job done quite well, a GUI would have had many advantages over input boxes (such as greater customizability and ease of use). 

10) The controls and settings are in tooltip format. These can have issues and can be unpredictable especially as the code gets more and more complex. Again, a GUI would have been more suitable.

11) While (Alhamdulillah) the program works, the flow and structure of the source code could have been more organised. It isn't spaghetti code, but there is room for improvement.

12) There is no way for the program to ensure that coordinates are entered in the form of [x,y]. This means that a user could enter any string (except blanks) and still generate the hotkey script (it would be unusable however, as AHK would return a syntax error).

13) Warning messages from Notepad++ are likely to disturb the (primitive) append function of the script. The "append function" essentially copies a whole block of text from the clipboard and pastes it into the text file along with extra automated inputs while it is open. If the text file becomes inactive for whatever reason (in this case by warning messages), the "append" function becomes interrupted and unexpected results are likely to occur. For this reason, it is best that the user manually closes all Notepad++ files and exits the text editor before running Surah Viewer.

14) Currently, generated AHK files can only be sent to the desktop. Hopefully in the future the user can choose where to store their file.

15) Videos that play large Surahs all in one go are exceptionally long (>1 hour). This means that a change in one pixel on the progress bar could correspond to a few seconds being jumped through the video. This is in comparison to relatively short Surahs that are only a few/tens of verses long, where a difference in one pixel would result in a change of just a second or less. This makes the program useless for long videos (not long Surahs, as the video could just be broken up into smaller chunks via private reupload (or via VLC/Media Player in the near future InshaAllah) and separate hotkeys could be made for those shorter videos). 
### If possible, it would be excellent if the specific frames (of when the verse starts or via dynamic hotkeys) would be used instead of screen coordinates, as it would eliminate issues: 5, 8, 12, and 15, all in one go.

# Summary ℹ️↙️

Surah Viewer is a user friendly program that allows you to easily memorize verses of the Quran by letting you jump from one verse to another at the press of a button and more. It is totally free.

I initially got the motivation to make this application when I tried to memorize the Quran on Youtube a few months ago, but wasn't able to do so that well. This was because I couldn't easily go from one verse to another and jump to certain parts within large verses. I was using my mouse to repeatedly click at the part that I would like to listen to, but this had numerous problems. 

The three major ones being that I had to have absolute precision and accuracy as to where I positioned the cursor, I had to make sure not to accidentally move the cursor as I clicked the mouse, and I could not save cursor locations on the scrollbar. This meant that I had to go back and forth if I wanted to go from one verse or section to another, going through the whole process of moving the mouse and getting to the specific point on the scrollbar with precision every single time. If I had to do this for 114 Chapters, this would get really irritating and time consuming. To remedy this, I tried looking for an extension on the Chrome webstore to see if there was one that would allow me to set custom timestamps and click them. Unfortunately, there weren't any that would suit my needs.

Alhamdulillah, in just under 2 weeks Surah Viewer was created, which allowed me to customise how I read the Quran (along with added programming experience and logic development). I'm not very good at programming, but AHK really is a beast of a language. As long as you have common sense and/or logic, you can make serious programs with AHK that otherwise wouldn't be possible with other programming languages (unless you dedicate a lot of time to them).

While initially I did run into a lot of trouble with using AHK (mainly syntax errors), I am glad that Surah Viewer is working.

Citation: Some code from the program was used from mikeyww and phil294 - thanks to both of them.

## Iجَزاكَ اللهُ خَـيْر  for using Surah Viewer and may Allah grant you huge rewards for striving to memorize the Quran.

— turbofan20
