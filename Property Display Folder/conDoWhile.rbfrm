#tag Window
Begin ContainerControl conDoWhile
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
   Begin clsPopVariablesList popVariablesMath1
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
      TabIndex        =   5
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
   Begin clsPopVariablesList popVariablesCustomMessage
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "=\n>\n<\n<>"
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
      Top             =   74
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
      Left            =   3
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
      Text            =   "Loop While This is True:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   173
   End
   Begin clsPopVariablesList popVariablesMath2
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
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   116
      Underline       =   ""
      Visible         =   True
      Width           =   159
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  popVariablesMath1.PopulateWithNumbers
		  popVariablesMath1.SelectVariableByName(ilObjectDoWhile(frmProject.chartProject.selectedFrame.tag).MathVariable1)
		  
		  popVariablesMath2.PopulateWithNumbers
		  popVariablesMath2.SelectVariableByName(ilObjectDoWhile(frmProject.chartProject.selectedFrame.tag).MathVariable2)
		  
		  popVariablesCustomMessage.SelectVariableByName(ilObjectDoWhile(frmProject.chartProject.selectedFrame.tag).CustomMessage)
		  if popVariablesCustomMessage.ListIndex = -1 then
		    popVariablesCustomMessage.ListIndex = 0
		  end if
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events popVariablesMath1
	#tag Event
		Sub Change()
		  ilObjectDoWhile(frmProject.chartProject.selectedFrame.tag).MathVariable1 = me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popVariablesCustomMessage
	#tag Event
		Sub Change()
		  ilObjectDoWhile(frmProject.chartProject.selectedFrame.tag).CustomMessage = me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popVariablesMath2
	#tag Event
		Sub Change()
		  
		  
		  ilObjectDoWhile(frmProject.chartProject.selectedFrame.tag).MathVariable2 = me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
