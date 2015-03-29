#tag Class
Class ContentObject
Inherits CalculatedHeightRect
	#tag Method, Flags = &h0
		Sub AddOutputObject(obj as ContentObject)
		  if obj <> nil then
		    outputs.Append(obj)
		    
		    'if obj.input <> nil then
		    'obj.input.RemoveOutputObject(obj)
		    'end if
		    
		    // Later here I can check if there are multiple inputs and remove them?
		    
		    obj.inputs.Append self
		    'obj.input = self
		  end if
		  
		  parent.forceUpdate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoPaint(g as Graphics)
		  g.ForeColor = &cFFFFFF
		  
		  UpdateInputOutputAreas
		  
		  if ShowInput = true then
		    g.FillOval inputArea.x, inputArea.y, inputArea.width, inputArea.height
		  end if
		  
		  if ShowOutput = true then
		    g.FillOval outputArea.x, outputArea.y, outputArea.width, outputArea.height
		  end if
		  
		  
		  g.ForeColor = linkColor
		  if inputs.Ubound >= 0 then
		    g.FillOval inputArea.x + 1, inputArea.y + 1, inputArea.width - 2, inputArea.height - 2
		  end if
		  
		  if outputs.Ubound >= 0 then
		    g.FillOval outputArea.x + 1, outputArea.y + 1, outputArea.width - 2, outputArea.height - 2
		  end if
		  
		  //g.DrawRect x, y, width, height
		  
		  Paint(g)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MouseDown(X as integer, Y as integer) As ContentObject
		  if outputArea.ContainsPoint(x, y) then
		    Return self
		  end if
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MouseDrag(X as integer, Y as integer) As ContentObject
		  if inputArea.ContainsPoint(x, y) then
		    Return self
		  end if
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveOutputObject(obj as ContentObject)
		  for i as Integer = 0 to outputs.Ubound
		    if outputs(i) = obj then
		      outputs.Remove(i)
		      parent.forceUpdate
		      Return
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateInputOutputAreas()
		  if parent = nil then Return
		  inputArea.x = InputOutputAreaSize
		  inputArea.y = y + (self.height - InputOutputAreaSize) * 0.5
		  inputArea.width = InputOutputAreaSize
		  
		  outputArea.x = parent.Width - 2 * InputOutputAreaSize
		  outputArea.y = y + (self.height - InputOutputAreaSize) * 0.5
		  outputArea.width = InputOutputAreaSize
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Paint(g as Graphics)
	#tag EndHook


	#tag Property, Flags = &h0
		CodeToCallThisObject As string
	#tag EndProperty

	#tag Property, Flags = &h0
		DBRowID As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if minputArea = nil then 
			    minputArea = new InputOutputRect
			    minputArea.x = InputOutputAreaSize
			    minputArea.y = y + (self.height - InputOutputAreaSize) * 0.5
			    minputArea.width = InputOutputAreaSize
			  end if
			  return minputArea
			End Get
		#tag EndGetter
		inputArea As InputOutputRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return minput
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  minput = value
			  parent.forceUpdate
			End Set
		#tag EndSetter
		inputOld As ContentObject
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		inputs() As contentObject
	#tag EndProperty

	#tag Property, Flags = &h21
		Private minput As ContentObject
	#tag EndProperty

	#tag Property, Flags = &h21
		Private minputArea As InputOutputRect
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moutputArea As InputOutputRect
	#tag EndProperty

	#tag Property, Flags = &h0
		myilUIObject As iluiObject
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if moutputArea = nil then 
			    moutputArea = new InputOutputRect
			    moutputArea.x = parent.Width - 2 * InputOutputAreaSize
			    moutputArea.y = y + (self.height - InputOutputAreaSize) * 0.5
			    moutputArea.width = InputOutputAreaSize
			  end if
			  return moutputArea
			End Get
		#tag EndGetter
		outputArea As InputOutputRect
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		outputs() As ContentObject
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.parentRef <> nil then
			    return ContentFrame(me.parentRef.Value)
			  else
			    return nil
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.parentRef = new WeakRef(value)
			End Set
		#tag EndSetter
		parent As ContentFrame
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private parentRef As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowInput As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowOutput As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		tag As Variant
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ilObjectBase(tag)
			End Get
		#tag EndGetter
		TagAsilObject As ilObjectBase
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CodeToCallThisObject"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DBRowID"
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
			Name="ShowInput"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowOutput"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
