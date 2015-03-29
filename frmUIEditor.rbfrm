#tag Window
Begin Window frmUIEditor
   BackColor       =   0
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   424
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   275582975
   MenuBarVisible  =   True
   MinHeight       =   424
   MinimizeButton  =   True
   MinWidth        =   794
   Placement       =   0
   Resizeable      =   True
   Title           =   "Illumination Window Editor"
   Visible         =   True
   Width           =   794
   Begin bunChart chartUI
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      BackColor       =   16777215
      Backdrop        =   ""
      ChartBackgroundColor=   0
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   369
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   161
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      myChartBackgroundColor=   0
      myChartPic      =   0
      Scope           =   0
      SelectionColor  =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   35
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   411
   End
   Begin Listbox listControls
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   369
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Button\rLabel\rTextBox\rTextField\rCanvas\rProgressBar\rWebBrowser\rListBox\rCheckBox"
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   35
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   149
      _ScrollWidth    =   -1
   End
   Begin Listbox listProperties
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   ""
      ColumnWidths    =   "110, 80"
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
      Height          =   329
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Property	Value"
      Italic          =   ""
      Left            =   584
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   35
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   190
      _ScrollWidth    =   -1
   End
   Begin PopupMenu popTarget
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Python/GTK - Desktop\rPython/GTK - Maemo Tablet\rAdobe Flex - Web\rAndroid\riOS - iPhone\riOS - iPad\rHTML5 - Web"
      Italic          =   ""
      Left            =   253
      ListIndex       =   6
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
      Top             =   0
      Underline       =   ""
      Visible         =   True
      Width           =   274
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
      Left            =   161
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Design For:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   8
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   86
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
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Controls:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   8
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox chkApplyToAll
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Apply To All Platforms"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   539
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
      Top             =   6
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   235
   End
   Begin PushButton btnOK
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "OK"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   694
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   384
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  prefLastUIEdited = popTarget.ListIndex
		  modPrefs.WriteAllPrefs
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  'CopyLayoutFromAdobeFlexAIRDesktop.Enabled = true
		  CopyLayoutFromHaikuDesktop.Enabled = True
		  CopyLayoutFromAdobeFlexWeb.Enabled = true
		  CopyLayoutFromPythonGTKMaemoTablet.Enabled = true
		  PythonGTKDesktopPythonGTKDesktop.Enabled = true
		  LayoutMenu.Enabled = true
		  CopyLayoutFrom.Enabled = true
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  if TargetMacOS = true then
		    popTarget.Top = 6
		  end if
		  
		  chartUI.myChartBackgroundColor = rgb(165,165,165)
		  'ilObjectSelected.AddNewUIObject("Button")
		  chartUI.AcceptRawDataDrop("text")
		  
		  popTarget.ListIndex = prefLastUIEdited
		  
		  RefreshUILayoutFromSelectedFrame
		  
		  'CopyLayoutFromAdobeFlexAIRDesktop.Enabled = true
		  CopyLayoutFromHaikuDesktop.Enabled = True
		  CopyLayoutFromAdobeFlexWeb.Enabled = true
		  CopyLayoutFromPythonGTKMaemoTablet.Enabled = true
		  PythonGTKDesktopPythonGTKDesktop.Enabled = true
		  LayoutMenu.Enabled = true
		  CopyLayoutFrom.Enabled = true
		  
		  'popTarget.ListIndex = prefLastUIEdited
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function CopyLayoutFromAdobeFlexAIRDesktop() As Boolean Handles CopyLayoutFromAdobeFlexAIRDesktop.Action
			CopyLayoutFromTo(app.kpFlexAIRDesktop, popTarget.ListIndex)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CopyLayoutFromAdobeFlexWeb() As Boolean Handles CopyLayoutFromAdobeFlexWeb.Action
			CopyLayoutFromTo(app.kpFlexWeb, popTarget.ListIndex)
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CopyLayoutFromPythonGTKMaemoTablet() As Boolean Handles CopyLayoutFromPythonGTKMaemoTablet.Action
			CopyLayoutFromTo(app.kpPythonMaemo,popTarget.ListIndex)
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PythonGTKDesktopPythonGTKDesktop() As Boolean Handles PythonGTKDesktopPythonGTKDesktop.Action
			CopyLayoutFromTo(app.kpPythonDesktop,popTarget.ListIndex)
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub CopyAllUIToAllTargets()
		  dim i as integer
		  dim j as integer
		  
		  if chkApplyToAll.Value = true then
		    
		    if chartUI.Objects.Ubound > -1 then
		      for i = 0 to chartUI.Objects.Ubound
		        
		        for j = 0 to 10
		          
		          ilUIObject(chartUI.Objects(i).myilUIObject).Text(j) = ilUIObject(chartUI.Objects(i).myilUIObject).Text(popTarget.ListIndex)
		          ilUIObject(chartUI.Objects(i).myilUIObject).X(j) = ilUIObject(chartUI.Objects(i).myilUIObject).X(popTarget.ListIndex)
		          ilUIObject(chartUI.Objects(i).myilUIObject).Y(j) = ilUIObject(chartUI.Objects(i).myilUIObject).Y(popTarget.ListIndex)
		          ilUIObject(chartUI.Objects(i).myilUIObject).Width(j) = ilUIObject(chartUI.Objects(i).myilUIObject).Width(popTarget.ListIndex)
		          ilUIObject(chartUI.Objects(i).myilUIObject).Height(j) = ilUIObject(chartUI.Objects(i).myilUIObject).Height(popTarget.ListIndex)
		          ilUIObject(chartUI.Objects(i).myilUIObject).LockBottom(j) = ilUIObject(chartUI.Objects(i).myilUIObject).LockBottom(popTarget.ListIndex)
		          ilUIObject(chartUI.Objects(i).myilUIObject).LockLeft(j) = ilUIObject(chartUI.Objects(i).myilUIObject).LockLeft(popTarget.ListIndex)
		          ilUIObject(chartUI.Objects(i).myilUIObject).LockRight(j) = ilUIObject(chartUI.Objects(i).myilUIObject).LockRight(popTarget.ListIndex)
		          ilUIObject(chartUI.Objects(i).myilUIObject).LockTop(j) = ilUIObject(chartUI.Objects(i).myilUIObject).LockTop(popTarget.ListIndex)
		          ilUIObject(chartUI.Objects(i).myilUIObject).BackgroundColor(j) = ilUIObject(chartUI.Objects(i).myilUIObject).BackgroundColor(popTarget.ListIndex)
		          
		          // If a Window, don't modify the width/height for iphone, ipad, tablet
		          
		          if ilUIObject(chartUI.Objects(i).myilUIObject).ControlType = 0 then // It's a window
		            
		            if j = app.kpiOSiPad or j = app.kpiOSiPad or j = app.kpPythonMaemo then // it's a mobile device
		              
		              
		              
		            else
		              'ilUIObject(chartUI.Objects(i).myilUIObject).Width(j) = ilUIObject(chartUI.Objects(i).myilUIObject).Width(popTarget.ListIndex)
		              'ilUIObject(chartUI.Objects(i).myilUIObject).Height(j) = ilUIObject(chartUI.Objects(i).myilUIObject).Height(popTarget.ListIndex)
		            end if
		            
		          else
		            'ilUIObject(chartUI.Objects(i).myilUIObject).Width(j) = ilUIObject(chartUI.Objects(i).myilUIObject).Width(popTarget.ListIndex)
		            'ilUIObject(chartUI.Objects(i).myilUIObject).Height(j) = ilUIObject(chartUI.Objects(i).myilUIObject).Height(popTarget.ListIndex)
		          end if
		          
		        next
		        
		      next
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyLayoutFromTo(FromTarget as integer, ToTarget as integer)
		  dim i as integer
		  
		  if chartUI.Objects.Ubound > -1 then
		    for i = 0 to chartUI.Objects.Ubound
		      ilUIObject(chartUI.Objects(i).myilUIObject).Text(ToTarget) = ilUIObject(chartUI.Objects(i).myilUIObject).Text(FromTarget) 
		      ilUIObject(chartUI.Objects(i).myilUIObject).X(ToTarget) = ilUIObject(chartUI.Objects(i).myilUIObject).X(FromTarget)
		      ilUIObject(chartUI.Objects(i).myilUIObject).Y(ToTarget) = ilUIObject(chartUI.Objects(i).myilUIObject).Y(FromTarget)
		      ilUIObject(chartUI.Objects(i).myilUIObject).Width(ToTarget) = ilUIObject(chartUI.Objects(i).myilUIObject).Width(FromTarget)
		      ilUIObject(chartUI.Objects(i).myilUIObject).Height(ToTarget) = ilUIObject(chartUI.Objects(i).myilUIObject).Height(FromTarget)
		      
		      
		    next
		  end if
		  
		  chartUI.Refresh
		  chartUI.RedrawChart
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function GetObjectPropertyAtIndex(ObjectIndex as Integer, propKey as string) As string
		  dim s as string
		  
		  if propKey = "Text" then
		    s = ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).Text(popTarget.ListIndex)
		  elseif propKey = "Name" then
		    s = ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).Name
		    
		  elseif propKey = "X" then
		    s = str(ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).X(popTarget.ListIndex))
		  elseif propKey = "Y" then
		    s = str(ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).Y(popTarget.ListIndex))
		  elseif propKey = "Width" then
		    s = str(ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).Width(popTarget.ListIndex))
		  elseif propKey = "Height" then
		    s = str(ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).Height(popTarget.ListIndex))
		  elseif propKey = "Lock Left" then
		    s = str(ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).LockLeft(popTarget.ListIndex))
		  elseif propKey = "Lock Right" then
		    s = str(ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).LockRight(popTarget.ListIndex))
		  elseif propKey = "Lock Top" then
		    s = str(ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).LockTop(popTarget.ListIndex))
		  elseif propKey = "Lock Bottom" then
		    s = str(ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).LockBottom(popTarget.ListIndex))
		  elseif propKey = "Color" then
		    s = ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).BackgroundColor(popTarget.ListIndex).stringvalue
		    
		  end if
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ilObjectSelected() As ilObjectWindow
		  if frmProject.chartProject.selectedFrame.tag isa ilObjectWindow then
		    Return ilObjectWindow(frmProject.chartProject.selectedFrame.tag)
		  else
		    Return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshPropertyListforIndex(ObjectIndex as integer)
		  listProperties.DeleteAllRows
		  
		  if ObjectIndex > -1 then
		    
		    listProperties.AddRow("Name")
		    listProperties.Cell(listProperties.LastIndex,1) = GetObjectPropertyAtIndex(ObjectIndex, "Name")
		    listProperties.RowTag(0) = ObjectIndex
		    
		    listProperties.AddRow("Text")
		    listProperties.Cell(listProperties.LastIndex,1) = GetObjectPropertyAtIndex(ObjectIndex, "Text")
		    
		    listProperties.AddRow("X")
		    listProperties.Cell(listProperties.LastIndex,1) = GetObjectPropertyAtIndex(ObjectIndex, "X")
		    
		    listProperties.AddRow("Y")
		    listProperties.Cell(listProperties.LastIndex,1) = GetObjectPropertyAtIndex(ObjectIndex, "Y")
		    
		    listProperties.AddRow("Height")
		    listProperties.Cell(listProperties.LastIndex,1) = GetObjectPropertyAtIndex(ObjectIndex, "Height")
		    
		    listProperties.AddRow("Width")
		    listProperties.Cell(listProperties.LastIndex,1) = GetObjectPropertyAtIndex(ObjectIndex, "Width")
		    
		    // If a Window, background color
		    if ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).ControlType = ilUIObject.kcWindow then
		      listProperties.AddRow("Color")
		      listProperties.Cell(listProperties.LastIndex,1) = GetObjectPropertyAtIndex(ObjectIndex, "Color")
		    end if
		    
		    // if not a window, then congrol locking
		    if ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).ControlType <> ilUIObject.kcWindow then
		      listProperties.AddRow("Lock Left")
		      listProperties.Cell(listProperties.LastIndex,1) = GetObjectPropertyAtIndex(ObjectIndex, "Lock Left")
		      listProperties.AddRow("Lock Right")
		      listProperties.Cell(listProperties.LastIndex,1) = GetObjectPropertyAtIndex(ObjectIndex, "Lock Right")
		      listProperties.AddRow("Lock Top")
		      listProperties.Cell(listProperties.LastIndex,1) = GetObjectPropertyAtIndex(ObjectIndex, "Lock Top")
		      listProperties.AddRow("Lock Bottom")
		      listProperties.Cell(listProperties.LastIndex,1) = GetObjectPropertyAtIndex(ObjectIndex, "Lock Bottom")
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshUILayoutFromSelectedFrame()
		  chartUI.RemoveAllObjects
		  
		  dim i as integer
		  
		  if ilObjectSelected <> nil then
		    if ilObjectSelected.theWindowObject <> nil then
		      chartUI.AddObjectUI(ilObjectSelected.theWindowObject)
		    end if
		    if ilObjectSelected.theUIObjects.Ubound > -1 then
		      for i = 0 to ilObjectSelected.theUIObjects.Ubound
		        chartUI.AddObjectUI(ilObjectSelected.theUIObjects(i))
		      next
		    end if
		  end if
		  
		  chartUI.RedrawChart
		  ilObjectSelected.UpdateControlBlockItems
		  
		  CopyAllUIToAllTargets
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveControlObject(ObjectIndex as integer)
		  'ilObjectSelected.theUIObjects.Remove(ObjectIndex)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateObjectPropertyAtIndex(ObjectIndex as Integer, propKey as string, propValue as string)
		  dim tempBool as Boolean
		  
		  if propValue = "True" then
		    tempBool = True
		  ElseIf propValue = "False" then
		    tempBool = false
		  end if
		  
		  if propKey = "Text" then
		    ilUIObject(chartUI.Objects(objectindex).myilUIObject).Text(popTarget.ListIndex) = propValue
		  elseif propKey = "Name" then
		    ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).Name = propValue
		  elseif propKey = "X" then
		    ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).X(popTarget.ListIndex) = Val(propValue)
		  elseif propKey = "Y" then
		    ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).Y(popTarget.ListIndex) = Val(propValue)
		  elseif propKey = "Width" then
		    ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).Width(popTarget.ListIndex) = Val(propValue)
		  elseif propKey = "Height" then
		    ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).Height(popTarget.ListIndex) = Val(propValue)
		  elseif propKey = "Lock Left" then
		    ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).LockLeft(popTarget.ListIndex) = tempBool
		  elseif propKey = "Lock Right" then
		    ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).LockRight(popTarget.ListIndex) = tempBool
		  elseif propKey = "Lock Top" then
		    ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).LockTop(popTarget.ListIndex) = tempBool
		  elseif propKey = "Lock Bottom" then
		    ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).LockBottom(popTarget.ListIndex) = tempBool
		  elseif propKey = "Color" then
		    ilUIObject(chartUI.Objects(ObjectIndex).myilUIObject).BackgroundColor(popTarget.ListIndex) = propValue.ColorValue
		  end if
		  
		  
		  ilObjectSelected.UpdateControlBlockItems
		  
		  CopyAllUIToAllTargets
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events chartUI
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  dim theX as integer
		  dim theY as integer
		  
		  theX = me.MouseX - me.Left - val(GetObjectPropertyAtIndex(0, "X"))
		  theY = me.MouseY - me.Top - val(GetObjectPropertyAtIndex(0, "Y"))
		  
		  
		  ilObjectSelected.AddNewUIObjectWithXY(obj.PrivateRawData("text"), theX, theY)
		  RefreshUILayoutFromSelectedFrame
		End Sub
	#tag EndEvent
	#tag Event
		Sub ObjectSelected(ObjectIndex as integer)
		  'me.Objects(ObjectIndex).myilUIObject
		  RefreshPropertyListforIndex(ObjectIndex)
		  CopyAllUIToAllTargets
		End Sub
	#tag EndEvent
	#tag Event
		Sub NoObjectSelected()
		  RefreshPropertyListforIndex(-1)
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  if me.SelectedObject > 0 then
		    
		    base.append(New MenuItem("Remove Control"))
		    
		    
		    Return True  //display the contextual menu
		    
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  if me.SelectedObject > -1 then
		    
		    Select Case hititem.text
		    case "Remove Control"
		      ilObjectSelected.DeleteUIObject(chartUI.Objects(me.SelectedObject).myilUIObject)
		      RefreshUILayoutFromSelectedFrame
		      ilObjectSelected.UpdateControlBlockItems
		      RefreshPropertyListforIndex(-1)
		      
		    end select
		    
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  if asc(key) = 127 or asc(key) = 8 then // Delete
		    
		    ilObjectSelected.DeleteUIObject(chartUI.Objects(me.SelectedObject).myilUIObject)
		    RefreshUILayoutFromSelectedFrame
		    ilObjectSelected.UpdateControlBlockItems
		    RefreshPropertyListforIndex(-1)
		    
		  end if
		  
		  '
		  'if asc(key) = 30 then // Up arrow
		  '
		  'ilUIObject(chartUI.Objects(me.SelectedObject).myilUIObject).Y(popTarget.ListIndex) = ilUIObject(chartUI.Objects(me.SelectedObject).myilUIObject).Y(popTarget.ListIndex)  - 1
		  'RefreshUILayoutFromSelectedFrame
		  '
		  '
		  'end if
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  me.SetFocus
		  if IsContextualClick = true then
		    Return false
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub ObjectMoved(ObjectIndex as integer)
		  RefreshPropertyListforIndex(ObjectIndex)
		  
		  CopyAllUIToAllTargets
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events listControls
	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  
		  Drag.PrivateRawData("text")=Me.List(Row)
		  
		  Return true
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  dim c as color
		  
		  c = rgb(15,0,90)
		  
		  'Black Border
		  g.ForeColor = RGB(0,0,0)
		  g.FillRect(0,2,g.Width - 7, g.Height - 4)
		  
		  'Hilight stripe
		  g.ForeColor = rgb(c.Red+20,c.Green+20,c.Blue+20)
		  g.FillRect(1,3,g.Width - 9, 1)
		  
		  'Main fill
		  g.ForeColor = c
		  g.FillRect(1, 4, g.Width - 9, g.Height - 7)
		  
		  'g.Gradient(1,3,10,26)', colorBlockList, rgb(colorBlockList.Red-20,colorBlockList.Green-20,colorBlockList.Blue-20)
		  
		  // Draw the text
		  g.TextSize = 10
		  
		  g.ForeColor = rgb(0,0,0)
		  if TargetLinux = true then
		    g.DrawString(me.List(row), 3, g.Height - 7)
		  ElseIf TargetWin32 = true then
		    g.DrawString(me.List(row), 3, g.Height - 5)
		  ElseIf TargetMacOS = true then
		    g.DrawString(me.List(row), 3, g.Height - 5)
		    
		  end if
		  
		  g.ForeColor = rgb(255,255,255)
		  if TargetLinux = true then
		    g.DrawString(me.List(row), 3, g.Height - 6)
		  ElseIf TargetWin32 = true then
		    g.DrawString(me.List(row), 3, g.Height - 4)
		  ElseIf TargetMacOS = true then
		    g.DrawString(me.List(row), 3, g.Height - 4)
		  end if
		  
		  
		  Return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events listProperties
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  Dim m as MenuItem
		  dim mResult as MenuItem
		  
		  // value column clicked
		  if column = 1 then
		    if me.Cell(row,0) = "Lock Top" or me.Cell(row,0) = "Lock Bottom" or me.Cell(row,0) = "Lock Left" or me.Cell(row,0) = "Lock Right" then
		      m = new MenuItem
		      m.Append ( new MenuItem ("True"))
		      m.Append ( new MenuItem ("False"))
		      mResult=m.Popup
		      me.Cell(row,1) = mResult.Text
		      UpdateObjectPropertyAtIndex(me.RowTag(0), me.Cell(row,0), me.Cell(row, column))
		      
		    elseif me.Cell(row,0) = "Color"  then
		      
		      Dim c  as Color
		      Dim b as Boolean
		      c=me.Cell(row,column).ColorValue
		      b=SelectColor(c,"Select a Color")
		      me.Cell(row,column) = c.stringvalue
		      UpdateObjectPropertyAtIndex(me.RowTag(0), me.Cell(row,0), me.Cell(row, column))
		      chartUI.RedrawChart
		      
		    else
		      me.EditCell(row, column)
		    end if
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub CellTextChange(row as Integer, column as Integer)
		  if me.Cell(row,0) = "X" or me.Cell(row,0) = "Y" or me.Cell(row,0) = "Height" or me.Cell(row,0) = "Width" then
		    me.Cell(row,column) = str(val(me.Cell(row,column)))
		  end if
		  UpdateObjectPropertyAtIndex(me.RowTag(0), me.Cell(row,0), me.Cell(row, column))
		  
		  chartUI.RedrawChart
		End Sub
	#tag EndEvent
	#tag Event
		Function CellKeyDown(row as Integer, column as Integer, key as String) As Boolean
		  if me.Cell(row,0) = "X" or me.Cell(row,0) = "Y" or me.Cell(row,0) = "Height" or me.Cell(row,0) = "Width" then
		    
		    'if asc(key) < 48 or asc(key) > 57 then
		    'if asc(key) <> 127 then
		    'Return true
		    'end if
		    'end if
		    
		    if asc(key) >= 58 and asc(key) <= 126 then
		      Return true
		    end if
		    
		  end if
		  
		  if me.Cell(row,0) = "Name" then
		    
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
		  end if
		  
		  Return false
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  if column = 1 then
		    if me.Cell(row,0) = "Color" then
		      g.ForeColor = me.Cell(row,column).ColorValue
		      g.FillRect 0,0,g.Width,g.Height
		    end if
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events popTarget
	#tag Event
		Sub Change()
		  RefreshUILayoutFromSelectedFrame
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnOK
	#tag Event
		Sub Action()
		  frmUIEditor.Close
		End Sub
	#tag EndEvent
#tag EndEvents
