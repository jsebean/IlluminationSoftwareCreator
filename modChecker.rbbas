#tag Module
Protected Module modChecker
	#tag Method, Flags = &h0
		Function CheckProjectForErrors() As Boolean
		  // Loop through all the variables in the project and check the name
		  dim i as integer
		  
		  if modVariables.projectVariables.Ubound > -1 then
		    for i = 0 to modVariables.projectVariables.Ubound
		      
		      if isVariableNameOK(modVariables.projectVariables(i).Name) = true then
		        // True = good variable naming
		        
		      else
		        // False = bad variable naming
		        Return false
		      end if
		      
		    next
		  end if
		  
		  
		  // Loop through each frame
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    'ilObjectBase(frame.tag).
		    
		    // Make sure each variable that is required is set.
		    
		    if ilObjectBase(frame.tag).RequireMathVariable1 = true then
		      if isVariableGood(ilObjectBase(frame.tag).MathVariable1) = false then
		        MsgBox "Please set the required values for this " + ilObjectBase(frame.tag).DisplayName + " block before Building or Running."
		        frmProject.chartProject.SelectFrame(frame)
		        Return false
		      end if
		    end if
		    
		    if ilObjectBase(frame.tag).RequireMathVariable2 = true then
		      if isVariableGood(ilObjectBase(frame.tag).MathVariable2) = false then
		        MsgBox "Please set the required values for this " + ilObjectBase(frame.tag).DisplayName + " block before Building or Running."
		        frmProject.chartProject.SelectFrame(frame)
		        Return false
		      end if
		    end if
		    
		    if ilObjectBase(frame.tag).RequireMathVariable3 = true then
		      if isVariableGood(ilObjectBase(frame.tag).MathVariable3) = false then
		        MsgBox "Please set the required values for this " + ilObjectBase(frame.tag).DisplayName + " block before Building or Running."
		        frmProject.chartProject.SelectFrame(frame)
		        Return false
		      end if
		    end if
		    
		    if ilObjectBase(frame.tag).RequireMathVariable4 = true then
		      if isVariableGood(ilObjectBase(frame.tag).MathVariable4) = false then
		        MsgBox "Please set the required values for this " + ilObjectBase(frame.tag).DisplayName + " block before Building or Running."
		        frmProject.chartProject.SelectFrame(frame)
		        Return false
		      end if
		    end if
		    
		    if ilObjectBase(frame.tag).RequireMessageFromVariable = true then
		      
		      if frame.tag isa ilObjectUISetCanvasFromPicture then
		        
		        if isPictureGood(ilObjectBase(frame.tag).MessageFromVariable) = false then
		          MsgBox "Please set the required values for this " + ilObjectBase(frame.tag).DisplayName + " block before Building or Running."
		          frmProject.chartProject.SelectFrame(frame)
		          Return false
		        end if
		        
		      else
		        
		        if isVariableGood(ilObjectBase(frame.tag).MessageFromVariable) = false then
		          MsgBox "Please set the required values for this " + ilObjectBase(frame.tag).DisplayName + " block before Building or Running."
		          frmProject.chartProject.SelectFrame(frame)
		          Return false
		        end if
		        
		      end if
		      
		    end if
		    
		    if ilObjectBase(frame.tag).RequireOriginVariable = true then
		      
		      if frame.tag isa ilObjectPortalDeparture then
		        
		        if isDestinationGood(ilObjectPortalDeparture(frame.tag).OriginVariable) = false then
		          MsgBox "Please set the required values for this " + ilObjectBase(frame.tag).DisplayName + " block before Building or Running."
		          frmProject.chartProject.SelectFrame(frame)
		          Return false
		        end if
		        
		      else
		        
		        if isVariableGood(ilObjectBase(frame.tag).OriginVariable) = false then
		          MsgBox "Please set the required values for this " + ilObjectBase(frame.tag).DisplayName + " block before Building or Running."
		          frmProject.chartProject.SelectFrame(frame)
		          Return false
		        end if
		        
		      end if
		    end if
		    
		    
		    if ilObjectBase(frame.tag).RequirevarWindowName = true then
		      if isWindowGood(ilObjectBase(frame.tag).varWindowName) = false then
		        MsgBox "Please set the required values for this " + ilObjectBase(frame.tag).DisplayName + " block before Building or Running."
		        frmProject.chartProject.SelectFrame(frame)
		        Return false
		      end if
		      
		    end if
		    
		    if ilObjectBase(frame.tag).RequirevarControlName = true then
		      if isControlGood(ilObjectBase(frame.tag).varWindowName, ilObjectBase(frame.tag).varControlName) = false then
		        MsgBox "Please set the required values for this " + ilObjectBase(frame.tag).DisplayName + " block before Building or Running."
		        frmProject.chartProject.SelectFrame(frame)
		        Return false
		      end if
		      
		    end if
		    
		  next
		  
		  Return true // No Errors
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isControlGood(theWindowName as string, theControlName as string) As boolean
		  
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    if frame.tag isa ilObjectWindow then
		      if ilObjectWindow(frame.tag).theWindowObject.Name = theWindowName then
		        
		        for each uiControl as ilUIObject in ilObjectWindow(frame.tag).theUIObjects
		          
		          if uiControl.Name = theControlName then
		            
		            Return true
		            
		          end if
		          
		        next
		        
		      end if
		    end if
		    
		  next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isDestinationGood(theDestination as String) As boolean
		  
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    if frame.tag isa ilObjectPortalDestination then
		      if ilObjectPortalDestination(frame.tag).OriginVariable = theDestination then
		        Return true
		      end if
		    end if
		    
		  next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isPictureGood(theVariable as String) As boolean
		  // Loop through the variable array to make sure it exists
		  
		  dim i as integer
		  
		  if trim(theVariable) <> "" then
		    if modVariables.projectImages.Ubound > -1 then
		      for i = 0 to modVariables.projectImages.Ubound
		        
		        if modVariables.projectImages(i).Name = theVariable then
		          Return true
		        end if
		        
		      next
		    end if
		  end if
		  
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isVariableGood(theVariable as String) As boolean
		  // Loop through the variable array to make sure it exists
		  
		  dim i as integer
		  
		  if trim(theVariable) <> "" then
		    
		    if modVariables.projectVariables.Ubound > -1 then
		      for i = 0 to modVariables.projectVariables.Ubound
		        
		        if modVariables.projectVariables(i).Name = theVariable then
		          Return true
		        end if
		        
		      next
		    end if
		    
		    
		  end if
		  
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isVariableNameOK(theVariable as String) As Boolean
		  
		  if theVariable.InStr("-") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '-' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr("/") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '/' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr("\") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '\' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr(".") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '.' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr("*") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '*' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr("+") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '+' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr("%") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '%' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr("!") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '!' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr(" ") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a space which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr("#") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '#' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr("@") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '@' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr("<") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '>' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  if theVariable.InStr(">") > 0 then
		    MsgBox "Variable '" + theVariable + " ' contans a '>' which is not allowed.  Please update this variable name before building or running."
		    Return false
		  end if
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isWindowGood(theWindowName as String) As boolean
		  
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    if frame.tag isa ilObjectWindow then
		      if ilObjectWindow(frame.tag).theWindowObject.Name = theWindowName then
		        Return true
		      end if
		    end if
		    
		  next
		  
		  Return False
		End Function
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
