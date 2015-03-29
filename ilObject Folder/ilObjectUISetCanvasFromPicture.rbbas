#tag Class
Protected Class ilObjectUISetCanvasFromPicture
Inherits ilObjectBase
	#tag Event
		Sub GenerateAndroidCode(theOrigin as string)
		  dim s as string
		  dim tempILUI as ilUIObject
		  
		  s = "public void " + GetCodeName + "()" + EndOfLine
		  
		  s = s + "{" + EndOfLine
		  
		  tempILUI = modCodeGenerator.GetilUIObjectFromNameOnWindow(varControlName, varWindowName)
		  
		  if tempILUI <> nil then
		    
		    s = s + tempILUI.ISCClassLocalAndroidName + ".setImageResource(R.drawable." 
		    s = s + modVariables.getProjectImageFromName(MessageFromVariable).Name + ");" + EndOfLine
		    
		  end if
		  
		  s = s + "//" + GetCodeName + "Done" + EndOfLine
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  setCodeToCallThisObjectForName("Set", GetCodeName + "();")
		  
		  AndroidInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateFlexWebCode(theOrigin as string)
		  dim s as string
		  dim tempILUI as ilUIObject
		  
		  tempILUI = modCodeGenerator.GetilUIObjectFromNameOnWindow(varControlName, varWindowName)
		  
		  if tempILUI <> nil then
		    
		    s = "private function " + GetCodeName + "():void" + EndOfLine
		    
		    s = s + "{" + EndOfLine
		    
		    s = s + "var myBitmap:BitmapData = new " + modVariables.getProjectImageFromName(MessageFromVariable).FlexEmbedName + _
		    "().bitmapData;" + EndOfLine
		    s = s + tempILUI.ISCClassLocalFlexName + ".graphics.clear();" + EndOfLine
		    s = s + tempILUI.ISCClassLocalFlexName + ".graphics.beginBitmapFill(myBitmap);" + EndOfLine
		    s = s + tempILUI.ISCClassLocalFlexName + ".graphics.drawRect(0, 0,myBitmap.width, myBitmap.height);" + EndOfLine
		    s = s + tempILUI.ISCClassLocalFlexName + ".graphics.endFill();" + EndOfLine
		    s = s + "//" + GetCodeName + "Done" + EndOfLine
		    
		    s = s + "}" + EndOfLine + EndOfLine
		    
		    setCodeToCallThisObjectForName("Set", GetCodeName + "();")
		    
		    FlexWebInsertCodeAtMarker(s, "//EndOfFunctions")
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateiOSCode(theOrigin as string)
		  dim s as string
		  dim tempILUI as ilUIObject
		  
		  tempILUI = modCodeGenerator.GetilUIObjectFromNameOnWindow(varControlName, varWindowName)
		  
		  if tempILUI <> nil then
		    
		    s = s + "- (void) " + GetCodeName + " {" + EndOfLine
		    
		    //myUIImageView.image = [UIImage imageNamed:@"myPhoto.png"];
		    
		    's = s + tempILUI.ISCClassLocalFlexName + ".image = [UIImage imageNamed:@""" + _
		    'modVariables.getProjectImageFromName(MessageFromVariable).ActualFileName + """];" + EndOfLine
		    
		    
		    s = s + "[" + tempILUI.ISCClassLocalFlexName + "  setImage:[UIImage imageNamed:@""" + _
		    modVariables.getProjectImageFromName(MessageFromVariable).ActualFileName + _
		    """] forState:UIControlStateNormal];" + EndOfLine
		    
		    //[iscWindow1Button2 setImage:[UIImage imageNamed:@"n900dott.JPG.jpg"] forState:UIControlStateNormal];
		    
		    
		    s = s + "//" + GetCodeName + "Done" + EndOfLine
		    
		    s = s + "}" + EndOfLine + EndOfLine
		    
		    setCodeToCallThisObjectForName("Set", "[self " + GetCodeName + "];")
		    
		    iOSMInsertCodeAtMarker(s, "//EndOfFunctions")
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateJavaScriptWebCode(theOrigin as string)
		  dim s as string
		  dim tempILUI as ilUIObject
		  
		  tempILUI = modCodeGenerator.GetilUIObjectFromNameOnWindow(varControlName, varWindowName)
		  
		  if tempILUI <> nil then
		    
		    s = "function " + GetCodeName + "()" + EndOfLine
		    
		    s = s + "{" + EndOfLine
		    
		    s = s + "var canvas = document.getElementById(""" + tempILUI.ISCClassLocalFlexName + """);" + EndOfLine
		    s = s + "var context = canvas.getContext(""2d"");" + EndOfLine
		    s = s + "var cat = new Image();" + EndOfLine
		    s = s + "cat.src = ""ISCimages/" + modVariables.getProjectImageFromName(MessageFromVariable).ActualFileName + """;" + EndOfLine
		    s = s + "cat.onload = function() {" + EndOfLine
		    s = s + "context.drawImage(cat, 0, 0);" + EndOfLine
		    s =s + "};" + EndOfLine
		    
		    s = s + "//" + GetCodeName + "Done" + EndOfLine
		    
		    s = s + "}" + EndOfLine + EndOfLine
		    
		    setCodeToCallThisObjectForName("Set", GetCodeName + "();")
		    
		    HTML5InsertCodeAtMarker(s, "//EndOfFunctions")
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub GeneratePythonDesktopCode(theOrigin as string)
		  dim s as string
		  dim tempILUI as ilUIObject
		  
		  tempILUI = modCodeGenerator.GetilUIObjectFromNameOnWindow(varControlName, varWindowName)
		  
		  if tempILUI <> nil then
		    
		    s = "def " + GetCodeName + "():" + EndOfLine
		    
		    //os.getcwd()
		    
		    s = s + " " + tempILUI.ISCPythonName + ".set_from_file(os.path.dirname(sys.argv[0]) + ""/ISCimages/" + modVariables.getProjectImageFromName(MessageFromVariable).ActualFileName + """)"
		    
		    s = s + " #" + GetCodeName + "Done" + EndOfLine + EndOfLine
		    
		    setCodeToCallThisObjectForName("Set", GetCodeName + "()")
		    
		    PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		    
		   end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  me.CodeNameBase = "iscSetCanvasPicture"
		  me.BGColor =  frmProject.kcolUserInterface
		  me.DisplayName = "Set Canvas Picture"
		  me.DisplayCategory = "User Interface"
		  me.Title = "Set Canvas Picture"
		  me.Width = 90
		  
		  me.ObjectItems.Append "Set"
		  me.ObjectShowInput.Append true
		  me.ObjectShowOutput.Append false
		  
		  me.ObjectItems.Append "Done"
		  me.ObjectShowInput.Append false
		  me.ObjectShowOutput.Append true
		  
		  
		  RequirevarControlName = true
		  RequirevarWindowName = true
		  RequireMessageFromVariable = true
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
