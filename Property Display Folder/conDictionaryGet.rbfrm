#tag Window
Begin ContainerControl conDictionaryGet
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
      Top             =   106
      Underline       =   ""
      Visible         =   True
      Width           =   159
   End
   Begin clsPopVariablesList popVariablesOrigin
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
      Text            =   "From This Dictionary:"
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
      Left            =   3
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
      Text            =   "Get This Key's Value:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   74
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   146
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
      Top             =   180
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
      Left            =   3
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "And Put It Into This Text:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   148
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   173
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  popVariablesOrigin.PopulateWithDicts
		  popVariablesOrigin.SelectVariableByName(ilObjectDictionaryGet(frmProject.chartProject.selectedFrame.tag).OriginVariable)
		  
		  popVariablesMath1.PopulateWithText
		  popVariablesMath1.SelectVariableByName(ilObjectDictionaryGet(frmProject.chartProject.selectedFrame.tag).MathVariable1)
		  
		  popVariablesMath2.PopulateWithText
		  popVariablesMath2.SelectVariableByName(ilObjectDictionaryGet(frmProject.chartProject.selectedFrame.tag).MathVariable2)
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events popVariablesMath1
	#tag Event
		Sub Change()
		  ilObjectDictionaryGet(frmProject.chartProject.selectedFrame.tag).MathVariable1 = me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popVariablesOrigin
	#tag Event
		Sub Change()
		  ilObjectDictionaryGet(frmProject.chartProject.selectedFrame.tag).OriginVariable = me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popVariablesMath2
	#tag Event
		Sub Change()
		  ilObjectDictionaryGet(frmProject.chartProject.selectedFrame.tag).MathVariable2 = me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
