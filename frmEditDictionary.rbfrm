#tag Window
Begin Window frmEditDictionary
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   367
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Edit Dictionary Default Values"
   Visible         =   True
   Width           =   427
   Begin Listbox listDict
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   301
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Value"
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   387
      _ScrollWidth    =   -1
   End
   Begin PushButton btnApply
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Apply"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   112
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   327
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
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   327
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin BevelButton btnNewRow
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   0
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   "+"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   ""
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   385
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   ""
      TextUnit        =   0
      Top             =   326
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
   Begin BevelButton btnDeleteRow
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   0
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   "-"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   ""
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   363
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   ""
      TextUnit        =   0
      Top             =   326
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub PopulateListFromDefault()
		  dim d as new Dictionary
		  
		  d = GetDictFromString(tempDict)
		  dim i as integer
		  
		  listDict.DeleteAllRows
		  
		  if d.Count > 0 then
		    for i = 0 to d.Count - 1
		      listDict.AddRow d.Key(i)
		      listDict.Cell(listDict.LastIndex,1) = d.Value(d.Key(i))
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDefaultFromList()
		  dim d as new Dictionary
		  
		  dim i as integer
		  
		  if listDict.ListCount > 0 then
		    for i = 0 to (listDict.ListCount - 1)
		      d.Value(listDict.Cell(i,0)) = listDict.Cell(i,1)
		    next
		  end if
		  
		  tempDict = GetStringFromDict(d)
		  frmNewVariable.tempDictDefault = tempDict
		  //modVariables.VariableObjectFromName(frmNewVariable.thisVariable).SetDefaultDictFromDict(d)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		tempDict As string
	#tag EndProperty

	#tag Property, Flags = &h0
		thisVariable As string
	#tag EndProperty


#tag EndWindowCode

#tag Events listDict
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  Me.CellType(row,column)=Listbox.TypeEditable
		  Me.EditCell(row,column)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btnApply
	#tag Event
		Sub Action()
		  SetDefaultFromList
		  frmEditDictionary.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCancel
	#tag Event
		Sub Action()
		  frmEditDictionary.Close
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNewRow
	#tag Event
		Sub Action()
		  listDict.AddRow "NewKey"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteRow
	#tag Event
		Sub Action()
		  if listDict.ListIndex > -1 then
		    listDict.RemoveRow(listDict.ListIndex)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
