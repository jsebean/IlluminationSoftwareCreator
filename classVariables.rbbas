#tag Class
Protected Class classVariables
	#tag Method, Flags = &h0
		Sub ExportImageToFile(TheFolder as FolderItem)
		  '// Write out the blob
		  '
		  'dim writeFile as FolderItem
		  'writeFile = TheFolder.Child(FileName)
		  'If writeFile <> Nil Then
		  'dim writeStream as BinaryStream = BinaryStream.Create(writeFile, true)
		  'writeStream.Write(ImageData)
		  'writeStream.Close
		  'End If
		  '
		  '
		  '
		  
		  // Save image as jpg
		  
		  
		  dim writeFile as FolderItem
		  writeFile = TheFolder.Child(ActualFileName)
		  If writeFile <> Nil Then
		    if writeFile.Exists = false then
		      
		      TheImage.Save(writeFile, Picture.SaveAsJPEG, Picture.QualityHigh)
		      
		    end if
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDefaultDictAsDict() As Dictionary
		  dim pairsLoop as integer
		  dim d as new Dictionary
		  dim s as string
		  
		  if DefaultVal.CountFields("%$bp$%") > 0 then
		    for pairsLoop = 1 to DefaultVal.CountFields("%$bp$%") 
		      
		      s = DefaultVal.NthField("%$bp$%", pairsLoop)
		      
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
		Function ISCClassLocalAndroidName() As string
		  dim s as string
		  
		  s = "iscV" + Name
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ISCClassLocalFlexName() As string
		  dim s as string
		  
		  s = "iscV" + Name
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ISCClassLocalPythonName() As string
		  dim s as string
		  
		  s = "iscV" + Name
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ISCiOSName() As string
		  dim s as string
		  
		  s = "iscV" + Name
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ISCPythonName() As String
		  dim s as string
		  
		  s = "thisiscApp1.iscV" + Name
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDefaultDictFromDict(theDict as Dictionary)
		  
		  
		  // Sep between Key/Value : %$kv$%
		  // Sep between pairs : %$bp$%
		  
		  dim pairsLoop as integer
		  dim finalString as string
		  dim thisPair as string
		  
		  if theDict.Count > 0 then
		    for pairsLoop = 0 to (theDict.Count - 1)
		      
		      thisPair = theDict.Key(pairsLoop).StringValue + "%$bp$%" + theDict.Value(theDict.Key(pairsLoop)).StringValue
		      if finalString = "" then
		        finalString = thisPair
		      else
		        finalString = finalString + "%$bp$%"  + thisPair
		      end if
		      
		    next
		  end if
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return name + ".jpg"
			End Get
		#tag EndGetter
		ActualFileName As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mDefaultVal = "" then
			    if Type = "Number" then
			      mDefaultVal = "0"
			    end if
			  else
			    
			  end if
			  
			  
			  Return mDefaultVal
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaultVal = value
			End Set
		#tag EndSetter
		DefaultVal As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		FileName As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return "isc" + ActualFileName.ReplaceAll(".","")
			  
			End Get
		#tag EndGetter
		FlexEmbedName As string
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ImageData As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if myioskey1.Len > 0 then
			    Return myioskey1
			  else
			    dim i as integer
			    dim r as new Random
			    i = r.InRange(11111111,99999999)
			    myioskey1 = str(i)
			    i = r.InRange(11111111,99999999)
			    myioskey1 = myioskey1 + str(i)
			    i = r.InRange(11111111,99999999)
			    myioskey1 = myioskey1 + str(i)
			    Return myioskey1
			  end if
			End Get
		#tag EndGetter
		iOSKey1 As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if myioskey2.Len > 0 then
			    Return myioskey2
			  else
			    dim i as integer
			    dim r as new Random
			    i = r.InRange(11111111,99999999)
			    myioskey2 = str(i)
			    i = r.InRange(11111111,99999999)
			    myioskey2 = myioskey2 + str(i)
			    i = r.InRange(11111111,99999999)
			    myioskey2 = myioskey2 + str(i)
			    Return myioskey2
			  end if
			End Get
		#tag EndGetter
		iOSKey2 As string
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDefaultVal As string
	#tag EndProperty

	#tag Property, Flags = &h0
		myioskey1 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		myioskey2 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mDefaultVal.InStr("*") > -1 then
			    
			    Return Val(NthField(mDefaultVal,"*",1))
			    
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  dim curHeight as integer
			  dim curWidth as integer
			  
			  if mDefaultVal.InStr("*") > -1 then
			    
			    curHeight = me.PictureHeight
			    curWidth = me.PictureWidth
			    
			  end if
			  
			  DefaultVal = Str(value) + "*" + str(curWidth)
			  
			End Set
		#tag EndSetter
		PictureHeight As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mDefaultVal.InStr("*") > -1 then
			    
			    Return Val(NthField(mDefaultVal,"*",2))
			    
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  dim curHeight as integer
			  dim curWidth as integer
			  
			  if mDefaultVal.InStr("*") > -1 then
			    
			    curHeight = me.PictureHeight
			    curWidth = me.PictureWidth
			    
			  end if
			  
			  DefaultVal = Str(curHeight) + "*" + str(value)
			  
			End Set
		#tag EndSetter
		PictureWidth As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		TheImage As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ActualFileName"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultVal"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileName"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FlexEmbedName"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageData"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iOSKey1"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iOSKey2"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="myioskey1"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="myioskey2"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PictureHeight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PictureWidth"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TheImage"
			Group="Behavior"
			Type="picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
