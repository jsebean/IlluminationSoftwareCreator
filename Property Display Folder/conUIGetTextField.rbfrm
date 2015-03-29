#tag Window
Begin ContainerControl conUIGetTextField
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
   Begin clsPopVariablesList popVariable
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   17
      ListIndex       =   0
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
      Top             =   180
      Underline       =   ""
      Visible         =   True
      Width           =   159
   End
   Begin clsPopVariablesList popOnWindow
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   20
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   32
      Underline       =   ""
      Visible         =   True
      Width           =   159
   End
   Begin Label StaticText1
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
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "On This Window:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   133
   End
   Begin Label StaticText2
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
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "In This Variable:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   148
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   137
   End
   Begin clsPopVariablesList popLabelControlName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   17
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   106
      Underline       =   ""
      Visible         =   True
      Width           =   159
   End
   Begin Label StaticText3
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
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Put The Text From This:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   74
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   159
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  popOnWindow.PopulateWithWindows
		  popOnWindow.SelectVariableByName(ilObjectUIGetTextField(frmProject.chartProject.selectedFrame.tag).varWindowName)
		  
		  popLabelControlName.PopulateWithControlsOfTypeFromWindow(ilObjectUIGetTextField(frmProject.chartProject.selectedFrame.tag).varWindowName, 8)
		  popLabelControlName.SelectVariableByName(ilObjectUIGetTextField(frmProject.chartProject.selectedFrame.tag).varControlName)
		  
		  popVariable.PopulateWithText
		  popVariable.SelectVariableByName(ilObjectUIGetTextField(frmProject.chartProject.selectedFrame.tag).MessageFromVariable)
		  
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events popVariable
	#tag Event
		Sub Change()
		  ilObjectUIGetTextField(frmProject.chartProject.selectedFrame.tag).MessageFromVariable = me.Text
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popOnWindow
	#tag Event
		Sub Change()
		  ilObjectUIGetTextField(frmProject.chartProject.selectedFrame.tag).varWindowName = me.Text
		  if me.Text <> "" then
		    popLabelControlName.PopulateWithControlsOfTypeFromWindow(ilObjectUIGetTextField(frmProject.chartProject.selectedFrame.tag).varWindowName, 8)
		    popLabelControlName.SelectVariableByName(ilObjectUIGetTextField(frmProject.chartProject.selectedFrame.tag).varControlName)
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popLabelControlName
	#tag Event
		Sub Change()
		  ilObjectUIGetTextField(frmProject.chartProject.selectedFrame.tag).varControlName = me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
