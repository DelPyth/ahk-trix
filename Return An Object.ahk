/*
	You can return an object from a function to help users who only want to get certain information out of a function without knowing which variable is to go where.
	A few examples would be, SplitPath, MouseGetPos, and WinGetActiveStats
*/

; --------------------------------------------------
MsgBox, % SplitPath(A_ScriptFullPath).NameNoExt . "`n"
	. MouseGetPos().X . "`n"
	. WinGetActiveStats().Title
ExitApp, 0


; --------------------------------------------------
SplitPath(File) {
	SplitPath, File, FileName, Dir, Ext, NameNoExt, Drive
	Return ({"FileName": FileName, "Dir": Dir, "Ext": Ext, "NameNoExt": NameNoExt, "Drive": Drive})
}

MouseGetPos(Options := "") {
	MouseGetPos, X, Y, Win, Control, % Options
	Return {"X": X, "Y": Y, "Win": Win, "Ctrl": Control}
}

WinGetActiveStats() {
	WinGetActiveStats, Title, W, H, X, Y
	Return ({"Title": Title, "W": W, "H": H, "X": X, "Y": Y})
}
