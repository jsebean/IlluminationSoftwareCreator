#tag Window
Begin ContainerControl conNumberSetNumber
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
   Begin TextField txtCustomMessage
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
      InitialParent   =   ""
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   138
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   159
   End
   Begin clsPopVariablesList popVariablesToSet
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
      Top             =   204
      Underline       =   ""
      Visible         =   True
      Width           =   159
   End
   Begin CheckBox chkCustomMessage
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Custom Number"
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
      Scope           =   0
      State           =   1
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   106
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   156
   End
   Begin CheckBox chkUseVariable
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Variable"
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
      Scope           =   0
      State           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   172
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   146
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
      Text            =   "Set This Variable:"
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
      Text            =   "To This:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   74
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
		  popVariablesToSet.PopulateWithNumbers
		  popVariablesToSet.SelectVariableByName(ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).MessageFromVariable)
		  
		  popVariablesOrigin.PopulateWithNumbers
		  popVariablesOrigin.SelectVariableByName(ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).OriginVariable)
		  
		  chkCustomMessage.Value = not ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).UseVariableForMessage
		  chkUseVariable.Value = ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).UseVariableForMessage
		  
		  txtCustomMessage.Text = ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).CustomMessage
		  
		  if txtCustomMessage.Text = "" then
		    txtCustomMessage.Text = "0"
		    ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).CustomMessage = "0"
		  end if
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events txtCustomMessage
	#tag Event
		Sub TextChange()
		  
		  ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).CustomMessage = me.Text
		  
		  
		  if txtCustomMessage.Text = "" then
		    txtCustomMessage.Text = "0"
		    ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).CustomMessage = "0"
		  end if
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if IsNumeric( Key ) then
		    // Allow numeric
		    return false
		  elseif ( Key = "." ) and ( InStr( me.Text, "." ) = 0 ) and me.Text.Len > 0 then
		    // Handle decimal points
		    return false
		  elseif ASC( Key ) < 32 then
		    // Allow control keys (e.g. the backspace key)
		    return false
		  else
		    // Ignore all other input
		    return true
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events popVariablesToSet
	#tag Event
		Sub Change()
		  ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).MessageFromVariable = me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkCustomMessage
	#tag Event
		Sub Action()
		  ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).UseVariableForMessage = not me.Value
		  chkUseVariable.Value = not me.Value
		  ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).RequireMessageFromVariable = not me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkUseVariable
	#tag Event
		Sub Action()
		  ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).UseVariableForMessage = me.Value
		  chkCustomMessage.Value = not me.Value
		  ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).RequireMessageFromVariable = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popVariablesOrigin
	#tag Event
		Sub Change()
		  ilObjectNumberSetNumber(frmProject.chartProject.selectedFrame.tag).OriginVariable = me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
