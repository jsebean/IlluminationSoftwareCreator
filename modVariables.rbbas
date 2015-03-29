#tag Module
Protected Module modVariables
	#tag Method, Flags = &h0
		Function AddNewImageFileFromFile(theFile as FolderItem) As boolean
		  dim b as BinaryStream
		  
		  dim t as classVariables
		  t = new classVariables
		  
		  'if VariableObjectFromName(theFile.Name) <> nil then
		  'Return false //File Name already exists as other var
		  'end if
		  
		  dim s as string
		  
		  s = ReplaceAll(theFile.Name,".jpg", "")
		  s = ReplaceAll(s,".jpeg", "")
		  s = ReplaceAll(s,".png", "")
		  
		  t.Name = s
		  
		  t.FileName = theFile.Name
		  
		  If theFile <> Nil then
		    
		    b=BinaryStream.Open(theFile,False)
		    t.ImageData=b.Read(b.Length)
		    b.Close
		    
		    t.TheImage = Picture.Open(theFile)
		    
		  end if
		  
		  
		  
		  projectImages.Append t
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddNewImageFileFromInfo(fileName as string, usedName as string, binaryBlob as string) As boolean
		  
		  dim t as classVariables
		  t = new classVariables
		  
		  'if VariableObjectFromName(theFile.Name) <> nil then
		  'Return false //File Name already exists as other var
		  'end if
		  
		  t.Name = usedName
		  t.FileName = fileName
		  t.ImageData=binaryBlob
		  
		  // Write out the blob to temp
		  
		  dim writeFile as FolderItem
		  writeFile = SpecialFolder.Temporary.Child(t.ActualFileName)
		  If writeFile <> Nil Then
		    dim writeStream as BinaryStream = BinaryStream.Create(writeFile, true)
		    writeStream.Write(binaryBlob)
		    writeStream.Close
		  End If
		  
		  // Load the Image
		  t.TheImage = Picture.Open(writeFile)
		  
		  // Delete the Temp File
		  writeFile.Delete
		  
		  projectImages.Append t
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddNewVariable(theName as string, theType as string, theDefault as string) As boolean
		  dim t as classVariables
		  t = new classVariables
		  
		  if VariableObjectFromName(theName) <> nil then
		    Return false //Name already exists
		  end if
		  
		  t.Name = theName
		  t.Type = theType
		  t.DefaultVal = theDefault
		  
		  projectVariables.Append t
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAllProjectImageFiles()
		  dim i as integer
		  
		  if projectImages.Ubound >= 0 then
		    
		    for i = projectImages.Ubound DownTo 0
		      projectImages.Remove(i)
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAllProjectVariables()
		  dim i as integer
		  
		  if projectVariables.Ubound >= 0 then
		    
		    for i = projectVariables.Ubound DownTo 0
		      projectVariables.Remove(i)
		    next
		    
		  end if
		  
		  ClearAllProjectImageFiles
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorToString(C as Color) As string
		  dim s as string
		  
		  s = Right("00"+Hex(C.Red), 2)
		  s = s + Right("00"+Hex(C.Green), 2)
		  s = s + Right("00"+Hex(C.Blue), 2)
		  s = "#" + s
		  
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteVariable(theName as string)
		  dim i as integer
		  
		  if projectVariables.Ubound > -1 then
		    for i = projectVariables.Ubound DownTo 0
		      if Lowercase(projectVariables(i).Name) = Lowercase(theName) then
		        projectVariables.Remove(i)
		      end if
		    next
		  end if
		  
		  frmProject.populateListVariables
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportAllImages(ToFolder as FolderItem)
		  dim i as integer
		  
		  if ToFolder <> nil then
		    
		    if ToFolder.Exists = false then
		      ToFolder.CreateAsFolder
		    end if
		    
		    if projectImages.Ubound > -1 then
		      
		      for i = projectImages.Ubound DownTo 0
		        
		        projectImages(i).ExportImageToFile(ToFolder)
		        
		      next
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAndroidPackage() As string
		  Return "com.isc." + GetSpaceFreeAppName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDictFromString(theString as string) As Dictionary
		  dim pairsLoop as integer
		  dim d as new Dictionary
		  dim s as string
		  
		  if theString.CountFields("%$bp$%") > 0 then
		    for pairsLoop = 1 to theString.CountFields("%$bp$%") 
		      
		      s = theString.NthField("%$bp$%", pairsLoop)
		      
		      if s.CountFields("%$kv$%") > 1 then
		        
		        d.Value(s.NthField("%$kv$%",1)) = s.NthField("%$kv$%",2)
		        
		      end if
		    next
		  end if
		  
		  Return d
		  
		  // Sep between Key/Value : %$kv$%
		  // Sep between pairs : %$bp$%
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetiOSDelegateName() As string
		  Return GetSpaceFreeAppName + "AppDelegate"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getProjectImageFromName(theName as String) As classVariables
		  dim i as integer
		  
		  if projectImages.Ubound >= 0 then
		    
		    for i = projectImages.Ubound DownTo 0
		      
		      if projectImages(i).Name = theName then
		        Return projectImages(i)
		      end if
		      
		    next
		    
		  end if
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSpaceFreeAppName() As String
		  Return ReplaceAll(ProjectApplicationName, " ", "")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStringFromDict(theDict as Dictionary) As string
		  
		  
		  // Sep between Key/Value : %$kv$%
		  // Sep between pairs : %$bp$%
		  
		  dim pairsLoop as integer
		  dim finalString as string
		  dim thisPair as string
		  
		  if theDict.Count > 0 then
		    for pairsLoop = 0 to (theDict.Count - 1)
		      
		      thisPair = theDict.Key(pairsLoop).StringValue + "%$kv$%" + theDict.Value(theDict.Key(pairsLoop)).StringValue
		      if finalString = "" then
		        finalString = thisPair
		      else
		        finalString = finalString + "%$bp$%"  + thisPair
		      end if
		      
		    next
		  end if
		  
		  Return finalString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HexFromColor(c as Color) As string
		  dim s as string
		  
		  s = Right("00"+Hex(C.Red), 2)
		  s = s + Right("00"+Hex(C.Green), 2)
		  s = s + Right("00"+Hex(C.Blue), 2)
		  s = "&h" + s
		  
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeProjectImageWithName(theName as String)
		  dim i as integer
		  
		  if projectImages.Ubound >= 0 then
		    
		    for i = projectImages.Ubound DownTo 0
		      
		      if projectImages(i).Name = theName then
		        projectImages.Remove(i)
		      end if
		      
		    next
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringToColor(src as string) As Color
		  dim R, G, B as integer
		  
		  R = Val("&h"+Mid(src, 2, 2))
		  G = Val("&h"+Mid(src, 4, 2))
		  B = Val("&h"+Mid(src, 6, 2))
		  
		  return RGB(R, G, B)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariableObjectFromName(theName as String) As classVariables
		  dim i as integer
		  
		  if projectVariables.Ubound >= 0 then
		    
		    for i = 0 to projectVariables.Ubound
		      
		      if Lowercase(projectVariables(i).Name) = Lowercase(theName) then
		        Return projectVariables(i)
		      end if
		      
		    next
		    
		  end if
		  
		  Return nil
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ProjectApplicationName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		projectImages() As classVariables
	#tag EndProperty

	#tag Property, Flags = &h0
		projectVariables() As classVariables
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectVersion As string
	#tag EndProperty


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
			Name="ProjectApplicationName"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProjectVersion"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
