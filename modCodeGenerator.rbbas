#tag Module
Protected Module modCodeGenerator
	#tag Method, Flags = &h0
		Sub BeginCodeGeneration(forTarget as integer)
		  MoveAppToTopFrame
		  
		  if TargetInProcess = app.kpPythonDesktop then
		    BeginCodeGenerationPythonDesktop(forTarget)
		  end if
		  
		  if TargetInProcess = app.kpPythonMaemo then
		    BeginCodeGenerationPythonDesktop(forTarget)
		  end if
		  
		  if TargetInProcess = app.kpPHPJavascriptWeb then
		    BeginCodeGenerationJavascript(forTarget)
		  end if
		  
		  if TargetInProcess = app.kpFlexWeb then
		    BeginCodeGenerationFlexWeb(forTarget)
		  end if
		  
		  if TargetInProcess = app.kpAndroid then
		    BeginCodeGenerationAndroid(forTarget)
		  end if
		  
		  if TargetInProcess = app.kpiOSiPhone then
		    BeginCodeGenerationiOS(forTarget)
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginCodeGenerationAndroid(forTarget as integer)
		  dim i as integer
		  dim j as integer
		  
		  // Clear the code strings
		  AndroidMainJavaCode = ""
		  
		  // Pass 1
		  // Loop through all the frames, generating the code for each
		  
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    ilObjectBase(frame.tag).PrepareForCodeGeneration()
		    'MsgBox ilObjectBase(frame.tag).DisplayName
		    // Generate the code
		    ilObjectBase(frame.tag).CallGenerateAndroidCode
		    
		  next
		  
		  // Pass 2
		  // Loop through all the links on all the frames, generating the calling code for each
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    for each content as contentObject in frame.contents
		      
		      if content.outputs.Ubound >= 0 then
		        
		        for each link as contentObject in content.outputs
		          
		          
		          ilObjectBase(frmProject.chartProject.frames(0).tag).HelperGenerateAndroidCodePhase2(content, link)
		          
		        next
		        
		      end if
		      
		    next
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginCodeGenerationFlexWeb(forTarget as integer)
		  dim i as integer
		  dim j as integer
		  
		  // Clear the code strings
		  FlexWebCode = ""
		  
		  // Pass 1
		  // Loop through all the frames, generating the code for each
		  
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    ilObjectBase(frame.tag).PrepareForCodeGeneration()
		    'MsgBox ilObjectBase(frame.tag).DisplayName
		    // Generate the code
		    ilObjectBase(frame.tag).CallGenerateFlexWebCode
		    
		  next
		  
		  // Pass 2
		  // Loop through all the links on all the frames, generating the calling code for each
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    for each content as contentObject in frame.contents
		      
		      if content.outputs.Ubound >= 0 then
		        
		        for each link as contentObject in content.outputs
		          
		          
		          ilObjectBase(frmProject.chartProject.frames(0).tag).HelperGenerateFlexWebCodePhase2(content, link)
		          
		        next
		        
		      end if
		      
		    next
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginCodeGenerationiOS(forTarget as integer)
		  dim i as integer
		  dim j as integer
		  
		  // Clear the code strings
		  iosAppDelegateMCode = ""
		  iosAppDelegateHCode = ""
		  iosMainCode = ""
		  
		  // Pass 1
		  // Loop through all the frames, generating the code for each
		  
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    ilObjectBase(frame.tag).PrepareForCodeGeneration()
		    ilObjectBase(frame.tag).CallGenerateiOSCode
		    
		  next
		  
		  // Pass 2
		  // Loop through all the links on all the frames, generating the calling code for each
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    for each content as contentObject in frame.contents
		      
		      if content.outputs.Ubound >= 0 then
		        
		        for each link as contentObject in content.outputs
		          
		          
		          ilObjectBase(frmProject.chartProject.frames(0).tag).HelperGenerateiOSCodePhase2(content, link)
		          
		        next
		        
		      end if
		      
		    next
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginCodeGenerationJavascript(forTarget as integer)
		  dim i as integer
		  dim j as integer
		  
		  // Clear the code strings
		  WebJavaScriptCode = ""
		  
		  // Pass 1
		  // Loop through all the frames, generating the code for each
		  
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    ilObjectBase(frame.tag).PrepareForCodeGeneration()
		    'MsgBox ilObjectBase(frame.tag).DisplayName
		    // Generate the code
		    ilObjectBase(frame.tag).CallGenerateJavascriptWebCode
		    
		  next
		  
		  // Pass 2
		  // Loop through all the links on all the frames, generating the calling code for each
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    for each content as contentObject in frame.contents
		      
		      if content.outputs.Ubound >= 0 then
		        
		        for each link as contentObject in content.outputs
		          
		          
		          ilObjectBase(frmProject.chartProject.frames(0).tag).HelperGenerateJavascriptWebCodePhase2(content, link)
		          
		        next
		        
		      end if
		      
		    next
		    
		  next
		  
		  
		  // Pass 3
		  // Generate the Portal Blocks
		  dim tempOrigin as string
		  
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    if frame.tag isa ilObjectPortalDeparture then
		      
		      for each content as contentObject in frame.contents
		        
		        tempOrigin = ilObjectPortalDeparture(content.parent.tag).OriginVariable
		        'MsgBox tempOrigin
		        'ilObjectBase(frmProject.chartProject.frames(0).tag).HelperGenerateJavascriptWebCodePhase2(content, GetDestinationPortalCOForName(tempOrigin))
		        'MsgBox GetDestinationPortalCOForName(tempOrigin).parent.title
		      next
		      
		    end if
		    
		    
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginCodeGenerationPythonDesktop(forTarget as integer)
		  dim i as integer
		  dim j as integer
		  
		  // Clear the code strings
		  PythonDesktopCode = ""
		  
		  // Pass 1
		  // Loop through all the frames, generating the code for each
		  
		  
		  for each frame as contentFrame in frmProject.chartProject.frames
		    ilObjectBase(frame.tag).PrepareForCodeGeneration()
		    // Generate the code
		    ilObjectBase(frame.tag).CallGeneratePythonDesktopCode
		  next
		  
		  // Pass 2
		  // Loop through all the links on all the frames, generating the calling code for each
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    for each content as contentObject in frame.contents
		      
		      if content.outputs.Ubound >= 0 then
		        
		        for each link as contentObject in content.outputs
		          
		          
		          ilObjectBase(frmProject.chartProject.frames(0).tag).HelperGeneratePythonDesktopCodePhase2(content, link)
		          
		        next
		        
		      end if
		      
		    next
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDestinationPortalCOForName(theName as string) As contentobject
		  dim i as integer
		  
		  // Loop through all frames, looking for ilObjectPortalDestination
		  
		  for i = 0 to frmProject.chartProject.frames.Ubound
		    
		    if frmProject.chartProject.frames(i).tag isa ilObjectPortalDestination then
		      
		      if ilObjectPortalDestination(frmProject.chartProject.frames(i).tag).OriginVariable = theName then
		        
		        'MsgBox frmProject.chartProject.frames(i).contents(0).inputs(0)
		        Return ContentObject(frmProject.chartProject.frames(i).contents(0)).outputs(0)
		        
		      end if
		      
		    end if
		    
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getilObjectWindowFromName(theName as string) As ilObjectWindow
		  dim i as integer
		  
		  // Loop through all frames, looking for ilObjectWindow
		  
		  for i = 0 to frmProject.chartProject.frames.Ubound
		    
		    if frmProject.chartProject.frames(i).tag isa ilObjectWindow then
		      if Lowercase(ilObjectWindow(frmProject.chartProject.frames(i).tag).theWindowObject.Name) = Lowercase(theName) then
		        Return ilObjectWindow(frmProject.chartProject.frames(i).tag)
		      end if
		    end if
		    
		  next
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetilUIObjectFromNameOnWindow(controlName as string, windowName as string) As iluiObject
		  dim tempIL as ilObjectWindow
		  dim i as integer
		  
		  tempIL = getilObjectWindowFromName(windowName)
		  
		  if tempIL <> nil then
		    
		    if tempIL.theUIObjects.Ubound > -1 then
		      for i = 0 to tempIL.theUIObjects.Ubound
		        'MsgBox controlName + " / " + tempIL.theUIObjects(i).Name
		        if Lowercase(tempIL.theUIObjects(i).Name) = Lowercase(controlName) then
		          Return tempIL.theUIObjects(i)
		        end if
		        
		      next
		    end if
		    
		  end if
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveAppToTopFrame()
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    for each content as contentObject in frame.contents
		      
		      if content.tag isa ilObjectApp then
		        ilObjectApp(content.tag).UniqueID = "1"
		      end if
		      
		    next
		    
		  next
		  
		  
		  
		  dim frame as ContentFrame
		  dim tempframe as contentframe
		  dim objectIndex as integer
		  
		  // find the selected object
		  for objectIndex = frmProject.chartProject.frames.Ubound DownTo 0
		    frame = frmProject.chartProject.frames(objectIndex)
		    if frame.tag isa ilObjectApp then
		      tempframe = contentFrame(frame)
		      frmProject.chartProject.frames.Remove(objectIndex)
		      frmProject.chartProject.frames.Insert(0,tempframe)
		      exit for
		    end if
		    
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AndroidLayoutFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		AndroidMainJavaCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		BuildingForiPad As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FlexWebCode As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim s as string
			  
			  s = "package components{" + EndOfLine
			  s = s + "import flash.events.Event;" + EndOfLine
			  s = s + "import flash.events.MouseEvent;" + EndOfLine
			  
			  s = s + "import mx.containers.Panel;" + EndOfLine
			  s = s + "import mx.controls.LinkButton;" + EndOfLine
			  
			  s = s + "public class DraggablePanel extends Panel{" + EndOfLine
			  s = s + "private var _closer:LinkButton=new LinkButton();" + EndOfLine
			  s = s + "[Embed(source=""assets/img/close.png"")] [Bindable] public var closePng:Class;" + EndOfLine
			  
			  s = s + "public function DraggablePanel(){" + EndOfLine
			  s = s + "super();" + EndOfLine
			  s = s + "_closer.addEventListener(MouseEvent.CLICK, closeMe);" + EndOfLine
			  s = s + "_closer.setStyle('icon', closePng);" + EndOfLine
			  s = s + "_closer.useHandCursor = false;" + EndOfLine
			  s = s + "}" + EndOfLine
			  
			  s = s + "override protected function createChildren():void{" + EndOfLine
			  s = s + "super.createChildren();" + EndOfLine
			  s = s + "super.titleBar.addEventListener(MouseEvent.MOUSE_DOWN,handleDown);" + EndOfLine
			  s = s + "super.titleBar.addEventListener(MouseEvent.MOUSE_UP,handleUp);" + EndOfLine
			  s = s + "super.titleBar.addChild(_closer);" + EndOfLine
			  s = s + "}" + EndOfLine
			  s = s + "override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{" + EndOfLine
			  s = s + "super.updateDisplayList(unscaledWidth,unscaledHeight);" + EndOfLine
			  s = s + "_closer.width = 16;" + EndOfLine
			  s = s + "_closer.height = 16;" + EndOfLine
			  s = s + "_closer.x = super.titleBar.width - _closer.width - 8;" + EndOfLine
			  s = s + "_closer.y = 8;" + EndOfLine
			  s = s + "}" + EndOfLine
			  
			  s = s + "private function handleDown(e:Event):void{" + EndOfLine
			  s = s + "this.startDrag();" + EndOfLine
			  s = s + "}" + EndOfLine
			  s = s + "private function handleUp(e:Event):void{" + EndOfLine
			  s = s + "this.stopDrag();" + EndOfLine
			  s = s + "}" + EndOfLine
			  
			  s = s + "private function closeMe(e:MouseEvent):void{" + EndOfLine
			  s = s + "this.visible = false;" + EndOfLine
			  s = s + "}" + EndOfLine
			  s = s + "}" + EndOfLine
			  s = s + "}" + EndOfLine
			  
			  Return s
			End Get
		#tag EndGetter
		GetFlexDragPanelString As string
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		iosAppDelegateHCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		iosAppDelegateMCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		iosMainCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		iosPBXProj As string
	#tag EndProperty

	#tag Property, Flags = &h0
		iosPList As string
	#tag EndProperty

	#tag Property, Flags = &h0
		iosPrefix As string
	#tag EndProperty

	#tag Property, Flags = &h0
		PythonDesktopCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		PythonMaemoCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TargetInProcess As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		WebJavaScriptCode As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AndroidMainJavaCode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BuildingForiPad"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FlexWebCode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GetFlexDragPanelString"
			Group="Behavior"
			Type="string"
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
			Name="iosAppDelegateHCode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iosAppDelegateMCode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iosMainCode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iosPBXProj"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iosPList"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iosPrefix"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PythonDesktopCode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PythonMaemoCode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TargetInProcess"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebJavaScriptCode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
