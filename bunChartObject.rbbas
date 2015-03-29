#tag Class
Protected Class bunChartObject
	#tag Method, Flags = &h0
		Function ObjectAsPicture() As picture
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myilUIObject.Height(frmUIEditor.popTarget.ListIndex)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myilUIObject.Height(frmUIEditor.popTarget.ListIndex) = value
			End Set
		#tag EndSetter
		Height As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Image As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		isWindow As boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myilUIObject.X(frmUIEditor.popTarget.ListIndex)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myilUIObject.X(frmUIEditor.popTarget.ListIndex) = value
			End Set
		#tag EndSetter
		Left As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		Moveable As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		myilUIObject As iluiObject
	#tag EndProperty

	#tag Property, Flags = &h0
		ObjectType As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		Opacity As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		Resizable As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		RotationInDegrees As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Selcted As boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		TextBold As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		TextColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		TextFont As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		TextItalic As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		TextSize As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		TextString As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		TextUnderline As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		theilUIObjectatIndexFromFrame As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myilUIObject.Y(frmUIEditor.popTarget.ListIndex)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myilUIObject.Y(frmUIEditor.popTarget.ListIndex) = value
			End Set
		#tag EndSetter
		Top As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		Visible As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myilUIObject.Width(frmUIEditor.popTarget.ListIndex)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if myilUIObject.ControlType = 0 then // It's a window
			    
			    if frmUIEditor.popTarget.ListIndex = app.kpiOSiPad or frmUIEditor.popTarget.ListIndex = app.kpiOSiPad or frmUIEditor.popTarget.ListIndex = app.kpPythonMaemo then // it's a mobile device
			      
			    else
			      
			      myilUIObject.Width(frmUIEditor.popTarget.ListIndex) = value
			      
			    end if
			    
			  else
			    
			    myilUIObject.Width(frmUIEditor.popTarget.ListIndex) = value
			    
			  end if
			End Set
		#tag EndSetter
		Width As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kTypePicture, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeString, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeUI, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeVector, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Height"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Image"
			Group="Behavior"
			InitialValue="0"
			Type="picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isWindow"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Moveable"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ObjectType"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Opacity"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Resizable"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RotationInDegrees"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Selcted"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextBold"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextItalic"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextString"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnderline"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="theilUIObjectatIndexFromFrame"
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
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
