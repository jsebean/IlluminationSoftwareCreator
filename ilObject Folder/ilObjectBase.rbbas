#tag Class
Protected Class ilObjectBase
	#tag Method, Flags = &h0
		Sub AndroidInsertCodeAtMarker(theCode as string, theMarker as string)
		  
		  
		  'theCode = theCode + EndOfLine + PythonStringOfSpacesPriorToMarker(theMarker) + theMarker
		  
		  theCode = theCode + EndOfLine + theMarker
		  
		  modCodeGenerator.AndroidMainJavaCode = modCodeGenerator.AndroidMainJavaCode.Replace(theMarker, theCode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CallGenerateAndroidCode()
		  GenerateAndroidCode("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CallGenerateFlexWebCode()
		  GenerateFlexWebCode("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CallGenerateHaikuDesktopCode()
		  GenerateHaikuDesktopCode("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CallGenerateiOSCode()
		  GenerateiOSCode("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CallGenerateJavascriptWebCode()
		  GenerateJavaScriptWebCode("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CallGeneratePythonDesktopCode()
		  GeneratePythonDesktopCode("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CallGeneratePythonDesktopCodePass2()
		  // GetCodeName + THIS CURRENT Object Text = Where the output call is inserted
		  // theLinks(1).CodeToCallThisObject = What gets called
		  
		  
		  
		  for each content as contentObject in parent.contents
		    MsgBox str(parent.contents.Ubound)
		    if content.outputs.Ubound >= 0 then
		      
		      for each link as contentObject in content.outputs
		        MsgBox "called"
		        HelperGeneratePythonDesktopCodePhase2(content, link)
		        
		      next
		      
		    end if
		    
		  next
		  
		  
		  '
		  'dim i as integer
		  'dim theCodeToCall as string
		  'dim theWhereCodeIsPut as string
		  '
		  'if theLinks.Ubound > -1 then
		  '
		  'for i = 0 to theLinks.Ubound
		  '
		  ''theWhereCodeIsPut = "#" + GetCodeName + TextObject(theLinks(i).input).text
		  ''theCodeToCall = theLinks(i).CodeToCallThisObject
		  '
		  'PythonReplaceCodeAtMarker(theCodeToCall, theWhereCodeIsPut)
		  '
		  'next
		  '
		  'end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  frmProject.UniqueIDCount = frmProject.UniqueIDCount + 1
		  UniqueID = Str(frmProject.UniqueIDCount)
		  UseVariableForMessage = false
		  modFile.fileisDirty = true
		  
		  RequireMathVariable1 = False
		  RequireMathVariable2 = False
		  RequireMessageFromVariable = False
		  RequireOriginVariable = False
		  RequirevarControlName = False
		  RequirevarWindowName = False
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FlexWebInsertCodeAtMarker(theCode as string, theMarker as string)
		  
		  
		  'theCode = theCode + EndOfLine + PythonStringOfSpacesPriorToMarker(theMarker) + theMarker
		  
		  theCode = theCode + EndOfLine + theMarker
		  
		  modCodeGenerator.FlexWebCode = modCodeGenerator.FlexWebCode.Replace(theMarker, theCode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameFromName(name as String) As contentFrame
		  dim temp as contentObject
		  
		  temp = LinkFromOriginContentObjectName(name)
		  
		  if temp <> nil then
		    Return temp.parent
		  else
		    Return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetClassNameDefinition() As string
		  Return GetCodeName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetClassNameVariable() As string
		  Return "this" + GetCodeName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCodeName() As string
		  dim s as string
		  s = CodeNameBase + UniqueID
		  Return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCurrentObjectFromName(theName as String) As contentObject
		  for each content as contentObject in Parent.contents
		    if Lowercase(theName) = Lowercase(TextObject(content).text) then
		      Return content
		    end if
		  next
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HelperGenerateAndroidCodePhase2(theSourceObject as contentObject, theDestinationObject as contentObject)
		  dim sCommentTag as string
		  dim sReplacementCode as string
		  
		  sCommentTag = "//" + ilObjectBase(theSourceObject.parent.tag).GetCodeName + TextObject(theSourceObject).text
		  
		  sReplacementCode = theDestinationObject.CodeToCallThisObject
		  
		  AndroidInsertCodeAtMarker(sReplacementCode,sCommentTag)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HelperGenerateFlexWebCodePhase2(theSourceObject as contentObject, theDestinationObject as contentObject)
		  dim sCommentTag as string
		  dim sReplacementCode as string
		  
		  sCommentTag = "//" + ilObjectBase(theSourceObject.parent.tag).GetCodeName + TextObject(theSourceObject).text
		  
		  sReplacementCode = theDestinationObject.CodeToCallThisObject
		  
		  FlexWebInsertCodeAtMarker(sReplacementCode,sCommentTag)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HelperGenerateHaikuDesktopCodePhase2(theSourceObject as contentObject, theDestinationObject as contentObject)
		  dim sCommentTag as string
		  dim sReplacementCode as string
		  
		  sCommentTag = "//" + ilObjectBase(theSourceObject.parent.tag).GetCodeName + TextObject(theSourceObject).text
		  
		  sReplacementCode = theDestinationObject.CodeToCallThisObject
		  
		  FlexWebInsertCodeAtMarker(sReplacementCode,sCommentTag)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HelperGenerateiOSCodePhase2(theSourceObject as contentObject, theDestinationObject as contentObject)
		  dim sCommentTag as string
		  dim sReplacementCode as string
		  
		  sCommentTag = "//" + ilObjectBase(theSourceObject.parent.tag).GetCodeName + TextObject(theSourceObject).text
		  
		  sReplacementCode = theDestinationObject.CodeToCallThisObject
		  
		  iOSMInsertCodeAtMarker(sReplacementCode,sCommentTag)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HelperGenerateJavascriptWebCodePhase2(theSourceObject as contentObject, theDestinationObject as contentObject)
		  dim sCommentTag as string
		  dim sReplacementCode as string
		  
		  sCommentTag = "//" + ilObjectBase(theSourceObject.parent.tag).GetCodeName + TextObject(theSourceObject).text
		  
		  sReplacementCode = theDestinationObject.CodeToCallThisObject
		  
		  HTML5InsertCodeAtMarker(sReplacementCode,sCommentTag)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HelperGeneratePythonDesktopCodePhase2(theSourceObject as contentObject, theDestinationObject as contentObject)
		  dim sCommentTag as string
		  dim sReplacementCode as string
		  
		  sCommentTag = "#" + ilObjectBase(theSourceObject.parent.tag).GetCodeName + TextObject(theSourceObject).text
		  
		  sReplacementCode = theDestinationObject.CodeToCallThisObject
		  
		  PythonInsertCodeAtMarker(sReplacementCode,sCommentTag)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HTML5InsertCodeAtMarker(theCode as string, theMarker as string)
		  
		  
		  'theCode = theCode + EndOfLine + PythonStringOfSpacesPriorToMarker(theMarker) + theMarker
		  
		  theCode = theCode + EndOfLine + theMarker
		  
		  modCodeGenerator.WebJavaScriptCode = modCodeGenerator.WebJavaScriptCode.Replace(theMarker, theCode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ilObjectFromName(name as String) As ilObjectBase
		  dim temp as contentFrame
		  
		  temp = FrameFromName(name)
		  
		  if temp <> nil then
		    Return temp.tag
		  else
		    Return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub iOSHInsertCodeAtMarker(theCode as string, theMarker as string)
		  theCode = theCode + EndOfLine + theMarker
		  
		  modCodeGenerator.iosAppDelegateHCode = modCodeGenerator.iosAppDelegateHCode.Replace(theMarker, theCode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub iOSMInsertCodeAtMarker(theCode as string, theMarker as string)
		  
		  
		  'theCode = theCode + EndOfLine + PythonStringOfSpacesPriorToMarker(theMarker) + theMarker
		  
		  theCode = theCode + EndOfLine + theMarker
		  
		  modCodeGenerator.iosAppDelegateMCode = modCodeGenerator.iosAppDelegateMCode.Replace(theMarker, theCode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LinkFromOriginContentObjectName(name as String) As contentObject
		  dim i as integer
		  dim s as string
		  
		  if theLinks.Ubound >= 0 then
		    
		    for i = 0 to theLinks.Ubound
		      's = lowercase(TextObject(theLinks(i).input).text)
		      
		      if s = Lowercase(name) then
		        
		        Return theLinks(i)
		        
		      end if
		      
		    next
		    
		  end if
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LinkFromTargetContentObjectName(name as String) As contentObject
		  dim i as integer
		  
		  if theLinks.Ubound >= 0 then
		    
		    for i = 0 to theLinks.Ubound
		      
		      if lowercase(TextObject(theLinks(i)).text) = Lowercase(name) then
		        
		        Return theLinks(i)
		        
		      end if
		      
		    next
		    
		  end if
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrepareForCodeGeneration()
		  'resetTheLinks
		  '
		  'for each content as contentObject in Parent.contents
		  '
		  'if content.outputs.Ubound >= 0 then //There are outputs to process
		  '
		  'for each link as contentObject in content.outputs
		  '
		  'theLinks.Append link
		  '
		  'next
		  '
		  'end if
		  '
		  'next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PythonEscapeString(theString as string) As string
		  theString = theString.ReplaceAll("""", "\""")
		  theString = theString.ReplaceAll("'", "\'")
		  Return theString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PythonInsertCodeAtMarker(theCode as string, theMarker as string)
		  
		  
		  theCode = theCode + EndOfLine + PythonStringOfSpacesPriorToMarker(theMarker) + theMarker
		  
		  modCodeGenerator.PythonDesktopCode = modCodeGenerator.PythonDesktopCode.Replace(theMarker, theCode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PythonReplaceCodeAtMarker(theCode as string, theMarker as string)
		  theCode = theCode + EndOfLine
		  
		  modCodeGenerator.PythonDesktopCode = modCodeGenerator.PythonDesktopCode.Replace(theMarker, theCode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PythonStringOfSpacesPriorToMarker(theMarker as string) As string
		  dim i as integer
		  dim spaceCount as integer
		  dim markerAt as integer
		  dim s as string
		  
		  s = NthField(modCodeGenerator.PythonDesktopCode, theMarker, 1)
		  
		  spaceCount = CountFields(s, EndOfLine)
		  
		  s = NthField(s,EndOfLine, spaceCount)
		  
		  Return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub resetTheLinks()
		  dim i as integer
		  
		  if theLinks.Ubound >= 0 then
		    
		    for i = theLinks.Ubound DownTo 0
		      theLinks.Remove(i)
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCodeToCallThisObjectForName(forName as string, withCodeToCall as string)
		  GetCurrentObjectFromName(forName).CodeToCallThisObject = withCodeToCall
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event GenerateAndroidCode(theOrigin as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GenerateFlexWebCode(theOrigin as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GenerateHaikuDesktopCode(theOrigin as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GenerateiOSCode(theOrigin as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GenerateJavaScriptWebCode(theOrigin as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GeneratePythonDesktopCode(theOrigin as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GeneratePythonDesktopCodePhase2(theSourceObject as contentObject, theDestinationObject as contentObject)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GeneratePythonMaemoCode(theOrigin as string)
	#tag EndHook


	#tag Property, Flags = &h0
		BGColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		CodeNameBase As string
	#tag EndProperty

	#tag Property, Flags = &h0
		CustomMessage As string
	#tag EndProperty

	#tag Property, Flags = &h0
		DBObjectType As string
	#tag EndProperty

	#tag Property, Flags = &h0
		DisplayCategory As string
	#tag EndProperty

	#tag Property, Flags = &h0
		DisplayName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MathVariable1 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MathVariable2 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MathVariable3 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MathVariable4 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MathVariable5 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MathVariable6 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MessageFromVariable As string
	#tag EndProperty

	#tag Property, Flags = &h0
		mLocalUniqueID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ObjectItems() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ObjectShowInput() As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ObjectShowOutput() As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		OriginVariable As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Parent As ContentFrame
	#tag EndProperty

	#tag Property, Flags = &h0
		RequireMathVariable1 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		RequireMathVariable2 As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		RequireMathVariable3 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		RequireMathVariable4 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		RequireMathVariable5 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		RequireMathVariable6 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		RequireMessageFromVariable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		RequireOriginVariable As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		RequirevarControlName As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		RequirevarWindowName As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		theLinks() As contentObject
	#tag EndProperty

	#tag Property, Flags = &h0
		theUIObjects() As ilUIObject
	#tag EndProperty

	#tag Property, Flags = &h0
		theWindowObject As ilUIObject
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As string
	#tag EndProperty

	#tag Property, Flags = &h0
		UniqueID As string
	#tag EndProperty

	#tag Property, Flags = &h0
		UseVariableForMessage As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		varControlName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		varWindowName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Width As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BGColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CodeNameBase"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomMessage"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DBObjectType"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayCategory"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable2"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable3"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable4"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable5"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable6"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageFromVariable"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mLocalUniqueID"
			Group="Behavior"
			Type="Integer"
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
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable1"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable2"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable3"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable4"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable5"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable6"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMessageFromVariable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireOriginVariable"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequirevarControlName"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequirevarWindowName"
			Group="Behavior"
			Type="boolean"
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
			EditorType="MultiLineEditor"
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
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseVariableForMessage"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="varControlName"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="varWindowName"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
