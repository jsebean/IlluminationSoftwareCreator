#tag Window
Begin ContainerControl conPortalDestination
   AcceptFocus     =   ""
   AcceptTabs      =   ""
   AutoDeactivate  =   True
   BackColor       =   16777215
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   455
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   ""
   LockLeft        =   ""
   LockRight       =   ""
   LockTop         =   ""
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   179
   Begin TextField txtPortalName
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
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   20
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "ThisPortal"
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   33
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   153
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
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Portal Name:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   9
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  txtPortalName.Text = ilObjectPortalDestination(frmProject.chartProject.selectedFrame.tag).OriginVariable
		  if txtPortalName.Text = "" then
		    txtPortalName.Text = "NewPortal"
		  end if
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events txtPortalName
	#tag Event
		Sub TextChange()
		  ilObjectPortalDestination(frmProject.chartProject.selectedFrame.tag).OriginVariable = txtPortalName.Text
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  // Numbers
		  if asc(key) >= 48 and asc(key) <= 57 then
		    Return false
		  end if
		  
		  // Big Letters
		  if asc(key) >= 65 and asc(key) <= 90 then
		    Return false
		  end if
		  
		  
		  // Small letters
		  if asc(key) >= 97 and asc(key) <= 122 then
		    Return false
		  end if
		  
		  if asc(key) = 127 or asc(key) = 8 then // Delete
		    Return false
		  end if
		  
		  Return true
		  
		End Function
	#tag EndEvent
#tag EndEvents
