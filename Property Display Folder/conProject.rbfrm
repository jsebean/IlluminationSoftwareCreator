#tag Window
Begin ContainerControl conProject
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
   Left            =   0
   LockBottom      =   ""
   LockLeft        =   ""
   LockRight       =   ""
   LockTop         =   ""
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   179
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Application Name"
      Enabled         =   True
      Height          =   55
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Visible         =   True
      Width           =   179
      Begin TextField txtApplicationName
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
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   13
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
         Text            =   "MyNewApplication"
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   21
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   153
      End
   End
   Begin GroupBox GroupBox3
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Version"
      Enabled         =   True
      Height          =   55
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   67
      Underline       =   ""
      Visible         =   True
      Width           =   179
      Begin TextField txtVersion
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
         InitialParent   =   "GroupBox3"
         Italic          =   ""
         Left            =   13
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
         Text            =   "1.0.0"
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   88
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   153
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  txtApplicationName.Text = modVariables.ProjectApplicationName
		  txtVersion.Text = modVariables.ProjectVersion
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events txtApplicationName
	#tag Event
		Sub TextChange()
		  modVariables.ProjectApplicationName = me.Text
		  frmProject.UpdateTitleBar
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
#tag Events txtVersion
	#tag Event
		Sub TextChange()
		  modVariables.ProjectVersion = me.Text
		End Sub
	#tag EndEvent
#tag EndEvents
