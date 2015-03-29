#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  modPrefs.WriteAllPrefs
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  
		  // Toggle this to set whether this build is for the Ubuntu store or not
		  
		  'kForUbuntuStore = true
		  kForUbuntuStore = false
		  
		  modCodeGenerator.BuildingForiPad = false
		  
		  
		  InitPrefFile(".illuminationpreferences")
		  
		  modPrefs.ReadAllPrefs
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		kForUbuntuStore As boolean
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kpAndroid, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kpFlexAIRDesktop, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kpFlexWeb, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kpiOSiPad, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kpiOSiPhone, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kpPHPJavascriptWeb, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kpPythonDesktop, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kpPythonMaemo, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kpWinPhone7, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="kForUbuntuStore"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
