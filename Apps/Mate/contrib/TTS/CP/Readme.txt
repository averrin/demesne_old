---------------------------------------------------------------------
File: 		Govorilka_cp.exe
Version:	2.4
Description: 	Command line text-to-speech processor
		(Govorilka CP TTS)
		This application can speak any texts
		by using installed text-to-speech engines.
		It may be used with software that allows external applications
		launch. Also works as stand-alone utility.
Requirements:	MS SpeechAPI 4 (or SAPI5) and compatible text-to-speech engine(s) installed.
		(ask author for download links if needed)
License type:	Free for non-commercial use.
Author:		Anton Ryazanov
Copyright:	©2001-2009, Anton Ryazanov
E-mail:		vsoft@vector-ski.ru
WebSite:	www.vector-ski.ru/vecs/
---------------------------------------------------------------------
How to use?
Just run it with parameters:

Govorilka_cp.exe [-H] [-Ex | -E "voice"] [-Sx] [-Px] [-Vx] [-I] [-D "dictionary_file"] {-F "file_name"}|{text_string}|{-C} [-TO "file_name"] [-Wx] [-STOPALL] [-QUEUE]

Keys:
 -H  - display available voice names with it's ordinal numbers.
 -Ex - obsolete. Use next parameter instead. Ordinal number (x) of used voice (0 by default).
  or
 -E "voice_name" - name of used voice.
 -Sx - set speech speed (0-100). 0 is slowest, 100 is fastest.
 -Px - set speech pitch(0-100). 0 is lowest, 100 is highest.
 -Vx - set speech volume(0-100). 0 is lowest, 100 is highest.
 -D "dictionary_file" 	- specifies the dictionary file name for text processing.
 -F "file_name"		- specifies the file name with text to be spoken. If it is not specified then 'text_string' will be spoken instead.
 -C	 		- speak text from clipboard.
 -I - invisible mode. If not specified then indication will appear in lower-right screen corner while speaking (single click will stop speech).
 -TO "file_name"	- specifies the output WAV-file name.
 -Wx - set WAVEOUT device (sound card) ordinal number (0-based, -1 for default soundcard).
 -Q or -QUEUE - put current Govorilka_cp instance in queue. Current instance will wait while all previously queued instances finished. Note: Govorilka_cp folder must be writable to write temporary queue file.
 -STOPALL - stop all other Govorilka_cp instances.


Tip: 
  You can also set default parameters' values in Govorilka_cp.ini file
  (see "Govorilka_cp_ini_example.ini")


//-----------------------
// Command line examples
//-----------------------

1. 
Govorilka_cp.exe "Hello!"

- Speaks "Hello!" with default voice.

2.
Govorilka_cp.exe -E "Digalo Russian Nicolai" Hello!
or
Govorilka_cp.exe -E "Adult Male #1, American English (TruVoice)" "Hello! I am your computer!"

- Speaks "Hello!" with particular installed voice.

3.
Govorilka_cp.exe -e "Digalo Russian Nicolai" -p100 -s100 -d "C:\Program Files\Говорилка\Dic\Digalo Russian Nicolai.dic" "Сделал дело - гуляй смело!"

-This will speak text using Govorilka's dictionary with "Digalo Russian Nicolai" voice with maximum speed and pitch.

4.

Govorilka_cp.exe -q -f "c:\Mail\msg.txt"

-This will speak text from c:\Mail\msg.txt without dictionary processing using first Speech engine (number 0) with default speed and pitch in queue context.

5.
Govorilka_cp.exe -stopall "You have urgent message!"

-stops all running Govorilka_cp instances and then speak defined text.

6.
Govorilka_cp.exe -stopall
-stops all running Govorilka_cp instances


---------------------------------------------------------------------
P.S. I hope you will enjoy with this little Govorilka :)
©Anton Ryazanov, 2001-2009
vsoft@vector-ski.ru
