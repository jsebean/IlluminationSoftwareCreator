#tag Class
Protected Class ilObjectDictionaryAdd
Inherits ilObjectBase
	#tag Event
		Sub GenerateAndroidCode(theOrigin as string)
		  dim s as string
		  
		  s = "public void " + GetCodeName + "()" + EndOfLine
		  
		  s = s + "{" + EndOfLine
		  
		  s = s + modVariables.VariableObjectFromName(OriginVariable).ISCClassLocalAndroidName + ".put(" + _
		  modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalAndroidName + ", " + _
		  modVariables.VariableObjectFromName(MathVariable2).ISCClassLocalAndroidName + ");" + EndOfLine
		  
		  s = s + "//" + GetCodeName + "Done" + EndOfLine
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  setCodeToCallThisObjectForName("Add", GetCodeName + "();")
		  
		  AndroidInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		  
		  'map.put("uid", uid);
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateFlexWebCode(theOrigin as string)
		  dim s as string
		  
		  s = "private function " + GetCodeName + "():void" + EndOfLine
		  
		  s = s + "{" + EndOfLine
		  
		  s = s + modVariables.VariableObjectFromName(OriginVariable).ISCClassLocalFlexName + "[" + _
		  modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalFlexName + "] = " + _
		  modVariables.VariableObjectFromName(MathVariable2).ISCClassLocalFlexName + ";" + EndOfLine
		  
		  s = s + "//" + GetCodeName + "Done" + EndOfLine
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  setCodeToCallThisObjectForName("Add", GetCodeName + "();")
		  
		  FlexWebInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		  
		  's = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + ":Object = new Object();" + EndOfLine
		  'monitorInfo["aspect ratio"] = "16:10"; // bad form, do not use spaces
		  'monitorInfo.colors = "16.7 million";
		  'trace(monitorInfo["aspect ratio"]
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateiOSCode(theOrigin as string)
		  dim s as string
		  
		  s = s + "- (void) " + GetCodeName + " {" + EndOfLine
		  
		  s = s + "[" + modVariables.VariableObjectFromName(OriginVariable).ISCClassLocalAndroidName + " setObject:" + _
		  modVariables.VariableObjectFromName(MathVariable2).ISCClassLocalAndroidName + " forKey:" + _
		  modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalAndroidName + "];" + EndOfLine
		  
		  s = s + "//" + GetCodeName + "Done" + EndOfLine
		  s = s + "" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  setCodeToCallThisObjectForName("Add", "[self " + GetCodeName + "];")
		  
		  iOSMInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		  
		  's = s + "extern NSMutableDictionary *" + modVariables.projectVariables(i).ISCiOSName + ";" + EndOfLine
		  '[dict setObject:@"John" forKey:@"Firstname"];
		  'NSLog([dictionary objectForKey:@"B"]);
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateJavaScriptWebCode(theOrigin as string)
		  dim s as string
		  
		  s = "function " + GetCodeName + "()" + EndOfLine
		  
		  s = s + "{" + EndOfLine
		  
		  s = s + modVariables.VariableObjectFromName(OriginVariable).ISCClassLocalFlexName + "[" + _
		  modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalFlexName + "] = " + _
		  modVariables.VariableObjectFromName(MathVariable2).ISCClassLocalFlexName + ";" + EndOfLine
		  
		  s = s + "//" + GetCodeName + "Done" + EndOfLine
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  setCodeToCallThisObjectForName("Add", GetCodeName + "();")
		  
		  HTML5InsertCodeAtMarker(s, "//EndOfFunctions")
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GeneratePythonDesktopCode(theOrigin as string)
		  dim s as string
		  
		  s = "def " + GetCodeName + "():" + EndOfLine
		  
		  s = s + " " + modVariables.VariableObjectFromName(OriginVariable).ISCPythonName + "[" + _
		  modVariables.VariableObjectFromName(MathVariable1).ISCPythonName + "] = " + _
		  modVariables.VariableObjectFromName(MathVariable2).ISCPythonName + EndOfLine
		  
		  s = s + " #" + GetCodeName + "Done" + EndOfLine + EndOfLine
		  
		  setCodeToCallThisObjectForName("Add", GetCodeName + "()")
		  
		  PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		  
		  's = s + " " + modVariables.projectVariables(i).ISCClassLocalPythonName + " = {}" + EndOfLine
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  me.CodeNameBase = "iscDictSet"
		  me.BGColor =  frmProject.kcolDictionary
		  me.DisplayName = "Set In Dictionary"
		  me.DisplayCategory = "Dictionaries"
		  me.Title = "Set In Dictionary"
		  me.Width = 90
		  
		  me.ObjectItems.Append "Add"
		  me.ObjectShowInput.Append true
		  me.ObjectShowOutput.Append false
		  
		  me.ObjectItems.Append "Done"
		  me.ObjectShowInput.Append false
		  me.ObjectShowOutput.Append true
		  
		  RequireOriginVariable = true
		  RequireMathVariable1 = true
		  RequireMathVariable2 = true
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
