/*
	Using a method or function to handle a control's actions is actually quite useful and it's better practice than using Labels everywhere.
	Setting up a control to use a method to handle said control isn't as intuitive as it may seem however.
	Sadly we cannot add the function call directly into the parameter of the command, but you can set the bound function to a variable beforehand.
*/

; --------------------------------------------------
; Show a window that will always be on top and will be a tool-window to simplify things.
Gui, New, +AlwaysOnTop +ToolWindow
Gui, Add, Button, w75 h23 vMyButton, &OK
Gui, Add, Button, w75 h23 vMyOtherButton, &MSG
Gui, Show,, Example

; Here we set up the button to be handled by "MyFunction"
FN := Func("MyFunction")
GuiControl, +g, MyButton, % FN

; Here we set up the button to be handled by "MyMethod"
FN := ObjBindMethod(MyClass, "MyMethod")
GuiControl, +g, MyOtherButton, % FN
Return

; When you're finished with the example, close the window and the script will exit.
GuiClose(HWND) {
	ExitApp, 0
}
GuiEscape(HWND) {
	GuiClose(HWND)
}


; --------------------------------------------------
MyFunction() {
	MsgBox, You pressed the first button!
	Return (False)
}

Class MyClass {
	MyMethod() {
		MsgBox, You pressed the other button!
		Return (False)
	}
}
