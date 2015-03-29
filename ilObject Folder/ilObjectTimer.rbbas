#tag Class
Protected Class ilObjectTimer
Inherits ilObjectBase
	#tag Event
		Sub GenerateAndroidCode(theOrigin as string)
		  dim s as string
		  
		  s = "private Handler " + GetCodeName + "Handler = new Handler();" + EndOfLine
		  
		  s = s + "private Runnable " + GetCodeName + "TimeTask = new Runnable()" + EndOfLine
		  s = s + "{" + EndOfLine
		  s = s + "public void run()" + EndOfLine
		  s = s + "{" + EndOfLine
		  s = s + "//" + GetCodeName + "Go" + EndOfLine
		  s = s + GetCodeName + "Handler.postDelayed(" + GetCodeName + "TimeTask, ( 2 * " + _
		  modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalAndroidName + "));" + EndOfLine
		  s = s + "}" + EndOfLine 
		  s = s + "};" + EndOfLine + EndOfLine
		  
		  AndroidInsertCodeAtMarker(s, "//EndOfGlobalVariables")
		  
		  
		  
		  s = GetCodeName + "Handler.removeCallbacks(" + GetCodeName + "TimeTask);" + EndOfLine
		  s = s + GetCodeName + "Handler.postDelayed(" + GetCodeName + "TimeTask, " + _
		  modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalAndroidName + ");" + EndOfLine
		  
		  AndroidInsertCodeAtMarker(s, "//iscApp1Launched")
		  
		  
		  'private Handler mHandler = new Handler();
		  '
		  'private Runnable mUpdateTimeTask = new Runnable()
		  '{
		  'public void run()
		  '{
		  'iscAddToListBox5();
		  'mHandler.postDelayed(mUpdateTimeTask, ( 2 * 1000)) ;
		  '}
		  '};
		  
		  
		  '
		  'mHandler.removeCallbacks(mUpdateTimeTask);
		  'mHandler.postDelayed(mUpdateTimeTask, 1000);
		  '
		  'AndroidInsertCodeAtMarker(s, "//EndOfGlobalVariables")
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateJavaScriptWebCode(theOrigin as string)
		  dim s as string
		  
		  //var myVar=setInterval(function(){myTimer()},1000);
		  
		  s = "var " + GetCodeName + "Handler=setInterval(function(){" + GetCodeName + "()}," + modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalAndroidName + ");" + EndOfLine
		  
		  HTML5InsertCodeAtMarker(s, "//EndOfGlobalVariables")
		  
		  
		  
		  s = "function " + GetCodeName + "()" + EndOfLine
		  
		  s = s + "{" + EndOfLine
		  
		  s = s + "//" + GetCodeName + "Go" + EndOfLine
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  
		  HTML5InsertCodeAtMarker(s, "//EndOfFunctions")
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GeneratePythonDesktopCode(theOrigin as string)
		  '
		  'dim s as string
		  '
		  '// Make the Timer global
		  's = s + "" + GetCodeName + " = timer(" + modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalPythonName + "," + _
		  ' "Go" + GetCodeName + ")" + EndOfLine
		  '
		  'PythonInsertCodeAtMarker(s, "#EndOfGlobalVariables")
		  '
		  '
		  '
		  '// Add the Timer start Function
		  's = "def Start" + GetCodeName + "():" + EndOfLine
		  's = s + " " + GetCodeName + " = timer(" + modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalPythonName + "," + _
		  '"Go" + GetCodeName + ")" + EndOfLine
		  's = s + " " + GetCodeName + ".start()" + EndOfLine
		  's= s + EndOfLine
		  '
		  'setCodeToCallThisObjectForName("Start", "Start" + GetCodeName + "()")
		  '
		  'PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		  '
		  '
		  '// Add the Timer Go function
		  's = "def Go" + GetCodeName + "():" + EndOfLine
		  's = s + " #" + GetCodeName + "Go" + EndOfLine
		  's = s + " Start" + GetCodeName + "()" + EndOfLine
		  's= s + EndOfLine
		  '
		  'setCodeToCallThisObjectForName("Go", "Go" + GetCodeName + "()")
		  '
		  'PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		  '
		  '
		  '// Add the Timer Stop function
		  's = "def Go" + GetCodeName + "():" + EndOfLine
		  's = s + " #" + GetCodeName + "Stop" + EndOfLine
		  's = s + " "+ GetCodeName + ".cancel()" + EndOfLine
		  's= s + EndOfLine
		  '
		  'setCodeToCallThisObjectForName("Stop", "Stop" + GetCodeName + "()")
		  '
		  'PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		  '
		  ''dim s as string
		  ''
		  ''s = "def Start" + GetCodeName + "():" + EndOfLine
		  ''
		  '''s = s + " Pass" + EndOfLine
		  '''s = s + " #" + GetCodeName + "Go" + EndOfLine
		  ''s = s + " if " + modVariables.VariableObjectFromName(MathVariable1).ISCPythonName + " > 0:" + EndOfLine
		  ''s = s + "  gobject.timeout_add_seconds(" + modVariables.VariableObjectFromName(MathVariable1).ISCPythonName + ", " + GetCodeName + ")"
		  ''
		  ''s= s + EndOfLine
		  ''
		  ''setCodeToCallThisObjectForName("Start", "Start" + GetCodeName + "()")
		  ''
		  ''PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		  ''
		  ''
		  ''s = "def Stop" + GetCodeName + "():" + EndOfLine
		  ''
		  '''s = s + " Pass" + EndOfLine
		  ''s = s + " #" + GetCodeName + "Go" + EndOfLine
		  ''s = s + " if " + modVariables.VariableObjectFromName(MathVariable1).ISCPythonName + " < 0:" + EndOfLine
		  ''s = s + "  gobject.timeout_add_seconds(" + modVariables.VariableObjectFromName(MathVariable1).ISCPythonName + ", " + GetCodeName + ")"
		  ''
		  ''s= s + EndOfLine
		  ''
		  ''setCodeToCallThisObjectForName("Stop", "Stop" + GetCodeName + "()")
		  ''
		  ''PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		  ''
		  ''
		  ''s = "def Go" + GetCodeName + "():" + EndOfLine
		  ''
		  '''s = s + " Pass" + EndOfLine
		  ''s = s + " #" + GetCodeName + "Go" + EndOfLine
		  ''s = s + " if " + modVariables.VariableObjectFromName(MathVariable1).ISCPythonName + " < 0:" + EndOfLine
		  ''s = s + "  gobject.timeout_add_seconds(" + modVariables.VariableObjectFromName(MathVariable1).ISCPythonName + ", " + GetCodeName + ")"
		  ''
		  ''s= s + EndOfLine
		  ''
		  ''setCodeToCallThisObjectForName("Go", "Go" + GetCodeName + "()")
		  ''
		  ''PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		  ''
		  ''
		  '''s = "if " + modVariables.VariableObjectFromName(MathVariable1).ISCPythonName + " < 0:" + EndOfLine
		  '''s = s + " gobject.timeout_add_seconds(" + modVariables.VariableObjectFromName(MathVariable1).ISCPythonName + ", " + GetCodeName + ")"
		  ''
		  '''PythonInsertCodeAtMarker(s, "#EndOfStatements")
		  ''
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  me.CodeNameBase = "iscTimer"
		  me.BGColor =  frmProject.kcolLogic
		  me.DisplayName = "Timer"
		  me.DisplayCategory = "Logic"
		  me.Title = "Timer"
		  me.Width = 90
		  
		  'me.ObjectItems.Append "Start"
		  'me.ObjectShowInput.Append True
		  'me.ObjectShowOutput.Append False
		  '
		  'me.ObjectItems.Append "Stop"
		  'me.ObjectShowInput.Append true
		  'me.ObjectShowOutput.Append false
		  
		  me.ObjectItems.Append "Go"
		  me.ObjectShowInput.Append false
		  me.ObjectShowOutput.Append true
		  
		  RequireMathVariable1 = true
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="BGColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="color"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CodeNameBase"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomMessage"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DBObjectType"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayCategory"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayName"
			Group="Behavior"
			Type="String"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable1"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable2"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable3"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable4"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable5"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable6"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageFromVariable"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mLocalUniqueID"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OriginVariable"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable1"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable2"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable3"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable4"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable5"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable6"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMessageFromVariable"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireOriginVariable"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequirevarControlName"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequirevarWindowName"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UniqueID"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseVariableForMessage"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="varControlName"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="varWindowName"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
