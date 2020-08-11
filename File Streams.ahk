/*
	With file streams you can hide information from a standard user and not have them snoop around things they shouldn't.
	But that's not the only use; you can set up a way to have a first-time-run action set up for your script for when the user just installs your program.
	This is quite useful for setting up the options and settings for your program and what not on the first instance of running, after that you can do what you want.

	Notes:
	- Streams do not affect the file directly, it's like making a file into a folder but you can read the folder as if it was a file... if that makes sense.
	- You can write to many streams for various actions, sometimes even writing all of your settings into your own script and then send your script to other users.
	- Your stream will not show up in the file explorer even if you have hidden files set to "On", so make sure to keep track of your streams somehow.
	- These streams can be any text you want. I don't know if you can save bitmaps into a stream, but its worth a try.
	- Streams can be added to just about any file. Even directories!
*/

; --------------------------------------------------
; This is the stream name.
; Stream Data Inside Files.ahk:FirstRun
StreamName := "FirstRun"

; Here we read the stream into a variable.
Content := ReadFromStream(StreamName)

If (Content == True) {
	; Here we delete the stream since we don't need it to exist any more.
	MsgBox, I've been run before!
	DeleteStream(StreamName)
} Else {
	; Here we append to the stream.
	MsgBox, Setting up your settings!
	AppendToStream(True, StreamName)
}
ExitApp, 0


; --------------------------------------------------
; The functions to use.
AppendToStream(Data, StreamName, File := "%A_ScriptFullPath%") {
	S := FileOpen(File . ":" . StreamName, "a")
	S.Write(Data)
	S.Close()
	Return (ErrorLevel)
}

DeleteStream(StreamName, File := "%A_ScriptFullPath%") {
	If (FileExist(File . ":" . StreamName)) {
		FileDelete, % File . ":" . StreamName
	} Else {
		Return (True)
	}
	Return (ErrorLevel)
}

ReadFromStream(StreamName, File := "%A_ScriptFullPath%") {
	If (FileExist(File . ":" . StreamName)) {
		S := FileOpen(File . ":" . StreamName, "r")
		Content := S.Read()
		S.Close()
		Return (Content)
	} Else {
		Return (False)
	}
}
