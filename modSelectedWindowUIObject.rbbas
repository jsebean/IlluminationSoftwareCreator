#tag Module
Protected Module modSelectedWindowUIObject
	#tag Method, Flags = &h0
		Function ControlTypeForSelectedWindow(UIObjectIndex as integer) As Integer
		  
		  dim i as integer
		  
		  i = ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).ControlType
		  
		  return i
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlTypeForSelectedWindow(UIObjectIndex as integer, Assigns theControlType as integer)
		  ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).ControlType = theControlType
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnabledForSelectedWindow(UIObjectIndex as integer, thePlatform as integer) As boolean
		  return ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).Enabled(thePlatform)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnabledForSelectedWindow(UIObjectIndex as integer, thePlatform as integer, Assigns theEnabled as boolean)
		  ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).Enabled(thePlatform) = theEnabled
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HeightForSelectedWindow(UIObjectIndex as integer, thePlatform as integer) As Integer
		  
		  dim i as integer
		  
		  i = ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).Height(thePlatform)
		  
		  return i
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HeightForSelectedWindow(UIObjectIndex as integer, thePlatform as integer, Assigns theHeight as integer)
		  ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).Height(thePlatform) = theHeight
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextForSelectedWindow(UIObjectIndex as integer, thePlatform as integer) As string
		  
		  return ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).Text(thePlatform)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextForSelectedWindow(UIObjectIndex as integer, thePlatform as integer, Assigns theText as String)
		  ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).Text(thePlatform) = theText
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WidthForSelectedWindow(UIObjectIndex as integer, thePlatform as integer) As Integer
		  
		  dim i as integer
		  
		  i = ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).Width(thePlatform)
		  
		  return i
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WidthForSelectedWindow(UIObjectIndex as integer, thePlatform as integer, Assigns theWidth as integer)
		  ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).Width(thePlatform) = theWidth
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XForSelectedWindow(UIObjectIndex as integer, thePlatform as integer) As Integer
		  
		  dim i as integer
		  
		  i = ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).X(thePlatform)
		  
		  return i
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub XForSelectedWindow(UIObjectIndex as integer, thePlatform as integer, Assigns theX as integer)
		  ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).X(thePlatform) = theX
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function YForSelectedWindow(UIObjectIndex as integer, thePlatform as integer) As Integer
		  
		  dim i as integer
		  
		  i = ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).Y(thePlatform)
		  
		  return i
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub YForSelectedWindow(UIObjectIndex as integer, thePlatform as integer, Assigns theY as integer)
		  ilObjectWindow(frmProject.chartProject.selectedFrame.tag).theUIObjects(UIObjectIndex).Y(thePlatform) = theY
		  
		  
		  
		End Sub
	#tag EndMethod


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
