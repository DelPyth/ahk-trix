/*
	You can set up a way to have a first-time-run action set up for your script for when the user just installs your program.
	This is quite useful for setting up the options and settings for your program and what not.

	However, this is not the only use for this.
	You can write to many streams for various actions, sometimes even writing all of your settings to your own script.

	Keep in mind, your stream will not show up in the file explorer even if you have hidden files set to "On", so keep track of your streams in a way that you know will work.

	These streams can be any text you want. I'm also fairly certain you can store images into a stream, but I wouldn't try it.
*/

; --------------------------------------------------
StreamName := "FirstRun"

Content := ReadFromStream(StreamName)

If (Content == True) {
	MsgBox, I've been run before!
} Else {
	MsgBox, Setting up your settings!
	WriteToStream(True, StreamName)
}
ExitApp, 0


; --------------------------------------------------
; The functions to use.
WriteToStream(Data, StreamName) {
	S := FileOpen(A_ScriptFullPath . ":" . StreamName, "w")
	S.Length := StrLen(Data)
	S.Write(Data)
	S.Close()
	Return (ErrorLevel)
}

DeleteStream(StreamName) {
	If (FileExist(A_ScriptFullPath . ":" . StreamName)) {
		FileDelete, % A_ScriptFullPath . ":" . StreamName
	} Else {
		Return (False)
	}
	Return (ErrorLevel)
}

ReadFromStream(StreamName) {
	If (FileExist(A_ScriptFullPath . ":" . StreamName)) {
		S := FileOpen(A_ScriptFullPath . ":" . StreamName, "r")
		Content := S.Read()
		S.Close()
		Return (Content)
	} Else {
		Return (False)
	}
}
