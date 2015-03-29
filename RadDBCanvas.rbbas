#tag Class
Protected Class RadDBCanvas
Inherits canvas
	#tag Event
		Sub Open()
		  // Check to see whether the user is on a system that
		  // requires double buffering
		  #if TargetWin32
		    // On Windows, we always want to double buffer
		    mDoubleBuffer = true
		  #elseif TargetMacOS
		    // We only want to double buffer on the Mac if
		    // we're running on OS 9.  OS X automatically
		    // double buffers for us
		    mDoubleBuffer = false
		  #endif
		  
		  if mDoubleBuffer then
		    
		    // We don't want the background to be erased every time
		    // since we're doing our own buffering.  This would cause
		    // a lot of flickering.
		    me.EraseBackground = false
		  end if
		  
		  // Call the user's Open event
		  Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  // We're going to implement the paint event ourselves
		  // so that we can automatically do the double buffering
		  
		  if mDoubleBuffer then
		    // Check our back buffer to make sure we've got
		    // one that we can draw to
		    CheckBackBuffer
		    
		    // Erase the back buffer ourselves
		    mBackBuffer.Graphics.ForeColor = FillColor
		    mBackBuffer.Graphics.FillRect( 0, 0, me.Width, me.Height )
		    
		    // Set the background color to be black, like
		    // a normal canvas would be
		    mBackBuffer.Graphics.ForeColor = &c000000
		    
		    // Now call the user's paint event, but pass in
		    // our back buffer
		    Paint( mBackBuffer.Graphics )
		    
		    // Now we can draw the back buffer to the screen
		    g.DrawPicture( mBackBuffer, 0, 0, me.Width, me.Height )
		  else
		    // We're not double buffering, so just pass the Graphics
		    // object on to the user's Paint event.
		    Paint( g )
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CheckBackBuffer()
		  // We want to make sure our back buffer is the proper size
		  // and ready for drawing to
		  
		  dim create as Boolean
		  
		  // If we don't have a back buffer, then we need to create one
		  // If our size has gotten larger than our
		  // back buffer, then we need to create a new one.  We don't
		  // care if the canvas is smaller than our back buffer since
		  // we're only going to be drawing to the canvas' size on the
		  // screen.
		  if mBackBuffer = nil or me.Width > mBackBuffer.Width or _
		    me.Height > mBackBuffer.Height or me.Width < mBackBuffer.Width or _
		    me.Height < mBackBuffer.Height then create = true
		    
		    if create then
		      // We only need to make the picture to the Canvas' current
		      // size.  Anything more than that is a waste.
		      mBackBuffer = new Picture( me.Width, me.Height, 32 )
		    end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redraw()
		  // We force the user to call Redraw instead of Refresh because
		  // we don't want the user to be able to accidentally cause an
		  // entire screen erase.  So we override Refresh by making it
		  // a private function.
		  super.Refresh( false )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Refresh(eraseBackground as Boolean = true)
		  // We don't do anything here because we don't want the user
		  // to be able to call refresh
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint(g as graphics)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mBackBuffer As picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDoubleBuffer As boolean
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
