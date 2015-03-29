#tag Class
Protected Class clsPopVariablesList
Inherits PopupMenu
	#tag Method, Flags = &h0
		Sub PopulateWithColors()
		  me.DeleteAllRows
		  
		  dim i as integer
		  
		  if modVariables.projectVariables.Ubound >=0 then
		    
		    for i = 0 to modVariables.projectVariables.Ubound
		      
		      if modVariables.projectVariables(i).Type = "Color" then
		        me.AddRow modVariables.projectVariables(i).Name
		      end if
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateWithControlsOfTypeFromWindow(theWindowName as string, controlType as Integer)
		  dim tempWin as ilObjectWindow
		  dim i as integer
		  
		  me.DeleteAllRows
		  
		  tempWin = getilObjectWindowFromName(theWindowName)
		  
		  if tempWin <> nil then
		    
		    // Loop through all objects, looking for controls
		    if tempWin.theUIObjects.Ubound > -1 then
		      for i = 0 to tempWin.theUIObjects.Ubound
		        
		        if tempWin.theUIObjects(i).ControlType = controlType then
		          me.AddRow tempWin.theUIObjects(i).Name
		        end if
		        
		      next
		    end if
		    
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateWithDicts()
		  me.DeleteAllRows
		  
		  dim i as integer
		  
		  if modVariables.projectVariables.Ubound >=0 then
		    
		    for i = 0 to modVariables.projectVariables.Ubound
		      
		      if modVariables.projectVariables(i).Type = "Dictionary" then
		        me.AddRow modVariables.projectVariables(i).Name
		      end if
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateWithNumbers()
		  me.DeleteAllRows
		  
		  dim i as integer
		  
		  if modVariables.projectVariables.Ubound >=0 then
		    
		    for i = 0 to modVariables.projectVariables.Ubound
		      
		      if modVariables.projectVariables(i).Type = "Number" then
		        me.AddRow modVariables.projectVariables(i).Name
		      end if
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateWithPictures()
		  me.DeleteAllRows
		  
		  dim i as integer
		  
		  if modVariables.projectImages.Ubound >=0 then
		    
		    for i = 0 to modVariables.projectImages.Ubound
		      
		      me.AddRow modVariables.projectImages(i).Name
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateWithPortals()
		  me.DeleteAllRows
		  
		  dim i as integer
		  
		  // Loop through all frames, looking for ilObjectPortalDestination
		  
		  for i = 0 to frmProject.chartProject.frames.Ubound
		    
		    if frmProject.chartProject.frames(i).tag isa ilObjectPortalDestination then
		      me.AddRow ilObjectPortalDestination(frmProject.chartProject.frames(i).tag).OriginVariable
		    end if
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateWithText()
		  me.DeleteAllRows
		  
		  dim i as integer
		  
		  if modVariables.projectVariables.Ubound >=0 then
		    
		    for i = 0 to modVariables.projectVariables.Ubound
		      
		      if modVariables.projectVariables(i).Type = "Text" then
		        me.AddRow modVariables.projectVariables(i).Name
		      end if
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateWithTextFiles()
		  me.DeleteAllRows
		  
		  dim i as integer
		  
		  if modVariables.projectVariables.Ubound >=0 then
		    
		    for i = 0 to modVariables.projectVariables.Ubound
		      
		      if modVariables.projectVariables(i).Type = "Text File" then
		        me.AddRow modVariables.projectVariables(i).Name
		      end if
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateWithWindows()
		  me.DeleteAllRows
		  
		  dim i as integer
		  
		  // Loop through all frames, looking for ilObjectWindow
		  
		  for i = 0 to frmProject.chartProject.frames.Ubound
		    
		    if frmProject.chartProject.frames(i).tag isa ilObjectWindow then
		      me.AddRow ilObjectWindow(frmProject.chartProject.frames(i).tag).theWindowObject.Name
		    end if
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectVariableByName(name as string)
		  dim i as integer
		  
		  if me.ListCount > 0 then
		    for i = 0 to (me.ListCount - 1)
		      if Lowercase(me.List(i)) = Lowercase(name) then
		        me.ListIndex = i
		      end if
		    next
		  end if
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="20"
			Type="Integer"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListIndex"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			InheritedFrom="PopupMenu"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="80"
			Type="Integer"
			InheritedFrom="PopupMenu"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
