#tag Window
Begin Window frmNewVariable
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   288
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   False
   Title           =   ""
   Visible         =   True
   Width           =   294
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Variable Name"
      Enabled         =   True
      Height          =   61
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   254
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
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   34
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
         Text            =   ""
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   40
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   224
      End
   End
   Begin GroupBox GroupBox2
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Variable Type"
      Enabled         =   True
      Height          =   61
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   87
      Underline       =   ""
      Visible         =   True
      Width           =   254
      Begin clsPopVariablesList popType
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   30
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         InitialValue    =   "Text\rNumber\rDictionary\rText File"
         Italic          =   ""
         Left            =   34
         ListIndex       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   109
         Underline       =   ""
         Visible         =   True
         Width           =   224
      End
   End
   Begin PagePanel pageDefault
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   86
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      PanelCount      =   6
      Panels          =   ""
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   151
      Value           =   5
      Visible         =   True
      Width           =   294
      Begin GroupBox GroupBox3
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Default Text"
         Enabled         =   True
         Height          =   61
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pageDefault"
         Italic          =   ""
         Left            =   20
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   160
         Underline       =   ""
         Visible         =   True
         Width           =   254
         Begin TextField txtDefaultText
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
            Left            =   34
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
            TabIndex        =   2
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   186
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   224
         End
      End
      Begin GroupBox GroupBox4
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Default Number"
         Enabled         =   True
         Height          =   61
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pageDefault"
         Italic          =   ""
         Left            =   20
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   160
         Underline       =   ""
         Visible         =   True
         Width           =   254
         Begin TextField txtDefaultNumber
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
            InitialParent   =   "GroupBox4"
            Italic          =   ""
            Left            =   34
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
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   186
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   224
         End
      End
      Begin GroupBox GroupBox5
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Default Color"
         Enabled         =   True
         Height          =   61
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pageDefault"
         Italic          =   ""
         Left            =   20
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   160
         Underline       =   ""
         Visible         =   True
         Width           =   254
         Begin ColorsPicker colorDefaultColor
            AcceptFocus     =   ""
            AcceptTabs      =   ""
            AutoDeactivate  =   True
            Backdrop        =   ""
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox5"
            Left            =   34
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   ""
            LockTop         =   True
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   3
            TabStop         =   True
            Top             =   182
            UseFocusRing    =   True
            Visible         =   True
            Width           =   224
         End
      End
      Begin GroupBox GroupBox6
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Default File Path"
         Enabled         =   True
         Height          =   61
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pageDefault"
         Italic          =   ""
         Left            =   20
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   160
         Underline       =   ""
         Visible         =   True
         Width           =   254
         Begin TextField txtDefaultTextFilePath
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
            InitialParent   =   "GroupBox6"
            Italic          =   ""
            Left            =   34
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
            TabIndex        =   5
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   186
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   224
         End
      End
      Begin GroupBox GroupBox7
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Default Height and Width"
         Enabled         =   True
         Height          =   61
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pageDefault"
         Italic          =   ""
         Left            =   20
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   160
         Underline       =   ""
         Visible         =   True
         Width           =   254
         Begin TextField txtDefaultPictureHeight
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
            Format          =   "####"
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox7"
            Italic          =   ""
            Left            =   34
            LimitText       =   0
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   ""
            LockTop         =   True
            Mask            =   "####"
            Password        =   ""
            ReadOnly        =   ""
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   100
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   186
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   79
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
            InitialParent   =   "GroupBox7"
            Italic          =   ""
            Left            =   125
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   ""
            LockTop         =   True
            Multiline       =   ""
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "X"
            TextAlign       =   1
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   188
            Transparent     =   False
            Underline       =   ""
            Visible         =   True
            Width           =   43
         End
         Begin TextField txtDefaultPictureWidth
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
            Format          =   "####"
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox7"
            Italic          =   ""
            Left            =   179
            LimitText       =   0
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   ""
            LockTop         =   True
            Mask            =   "####"
            Password        =   ""
            ReadOnly        =   ""
            Scope           =   0
            TabIndex        =   7
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   100
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   186
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   79
         End
      End
      Begin PushButton btnEditDictionary
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Edit Dictionary"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pageDefault"
         Italic          =   ""
         Left            =   78
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   6
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   184
         Underline       =   ""
         Visible         =   True
         Width           =   139
      End
   End
   Begin PushButton btnOK
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   194
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
      Top             =   248
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnCancel
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   102
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   248
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub LoadThisVariable(varName as string)
		  
		  if VariableObjectFromName(varName) <> nil then
		    //Name already exists
		    //MsgBox "Variable name " + txtName.Text + " already exists.  Please use a different name."
		    
		    thisVariable = varName
		    
		    
		    txtName.Text = modVariables.VariableObjectFromName(thisVariable).Name
		    
		    if modVariables.VariableObjectFromName(thisVariable).Type = "Text" then
		      
		      popType.ListIndex = 0
		      txtDefaultText.Text = modVariables.VariableObjectFromName(thisVariable).DefaultVal
		      
		    elseif modVariables.VariableObjectFromName(thisVariable).Type = "Number" then
		      
		      popType.ListIndex = 1
		      txtDefaultNumber.Text = modVariables.VariableObjectFromName(thisVariable).DefaultVal
		      
		    elseif modVariables.VariableObjectFromName(thisVariable).Type = "Color" then
		      
		      popType.ListIndex = 3
		      colorDefaultColor.SetColors (modVariables.StringToColor(modVariables.VariableObjectFromName(thisVariable).DefaultVal))
		      
		    elseif modVariables.VariableObjectFromName(thisVariable).Type = "Text File" then
		      
		      popType.ListIndex = 3
		      txtDefaultTextFilePath.Text = modVariables.VariableObjectFromName(thisVariable).DefaultVal
		      
		    elseif modVariables.VariableObjectFromName(thisVariable).Type = "Picture" then
		      
		      popType.ListIndex = 4
		      txtDefaultPictureHeight.Text = str(modVariables.VariableObjectFromName(thisVariable).PictureHeight)
		      txtDefaultPictureWidth.Text = str(modVariables.VariableObjectFromName(thisVariable).PictureWidth)
		      
		    elseif modVariables.VariableObjectFromName(thisVariable).Type = "Dictionary" then
		      
		      tempDictDefault = modVariables.VariableObjectFromName(thisVariable).DefaultVal
		      popType.ListIndex = 2
		      
		    end if
		    
		  else
		    
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		tempDictDefault As string
	#tag EndProperty

	#tag Property, Flags = &h0
		thisVariable As string
	#tag EndProperty


#tag EndWindowCode

#tag Events txtName
	#tag Event
		Sub TextChange()
		  me.Text = ReplaceAll(me.Text, " ", "")
		  
		  if me.Text.Len > 14 then
		    me.Text = left(me.Text, 14)
		  end if
		  
		  me.SelStart = me.Text.Len
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popType
	#tag Event
		Sub Change()
		  if me.Text = "Number" then
		    pageDefault.Value = 1
		  end if
		  
		  if me.Text = "Text" then
		    pageDefault.Value = 0
		  end if
		  
		  if me.Text = "Color" then
		    pageDefault.Value = 2
		  end if
		  
		  if me.Text = "Text File" then
		    pageDefault.Value = 3
		  end if
		  
		  if me.Text = "Picture" then
		    pageDefault.Value = 4
		  end if
		  
		  if me.Text = "Dictionary" then
		    pageDefault.Value = 5
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtDefaultNumber
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
#tag Events colorDefaultColor
	#tag Event
		Sub Open()
		  me.AllowMultipleColors = false
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtDefaultPictureHeight
	#tag Event
		Sub TextChange()
		  if me.Text = "0" or me.Text = "" then
		    me.Text = "1"
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtDefaultPictureWidth
	#tag Event
		Sub TextChange()
		  if me.Text = "0" or me.Text = "" then
		    me.Text = "1"
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEditDictionary
	#tag Event
		Sub Action()
		  frmEditDictionary.Show
		  frmEditDictionary.tempDict = tempDictDefault
		  frmEditDictionary.PopulateListFromDefault
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnOK
	#tag Event
		Sub Action()
		  dim diditwork as Boolean
		  dim newDefault as string
		  
		  if trim(txtName.Text) = "" then
		    MsgBox "You must enter a name for this variable before it can be created."
		    Return
		  end if
		  
		  if popType.Text = "Number" then
		    newDefault = txtDefaultNumber.Text
		  end if
		  
		  if popType.Text = "Dictionary" then
		    newDefault = tempDictDefault
		  end if
		  
		  if popType.Text = "Text" then
		    newDefault = txtDefaultText.Text
		  end if
		  
		  if popType.Text = "Color" then
		    newDefault = modVariables.ColorToString(colorDefaultColor.GetColor)
		  end if
		  
		  if popType.Text = "Text File" then
		    newDefault = txtDefaultTextFilePath.Text
		  end if
		  
		  if popType.Text = "Picture" then
		    newDefault = txtDefaultPictureHeight.Text + "*" + txtDefaultPictureWidth.Text
		  end if
		  
		  
		  if thisVariable = "" then
		    
		    diditwork = modVariables.AddNewVariable(txtName.Text, popType.Text, newDefault)
		    
		    if diditwork = true then
		      
		      frmProject.populateListVariables
		      frmNewVariable.close
		      frmProject.chartProject.ReSelectCurrentFrame
		      
		    else
		      
		      MsgBox "Variable name " + txtName.Text + " already exists.  Please use a different name."
		      
		    end if
		    
		  Else
		    
		    //Name already exists
		    'MsgBox "Variable name " + txtName.Text + " already exists.  Please use a different name."
		    
		    if thisVariable <> txtName.Text then
		      if VariableObjectFromName(txtName.Text) <> nil then
		        MsgBox "Variable name " + txtName.Text + " already exists.  Please use a different name."
		        Return
		      end if
		    end if
		    
		    
		    modVariables.VariableObjectFromName(thisVariable).DefaultVal = newDefault
		    modVariables.VariableObjectFromName(thisVariable).Type = popType.Text
		    modVariables.VariableObjectFromName(thisVariable).Name = txtName.Text
		    frmProject.populateListVariables
		    frmNewVariable.close
		    frmProject.chartProject.ReSelectCurrentFrame
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCancel
	#tag Event
		Sub Action()
		  frmNewVariable.Close
		End Sub
	#tag EndEvent
#tag EndEvents
