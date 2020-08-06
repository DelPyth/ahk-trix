/*
	You can get the current OS Version by reading the file version of a specific DLL file.
	What's the difference between this function and A_OSVersion?

	A_OSVersion  - https://www.autohotkey.com/docs/Variables.htm#OSVersion
	One of the following strings, if appropriate: WIN_7 [requires v1.0.90+], WIN_8 [requires v1.1.08+], WIN_8.1 [requires v1.1.15+], WIN_VISTA, WIN_2003, WIN_XP, WIN_2000.
	Applying compatibility settings in the AutoHotkey executable or compiled script's properties causes the OS to report a different version number, which is reflected by A_OSVersion.
	[v1.1.20+]: If the OS version is not recognized as one of those listed above, a string in the format "major.minor.build" is returned. For example, 10.0.14393 is Windows 10 build 14393, also known as version 1607.

	In short, the built in variable only gives a name, while this function gives a readable version number.
*/

; --------------------------------------------------
MsgBox, % "Your OS Version is: " . OSVersion()
ExitApp, 0


; --------------------------------------------------
OSVersion() {
	FileGetVersion, OSV, user32.dll
	Return (Format("{1:}.{2:}.{3:}", StrSplit(OSV, ".")*))
}
