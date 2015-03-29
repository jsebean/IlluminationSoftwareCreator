#tag Class
Class PictureObject
Inherits ContentObject
	#tag Event
		Function CalculateHeight() As Integer
		  Return Image.Height
		End Function
	#tag EndEvent

	#tag Event
		Sub Paint(g as Graphics)
		  g.DrawPicture Image, (width - Image.Width) * 0.5 + self.x, y
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(image as Picture)
		  self.image = image
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mimage
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mimage = value
			  UpdateInputOutputAreas
			  
			  if parent = nil then Return
			  parent.forceUpdate
			  parent.fixPositions
			End Set
		#tag EndSetter
		image As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mimage As Picture
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CodeToCallThisObject"
			Group="Behavior"
			Type="string"
			InheritedFrom="ContentObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DBRowID"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="ContentObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="image"
			Group="Behavior"
			Type="Picture"
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
			Name="ShowInput"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ContentObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowOutput"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ContentObject"
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
End Class
#tag EndClass
