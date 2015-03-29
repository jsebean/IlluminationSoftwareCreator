#tag Class
Class TextObject
Inherits ContentObject
	#tag Event
		Function CalculateHeight() As Integer
		  // the height of this object is the height of the text
		  Return StringHeight(text, self.width, TextFont, TextSize) + 2
		End Function
	#tag EndEvent

	#tag Event
		Sub Paint(g as Graphics)
		  // paint the text....
		  g.TextFont = TextFont
		  g.TextSize = TextSize
		  g.Bold = False
		  
		  g.ForeColor = &cFFFFFF
		  g.DrawString text, x, y + g.TextHeight, self.width
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(text as String)
		  self.text = text
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mtext As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtext
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtext = value
			  UpdateInputOutputAreas
			  
			  if parent = nil then Return
			  parent.forceUpdate
			  parent.fixPositions
			End Set
		#tag EndSetter
		text As String
	#tag EndComputedProperty


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
			Name="text"
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
