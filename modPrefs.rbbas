#tag Module
Protected Module modPrefs
	#tag Method, Flags = &h0
		Function getFlexCompiler() As FolderItem
		  if IsFlexSDKFolderGood(prefFlexSDKLocation) = true then
		    if modPrefs.prefFlexSDKLocation.Child("bin") <> nil then
		      if TargetLinux= true then
		        if modPrefs.prefFlexSDKLocation.Child("bin").Child("mxmlc") <> nil then
		          if modPrefs.prefFlexSDKLocation.Child("bin").Child("mxmlc").Exists = true then
		            Return modPrefs.prefFlexSDKLocation.Child("bin").Child("mxmlc") 
		          end if
		        end if
		      end if
		      
		      if TargetWin32= true then
		        if modPrefs.prefFlexSDKLocation.Child("bin").Child("mxmlc.exe") <> nil then
		          if modPrefs.prefFlexSDKLocation.Child("bin").Child("mxmlc.exe").Exists = true then
		            Return modPrefs.prefFlexSDKLocation.Child("bin").Child("mxmlc.exe")
		          end if
		        end if
		      end if
		      
		      
		      if TargetMacOS= true then
		        if modPrefs.prefFlexSDKLocation.Child("bin").Child("mxmlc") <> nil then
		          if modPrefs.prefFlexSDKLocation.Child("bin").Child("mxmlc").Exists = true then
		            Return modPrefs.prefFlexSDKLocation.Child("bin").Child("mxmlc")
		          end if
		        end if
		      end if
		      
		      
		    end if
		  end if
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFlexSDKFolderGood(f as FolderItem) As Boolean
		  if f <> nil then
		    if f.Exists = true then
		      if f.Directory = true then
		        if f.Child("bin") <> nil then
		          if f.Child("bin").Directory = true then
		            if f.Child("bin").Child("mxmlc") <> nil then
		              Return true
		            end if
		          end if
		        end if
		      end if
		    end if
		  end if
		  
		  if f = nil then
		    MsgBox "You must first set the location of the Flex SDK."
		    frmPreferences.Show
		  end if
		  
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isRegGood() As boolean
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadAllPrefs()
		  prefFirstRun = getPrefBoolean("prefFirstRun", true)
		  prefFlexSDKLocation = GetPrefFolderItem("prefFlexSDKLocation",nil)
		  defaultRunTarget = GetPrefNumber("defaultRunTarget", 0)
		  prefLastUIEdited = GetPrefNumber("prefLastUIEdited", 6)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowUnregisteredDialog()
		  Dim d as New MessageDialog  //declare the MessageDialog object
		  Dim b as MessageDialogButton //for handling the result
		  d.icon=MessageDialog.GraphicCaution   //display warning icon
		  d.ActionButton.Caption="Purchase Upgrade"
		  d.CancelButton.Visible=True     //show the Cancel button
		  d.AlternateActionButton.Visible=True   //show the "Don't Save" button
		  d.AlternateActionButton.Caption="Enter Code"
		  d.Message="You are using Illumination Software Creator Free Edition."
		  d.Explanation="The feature you are trying to use requires upgrading to the Deluxe Edition."
		  
		  b=d.ShowModal     //display the dialog
		  Select Case b //determine which button was pressed.
		  Case d.ActionButton
		    ShowURL "http://lunduke.com/?page_id=3500"
		  Case d.AlternateActionButton
		    frmReg.Show
		  Case d.CancelButton
		    //user pressed Cancel
		  End select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteAllPrefs()
		  prefFirstRun = false
		  
		  setPrefBoolean("prefFirstRun", false)
		  setPrefFolderItem("prefFlexSDKLocation",prefFlexSDKLocation)
		  SetPrefNumber("defaultRunTarget", defaultRunTarget)
		  
		  setPrefNumber("prefLastUIEdited", prefLastUIEdited)
		  
		  
		  WritePrefsFile()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		defaultRunTarget As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		prefFirstRun As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		prefFlexSDKLocation As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		prefLastUIEdited As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		regCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		regName As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="defaultRunTarget"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
			Name="prefFirstRun"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="prefLastUIEdited"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="regCode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="regName"
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
