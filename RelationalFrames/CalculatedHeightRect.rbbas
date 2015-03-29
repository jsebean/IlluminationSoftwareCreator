#tag Class
Private Class CalculatedHeightRect
	#tag Method, Flags = &h1
		Protected Function ContainsPoint(x as integer, y as Integer) As Boolean
		  // simple hit testing...
		  dim h as Integer = height
		  Return x >= self.x and x < self.x + self.width and y >= self.y and y <= self.y + h
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CalculateHeight() As Integer
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return calculateHeight
			End Get
		#tag EndGetter
		height As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		width As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		x As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		y As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="height"
			Group="Behavior"
			Type="Integer"
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
		#tag ViewProperty
			Name="width"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="x"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="y"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
