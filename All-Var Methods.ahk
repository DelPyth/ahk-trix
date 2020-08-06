/*
	A cool and useful trick in AHK is to add methods to EVERY variable by adding a function call to the Base property.
	Kinda complicated, don't worry, it's pretty simple if you know how classes work.

	Notes:
	- This will work for any and every variable in the program.
	  No matter if it's local, static, or global.
	- This does not override class methods, so play around with it.
*/

; --------------------------------------------------
; Set up out methods.
"".Base.IsFunc := Func("IsFunc")
"".Base.Add := Func("MyFunction")
"".Base.Length := Func("StrLen")
"".Base.IsLongerThan2 := Func("AnotherFunction")

; --------------------------------------------------
; Detect if a string is a function.
X := 10
Y := "Yes"
Z := "MyFunction"

MsgBox, % "X is a function?: " . X.IsFunc()	. "`n"
		. "Y is a function?: " . Y.IsFunc()	. "`n"
		. "Z is a function?: " . Z.IsFunc()	. "`n"

; --------------------------------------------------
; Add Y to X.
A := 10
MsgBox, % "A + 5 is: " . A.Add(5)

; --------------------------------------------------
MsgBox, % A_UserName.IsLongerThan2()
ExitApp, 0


; --------------------------------------------------
; Some of the functions that we're using.
MyFunction(VarA, VarB) {
	Return (VarA + VarB)
}

AnotherFunction(X) {
	If (X.Length() > 2) {
		Return ("Yes")
	} Else {
		Return ("No")
	}
}
