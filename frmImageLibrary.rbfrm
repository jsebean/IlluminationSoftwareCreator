#tag Window
Begin Window frmImageLibrary
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   700
   Placement       =   0
   Resizeable      =   True
   Title           =   "Image Library"
   Visible         =   True
   Width           =   700
   Begin RadThumbnailView thumbImages
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      BackColor       =   16777215
      Backdrop        =   ""
      BackGroundColor =   0
      DoubleClickTime =   15
      DrawThumbShadow =   0
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   380
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectionColor  =   0
      SelectionTextColor=   0
      SuspendDrawing  =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   0
      TheSelectedThumb=   0
      ThumbShadowColor=   0
      Top             =   0
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   472
   End
   Begin toolImageLib toolImageLib1
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   37
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -62
      Visible         =   True
      Width           =   209
   End
   Begin TextField txtName
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   484
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   104
   End
   Begin PushButton btnName
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Rename"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   600
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   15
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   488
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Width :"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   48
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   488
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Height :"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   80
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label lblWidth
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   600
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   48
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label lblHeight
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   600
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   80
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  LoadAllThumbs
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub LoadAllThumbs()
		  dim i as integer
		  
		  thumbImages.RemoveAllPictures
		  
		  if modVariables.projectImages.Ubound > -1 then
		    for i = 0 to modVariables.projectImages.Ubound
		      thumbImages.AddNewPicture(modVariables.projectImages(i).TheImage, modVariables.projectImages(i).Name)
		    next
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ImageBeingUpdated As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ImageSelected As string
	#tag EndProperty


#tag EndWindowCode

#tag Events thumbImages
	#tag Event
		Sub ThumbSelected(index as integer)
		  if index = -1 then
		    
		    txtName.Text = ""
		    lblWidth.Text = ""
		    lblHeight.Text = ""
		    ImageSelected = ""
		    
		  end if
		  
		  if index > -1 then
		    
		    dim myImage as classVariables
		    
		    myImage = getProjectImageFromName(thumbImages.ThumbnailPictureAtIndex(index).Name)
		    
		    if myImage <> nil then
		      txtName.Text = myImage.Name
		      lblWidth.Text = str(myImage.TheImage.Width)
		      lblHeight.Text = str(myImage.TheImage.Height)
		    end if
		    
		    ImageSelected = myImage.Name
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events toolImageLib1
	#tag Event
		Sub Action(item As ToolItem)
		  
		  select case item.Name
		    
		    
		  case "toolAdd"
		    Dim jpegType as New FileType
		    jpegType.Name = "image/jpeg"
		    jpegType.MacType = "JPEG"
		    jpegType.Extensions = "jpg;jpeg"
		    
		    Dim pngType As New FileType
		    pngType.Name = "image/png"
		    pngType.MacType = "PNG "
		    pngType.Extensions = "png"
		    
		    Dim f As FolderItem
		    
		    f =GetOpenFolderItem(jpegType + pngType)
		    
		    if f <> nil then
		      
		      if modVariables.AddNewImageFileFromFile(f) then
		        // Successfully added, so add to thumbnail view
		        thumbImages.AddNewPicture(modVariables.projectImages(modVariables.projectImages.Ubound).TheImage, modVariables.projectImages(modVariables.projectImages.Ubound).Name)
		      end if
		      
		    end if
		    
		  case "toolRemove"
		    
		    if ImageSelected <> "" then
		      modVariables.removeProjectImageWithName(ImageSelected)
		      LoadAllThumbs
		    end if
		    
		    
		  end Select
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnName
	#tag Event
		Sub Action()
		  if me.Caption = "Rename" then
		    
		    if txtName.Text <> "" then // is a thumb selected
		      
		      thumbImages.Enabled = false // Disable thumb view
		      me.Caption = "Save"
		      txtName.Enabled = true
		      ImageBeingUpdated = txtName.Text
		      toolImageLib1.Item(0).Enabled = false
		      toolImageLib1.Item(1).Enabled = false
		    end if
		    
		  ElseIf me.Caption = "Save" then
		    
		    if txtName.Text <> "" then // is the name longer than nothing?
		      
		      dim myImage as classVariables
		      myImage = getProjectImageFromName(ImageBeingUpdated)
		      
		      dim myNewName as string
		      
		      myNewName = trim(txtName.Text)
		      
		      if myImage.Name <> myNewName then
		        
		        dim otherImage as classVariables
		        otherImage = getProjectImageFromName(myNewName)
		        
		        if otherImage <> nil then
		          
		          MsgBox "The name " + myNewName + " is already in use.  Please choose a different name for this image."
		          Return
		          
		        else
		          
		          getProjectImageFromName(ImageBeingUpdated).Name = myNewName
		          LoadAllThumbs
		          
		        end if
		        
		      end if
		      
		      me.Caption = "Rename"
		      thumbImages.Enabled = true
		      txtName.Enabled = false
		      toolImageLib1.Item(0).Enabled = true
		      toolImageLib1.Item(1).Enabled = true
		    end if
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
