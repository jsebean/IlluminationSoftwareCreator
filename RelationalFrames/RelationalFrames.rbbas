#tag Module
Protected Module RelationalFrames
	#tag Method, Flags = &h1
		Protected Sub ClearMask(extends pic as Picture)
		  dim oldMaskColor as color = pic.Mask.Graphics.ForeColor
		  pic.Mask.Graphics.ForeColor = &cffffff
		  pic.mask.Graphics.FillRect 0, 0, pic.Width, pic.Height
		  pic.mask.Graphics.ForeColor = oldMaskColor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DarkerColor(extends c as color, byPercent as Single) As color
		  dim r, g, b as Integer
		  r = max(min(c.Red - 255.0 * byPercent, 255), 0)
		  g = max(min(c.Green - 255.0 * byPercent, 255), 0)
		  b = max(min(c.Blue - 255.0 * byPercent, 255), 0)
		  Return rgb(r, g, b)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawLink(g as graphics, fromX as integer, fromY as integer, toX as integer, toY as integer, fillColor as color = &cFF922A, borderColor as color = &c0)
		  //draws a "link" between 2 objects
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  dim c as new CurveShape
		  c.ControlX(0) = 40
		  c.ControlY(0) = 0
		  
		  c.Order = 2
		  c.x = 0
		  c.y = 0
		  c.X2 = tox - fromx - 1
		  c.Y2 = toy - fromy
		  
		  c.ControlX(1) = c.x2 - 40
		  c.ControlY(1) = c.Y2
		  
		  c.Border = 100
		  c.Segments = 10
		  
		  c.BorderColor = borderColor
		  c.BorderWidth = 4
		  
		  g.DrawObject c, fromx + 1, fromy
		  
		  
		  c.BorderColor = fillColor
		  c.BorderWidth = 2
		  
		  g.DrawObject c, fromx + 1, fromy
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Gradient(extends g as graphics, x as integer, y as integer, width as integer, height as integer, startColor as color = &cFFFFFF, endColor as color = &cCCCCCC)
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  dim ratio, endratio as Double
		  
		  // Draw the gradient
		  for i as integer = y to height + y
		    
		    // Determine the current line's color
		    ratio = ((height - (i - y)) / height)
		    endratio = ((i - y) / height)
		    g.ForeColor = RGB(EndColor.Red * endratio + StartColor.Red * ratio, EndColor.Green * endratio + StartColor.Green * ratio, EndColor.Blue * endratio + StartColor.Blue * ratio)
		    
		    // Draw the step
		    g.DrawLine x, i, x + width, i
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GrayColor(percent as Single) As Color
		  percent = max(min(percent, 1.0), 0.0)
		  Return rgb(percent * 255.0, percent * 255.0, percent * 255.0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LighterColor(extends c as color, byPercent as Single) As color
		  dim r, g, b as Integer
		  r = max(min(c.Red + 255.0 * byPercent, 255), 0)
		  g = max(min(c.Green + 255.0 * byPercent, 255), 0)
		  b = max(min(c.Blue + 255.0 * byPercent, 255), 0)
		  Return rgb(r, g, b)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StringHeight(text as string, wrapWidth as integer, textFont as string, textSize as Integer, bold as Boolean = false, italic as Boolean = false, underline as Boolean = false) As Integer
		  stringMetricsPic.Graphics.TextFont = textFont
		  stringMetricsPic.Graphics.TextSize = textSize
		  stringMetricsPic.Graphics.Bold = bold
		  stringMetricsPic.Graphics.Italic = italic
		  stringMetricsPic.Graphics.Underline = underline
		  Return stringMetricsPic.Graphics.StringHeight(text, wrapWidth)
		End Function
	#tag EndMethod


	#tag Note, Name = About
		RelationalFrames
		By Alex Restrepo
		send comments, suggestions, fixes to alexrestrepo@mac.com
		
		A canvas that holds and optionally links a series of frame objects.
		Each object can have only one input, but any number of outputs... but you can easily modify that if needed.
		
		Events:
		Event FrameSelected(Frame as contentFrame)
		fired when you select/deselect a frame, if there's no selection, frame is nil.
		
		Event LinkPerformed(fromObject as contentObject, toObject as contentObject)
		fired when 2 frame objects are linked together.
		
		Event ShouldAllowLink(fromObject as ContentObject, toObject as ContentObject) As Boolean
		Return true if you want to allow both objects to be linked.
		
		Open source under the Creative Commons Attribution License: If you decide to use it in your projects, please give me credit in your about window or documentation.
		Use in whatever way you like... at your own risk :P
		let me know if you find it useful.
	#tag EndNote


	#tag Property, Flags = &h21
		Private mstringMetricsPic As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mstringMetricsPic = nil then
			    mstringMetricsPic = NewPicture(2,2,32)
			  end if
			  return mstringMetricsPic
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mstringMetricsPic = value
			End Set
		#tag EndSetter
		stringMetricsPic As Picture
	#tag EndComputedProperty


	#tag Constant, Name = FrameRadius, Type = Double, Dynamic = False, Default = \"12", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = InputOutputAreaSize, Type = Double, Dynamic = False, Default = \"6", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LinkColor, Type = Color, Dynamic = False, Default = \"&c6873A9", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SelectionWidth, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TextFont, Type = String, Dynamic = False, Default = \"Verdana", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TextSize, Type = Double, Dynamic = False, Default = \"9", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
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
			Name="stringMetricsPic"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
