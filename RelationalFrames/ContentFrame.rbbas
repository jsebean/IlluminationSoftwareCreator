#tag Class
Class ContentFrame
Inherits CalculatedHeightRect
	#tag Event
		Function CalculateHeight() As Integer
		  // if there's no content, return the header height at least
		  if contents.Ubound < 0 then
		    Return 16
		  end if
		  
		  Return contents(contents.Ubound).y + contents(contents.Ubound).height + 4
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AppendObject(obj as ContentObject)
		  // set the parent object
		  obj.parent = self
		  
		  // offset the object
		  obj.x = InputOutputAreaSize * 3
		  
		  // set its Y pos.
		  if contents.Ubound < 0 then
		    obj.y = TitleAreaHeight + 2
		    
		  else
		    obj.y = contents(contents.Ubound).y + contents(contents.Ubound).height + 2
		    
		  end if
		  // set the width, taking the margins into consideration
		  obj.width = self.width - InputOutputAreaSize * 6
		  
		  contents.Append obj
		  
		  // this will force to update the whole frame on the next redraw
		  contentsPic = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(x as Integer, y as Integer, width as Integer, title as String)
		  self.Constructor(x, y, width, title, true, &c0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(x as Integer, y as Integer, width as Integer, title as String, rounded as Boolean)
		  self.Constructor(x, y, width, title, rounded, &c0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(x as Integer, y as Integer, width as Integer, title as String, rounded as Boolean, backColor as color)
		  self.x = x
		  self.y = y
		  self.width = width
		  self.title = Title
		  self.backColor = backColor
		  self.rounded = rounded
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(x as Integer, y as Integer, width as Integer, title as string, backColor as color)
		  self.Constructor(x, y, width, title, true, backColor)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawAllLinks(g as Graphics, selectedFrame as contentFrame)
		  for each content as contentObject in contents
		    // paint all outgoing links
		    if content.outputs.Ubound >= 0 then
		      for each link as contentObject in content.outputs
		        
		        // set the color, if no frame is selected, paint them all the same color
		        // if a frame is selected and it's self, highlight this frame's links
		        dim linksColor as color = linkColor
		        if selectedFrame <> nil and selectedFrame <> self then linksColor = grayColor(0.8)
		        if selectedFrame <> nil and link.parent = selectedFrame then linksColor = linkColor
		        drawLink(g, content.outputArea.x + 3 + self.x, content.outputArea.y + 3  + self.y, link.inputArea.x + 3 + link.parent.x, link.inputArea.y + 3 + link.parent. y, linksColor)
		      next
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub fixPositions()
		  // update positions
		  for i as Integer = 0 to contents.Ubound
		    dim obj as contentObject = contents(i)
		    
		    if i = 0 then
		      obj.y = TitleAreaHeight + 2
		      
		    else
		      obj.y = contents(i - 1).y + contents(i - 1).height + 2
		      
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub forceUpdate()
		  contentsPic = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MouseDown(X as Integer, Y as Integer) As CalculatedHeightRect
		  // if the hit point is not inside this frame, there's nothing to do
		  if not self.ContainsPoint(x, y) then Return nil
		  
		  // find the selected object
		  dim hitObject as ContentObject
		  for each content as contentobject in contents
		    hitObject = content.MouseDown(x - self.x, y - self.y)
		    if hitObject <> nil then exit for
		  next
		  
		  // if hitObject <> nil it's because an output "outlet" was clicked
		  if hitObject <> nil then Return hitObject
		  
		  // if not, return self, so the frame can be dragged
		  Return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MouseDrag(X as Integer, Y as Integer) As ContentObject
		  if not self.ContainsPoint(x, y) then Return nil
		  
		  // find if x, y is on top of an input on this frame
		  dim hitObject as ContentObject
		  for each content as contentobject in contents
		    hitObject = content.MouseDrag(x - self.x, y - self.y)
		    if hitObject <> nil then Return hitObject
		  next
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Offset(ox as integer, oy as integer)
		  // move frame
		  self.x = self.x + ox
		  self.y = self.y + oy
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics)
		  // if the contents picture exists, it must be the latest know state of the frame, let's just paint it.
		  if contentsPic <> nil then
		    g.DrawPicture contentsPic, self.x, self.y
		    Return
		  end if
		  
		  // our contents picture needs to be re-created
		  // that could be the case if the contents were changed.
		  contentsPic = NewPicture(self.width, self.height, 32)
		  
		  dim calcHeight as Integer = self.height
		  dim maskg as Graphics = contentsPic.Mask.Graphics
		  dim contentsg as Graphics = contentsPic.Graphics
		  
		  // clear the mask
		  contentsPic.ClearMask
		  
		  // draw a solid round rect for the mask, and make it 85% opaque
		  maskg.ForeColor = GrayColor(0.15)
		  if rounded then
		    maskg.FillRoundRect 0, 0, self.width, calcHeight, FrameRadius, FrameRadius
		  else
		    maskg.FillRect 0, 0, self.width, calcHeight
		  end if
		  
		  // title bar gradient
		  contentsg.Gradient 0, 0, self.width, TitleAreaHeight, backColor.lighterColor(0.5), backColor.lighterColor(0.2)
		  
		  // title
		  contentsg.TextFont = textFont
		  contentsg.TextSize = textSize
		  contentsg.Bold = true
		  contentsg.ForeColor = backColor.darkerColor(0.35)
		  contentsg.DrawString Title, 6, TitleAreaHeight - (g.TextHeight - g.TextAscent) - 2, self.width - 10, true
		  contentsg.ForeColor = GrayColor(2.0)
		  contentsg.DrawString Title, 6, TitleAreaHeight - (g.TextHeight - g.TextAscent) - 1, self.width - 10, true
		  
		  // body
		  contentsg.Gradient 0, TitleAreaHeight, self.width, calcHeight - TitleAreaHeight, backColor.lighterColor(0.1), backColor.darkerColor(0.1)
		  
		  // contents...
		  for each content as ContentObject in contents
		    content.DoPaint(contentsg)
		  next
		  
		  // frame
		  contentsg.ForeColor = backColor.lighterColor(0.75)
		  if rounded then
		    contentsg.DrawRoundRect 0, 1, self.width, calcHeight, FrameRadius, FrameRadius
		  else
		    contentsg.DrawLine 0, 1, self.width, 1
		  end if
		  
		  contentsg.ForeColor = backColor.darkerColor(0.35)
		  if rounded then
		    contentsg.DrawRoundRect 0, 0, self.width, calcHeight, FrameRadius, FrameRadius
		  else
		    contentsg.DrawRect 0, 0, self.width, calcHeight
		  end if
		  
		  g.DrawPicture contentsPic, self.x, self.y
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveLink(theCO as integer, theOutput as integer)
		  me.contents(theCO).outputs.Remove(theOutput)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mbackColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mbackColor = value
			  self.forceUpdate
			End Set
		#tag EndSetter
		backColor As color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		contents() As ContentObject
	#tag EndProperty

	#tag Property, Flags = &h21
		Private contentsPic As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mbackColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mrounded As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		mtag As variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtitle As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mrounded
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mrounded = value
			  self.forceUpdate
			End Set
		#tag EndSetter
		rounded As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mtag
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtag = value
			  ilObjectBase(mtag).Parent = me
			End Set
		#tag EndSetter
		tag As variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtitle
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtitle = value
			  self.forceUpdate
			End Set
		#tag EndSetter
		title As String
	#tag EndComputedProperty


	#tag Constant, Name = TitleAreaHeight, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="backColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="color"
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
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="rounded"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
