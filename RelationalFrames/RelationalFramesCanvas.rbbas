#tag Class
Class RelationalFramesCanvas
Inherits canvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if asc(key) = 9 then SelectNextFrame
		  
		  
		  if asc(key) = 127 or asc(key) = 8 then // Delete
		    if selectedFrame <> nil then
		      if selectedFrame.tag isa ilObjectApp or selectedFrame.tag isa ilObjectAppQuit then
		      else
		        DeleteFrame(selectedFrame)
		      end if
		    end if
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  me.SetFocus
		  
		  // clear selections
		  dim previousSelection as contentframe = selectedFrame
		  mselectedFrame = nil
		  sourceObject = nil
		  
		  dim objectHit as CalculatedHeightRect
		  dim frame as ContentFrame
		  dim objectIndex as integer
		  
		  // find the selected object
		  for objectIndex = frames.Ubound DownTo 0
		    frame = frames(objectIndex)
		    objectHit = frame.MouseDown(x, y)
		    if objectHit <> nil then exit for
		  next
		  
		  if objectHit isa ContentFrame then
		    // if it's a frame, bring it to the front
		    mselectedFrame = contentFrame(objectHit)
		    frames.Remove(objectIndex)
		    frames.Append(selectedFrame)
		    
		  elseif objectHit isa ContentObject then
		    sourceObject = ContentObject(objectHit)
		    
		  end if
		  
		  if selectedFrame <> previousSelection then FrameSelected(selectedFrame)
		  
		  lastMouseX = x
		  lastMouseY = y
		  
		  me.Refresh(False)
		  
		  if IsContextualClick = true then
		    Return false
		  end if
		  
		  Return objectHit <> nil
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if selectedFrame <> nil then
		    // drag frame
		    'if x > 0 and y > 0 then
		    selectedFrame.Offset(x - lastMouseX, y - lastMouseY)
		    if selectedFrame.X < 0 then
		      selectedFrame.X = 0
		    end if
		    if selectedFrame.Y < 0 then
		      selectedFrame.Y = 0
		    end if
		    'end if
		    modFile.fileisDirty = true
		    
		  elseif sourceObject <> nil then
		    // find a possible target for a link...
		    dim objectIndex as integer
		    dim objectHit as contentObject
		    targetObject = nil
		    
		    for objectIndex = frames.Ubound DownTo 0
		      objectHit = frames(objectIndex).MouseDrag(x, y)
		      if objectHit <> nil and objectHit <> sourceObject then exit for
		    next
		    
		    if objectHit <> nil and ShouldAllowLink(targetObject, objectHit) then
		      targetObject = objectHit
		    end if
		  end if
		  
		  lastMouseX = x
		  lastMouseY = y
		  
		  Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  // perform the link
		  if sourceObject <> nil and targetObject <> nil then
		    sourceObject.AddOutputObject(targetObject)
		    LinkPerformed(sourceObject, targetObject)
		  end if
		  
		  // reset selections
		  sourceObject = nil
		  targetObject = nil
		  Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  #if TargetWin32
		    me.DoubleBuffer = true
		  #endif
		  
		  me.AcceptFocus = true
		  me.AcceptTabs = true
		  Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  
		  if TargetLinux then
		    
		    g.DrawPicture GetPictureOfChart,0,0
		    
		  end if
		  
		  
		  
		  if TargetWin32 then
		    
		    g.DrawPicture GetPictureOfChartWin32,0,0',100,100
		    
		  end if
		  
		  if TargetMacOS then
		    g.DrawPicture GetPictureOfChart,0,0
		  end if
		  
		  
		  '// background
		  'g.ForeColor = &cffffff
		  'g.FillRect 0, 0, g.Width, g.Height
		  '
		  '// grid... you should parametrize this
		  'for i as Integer = 0 to max(g.Width, g.Height) step 10
		  'if i mod 50 = 0 then
		  'g.ForeColor = GrayColor(0.9)
		  'else
		  'g.ForeColor = GrayColor(0.95)
		  'end if
		  'if i < g.Height then
		  'g.DrawLine 0, i, g.Width, i
		  'end if
		  'if i < g.Width then
		  'g.DrawLine i, 0, i, g.Height
		  'end if
		  'next
		  '
		  '// now, draw all links, so they appear below every frame...
		  'for each frame as ContentFrame in frames
		  'frame.DrawAllLinks(g, selectedFrame)
		  'next
		  '
		  '// now, draw the frames, and highlight the currently selected frame...
		  'for each frame as ContentFrame in frames
		  'if selectedFrame = frame then
		  'g.ForeColor = linkColor
		  'g.PenWidth = 2
		  'g.PenHeight = 2
		  'if selectedFrame.rounded then
		  'g.DrawRoundRect frame.x - selectionWidth, frame.y - selectionWidth, frame.width + 2 * selectionWidth, frame.height + 2 * selectionWidth, 14, 14
		  'else
		  'g.DrawRect frame.x - selectionWidth, frame.y - selectionWidth, frame.width + 2 * selectionWidth, frame.height + 2 * selectionWidth
		  'end if
		  'g.PenWidth = 1
		  'g.PenHeight = 1
		  'g.ForeColor = &c0
		  'end if
		  'frame.Paint(g)
		  'next
		  '
		  '// if there's a link being performed, paint it...
		  'if sourceObject <> nil then
		  'dim linkColor as color = &cffffff
		  'if targetObject <> nil then linkColor = RelationalFrames.LinkColor
		  'drawLink(g, sourceObject.outputArea.x + 3 + sourceObject.parent.x, sourceObject.outputArea.y + 3  + sourceObject.parent.y, lastMousex, lastMouseY, linkColor)
		  'end if
		  '
		  '// finally, draw a frame.
		  'g.ForeColor = &c888888
		  'g.DrawRect 0,0,g.Width,g.Height
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddFrame(frame as contentFrame)
		  frames.Append frame
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteFrame(theFrame as contentFrame)
		  dim i as integer
		  
		  dim j as integer
		  dim k as integer
		  dim p as integer
		  
		  for i = frames.Ubound DownTo 0
		    
		    if frames(i) = theFrame then
		      
		      
		      
		      // Need to remove all incoming links.
		      
		       // Loop through all frames
		      for j = frames.Ubound DownTo 0
		        
		        //Loop through all content objects
		        for k = frames(j).contents.Ubound DownTo 0
		          
		          
		          //Loop through all the outputs
		          for p = ContentObject(frames(j).contents(k)).outputs.Ubound DownTo 0
		            
		            //Check if the output goes to this current frame
		            if ContentObject(frames(j).contents(k)).outputs(p).parent = frames(i) then
		              
		              //Remove that output
		              frames(j).RemoveLink(k,p)
		              
		              //chartProject.selectedFrame.RemoveLink(theCO, theOutput)
		              
		            end if
		            
		          next
		          
		          
		          
		        next
		        
		        //me.contents(theCO).outputs.Remove(theOutput)
		        
		        
		      next
		      
		      
		      
		      // Remove the frame itself
		      frames.Remove(i)
		      
		      
		      
		    end if
		    
		  next
		  
		  FrameSelected(nil)
		  
		  modFile.fileisDirty = true
		  
		  me.Refresh
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPictureOfChart() As picture
		  dim p as Picture
		  p = NewPicture(me.Width, me.Height, 32)
		  
		  // background
		  p.Graphics.ForeColor = &cffffff
		  p.Graphics.FillRect 0, 0, p.Graphics.Width, p.Graphics.Height
		  
		  // grid... you should parametrize this
		  for i as Integer = 0 to max(p.Graphics.Width, p.Graphics.Height) step 10
		    if i mod 50 = 0 then
		      p.Graphics.ForeColor = GrayColor(0.9)
		    else
		      p.Graphics.ForeColor = GrayColor(0.95)
		    end if
		    if i < p.Graphics.Height then
		      p.Graphics.DrawLine 0, i, p.Graphics.Width, i
		    end if
		    if i < p.Graphics.Width then
		      p.Graphics.DrawLine i, 0, i, p.Graphics.Height
		    end if
		  next
		  
		  // now, draw all links, so they appear below every frame...
		  for each frame as ContentFrame in frames
		    frame.DrawAllLinks(p.Graphics, selectedFrame)
		  next
		  
		  // now, draw the frames, and highlight the currently selected frame...
		  for each frame as ContentFrame in frames
		    if selectedFrame = frame then
		      p.Graphics.ForeColor = linkColor
		      p.Graphics.PenWidth = 2
		      p.Graphics.PenHeight = 2
		      if selectedFrame.rounded then
		        p.Graphics.DrawRoundRect frame.x - selectionWidth, frame.y - selectionWidth, frame.width + 2 * selectionWidth, frame.height + 2 * selectionWidth, 14, 14
		      else
		        p.Graphics.DrawRect frame.x - selectionWidth, frame.y - selectionWidth, frame.width + 2 * selectionWidth, frame.height + 2 * selectionWidth
		      end if
		      p.Graphics.PenWidth = 1
		      p.Graphics.PenHeight = 1
		      p.Graphics.ForeColor = &c0
		    end if
		    frame.Paint(p.Graphics)
		  next
		  
		  // if there's a link being performed, paint it...
		  if sourceObject <> nil then
		    dim linkColor as color = &cffffff
		    if targetObject <> nil then linkColor = RelationalFrames.LinkColor
		    drawLink(p.Graphics, sourceObject.outputArea.x + 3 + sourceObject.parent.x, sourceObject.outputArea.y + 3  + sourceObject.parent.y, lastMousex, lastMouseY, linkColor)
		  end if
		  
		  // finally, draw a frame.
		  p.Graphics.ForeColor = &c888888
		  p.Graphics.DrawRect 0,0,p.Graphics.Width,p.Graphics.Height
		  
		  'CurrentChartPic = p
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPictureOfChartWin32() As picture
		  dim p as Picture
		  p = NewPicture(me.Width, me.Height, 32)
		  
		  // background
		  p.Graphics.ForeColor = &cffffff
		  p.Graphics.FillRect 0, 0, p.Graphics.Width, p.Graphics.Height
		  
		  // grid... you should parametrize this
		  for i as Integer = 0 to max(p.Graphics.Width, p.Graphics.Height) step 10
		    if i mod 50 = 0 then
		      p.Graphics.ForeColor = GrayColor(0.9)
		    else
		      p.Graphics.ForeColor = GrayColor(0.95)
		    end if
		    if i < p.Graphics.Height then
		      p.Graphics.DrawLine 0, i, p.Graphics.Width, i
		    end if
		    if i < p.Graphics.Width then
		      p.Graphics.DrawLine i, 0, i, p.Graphics.Height
		    end if
		  next
		  
		  // now, draw all links, so they appear below every frame...
		  for each frame as ContentFrame in frames
		    frame.DrawAllLinks(p.Graphics, selectedFrame)
		  next
		  
		  // now, draw the frames, and highlight the currently selected frame...
		  for each frame as ContentFrame in frames
		    if selectedFrame = frame then
		      p.Graphics.ForeColor = linkColor
		      p.Graphics.PenWidth = 2
		      p.Graphics.PenHeight = 2
		      if selectedFrame.rounded then
		        p.Graphics.DrawRoundRect frame.x - selectionWidth, frame.y - selectionWidth, frame.width + 2 * selectionWidth, frame.height + 2 * selectionWidth, 14, 14
		      else
		        p.Graphics.DrawRect frame.x - selectionWidth, frame.y - selectionWidth, frame.width + 2 * selectionWidth, frame.height + 2 * selectionWidth
		      end if
		      p.Graphics.PenWidth = 1
		      p.Graphics.PenHeight = 1
		      p.Graphics.ForeColor = &c0
		    end if
		    frame.Paint(p.Graphics)
		  next
		  
		  // if there's a link being performed, paint it...
		  if sourceObject <> nil then
		    dim linkColor as color = &cffffff
		    if targetObject <> nil then linkColor = RelationalFrames.LinkColor
		    drawLink(p.Graphics, sourceObject.outputArea.x + 3 + sourceObject.parent.x, sourceObject.outputArea.y + 3  + sourceObject.parent.y, lastMousex, lastMouseY, linkColor)
		  end if
		  
		  // finally, draw a frame.
		  p.Graphics.ForeColor = &c888888
		  p.Graphics.DrawRect 0,0,p.Graphics.Width,p.Graphics.Height
		  
		  'CurrentChartPic = p
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReSelectCurrentFrame()
		  FrameSelected(selectedFrame)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectFrame(frame as ContentFrame)
		  mselectedFrame = frame
		  FrameSelected(Frame)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectNextFrame()
		  if frames.Ubound < 0 then Return
		  
		  mselectedFrame = frames(0)
		  frames.Remove(0)
		  frames.Append(selectedFrame)
		  me.Refresh(False)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FrameSelected(frame as contentFrame)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LinkPerformed(fromObject as contentObject, toObject as contentObject)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ShouldAllowLink(fromObject as ContentObject, toObject as ContentObject) As Boolean
	#tag EndHook


	#tag Property, Flags = &h0
		CurrentChartPic As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		frames() As ContentFrame
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastMouseX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastMouseY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mselectedFrame As ContentFrame
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mselectedFrame
			End Get
		#tag EndGetter
		selectedFrame As ContentFrame
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private sourceObject As contentObject
	#tag EndProperty

	#tag Property, Flags = &h21
		Private targetObject As contentObject
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentChartPic"
			Group="Behavior"
			Type="picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
