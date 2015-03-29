#tag Window
Begin Window frmProject
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   506
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   543502335
   MenuBarVisible  =   True
   MinHeight       =   506
   MinimizeButton  =   True
   MinWidth        =   820
   Placement       =   2
   Resizeable      =   True
   Title           =   "Illumination Software Creator"
   Visible         =   True
   Width           =   820
   Begin Listbox listObjects
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
      Height          =   225
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   2
      LockBottom      =   False
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
      Width           =   145
      _ScrollWidth    =   -1
   End
   Begin PopupMenu popCategory
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "User Interface\rText\rNumbers\rDictionaries\rLogic\rConversion\rSystem\rFiles\rCustom"
      Italic          =   ""
      Left            =   0
      ListIndex       =   0
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
      Top             =   2
      Underline       =   ""
      Visible         =   True
      Width           =   145
   End
   Begin toolbarProject toolbarProject1
      Enabled         =   True
      Height          =   35
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -75
      Visible         =   True
      Width           =   830
   End
   Begin Canvas canCon
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   486
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   621
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   179
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
      Left            =   -121
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Variables:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   252
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Timer timeFirstRun
      Height          =   32
      Index           =   -2147483648
      Left            =   -59
      LockedInPosition=   False
      Mode            =   1
      Period          =   500
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   454
      Width           =   32
   End
   Begin Canvas canScroller
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   467
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   157
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   False
      Visible         =   True
      Width           =   434
      Begin RelationalFrames.RelationalFramesCanvas chartProject
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   ""
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   458
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "canScroller"
         Left            =   157
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   0
         UseFocusRing    =   False
         Visible         =   True
         Width           =   424
      End
   End
   Begin ScrollBar scrlVer
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   467
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   593
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   16
   End
   Begin ScrollBar scrlHor
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   157
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   470
      Value           =   0
      Visible         =   True
      Width           =   434
   End
   Begin Timer timeNav
      Height          =   32
      Index           =   -2147483648
      Left            =   -59
      LockedInPosition=   False
      Mode            =   2
      Period          =   500
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   304
      Width           =   32
   End
   Begin Label lblInfo
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
      Left            =   157
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   486
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   643
   End
   Begin Listbox listVariables
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   28
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   195
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Variables"
      Italic          =   ""
      Left            =   2
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
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   272
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   145
      _ScrollWidth    =   -1
   End
   Begin BevelButton btnDeleteVariable
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
      Left            =   103
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   ""
      TextUnit        =   0
      Top             =   468
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
   Begin BevelButton btnNewVariable
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
      Left            =   125
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   ""
      TextUnit        =   0
      Top             =   468
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  Quit
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  if TargetMacOS = true then
		    popCategory.Top = 3
		  end if
		  
		  if app.kForUbuntuStore = true then
		    'HelpRegisterIlluminationSoftwareCreator.Visible = false
		    UntitledSeparator3.Visible = false
		  end if
		  
		  populateListObjects
		  ShowPropertiesForProject
		  
		  
		  UpdateTitleBar
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  ResetScrollBars
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  ResetScrollBars
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditPreferences() As Boolean Handles EditPreferences.Action
			frmPreferences.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNewCustomBlock() As Boolean Handles FileNewCustomBlock.Action
			if modPrefs.isRegGood = false then
			modPrefs.ShowUnregisteredDialog
			Return true
			end if
			
			
			frmCustomBlock.Show
			frmCustomBlock.myBlock = new ilObjectCustomBlock
			frmCustomBlock.myBlock.BlockName = "MyNewBlock"
			frmCustomBlock.myBlock.BlockCategory = "Misc"
			frmCustomBlock.myBlock.InputName = "Go"
			frmCustomBlock.myBlock.BlockDescription = ""
			frmCustomBlock.myBlock.Out1Enabled = true
			frmCustomBlock.myBlock.Out1Name = "Done"
			frmCustomBlock.myBlock.Var1Enabled = true
			frmCustomBlock.myBlock.Var1Description = "Set this Text to Hello"
			frmCustomBlock.myBlock.Var1Type = "Text"
			frmCustomBlock.myWindowTitle = "Edit Block - NewBlock (Not Saved)"
			
			frmCustomBlock.myBlock.TemplateCodeAndroid = "// Example Android Block that sets the value of Variable1 to 'Hello'" + EndOfLine + _
			"ISCVariable1 = ""Hello"";" + EndOfLine + _
			"// The line below is the code that tells Illumination where Output 1 is called" + EndOfLine + _
			"//Output1" + EndOfLine
			
			frmCustomBlock.myBlock.TemplateCodeiOS = "// Example iOS Block that sets the value of Variable1 to 'Hello'" + EndOfLine + _
			"ISCVariable1 = @""Hello"";" + EndOfLine + _
			"// The line below is the code that tells Illumination where Output 1 is called" + EndOfLine + _
			"//Output1" + EndOfLine
			
			frmCustomBlock.myBlock.TemplateCodeFlexWeb = "// Example Flex/Flash Block that sets the value of Variable1 to 'Hello'" + EndOfLine + _
			"ISCVariable1 = ""Hello"";" + EndOfLine + _
			"// The line below is the code that tells Illumination where Output 1 is called" + EndOfLine + _
			"//Output1" + EndOfLine
			
			frmCustomBlock.myBlock.TemplateCodePythonDesktop = " # Example Python Deskop Block that sets the value of Variable1 to 'Hello'" + EndOfLine + _
			" # Remember that leading spaces are key in Python..." + EndOfLine + _
			" ISCVariable1 = ""Hello"";" + EndOfLine + _
			" # The line below is the code that tells Illumination where Output 1 is called" + EndOfLine + _
			" #Output1" + EndOfLine
			
			frmCustomBlock.myBlock.TemplateCodePythonMaemo = " # Example Python Deskop Block that sets the value of Variable1 to 'Hello'" + EndOfLine + _
			" # Remember that leading spaces are key in Python..." + EndOfLine + _
			" ISCVariable1 = ""Hello"";" + EndOfLine + _
			" # The line below is the code that tells Illumination where Output 1 is called" + EndOfLine + _
			" #Output1" + EndOfLine
			
			frmCustomBlock.UpdateDisplay
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNewProject() As Boolean Handles FileNewProject.Action
			myNewProject
			frmProject.chartProject.Refresh
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpenProject() As Boolean Handles FileOpenProject.Action
			myOpenProject
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveProject() As Boolean Handles FileSaveProject.Action
			mySaveProject
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveProjectAs() As Boolean Handles FileSaveProjectAs.Action
			modFile.SafeProjectFileAs
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveProjectAsImage() As Boolean Handles FileSaveProjectAsImage.Action
			mySaveAsImage
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAboutIlluminationSoftwareCreator() As Boolean Handles HelpAboutIlluminationSoftwareCreator.Action
			frmAbout.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpExampleProjects() As Boolean Handles HelpExampleProjects.Action
			ShowURL("http://lunduke.com/")
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpLicenseTheSourceCode() As Boolean Handles HelpLicenseTheSourceCode.Action
			ShowURL "http://lunduke.com/?page_id=3194"
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpRegisterIlluminationSoftwareCreator() As Boolean Handles HelpRegisterIlluminationSoftwareCreator.Action
			frmReg.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpSupportForum() As Boolean Handles HelpSupportForum.Action
			ShowURL "http://lunduke.com/forum/"
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpSupportTheProject() As Boolean Handles HelpSupportTheProject.Action
			ShowURL "http://lunduke.com/?page_id=3500"
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpTutorials() As Boolean Handles HelpTutorials.Action
			ShowURL("http://lunduke.com/")
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpWelcomeToIlluminationSoftwareCreator() As Boolean Handles HelpWelcomeToIlluminationSoftwareCreator.Action
			'frmFirstRun.Show
			frmFirstRunSimple.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectBuildProjectAdobeFlexWeb() As Boolean Handles ProjectBuildProjectAdobeFlexWeb.Action
			if modPrefs.isRegGood = false then
			modPrefs.ShowUnregisteredDialog
			Return true
			end if
			
			dim f as FolderItem
			f = BuildProjectFlexWeb
			if f <> nil then
			f.Parent.Launch
			end if
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectBuildProjectAndroid() As Boolean Handles ProjectBuildProjectAndroid.Action
			if modPrefs.isRegGood = false then
			modPrefs.ShowUnregisteredDialog
			Return true
			end if
			
			dim f as FolderItem
			f = BuildProjectAndroid
			if f <> nil then
			f.Launch
			end if
			Return True
			
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectBuildProjectHTML5Web() As Boolean Handles ProjectBuildProjectHTML5Web.Action
			dim f as FolderItem
			f = BuildProjectHTML5
			if f <> nil then
			f.Parent.Launch
			end if
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectBuildProjectiOSiPad() As Boolean Handles ProjectBuildProjectiOSiPad.Action
			if modPrefs.isRegGood = false then
			modPrefs.ShowUnregisteredDialog
			Return true
			end if
			
			dim f as FolderItem
			f = BuildProjectiOSiPad
			if f <> nil then
			f.Launch
			end if
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectBuildProjectiOSiPhone() As Boolean Handles ProjectBuildProjectiOSiPhone.Action
			if modPrefs.isRegGood = false then
			modPrefs.ShowUnregisteredDialog
			Return true
			end if
			
			dim f as FolderItem
			f = BuildProjectiOSiPhone
			if f <> nil then
			f.Launch
			end if
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectBuildProjectPythonGTKDesktop() As Boolean Handles ProjectBuildProjectPythonGTKDesktop.Action
			if modPrefs.isRegGood = false then
			modPrefs.ShowUnregisteredDialog
			Return true
			end if
			
			dim f as FolderItem
			f = BuildProjectPythonDesktop
			if f <> nil then
			f.Parent.Launch
			end if
			Return True
			
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectBuildProjectPythonGTKMaemoN8x0() As Boolean Handles ProjectBuildProjectPythonGTKMaemoN8x0.Action
			if modPrefs.isRegGood = false then
			modPrefs.ShowUnregisteredDialog
			Return true
			end if
			
			dim f as FolderItem
			f = BuildProjectPythonMaemo
			if f <> nil then
			f.Parent.Launch
			end if
			Return True
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectCheckProjectForErrors() As Boolean Handles ProjectCheckProjectForErrors.Action
			if modChecker.CheckProjectForErrors = false then
			else
			MsgBox "No errors found!"
			end if
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectProjectSettings() As Boolean Handles ProjectProjectSettings.Action
			frmProjectSettings.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectRunProject() As Boolean Handles ProjectRunProject.Action
			RunProjectPythonDesktop
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function RunProjectRunProjectAdobeFlexWeb() As Boolean Handles RunProjectRunProjectAdobeFlexWeb.Action
			if modPrefs.isRegGood = false then
			modPrefs.ShowUnregisteredDialog
			Return true
			end if
			
			RunProjectFlexWeb
			modPrefs.defaultRunTarget = app.kpFlexWeb
			modPrefs.WriteAllPrefs
			SetRunDropDownChecked
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function RunProjectRunProjectPythonGTKDesktop() As Boolean Handles RunProjectRunProjectPythonGTKDesktop.Action
			if modPrefs.isRegGood = false then
			modPrefs.ShowUnregisteredDialog
			Return true
			end if
			
			RunProjectPythonDesktop
			modPrefs.defaultRunTarget = app.kpPythonDesktop
			modPrefs.WriteAllPrefs
			SetRunDropDownChecked
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub AddNewObject(ObjectType as string, x as integer, y as integer, LoadingFile as boolean = false)
		  
		  dim i as integer
		  dim tempObj as ilObjectBase
		  
		  LastCustomBlockObjectAddedFailed = false
		  
		  if ObjectType = "Window" then
		    
		    tempObj = new ilObjectWindow
		    
		  end if
		  
		  
		  if ObjectType = "Application" then
		    
		    tempObj = new ilObjectApp
		    
		  end if
		  
		  if ObjectType = "ApplicationQuit" then
		    
		    tempObj = new ilObjectAppQuit
		    
		  end if
		  
		  
		  if ObjectType = "Message Box" then
		    
		    tempObj = new ilObjectMessageBox
		    
		  end if
		  
		  if ObjectType = "Note" then
		    
		    tempObj = new ilObjectNote
		    
		  end if
		  
		  if ObjectType = "Confirmation Dialog" then
		    
		    tempObj = new ilObjectConfirmationDialog
		    
		  end if
		  
		  if ObjectType = "Set Text" then
		    
		    tempObj = new ilObjectTextSetText
		    
		  end if
		  
		  if ObjectType = "Lowercase" then
		    
		    tempObj = new ilObjectTextLowercase
		    
		  end if
		  
		  if ObjectType = "Uppercase" then
		    
		    tempObj = new ilObjectTextUppercase
		    
		  end if
		  
		  if ObjectType = "Set Number" then
		    
		    tempObj = new ilObjectNumberSetNumber
		    
		  end if
		  
		  
		  if ObjectType = "Number to Text" then
		    
		    tempObj = new ilObjectConversionNumberToText
		    
		  end if
		  
		  if ObjectType = "Text to Number" then
		    tempObj = new ilObjectConversionTextToNumber
		  end if
		  
		  if ObjectType = "Add" then
		    tempObj = new ilObjectNumberAdd
		  end if
		  
		  if ObjectType = "Subtract" then
		    tempObj = new ilObjectNumberSubtract
		  end if
		  
		  if ObjectType = "Multiply" then
		    tempObj = new ilObjectNumberMultiply
		  end if
		  
		  if ObjectType = "Divide" then
		    tempObj = new ilObjectNumberDivide
		  end if
		  
		  if ObjectType = "Combine Text" then
		    tempObj = new ilObjectTextCombineText
		  end if
		  
		  if ObjectType = "Set Label" then
		    tempObj = new ilObjectUISetLabel
		  end if
		  
		  if ObjectType = "Set TextBox" then
		    tempObj = new ilObjectUISetTextBox
		  end if
		  
		  if ObjectType = "Get TextBox" then
		    tempObj = new ilObjectUIGetTextBox
		  end if
		  
		  if ObjectType = "If... Then..." then
		    tempObj = new ilObjectIfThen
		  end if
		  
		  if ObjectType = "Do While" then
		    tempObj = new ilObjectDoWhile
		  end if
		  
		  if ObjectType = "Remainder" then
		    tempObj = new ilObjectNumberRemainder
		  end if
		  
		  if ObjectType = "Set ProgressBar" then
		    tempObj = new ilObjectUISetProgressBar
		  end if
		  
		  if ObjectType = "Timer" then
		    tempObj = new ilObjectTimer
		  end if
		  
		  if ObjectType = "Set Button" then
		    tempObj = new ilObjectUISetButton
		  end if
		  
		  if ObjectType = "Replace Text" then
		    tempObj = new ilObjectTextReplaceText
		  end if
		  
		  if ObjectType = "Random" then
		    tempObj = new ilObjectNumberRandom
		  end if
		  
		  if ObjectType = "Close Window" then
		    tempObj = new ilObjectUICloseWindow
		  end if
		  
		  if ObjectType = "Run Shell Script" then
		    tempObj = new ilObjectSystemRunShellScript
		  end if
		  
		  if ObjectType = "Read All Text From File" then
		    tempObj = new ilObjectFileReadAllTextFromFile
		  end if
		  
		  if ObjectType = "Open Text File Dialog" then
		    tempObj = new ilObjectFileOpenTextFileDialog
		  end if
		  
		  if ObjectType = "Save Text File Dialog" then
		    tempObj = new ilObjectFileSaveTextFileDialog
		  end if
		  
		  if ObjectType = "Save All Text To File" then
		    tempObj = new ilObjectFileSaveAllTextToFile
		  end if
		  
		  if ObjectType = "Get TextField" then
		    tempObj = new ilObjectUIGetTextField
		  end if
		  
		  if ObjectType = "Set TextField" then
		    tempObj = new ilObjectUISetTextField
		  end if
		  
		  if ObjectType = "Set Canvas Picture" then
		    tempObj = new ilObjectUISetCanvasFromPicture
		  end if
		  
		  if ObjectType = "Draw Filled Rectangle" then
		    tempObj = new ilObjectPictureDrawFilledRectangle
		  end if
		  
		  if ObjectType = "Fill Picture" then
		    tempObj = new ilObjectPictureFillPicture
		  end if
		  
		  if ObjectType = "Draw Line" then
		    tempObj = new ilObjectPictureDrawLine
		  end if
		  
		  if ObjectType = "Draw Dot" then
		    tempObj = new ilObjectPictureDrawDot
		  end if
		  
		  if ObjectType = "Set ColorButton" then
		    tempObj = new ilObjectUISetColorButton
		  end if
		  
		  if ObjectType = "Get ColorButton" then
		    tempObj = new ilObjectUIGetColorButton
		  end if
		  
		  if ObjectType = "Draw Picture" then
		    tempObj = new ilObjectPictureDrawPicture
		  end if
		  
		  if ObjectType = "Set WebBrowser" then
		    tempObj = new ilObjectUISetWebBrowser
		  end if
		  
		  if ObjectType = "Specifc Target" then
		    tempObj = new ilObjectTargetIs
		  end if
		  
		  if ObjectType = "Set In Dictionary" then
		    tempObj = new ilObjectDictionaryAdd
		  end if
		  
		  if ObjectType = "Get From Dictionary" then
		    tempObj = new ilObjectDictionaryGet
		  end if
		  
		  if ObjectType = "Remove From Dictionary" then
		    tempObj = new ilObjectDictionaryRemove
		  end if
		  
		  if ObjectType = "Departure Portal" then
		    tempObj = new ilObjectPortalDeparture
		  end if
		  
		  if ObjectType = "Destination Portal" then
		    tempObj = new ilObjectPortalDestination
		  end if
		  
		  if ObjectType = "Text Length" then
		    tempObj = new ilObjectTextTextLength
		  end if
		  
		  if ObjectType = "Position In Text" then
		    tempObj = new ilObjectTextInText
		  end if
		  
		  if ObjectType = "Text At Position" then
		    tempObj = new ilObjectTextTextAtPosition
		  end if
		  
		  if ObjectType = "Set CheckBox" then
		    tempObj = new ilObjectUISetCheckBox
		  end if
		  
		  if ObjectType = "Get CheckBox" then
		    tempObj = new ilObjectUIGetCheckBox
		  end if
		  
		  if ObjectType = "Add To ListBox" then
		    tempObj = new ilObjectUIAddToListBox
		  end if
		  
		  if ObjectType = "Clear ListBox" then
		    tempObj = new ilObjectUIClearListBox
		  end if
		  
		  if ObjectType = "Get ListBox Selection" then
		    tempObj = new ilObjectUIGetListBoxSelection
		  end if
		  
		  
		  'if frmProject.popCategory.Text = "Custom" then
		  if InStr(ObjectType, "Custom///***///") > 0 then
		    
		    tempObj = new ilObjectCustomBlock
		    dim realObjType as string
		    realObjType = NthField(ObjectType, "///***///", 2)
		    
		    if modFile.GetISCCustomBlockFolder.Child(realObjType).Exists = true then
		      ilObjectCustomBlock(tempObj).LoadBlockFromFile(modFile.GetISCCustomBlockFolder.Child(realObjType))
		      tempObj.Constructor
		    else
		      LastCustomBlockObjectAddedFailed = true
		      MsgBox "Error Loading Custom Block: " + realObjType
		      Return
		    end if
		    
		  end if
		  'end if
		  
		  
		  tempObj.DBObjectType = ObjectType
		  
		  // Instantiate and init the new content frame object
		  dim cf as contentFrame
		  cf = new ContentFrame(x,y, tempObj.Width, tempObj.Title, false, tempObj.BGColor)
		  cf.tag = tempObj
		  
		  'if LoadingFile = false then
		  if tempObj.ObjectItems.Ubound > -1 then
		    for i = 0 to tempObj.ObjectItems.Ubound
		      cf.AppendObject new TextObject(tempObj.ObjectItems(i))
		      cf.contents(cf.contents.Ubound).ShowInput = tempObj.ObjectShowInput(i)
		      cf.contents(cf.contents.Ubound).ShowOutput = tempObj.ObjectShowOutput(i)
		    next
		  end if
		  'end if
		  
		  chartProject.AddFrame cf
		  
		  modFile.fileisDirty = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildProjectAndroid() As FolderItem
		  if modChecker.CheckProjectForErrors = false then
		    Return nil
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    modFile.SafeProjectFileAs
		  else
		    
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    MsgBox "You must save the project first."
		    Return nil
		  end if
		  
		  dim f as FolderItem
		  dim f2 as FolderItem
		  Dim t as TextOutputStream
		  
		  frmBuilding.Show
		  app.DoEvents
		  app.YieldToNextThread
		  frmBuilding.Refresh
		  
		  // Generate the base project files
		  // Make a build folder
		  f = modFile.currentSaveFile.Parent.Child(modVariables.ProjectApplicationName + "Android")
		  if f.Exists then
		    f.Delete
		  end if
		  
		  f.CreateAsFolder
		  
		  // Make the .project file
		  dim strProject as string
		  strProject = "<?xml version=""1.0"" encoding=""UTF-8""?>" + EndOfLine
		  strProject = strProject + "<projectDescription>" + EndOfLine
		  strProject = strProject + "<name>" + modVariables.GetSpaceFreeAppName + "</name>" + EndOfLine
		  strProject = strProject + "<comment></comment>" + EndOfLine
		  strProject = strProject + "<projects>" + EndOfLine
		  strProject = strProject + "</projects>" + EndOfLine
		  strProject = strProject + "<buildSpec>" + EndOfLine
		  strProject = strProject + "<buildCommand>" + EndOfLine
		  strProject = strProject + "<name>com.android.ide.eclipse.adt.ResourceManagerBuilder</name>" + EndOfLine
		  strProject = strProject + "<arguments>" + EndOfLine
		  strProject = strProject + "</arguments>" + EndOfLine
		  strProject = strProject + "</buildCommand>" + EndOfLine
		  strProject = strProject + "<buildCommand>" + EndOfLine
		  strProject = strProject + "<name>com.android.ide.eclipse.adt.PreCompilerBuilder</name>" + EndOfLine
		  strProject = strProject + "<arguments>" + EndOfLine
		  strProject = strProject + "</arguments>" + EndOfLine
		  strProject = strProject + "</buildCommand>" + EndOfLine
		  strProject = strProject + "<buildCommand>" + EndOfLine
		  strProject = strProject + "<name>org.eclipse.jdt.core.javabuilder</name>" + EndOfLine
		  strProject = strProject + "<arguments>" + EndOfLine
		  strProject = strProject + "</arguments>" + EndOfLine
		  strProject = strProject + "</buildCommand>" + EndOfLine
		  strProject = strProject + "<buildCommand>" + EndOfLine
		  strProject = strProject + "<name>com.android.ide.eclipse.adt.ApkBuilder</name>" + EndOfLine
		  strProject = strProject + "<arguments>" + EndOfLine
		  strProject = strProject + "</arguments>" + EndOfLine
		  strProject = strProject + "</buildCommand>" + EndOfLine
		  strProject = strProject + "</buildSpec>" + EndOfLine
		  strProject = strProject + "<natures>" + EndOfLine
		  strProject = strProject + "<nature>com.android.ide.eclipse.adt.AndroidNature</nature>" + EndOfLine
		  strProject = strProject + "<nature>org.eclipse.jdt.core.javanature</nature>" + EndOfLine
		  strProject = strProject + "</natures>" + EndOfLine
		  strProject = strProject + "</projectDescription>" + EndOfLine
		  
		  
		  f2 = f.Child(".project")
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(strProject)
		    t.Close
		  End if
		  
		  
		  // Make the default.properties
		  
		  dim strDefaultProperties as string
		  
		  strDefaultProperties = "target=android-8" + EndOfLine
		  
		  f2 = f.Child("default.properties")
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(strDefaultProperties)
		    t.Close
		  End if
		  
		  
		  
		  
		  // Make the .classpath file
		  dim strClassPath as string
		  
		  strClassPath = "<?xml version=""1.0"" encoding=""UTF-8""?>" + EndOfLine
		  strClassPath = strClassPath + "<classpath>" + EndOfLine
		  strClassPath = strClassPath + "<classpathentry kind=""src"" path=""src""/>" + EndOfLine
		  strClassPath = strClassPath + "<classpathentry kind=""src"" path=""gen""/>" + EndOfLine
		  strClassPath = strClassPath + "<classpathentry kind=""con"" path=""com.android.ide.eclipse.adt.ANDROID_FRAMEWORK""/>" + EndOfLine
		  strClassPath = strClassPath + "<classpathentry kind=""output"" path=""bin""/>" + EndOfLine
		  strClassPath = strClassPath + "</classpath>" + EndOfLine
		  
		  f2 = f.Child(".classpath")
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(strClassPath)
		    t.Close
		  End if
		  
		  
		  // Make the AndroidManifest.xml
		  dim strAndroidManifest as string
		  
		  strAndroidManifest = "<?xml version=""1.0"" encoding=""utf-8""?>" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "<manifest xmlns:android=""http://schemas.android.com/apk/res/android""" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "package=""" + modVariables.GetAndroidPackage + """" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "android:versionCode=""1""" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "android:versionName=""" + modVariables.ProjectVersion + """>" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "<application android:label=""" + modVariables.ProjectApplicationName + """>" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "<activity android:name=""." + modVariables.GetSpaceFreeAppName + """" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "android:label=""@string/app_name"">" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "<intent-filter>" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "<action android:name=""android.intent.action.MAIN"" />" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "<category android:name=""android.intent.category.LAUNCHER"" />" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "</intent-filter>" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "</activity>" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "</application>" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "<uses-permission android:name=""android.permission.INTERNET"" />" + EndOfLine
		  strAndroidManifest = strAndroidManifest + "</manifest>" + EndOfLine
		  
		  
		  f2 = f.Child("AndroidManifest.xml")
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(strAndroidManifest)
		    t.Close
		  End if
		  
		  
		  // Create full folder structure
		  f.Child("bin").CreateAsFolder
		  f.Child("assets").CreateAsFolder
		  f.Child("gen").CreateAsFolder
		  f.Child("res").CreateAsFolder
		  f.Child("res").Child("layout").CreateAsFolder
		  f.Child("res").Child("values").CreateAsFolder
		  f.Child("src").CreateAsFolder
		  f.Child("src").Child("com").CreateAsFolder
		  f.Child("src").Child("com").Child("isc").CreateAsFolder
		  f.Child("src").Child("com").Child("isc").Child(modVariables.GetSpaceFreeAppName).CreateAsFolder
		  f.Child(".settings").CreateAsFolder
		  
		  
		  
		  
		  // Make the core.prefs
		  
		  dim strCorePrefs as string
		  
		  strCorePrefs = "eclipse.preferences.version=1"
		  strCorePrefs = strCorePrefs + "org.eclipse.jdt.core.compiler.codegen.targetPlatform=1.5"
		  strCorePrefs = strCorePrefs + "org.eclipse.jdt.core.compiler.compliance=1.5"
		  strCorePrefs = strCorePrefs + "org.eclipse.jdt.core.compiler.source=1.5"
		  
		  
		  
		  f2 = f.Child(".settings").Child("org.eclipse.jdt.core.prefs")
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(strCorePrefs)
		    t.Close
		  End if
		  
		  
		  
		  
		  // Make strings.xml
		  
		  dim strStringsXML as string
		  
		  strStringsXML = "<?xml version=""1.0"" encoding=""utf-8""?>" + EndOfLine
		  strStringsXML = strStringsXML + "<resources>" + EndOfLine
		  strStringsXML = strStringsXML + "<string name=""app_name"">" + modVariables.ProjectApplicationName + "</string>" + EndOfLine
		  strStringsXML = strStringsXML + "</resources>" + EndOfLine
		  
		  
		  f2 = f.Child("res").Child("values").Child("strings.xml")
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(strStringsXML)
		    t.Close
		  End if
		  
		  
		  
		  // Make IlluminationReadMe.txt
		  
		  dim strReadMe as string
		  
		  strReadMe = "This project is built with Illumination Software Creator.  Below are a few items worth noting that cover how to run and test your Android application." + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "1) You must have a functioning copy of Eclipse and the Android SDK installed.  You can download them, and find full instructions on setting them up for Windows, Linux or MacOS X from http://developer.android.com/sdk/index.html." + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "2) Now that your project is built with Illumination, open up Eclipse and go to the File menu, select Import, and choose General -> Existing Projects Into Workspace.  Then select the root directory of your new Android project and click Finish.  This will add your project into Eclipse." + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "3) By default your project is set to use the Android SDK version 2.2.  If you have this installed you are all set.  If not, you can either follow the instructions on the URL in step 1 to install version 2.2, or you can right click on your project name on the right hand side of Eclipse, choose Properties, and choose a different SDK version from the Android section." + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "4) At this point your project is all set and ready to run!  Simply choose Run from the Run menu and select Android Application (only necessary the first time you run this project) and the Android Simulator will launch and load your application!" + EndOfLine + EndOfLine
		  
		  f2 = f.Child("IlluminationReadMe.txt")
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(strReadMe)
		    t.Close
		  End if
		  
		  
		  
		  // Set the Android Layout Folder
		  modCodeGenerator.AndroidLayoutFolder = f.Child("res").Child("layout")
		  
		  if f.Child("res").Child("drawable").Exists = false then
		    f.Child("res").Child("drawable").CreateAsFolder
		  end if
		  
		  modVariables.ExportAllImages(f.Child("res").Child("drawable"))
		  
		  
		  // Build the project!
		  modCodeGenerator.TargetInProcess = app.kpAndroid
		  modCodeGenerator.BeginCodeGeneration(app.kpAndroid)
		  
		  // Save the main java file
		  
		  f2 = f.Child("src").Child("com").Child("isc").Child(modVariables.GetSpaceFreeAppName).Child(modVariables.GetSpaceFreeAppName + ".java")
		  
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(modCodeGenerator.AndroidMainJavaCode)
		    t.Close
		  End if
		  
		  
		  frmBuilding.Close
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildProjectFlexWeb() As FolderItem
		  if modChecker.CheckProjectForErrors = false then
		    Return nil
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    modFile.SafeProjectFileAs
		  else
		    
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    MsgBox "You must save the project first."
		    Return nil
		  end if
		  
		  frmBuilding.Show
		  app.DoEvents
		  app.YieldToNextThread
		  frmBuilding.Refresh
		  
		  modCodeGenerator.TargetInProcess = app.kpFlexWeb
		  modCodeGenerator.BeginCodeGeneration(app.kpFlexWeb)
		  
		  // Save the python project to the desktop (need to change and base on project name
		  Dim t as TextOutputStream
		  Dim f as FolderItem
		  dim f2 as FolderItem
		  
		  // Make a build folder
		  f = modFile.currentSaveFile.Parent.Child(modVariables.ProjectApplicationName + "FlexWeb")
		  if f.Exists then
		    f.Delete
		  end if
		  
		  f.CreateAsFolder
		  
		  modVariables.ExportAllImages(f.Child("ISCimages"))
		  
		  f = f.Child(modVariables.ProjectApplicationName + ".mxml")
		  'f=SpecialFolder.Desktop.Child("ISCProject.py")
		  If f <> Nil then
		    t=TextOutputStream.Create(f)
		    t.Write(modCodeGenerator.FlexWebCode)
		    t.Close
		  End if
		  
		  f2 = f
		  
		  f = f.Parent.Child("components")
		  f.CreateAsFolder
		  
		  f = f.Child("DraggablePanel.as")
		  If f <> Nil then
		    t=TextOutputStream.Create(f)
		    t.Write(modCodeGenerator.GetFlexDragPanelString)
		    t.Close
		  End if
		  
		  f = f2.Parent.Child("components").Child("assets")'f.Parent.Child("assets")
		  f.CreateAsFolder
		  
		  f = f.Child("img")
		  f.CreateAsFolder
		  
		  f = f.Child("close.png")
		  f.SaveAsJPEG(closepanel)
		  
		  // Now we run the compiler
		  
		  dim theShell as Shell
		  theShell = new Shell
		  dim fHTML as FolderItem
		  
		  dim theCmd as string
		  
		  if TargetLinux = true or TargetWin32 = true or TargetMacOS = true then
		    if modPrefs.getFlexCompiler <> nil then
		      theCmd = modPrefs.getFlexCompiler.ShellPath + " " + f2.ShellPath
		      'MsgBox theCmd
		      theShell.Execute theCmd
		      'MsgBox theShell.Result
		      if theShell.Result.InStr ("not found") > -1 then
		        'MsgBox "It appears that Java is not properly installed on this system.  Please install the Java JDK from http://www.java.com."
		      end if
		      
		      if TargetWin32 = true then
		        theShell.TimeOut = 240000
		      end if
		      
		      
		      if f2.Parent.Child(ReplaceAll(f2.Name, ".mxml", ".swf")) <> nil then
		        'f2 = f2.Parent.Child(ReplaceAll(f2.Name, ".mxml", ".swf")) 
		        
		        fHTML = f2.Parent.Child(modVariables.ProjectApplicationName + ".html")
		        If fHTML <> Nil then
		          t=TextOutputStream.Create(fHTML)
		          t.WriteLine("<object type=""application/x-shockwave-flash"" data=""" + modVariables.ProjectApplicationName + _
		          ".swf"" width=""100%"" height=""100%"" />")
		          t.Close
		          
		        End if
		      end if
		    end if
		  end if
		  
		  
		  
		  frmBuilding.Close
		  
		  if fHTML <> nil then
		    Return fHTML
		  end if
		  
		  Return f2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildProjectHaikuDesktop() As FolderItem
		  if modChecker.CheckProjectForErrors = false then
		    Return nil
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    modFile.SafeProjectFileAs
		  else
		    
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    MsgBox "You must save the project first."
		    Return nil
		  end if
		  
		  
		  modCodeGenerator.TargetInProcess = app.kpPythonDesktop
		  modCodeGenerator.BeginCodeGeneration(app.kpPythonDesktop)
		  
		  // Save the python project to the desktop (need to change and base on project name
		  Dim t as TextOutputStream
		  Dim f as FolderItem
		  
		  // Make a build folder
		  f = modFile.currentSaveFile.Parent.Child(modVariables.ProjectApplicationName + "PythonDesktop")
		  if f.Exists then
		    f.Delete
		  end if
		  
		  f.CreateAsFolder
		  f = f.Child(modVariables.ProjectApplicationName + ".py")
		  'f=SpecialFolder.Desktop.Child("ISCProject.py")
		  If f <> Nil then
		    t=TextOutputStream.Create(f)
		    t.Write(modCodeGenerator.PythonDesktopCode)
		    t.Close
		  End if
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildProjectHTML5() As FolderItem
		  if modChecker.CheckProjectForErrors = false then
		    Return nil
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    modFile.SafeProjectFileAs
		  else
		    
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    MsgBox "You must save the project first."
		    Return nil
		  end if
		  
		  app.DoEvents
		  app.YieldToNextThread
		  
		  modCodeGenerator.TargetInProcess = app.kpPHPJavascriptWeb
		  modCodeGenerator.BeginCodeGeneration(app.kpPHPJavascriptWeb)
		  
		  // Save the project to the desktop (need to change and base on project name
		  Dim t as TextOutputStream
		  Dim f as FolderItem
		  dim f2 as FolderItem
		  dim f3 as FolderItem
		  
		  // Make a build folder
		  f = modFile.currentSaveFile.Parent.Child(modVariables.ProjectApplicationName + "HTML")
		  if f.Exists then
		    f.Delete
		  end if
		  
		  f.CreateAsFolder
		  
		  modVariables.ExportAllImages(f.Child("ISCimages"))
		  
		  f = f.Child(modVariables.ProjectApplicationName + ".html")
		  If f <> Nil then
		    t=TextOutputStream.Create(f)
		    t.Write(modCodeGenerator.WebJavaScriptCode)
		    t.Close
		  End if
		  
		  f2 = f
		  
		  f = f.Parent.Child("javascript")
		  f.CreateAsFolder
		  
		  f3 = f.Child("builder.js")
		  If f3 <> Nil then
		    t=TextOutputStream.Create(f3)
		    t.Write(webbuilderjs)
		    t.Close
		  End if
		  
		  f3 = f.Child("controls.js")
		  If f3 <> Nil then
		    t=TextOutputStream.Create(f3)
		    t.Write(webcontrolsjs)
		    t.Close
		  End if
		  
		  f3 = f.Child("dragdrop.js")
		  If f3 <> Nil then
		    t=TextOutputStream.Create(f3)
		    t.Write(webdragdropjs)
		    t.Close
		  End if
		  
		  f3 = f.Child("effects.js")
		  If f3 <> Nil then
		    t=TextOutputStream.Create(f3)
		    t.Write(webeffectsjs)
		    t.Close
		  End if
		  
		  f3 = f.Child("scriptaculous.js")
		  If f3 <> Nil then
		    t=TextOutputStream.Create(f3)
		    t.Write(webscriptaculousjs)
		    t.Close
		  End if
		  
		  f3 = f.Child("slider.js")
		  If f3 <> Nil then
		    t=TextOutputStream.Create(f3)
		    t.Write(websliderjs)
		    t.Close
		  End if
		  
		  f3 = f.Child("sound.js")
		  If f3 <> Nil then
		    t=TextOutputStream.Create(f3)
		    t.Write(websoundjs)
		    t.Close
		  End if
		  
		  f3 = f.Child("unittest.js")
		  If f3 <> Nil then
		    t=TextOutputStream.Create(f3)
		    t.Write(webunittestjs)
		    t.Close
		  End if
		  
		  f3 = f.Child("prototype.js")
		  If f3 <> Nil then
		    t=TextOutputStream.Create(f3)
		    t.Write(webprototypejs)
		    t.Close
		  End if
		  
		  Return f2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildProjectHTML5OLD() As FolderItem
		  if modFile.currentSaveFile = nil then
		    modFile.SafeProjectFileAs
		  else
		    
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    MsgBox "You must save the project first."
		    Return nil
		  end if
		  
		  dim f as FolderItem
		  dim f2 as FolderItem
		  Dim t as TextOutputStream
		  
		  frmBuilding.Show
		  app.DoEvents
		  app.YieldToNextThread
		  frmBuilding.Refresh
		  
		  // Generate the base project files
		  // Make a build folder
		  f = modFile.currentSaveFile.Parent.Child(modVariables.ProjectApplicationName + "HTML5")
		  if f.Exists then
		    f.Delete
		  end if
		  
		  f.CreateAsFolder
		  
		  
		  
		  
		  
		  
		  // Make IlluminationReadMe.txt
		  
		  dim strReadMe as string
		  
		  strReadMe = "This project is built with Illumination Software Creator.  Below are a few items worth noting that cover how to run and test your Android application." + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "1) You must have a functioning copy of Eclipse and the Android SDK installed.  You can download them, and find full instructions on setting them up for Windows, Linux or MacOS X from http://developer.android.com/sdk/index.html." + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "2) Now that your project is built with Illumination, open up Eclipse and go to the File menu, select Import, and choose General -> Existing Projects Into Workspace.  Then select the root directory of your new Android project and click Finish.  This will add your project into Eclipse." + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "3) By default your project is set to use the Android SDK version 2.2.  If you have this installed you are all set.  If not, you can either follow the instructions on the URL in step 1 to install version 2.2, or you can right click on your project name on the right hand side of Eclipse, choose Properties, and choose a different SDK version from the Android section." + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "4) At this point your project is all set and ready to run!  Simply choose Run from the Run menu and select Android Application (only necessary the first time you run this project) and the Android Simulator will launch and load your application!" + EndOfLine + EndOfLine
		  
		  f2 = f.Child("IlluminationReadMe.txt")
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(strReadMe)
		    t.Close
		  End if
		  
		  
		  // Build the project!
		  modCodeGenerator.TargetInProcess = app.kpPHPJavascriptWeb
		  modCodeGenerator.BeginCodeGeneration(app.kpPHPJavascriptWeb)
		  
		  // Save the html file
		  
		  f2 = f.Child(modVariables.GetSpaceFreeAppName + ".html")
		  
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(modCodeGenerator.WebJavaScriptCode)
		    t.Close
		  End if
		  
		  
		  frmBuilding.Close
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildProjectiOSiPad() As FolderItem
		  
		  dim f as FolderItem
		  modCodeGenerator.BuildingForiPad = true
		  f = BuildProjectiOSiPhone
		  modCodeGenerator.BuildingForiPad = false
		  Return f
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildProjectiOSiPhone() As FolderItem
		  if modChecker.CheckProjectForErrors = false then
		    Return nil
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    modFile.SafeProjectFileAs
		  else
		    
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    MsgBox "You must save the project first."
		    Return nil
		  end if
		  
		  dim f as FolderItem
		  dim f2 as FolderItem
		  Dim t as TextOutputStream
		  
		  frmBuilding.Show
		  app.DoEvents
		  app.YieldToNextThread
		  frmBuilding.Refresh
		  
		  // Generate the base project files
		  // Make a build folder
		  if modCodeGenerator.BuildingForiPad = true then
		    f = modFile.currentSaveFile.Parent.Child(modVariables.ProjectApplicationName + "iOSiPad")
		  else
		    f = modFile.currentSaveFile.Parent.Child(modVariables.ProjectApplicationName + "iOSiPhone")
		  end if
		  
		  if f.Exists then
		    f.Delete
		  end if
		  
		  f.CreateAsFolder
		  
		  f.Child("Classes").CreateAsFolder
		  
		  // Export all the images
		  modVariables.ExportAllImages(f.Child("Classes"))
		  
		  f.Child(modVariables.GetSpaceFreeAppName + ".xcodeproj").CreateAsFolder
		  
		  
		  // Make IlluminationReadMe.txt
		  
		  dim strReadMe as string
		  
		  strReadMe = "This project is built with Illumination Software Creator.  Below are a few items worth noting that cover how to run and test your iOS application." + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "1) You must have a current copy of XCode and the iOS (iPhone / iPad) SDK installed.  You can find more information at: http://developer.apple.com/devcenter/ios/index.action" + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "2) On your Mac, with XCode installed, double click on the .xcodeproj file.  This will launch XCode and open your project." + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "3) At this point you are all set!  Just hit 'Build and Run' from the XCode toolbar and you can run your new app in the iPhone simulator." + EndOfLine + EndOfLine + EndOfLine
		  strReadMe = strReadMe + "Note - There is no technical difference between applications created with Illumination Software Creator, and those apps created with XCode alone.  Your application can be modified, run on actual iOS devices and even submited to the iTunes App Store." + EndOfLine + EndOfLine
		  
		  f2 = f.Child("IlluminationReadMe.txt")
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(strReadMe)
		    t.Close
		  End if
		  
		  
		  // Build the project!
		  modCodeGenerator.TargetInProcess = app.kpiOSiPhone
		  modCodeGenerator.BeginCodeGeneration(app.kpiOSiPhone)
		  
		  // Save the main.m file
		  f2 = f.Child("main.m")
		  
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(modCodeGenerator.iosMainCode)
		    t.Close
		  End if
		  
		  // Save the .h file
		  f2 = f.Child("Classes").Child(modVariables.GetiOSDelegateName + ".h")
		  
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(modCodeGenerator.iosAppDelegateHCode)
		    t.Close
		  End if
		  
		  
		  // Save the .m file
		  f2 = f.Child("Classes").Child(modVariables.GetiOSDelegateName + ".m")
		  
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(modCodeGenerator.iosAppDelegateMCode)
		    t.Close
		  End if
		  
		  // Save the plist file
		  f2 = f.Child(modVariables.GetSpaceFreeAppName + "-Info.plist")
		  
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(modCodeGenerator.iosPList)
		    t.Close
		  End if
		  
		  // Save the prefix file
		  f2 = f.Child(modVariables.GetSpaceFreeAppName + "_Prefix.pch")
		  
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(modCodeGenerator.iosPrefix)
		    t.Close
		  End if
		  
		  // Save the pbxproj file
		  f2 = f.Child(modVariables.GetSpaceFreeAppName + ".xcodeproj").Child("project.pbxproj")
		  
		  If f <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(modCodeGenerator.iosPBXProj)
		    t.Close
		  End if
		  
		  
		  frmBuilding.Close
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildProjectPythonDesktop() As FolderItem
		  if modChecker.CheckProjectForErrors = false then
		    Return nil
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    modFile.SafeProjectFileAs
		  else
		    
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    MsgBox "You must save the project first."
		    Return nil
		  end if
		  
		  
		  modCodeGenerator.TargetInProcess = app.kpPythonDesktop
		  modCodeGenerator.BeginCodeGeneration(app.kpPythonDesktop)
		  
		  // Save the python project to the desktop (need to change and base on project name
		  Dim t as TextOutputStream
		  Dim f as FolderItem
		  
		  // Make a build folder
		  f = modFile.currentSaveFile.Parent.Child(modVariables.ProjectApplicationName + "PythonDesktop")
		  if f.Exists then
		    f.Delete
		  end if
		  
		  f.CreateAsFolder
		  
		  modVariables.ExportAllImages(f.Child("ISCimages"))
		  
		  f = f.Child(modVariables.ProjectApplicationName + ".py")
		  'f=SpecialFolder.Desktop.Child("ISCProject.py")
		  If f <> Nil then
		    t=TextOutputStream.Create(f)
		    t.Write(modCodeGenerator.PythonDesktopCode)
		    t.Close
		  End if
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildProjectPythonMaemo() As FolderItem
		  if modChecker.CheckProjectForErrors = false then
		    Return nil
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    modFile.SafeProjectFileAs
		  else
		    
		  end if
		  
		  if modFile.currentSaveFile = nil then
		    MsgBox "You must save the project first."
		    Return nil
		  end if
		  
		  
		  modCodeGenerator.TargetInProcess = app.kpPythonMaemo
		  modCodeGenerator.BeginCodeGeneration(app.kpPythonMaemo)
		  
		  // Save the python project to the desktop (need to change and base on project name
		  Dim t as TextOutputStream
		  Dim f as FolderItem
		  dim fParentFolder as FolderItem
		  
		  // Make a build folder
		  fParentFolder = modFile.currentSaveFile.Parent.Child(modVariables.ProjectApplicationName + "PythonMaemo")
		  if fParentFolder.Exists then
		    fParentFolder.Delete
		  end if
		  
		  fParentFolder.CreateAsFolder
		  
		  modVariables.ExportAllImages(fParentFolder.Child("ISCimages"))
		  
		  f = fParentFolder.Child(modVariables.ProjectApplicationName + ".py")
		  
		  'f=SpecialFolder.Desktop.Child("ISCProject.py")
		  If f <> Nil then
		    t=TextOutputStream.Create(f)
		    t.Write(modCodeGenerator.PythonDesktopCode)
		    t.Close
		  End if
		  
		  
		  
		  // Create Maemo Instructions File
		  dim fInstructions as FolderItem
		  dim tInstructions as TextOutputStream
		  dim sInstructions as string
		  
		  sInstructions = "Running your application on a Maemo-powered Internet Tablet (Nokia N800, N810, N900, etc.):" + EndOfLine + EndOfLine
		  sInstructions = sInstructions + "1) Copy the .py file in this folder to your Maemo powered tablet." + EndOfLine
		  sInstructions = sInstructions + "2) Launch the X Terminal application (usually located in your Utilities section)." + EndOfLine
		  sInstructions = sInstructions + "3) Change to the directory where you placed your application (for example, if you have an N800/N810 and you copied your " + _
		  "application via USB, you would type 'cd /media/mmc2' to change to your internal memory card" + EndOfLine
		  sInstructions = sInstructions + "4) From there type 'python yourapplication.py'.  This will run your application." + EndOfLine + EndOfLine + EndOfLine
		  sInstructions = sInstructions + "Distributing your application to other Maemo-powered Tablets:" + EndOfLine + EndOfLine
		  sInstructions = sInstructions + "You will want to create a .deb package so that your application can be properly installed on other tablets." + EndOfLine
		  sInstructions = sInstructions + "There is a great set of instructions on how to do this here:" + EndOfLine
		  sInstructions = sInstructions + "http://wiki.maemo.org/PyMaemo/UsingPythonInMaemo#Distributing_Python_applications" + EndOfLine
		  
		  fInstructions = fParentFolder.Child("Maemo Instructions.txt")
		  If fInstructions <> Nil then
		    tInstructions=TextOutputStream.Create(fInstructions)
		    tInstructions.Write(sInstructions)
		    tInstructions.Close
		  End if
		  
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub myNewProject()
		  
		  Dim d as New MessageDialog  //declare the MessageDialog object
		  Dim b as MessageDialogButton //for handling the result
		  
		  if modFile.fileisDirty = false then
		    modFile.StartNewProject
		  else
		    d.icon=MessageDialog.GraphicCaution   //display warning icon
		    d.ActionButton.Caption="Save Project"
		    d.CancelButton.Visible=True     //show the Cancel button
		    d.AlternateActionButton.Visible=true   //show the "Don't Save" button
		    d.AlternateActionButton.Caption="Don't Save"
		    d.Message="Do you want to save changes to the current project?"
		    d.Explanation="If you don't save, your changes will be lost."
		    b=d.ShowModal     //display the dialog
		    Select Case b //determine which button was pressed.
		    Case d.ActionButton
		      //user pressed Save
		      if modFile.currentSaveFile = nil then
		        modFile.SafeProjectFileAs
		      else
		        modFile.SaveProject(modFile.currentSaveFile)
		      end if
		    Case d.AlternateActionButton
		      modFile.StartNewProject
		    Case d.CancelButton
		      //user pressed Cancel
		    End select
		  end if
		  
		  
		  UpdateTitleBar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub myOpenProject()
		  Dim d as New MessageDialog  //declare the MessageDialog object
		  Dim b as MessageDialogButton //for handling the result
		  
		  if modFile.fileisDirty = false then
		    modFile.LoadProjectFromFile
		  else
		    d.icon=MessageDialog.GraphicCaution   //display warning icon
		    d.ActionButton.Caption="Save Project"
		    d.CancelButton.Visible=True     //show the Cancel button
		    d.AlternateActionButton.Visible=true   //show the "Don't Save" button
		    d.AlternateActionButton.Caption="Don't Save"
		    d.Message="Do you want to save changes to the current project?"
		    d.Explanation="If you don't save, your changes will be lost."
		    b=d.ShowModal     //display the dialog
		    Select Case b //determine which button was pressed.
		    Case d.ActionButton
		      //user pressed Save
		      if modFile.currentSaveFile = nil then
		        modFile.SafeProjectFileAs
		      else
		        modFile.SaveProject(modFile.currentSaveFile)
		      end if
		    Case d.AlternateActionButton
		      modFile.LoadProjectFromFile
		      if conProperties <> nil then
		        conProperties.Close
		        ShowPropertiesForProject
		      end if
		    Case d.CancelButton
		      //user pressed Cancel
		    End select
		    
		  end if
		  
		  
		  UpdateTitleBar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mySaveAsImage()
		  dim f as FolderItem
		  
		  Dim jpegType as New FileType
		  jpegType.Name = "image/jpeg"
		  jpegType.MacType = "JPEG"
		  jpegType.Extensions = "jpg;jpeg"
		  
		  f = GetSaveFolderItem (jpegType, "MyISCProject.jpg")
		  
		  if f <> nil then
		    
		    f.SaveAsPicture(chartProject.GetPictureOfChart, FolderItem.SaveAsJPEG)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mySaveProject()
		  if modFile.currentSaveFile = nil then
		    modFile.SafeProjectFileAs
		  else
		    modFile.SaveProject(modFile.currentSaveFile)
		  end if
		  
		  UpdateTitleBar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateListObjects()
		  listObjects.DeleteAllRows
		  
		  // UI
		  if popCategory.Text = "User Interface" then
		    colorBlockList = kcolUserInterface
		    listObjects.AddRow "Window"
		    listObjects.AddRow "Close Window"
		    listObjects.AddRow "Message Box"
		    listObjects.AddRow "Confirmation Dialog"
		    listObjects.AddRow "Set TextBox"
		    listObjects.AddRow "Get TextBox"
		    listObjects.AddRow "Set Label"
		    listObjects.AddRow "Set TextField"
		    listObjects.AddRow "Get TextField"
		    listObjects.AddRow "Set ProgressBar"
		    listObjects.AddRow "Set Button"
		    listObjects.AddRow "Set Canvas Picture"
		    //listObjects.AddRow "Set ColorButton"
		    //listObjects.AddRow "Get ColorButton"
		    listObjects.AddRow "Set WebBrowser"
		    listObjects.AddRow "Set CheckBox"
		    listObjects.AddRow "Get CheckBox"
		    listObjects.AddRow "Add To ListBox"
		    listObjects.AddRow "Clear ListBox"
		    listObjects.AddRow "Get ListBox Selection"
		    'listObjects.AddRow "About Box"
		    'listObjects.AddRow "System Notification"
		  end if
		  
		  if popCategory.Text = "Text" then
		    colorBlockList = kcolText
		    listObjects.AddRow "Set Text"
		    listObjects.AddRow "Combine Text"
		    listObjects.AddRow "Lowercase"
		    listObjects.AddRow "Uppercase"
		    listObjects.AddRow "Replace Text"
		    listObjects.AddRow "Text Length"
		    listObjects.AddRow "Position In Text"
		    listObjects.AddRow "Text At Position"
		  end if
		  
		  if popCategory.Text = "Conversion" then
		    colorBlockList = kcolConversion
		    listObjects.AddRow "Text to Number"
		    listObjects.AddRow "Number to Text"
		  end if
		  
		  if popCategory.Text = "Dictionaries" then
		    colorBlockList = kcolDictionary
		    listObjects.AddRow "Set In Dictionary"
		    listObjects.AddRow "Get From Dictionary"
		    listObjects.AddRow "Remove From Dictionary"
		  end if
		  
		  // Math
		  if popCategory.Text = "Numbers" then
		    colorBlockList = kcolNumbers
		    listObjects.AddRow "Set Number"
		    listObjects.AddRow "Add"
		    listObjects.AddRow "Subtract"
		    listObjects.AddRow "Multiply"
		    listObjects.AddRow "Divide"
		    listObjects.AddRow "Remainder"
		    listObjects.AddRow "Random"
		  end if
		  
		  // Logic
		  if popCategory.Text = "Logic" then
		    colorBlockList = kcolLogic
		    listObjects.AddRow "If... Then..."
		    listObjects.AddRow "Do While"
		    listObjects.AddRow "Timer"
		    listObjects.AddRow "Specifc Target"
		    listObjects.AddRow "Departure Portal"
		    listObjects.AddRow "Destination Portal"
		  end if
		  
		  if popCategory.Text = "System" then
		    colorBlockList = kcolSystem
		    listObjects.AddRow "Run Shell Script"
		  end if
		  
		  // Files
		  if popCategory.Text = "Files" then
		    colorBlockList = kcolFiles
		    listObjects.AddRow "Read All Text From File"
		    listObjects.AddRow "Save All Text To File"
		    listObjects.AddRow "Open Text File Dialog"
		    listObjects.AddRow "Save Text File Dialog"
		    //listObjects.AddRow "Open Picture File"
		    //listObjects.AddRow "Open Text File"
		    //listObjects.AddRow "Save Picture File As"
		    //listObjects.AddRow "Save Text File As"
		  end if
		  
		  if popCategory.Text = "Picture" then
		    colorBlockList = kcolPicture
		    listObjects.AddRow "Fill Picture"
		    listObjects.AddRow "Draw Filled Rectangle"
		    listObjects.AddRow "Draw Line"
		    listObjects.AddRow "Draw Dot"
		    listObjects.AddRow "Draw Picture"
		    'listObjects.AddRow "Draw Filled Oval"
		    'listObjects.AddRow "Reset Picture"
		  end if
		  
		  if popCategory.Text = "Custom" then
		    colorBlockList = kcolCustom
		    
		    dim f as FolderItem
		    dim i as integer
		    dim tempCB as ilObjectCustomBlock
		    
		    f = modFile.GetISCCustomBlockFolder
		    
		    if f <> nil then
		      if f.Exists = true then
		        if f.Directory = true then
		          if f.Count > 0 then
		            
		            // Loop through all the items
		            for i = 1 to f.Count
		              if f.Item(i) <> nil then
		                if f.Item(i).Exists = true then
		                  if f.Item(i).Directory = false then
		                    
		                    tempCB = new ilObjectCustomBlock
		                    if tempCB <> nil then
		                      tempCB.LoadBlockFromFile(f.Item(i))
		                      
		                      if tempCB.BlockName <> "" then
		                        listObjects.AddRow tempCB.BlockName
		                        listObjects.RowTag(listObjects.LastIndex) = f.Item(i).Name
		                      end if
		                      
		                    end if
		                    
		                  end if
		                end if
		              end if
		            next
		            
		          end if
		        end if
		      end if
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateListVariables()
		  frmProject.listVariables.DeleteAllRows
		  
		  dim i as integer
		  
		  if modVariables.projectVariables.Ubound >=0 then
		    
		    for i = 0 to modVariables.projectVariables.Ubound
		      
		      frmProject.listVariables.AddRow modVariables.projectVariables(i).Name
		      frmProject.listVariables.RowTag(frmProject.listVariables.LastIndex) = modVariables.projectVariables(i).Type
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshCustomBlocksInUse(BlockFile as FolderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetScrollBars()
		  scrlHor.Maximum = chartProject.Width - canScroller.Width
		  scrlVer.Maximum = chartProject.Height - canScroller.Height
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunProjectFlexWeb()
		  
		  
		  dim f as FolderItem
		  
		  f = BuildProjectFlexWeb
		  
		  if f <> nil then
		    'ShowURL f.URLPath
		    if f.exists = true then
		      f.Launch
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunProjectHTML5()
		  
		  
		  dim f as FolderItem
		  
		  f = BuildProjectHTML5
		  
		  if f <> nil then
		    'ShowURL f.URLPath
		    if f.exists = true then
		      f.Launch
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunProjectiPad()
		  
		  dim f as FolderItem
		  
		  f = BuildProjectiOSiPad
		  
		  if f <> nil then
		    if f.exists = true then
		      dim f2 as FolderItem
		      f2 = f.Child(modVariables.GetSpaceFreeAppName + ".xcodeproj")
		      if f2.Exists = true then
		        f2.Launch
		        dim f3 as FolderItem
		        f3 = f.Child("RunProject.zsh")
		        
		        Dim t as TextOutputStream
		        If f3 <> Nil then
		          t=TextOutputStream.Create(f3)
		          t.Write(RunProjectZsh)
		          t.Close
		        End if
		        
		        dim sh as Shell
		        
		        sh = new Shell
		        
		        sh.Execute "zsh " + f3.ShellPath
		        sh.Execute "zsh " + f3.ShellPath
		        
		        //RuniOSAppSimulator
		      end if
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunProjectiPhone()
		  
		  dim f as FolderItem
		  
		  f = BuildProjectiOSiPhone
		  
		  if f <> nil then
		    if f.exists = true then
		      dim f2 as FolderItem
		      f2 = f.Child(modVariables.GetSpaceFreeAppName + ".xcodeproj")
		      if f2.Exists = true then
		        f2.Launch
		        dim f3 as FolderItem
		        f3 = f.Child("RunProject.zsh")
		        
		        Dim t as TextOutputStream
		        If f3 <> Nil then
		          t=TextOutputStream.Create(f3)
		          t.Write(RunProjectZsh)
		          t.Close
		        End if
		        
		        dim sh as Shell
		        
		        sh = new Shell
		        
		        sh.Execute "zsh " + f3.ShellPath
		        sh.Execute "zsh " + f3.ShellPath
		        
		        //RuniOSAppSimulator
		      end if
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunProjectPythonDesktop()
		  dim f as FolderItem
		  
		  f = BuildProjectPythonDesktop
		  
		  if f <> nil then
		    // Run the python project
		    Dim s As Shell
		    s=New Shell
		    s.Mode = 1
		    dim whut as string
		    
		    #if TargetWin32
		      whut = f.ShellPath + EndOfLine
		      If Not s.IsRunning Then
		        's.Execute "sh"
		      End If
		      s.Execute whut
		      
		    #elseif (TargetLinux)
		      whut = "python " + f.ShellPath + EndOfLine
		      If Not s.IsRunning Then
		        's.Execute "sh"
		      End If
		      s.Mode = 0
		      s.Execute whut
		      
		    #elseif (TargetMacOS)
		      
		      whut = "python " + f.ShellPath
		      'If Not s.IsRunning Then
		      's.Execute "sh"
		      'End If
		      'MsgBox whut
		      's.Execute whut
		      dim macShell as Shell
		      macShell = new Shell
		      
		      'macShell.Mode = 2
		      'If Not macShell.IsRunning Then
		      'macShell.Execute "sh"
		      'End If
		      'macShell.WriteLine "cd " + f.Parent.ShellPath
		      'macShell.WriteLine "python " + f.Name
		      macShell.Execute whut
		      if macShell.Result = "" then
		      end if
		      
		    #endif
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRunDropDownChecked()
		  
		  
		  ToolButton(toolbarProject1.Item(4)).DropDownMenu.Item(0).Checked = False
		  ToolButton(toolbarProject1.Item(4)).DropDownMenu.Item(1).Checked = False
		  ToolButton(toolbarProject1.Item(4)).DropDownMenu.Item(2).Checked = False
		  'ToolButton(toolbarProject1.Item(4)).DropDownMenu.Item(3).Checked = False
		  
		  ToolButton(toolbarProject1.Item(4)).DropDownMenu.Item(modPrefs.defaultRunTarget).Checked = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowPropertiesForObject(theObject as ilObjectBase)
		  if conProperties <> nil then
		    conProperties.Close
		    'conProperties = nil
		  end if
		  
		  if theObject isa ilObjectApp then
		    ShowPropertiesForProject
		  end if
		  
		  if theObject isa ilObjectAppQuit then
		    ShowPropertiesForProject
		  end if
		  
		  if theObject isa ilObjectMessageBox then
		    conProperties = new conMessageBox
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectConfirmationDialog then
		    conProperties = new conConfirmationDialog
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectWindow then
		    conProperties = new conWindow
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectTextSetText then
		    conProperties = new conTextSetText
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectTextUppercase then
		    conProperties = new conTextUppercase
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectTextLowercase then
		    conProperties = new conTextLowercase
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectNumberSetNumber then
		    conProperties = new conNumberSetNumber
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectConversionNumberToText then
		    conProperties = new conConversionNumberToText
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectConversionTextToNumber then
		    conProperties = new conConversionTextToNumber
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectNumberAdd then
		    conProperties = new conNumberAdd
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectNumberSubtract then
		    conProperties = new conNumberSubtract
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectNumberMultiply then
		    conProperties = new conNumberMultiply
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectNumberDivide then
		    conProperties = new conNumberDivide
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectTextCombineText then
		    conProperties = new conTextCombineText
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUISetLabel then
		    conProperties = new conUISetLabel
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUIGetTextBox then
		    conProperties = new conUIGetTextBox
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUISetTextBox then
		    conProperties = new conUISetTextBox
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectNote then
		    conProperties = new conNote
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectDoWhile then
		    conProperties = new conDoWhile
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectIfThen then
		    conProperties = new conIfThen
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectNumberRemainder then
		    conProperties = new conNumberRemainder
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUISetProgressBar then
		    conProperties = new conUISetProgressBar
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectTimer then
		    conProperties = new conTimer
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUISetButton then
		    conProperties = new conUISetButton
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectTextReplaceText then
		    conProperties = new conTextReplaceText
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectNumberRandom then
		    conProperties = new conNumberRandom
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUICloseWindow then
		    conProperties = new conUICloseWindow
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectSystemRunShellScript then
		    conProperties = new conSystemRunShellScript
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectFileReadAllTextFromFile then
		    conProperties = new conFileReadAllTextFromFile
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectFileOpenTextFileDialog then
		    conProperties = new conFileOpenTextFileDialog
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectFileSaveTextFileDialog then
		    conProperties = new conFileSaveTextFileDialog
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectFileSaveAllTextToFile then
		    conProperties = new conFileSaveAllTextToFile
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUIGetTextField then
		    conProperties = new conUIGetTextField
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUISetTextField then
		    conProperties = new conUISetTextField
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUISetCanvasFromPicture then
		    conProperties = new conUISetCanvasPicture
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectPictureDrawFilledRectangle then
		    conProperties = new conPictureDrawFilledRectangle
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectPictureFillPicture then
		    conProperties = new conPictureFillPicture
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectPictureDrawLine then
		    conProperties = new conPictureDrawLine
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectPictureDrawDot then
		    conProperties = new conPictureDrawDot
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUISetColorButton then
		    conProperties = new conUISetColorButton
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUIGetColorButton then
		    conProperties = new conUIGetColorButton
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectPictureDrawPicture then
		    conProperties = new conPictureDrawPicture
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUISetWebBrowser then
		    conProperties = new conUISetWebBrowser
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectCustomBlock then
		    conProperties = new conCustomBlock
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectDictionaryAdd then
		    conProperties = new conDictionaryAdd
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectDictionaryRemove then
		    conProperties = new conDictionaryRemove
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectDictionaryGet then
		    conProperties = new conDictionaryGet
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectPortalDeparture then
		    conProperties = new conPortalDeparture
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectPortalDestination then
		    conProperties = new conPortalDestination
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectTextInText then
		    conProperties = new conTextInText
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectTextTextAtPosition then
		    conProperties = new conTextTextAtPosition
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectTextTextLength then
		    conProperties = new conTextTextLength
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUISetCheckBox then
		    conProperties = new conUISetCheckBox
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUIGetCheckBox then
		    conProperties = new conUIGetCheckBox
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		  if theObject isa ilObjectUIClearListBox then
		    conProperties = new conUIClearListBox
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  if theObject isa ilObjectUIGetListBoxSelection then
		    conProperties = new conUIGetListBoxSelection
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  if theObject isa ilObjectUIAddToListBox then
		    conProperties = new conUIAddToListBox
		    conProperties.EmbedWithin(canCon,0,0)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowPropertiesForProject()
		  conProperties = new conProject
		  conProperties.EmbedWithin(canCon,0,0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateTitleBar()
		  dim s as string
		  
		  s = "Illumination Software Creator - "
		  
		  s = s + modVariables.ProjectApplicationName
		  
		  frmProject.Title = s
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		colorBlockList As color
	#tag EndProperty

	#tag Property, Flags = &h0
		conProperties As containercontrol
	#tag EndProperty

	#tag Property, Flags = &h0
		curDeltaX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurDeltaY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LastCustomBlockObjectAddedFailed As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		UniqueIDCount As Integer
	#tag EndProperty


	#tag Constant, Name = kcolColor, Type = Color, Dynamic = False, Default = \"&c005908", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcolConversion, Type = Color, Dynamic = False, Default = \"&c278570", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcolCustom, Type = Color, Dynamic = False, Default = \"&c6E6E6E", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcolDictionary, Type = Color, Dynamic = False, Default = \"&c002E79", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcolFiles, Type = Color, Dynamic = False, Default = \"&c770000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcolLogic, Type = Color, Dynamic = False, Default = \"&c2F0059", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcolNumbers, Type = Color, Dynamic = False, Default = \"&c005908", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcolPicture, Type = Color, Dynamic = False, Default = \"&c322896", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcolSystem, Type = Color, Dynamic = False, Default = \"&c4E4E4E", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcolText, Type = Color, Dynamic = False, Default = \"&c322896", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcolUserInterface, Type = Color, Dynamic = False, Default = \"&c284678", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events listObjects
	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  
		  if popCategory.Text = "Custom" then
		    Drag.PrivateRawData("text")="Custom///***///" + Me.RowTag(Row)
		  else
		    Drag.PrivateRawData("text")=Me.List(Row)
		  end if
		  
		  Return true
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  'Black Border
		  g.ForeColor = RGB(0,0,0)
		  g.FillRect(0,2,g.Width - 7, g.Height - 4)
		  
		  'Hilight stripe
		  g.ForeColor = rgb(colorBlockList.Red+20,colorBlockList.Green+20,colorBlockList.Blue+20)
		  g.FillRect(1,3,g.Width - 9, 1)
		  
		  'Main fill
		  g.ForeColor = colorBlockList
		  g.FillRect(1, 4, g.Width - 9, g.Height - 7)
		  
		  'g.Gradient(1,3,10,26)', colorBlockList, rgb(colorBlockList.Red-20,colorBlockList.Green-20,colorBlockList.Blue-20)
		  
		  // Draw the text
		  g.TextSize = 10
		  g.ForeColor = rgb(0,0,0)
		  if TargetLinux = true then
		    g.DrawString(me.List(row), 3, g.Height - 7)
		  ElseIf TargetWin32 = true then
		    g.DrawString(me.List(row), 3, g.Height - 5)
		  elseif TargetMacOS = true then
		    g.DrawString(me.List(row), 3, g.Height - 5)
		  end if
		  
		  g.ForeColor = rgb(255,255,255)
		  if TargetLinux = true then
		    g.DrawString(me.List(row), 3, g.Height - 6)
		  ElseIf TargetWin32 = true then
		    g.DrawString(me.List(row), 3, g.Height - 4)
		  elseif TargetMacOS = true then
		    g.DrawString(me.List(row), 3, g.Height - 4)
		  end if
		  
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  dim f as FolderItem
		  
		  
		  if popCategory.Text = "Custom" then
		    if listObjects.ListIndex > -1 then
		      
		      select case hitItem.Text
		        
		      case"Show in File System"
		        f = modFile.GetISCCustomBlockFolder.Child(listObjects.RowTag(listObjects.ListIndex))
		        if f <> nil then
		          if f.Exists = true then
		            f.Parent.Launch
		          end if
		        end if
		        
		      case "Delete Custom Block"
		        
		        Dim d as New MessageDialog  //declare the MessageDialog object
		        Dim b as MessageDialogButton //for handling the result
		        d.icon=MessageDialog.GraphicCaution   //display warning icon
		        d.ActionButton.Caption="Delete"
		        d.CancelButton.Visible=True     //show the Cancel button
		        d.AlternateActionButton.Visible=false   //show the "Don't Save" button
		        d.Message="Are you sure you want to delete this block?"
		        d.Explanation="If you"
		        
		        b=d.ShowModal     //display the dialog
		        Select Case b //determine which button was pressed.
		        Case d.ActionButton
		          //user pressed Save
		        Case d.AlternateActionButton
		          //user pressed Don't Save
		        Case d.CancelButton
		          //user pressed Cancel
		        End select
		        
		        f = modFile.GetISCCustomBlockFolder.Child(listObjects.RowTag(listObjects.ListIndex))
		        if f <> nil then
		          if f.Exists = true then
		            f.Delete
		          end if
		        end if
		        
		      case "Edit Custom Block"
		        
		        f = modFile.GetISCCustomBlockFolder.Child(listObjects.RowTag(listObjects.ListIndex))
		        if f <> nil then
		          if f.Exists = true then
		            frmCustomBlock.Show
		            frmCustomBlock.UpdatingDisplay = true
		            frmCustomBlock.myBlock = new ilObjectCustomBlock
		            frmCustomBlock.myBlock.LoadBlockFromFile(f)
		            frmCustomBlock.myWindowTitle = "Edit Block - " + f.Name
		            frmCustomBlock.UpdateDisplay
		          end if
		        end if
		        
		      end Select
		      
		    end if
		  end if
		  
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  if popCategory.Text = "Custom" then
		    if listObjects.ListIndex > -1 then
		      
		      base.Append(new MenuItem("Edit Custom Block"))
		      base.Append(new MenuItem("-"))
		      base.Append(new MenuItem("Show in File System"))
		      //base.Append(new MenuItem("Delete Custom Block"))
		      
		      Return true
		    end if
		  end if
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events popCategory
	#tag Event
		Sub Change()
		  if me.Text = "Custom" then
		    if modPrefs.isRegGood = false then
		      modPrefs.ShowUnregisteredDialog
		      me.ListIndex = 0
		      Return
		    end if
		  end if
		  
		  populateListObjects
		  listObjects.Refresh
		  listObjects.Invalidate
		  listObjects.InvalidateCell(0,0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events toolbarProject1
	#tag Event
		Sub Action(item As ToolItem)
		  
		  select case item.Name
		    
		  case "toolImageLibrary"
		    frmImageLibrary.Show
		    
		  case "toolBuild"
		    dim f as FolderItem
		    
		    dim m as MenuItem
		    m = new MenuItem
		    m.Name = "BuildRun"
		    m.Visible = true
		    m.Enabled = true
		    m.Text = "BuildRun"
		    
		    dim m8 as MenuItem
		    m8 = new MenuItem("Build HTML5 - Web")
		    m.Append m8
		    
		    dim m2 as MenuItem
		    m2 = new MenuItem("Build Python/GTK - Desktop")
		    m.Append m2
		    
		    dim m3 as MenuItem
		    m3 = new MenuItem("Build Python/GTK - Maemo")
		    m.Append m3
		    
		    dim m4 as MenuItem
		    m4 = new MenuItem("Build Adobe Flash/Flex - Web")
		    m.Append m4
		    
		    dim m5 as MenuItem
		    m5 = new MenuItem("Build Android")
		    m.Append m5
		    
		    dim m6 as MenuItem
		    m6 = new MenuItem("Build iOS - iPhone")
		    m.Append m6
		    
		    dim m7 as MenuItem
		    m7 = new MenuItem("Build iOS - iPad")
		    m.Append m7
		    
		    dim m9 as MenuItem
		    m9 = new MenuItem("Lunduke SDK")
		    m.Append m9
		    
		    dim mr as MenuItem
		    mr=m.Popup
		    
		    if mr <> nil then
		      
		      if mr.Text = "Build Python/GTK - Desktop" then
		        if modPrefs.isRegGood = false then
		          modPrefs.ShowUnregisteredDialog
		          Return
		        end if
		        f = BuildProjectPythonDesktop
		        if f <> nil then
		          f.Parent.Launch
		        end if
		      end if
		      
		      if mr.Text = "Build Python/GTK - Maemo" then
		        if modPrefs.isRegGood = false then
		          modPrefs.ShowUnregisteredDialog
		          Return
		        end if
		        f = BuildProjectPythonMaemo
		        if f <> nil then
		          f.Parent.Launch
		        end if
		      end if
		      
		      if mr.Text = "Build Adobe Flash/Flex - Web" then
		        if modPrefs.isRegGood = false then
		          modPrefs.ShowUnregisteredDialog
		          Return
		        end if
		        f = BuildProjectFlexWeb
		        if f <> nil then
		          f.Parent.Launch
		        end if
		      end if
		      
		      if mr.Text = "Build Android" then
		        if modPrefs.isRegGood = false then
		          modPrefs.ShowUnregisteredDialog
		          Return
		        end if
		        f = BuildProjectAndroid
		        if f <> nil then
		          f.Launch
		        end if
		      end if
		      
		      if mr.Text = "Build iOS - iPhone" then
		        if modPrefs.isRegGood = false then
		          modPrefs.ShowUnregisteredDialog
		          Return
		        end if
		        f = BuildProjectiOSiPhone
		        if f <> nil then
		          f.Launch
		        end if
		      end if
		      
		      if mr.Text = "Build iOS - iPad" then
		        if modPrefs.isRegGood = false then
		          modPrefs.ShowUnregisteredDialog
		          Return
		        end if
		        f = BuildProjectiOSiPad
		        if f <> nil then
		          f.Launch
		        end if
		      end if
		      
		      if mr.Text = "Build HTML5 - Web" then
		        f = BuildProjectHTML5
		        if f <> nil then
		          f.Parent.Launch
		        end if
		      end if
		      
		    end if
		    
		    
		  case "toolNote"
		    AddNewObject("Note", 200 -(curDeltaX), 20 -(CurDeltaY))
		    
		  case "toolRun"
		    
		    dim mRun as MenuItem
		    mRun = new MenuItem
		    mRun.Name = "BuildRun"
		    mRun.Visible = true
		    mRun.Enabled = true
		    mRun.Text = "BuildRun"
		    
		    dim mRun8 as MenuItem
		    mRun8 = new MenuItem("Run HTML5 - Web")
		    mRun.Append mRun8
		    
		    dim mRun2 as MenuItem
		    mRun2 = new MenuItem("Run Python/GTK - Desktop")
		    mRun.Append mRun2
		    
		    dim mRun3 as MenuItem
		    mRun3 = new MenuItem("Run Adobe Flash/Flex - Web")
		    mRun.Append mRun3
		    
		    if TargetMacOS = true then // If on a Mac, allow running
		      dim mRun6 as MenuItem
		      mRun6 = new MenuItem("Run iOS - iPhone")
		      mRun.Append mRun6
		      
		      dim mRun7 as MenuItem
		      mRun7 = new MenuItem("Run iOS - iPad")
		      mRun.Append mRun7
		    end if
		    
		    dim mrRun as MenuItem
		    mrRun=mRun.Popup
		    
		    if mrRun <> nil then
		      
		      if mrRun.Text = "Run Python/GTK - Desktop" then
		        if modPrefs.isRegGood = false then
		          modPrefs.ShowUnregisteredDialog
		          Return
		        end if
		        RunProjectPythonDesktop
		      end if
		      
		      if mrRun.Text = "Run Adobe Flash/Flex - Web" then
		        if modPrefs.isRegGood = false then
		          modPrefs.ShowUnregisteredDialog
		          Return
		        end if
		        RunProjectFlexWeb
		      end if
		      
		      if mrRun.Text = "Run iOS - iPhone" then
		        if modPrefs.isRegGood = false then
		          modPrefs.ShowUnregisteredDialog
		          Return
		        end if
		        RunProjectiPhone
		      end if
		      
		      if mrRun.Text = "Run iOS - iPad" then
		        if modPrefs.isRegGood = false then
		          modPrefs.ShowUnregisteredDialog
		          Return
		        end if
		        RunProjectiPad
		      end if
		      
		      if mrRun.Text = "Run HTML5 - Web" then
		        RunProjectHTML5
		      end if
		      
		    end if
		    
		    '
		    ''RunProjectPythonDesktop
		    'if modPrefs.defaultRunTarget = App.kpPythonDesktop then
		    'RunProjectPythonDesktop
		    '
		    'ElseIf modPrefs.defaultRunTarget = app.kpPythonMaemo then
		    '
		    'ElseIf modPrefs.defaultRunTarget = app.kpFlexWeb then
		    'RunProjectFlexWeb
		    '
		    'ElseIf modPrefs.defaultRunTarget = app.kpFlexAIRDesktop then
		    '
		    'end if
		    
		  case "toolNewProject"
		    myNewProject
		    
		  case "toolSaveProject"
		    mySaveProject
		    
		  case "toolOpen"
		    myOpenProject
		    
		  case "toolPreferences"
		    frmPreferences.Show
		    
		  case "toolHelp"
		    
		  end Select
		  
		  chartProject.Refresh
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Dim myMenu as New MenuItem
		  
		  myMenu.Append new MenuItem("Python/GTK - Desktop")
		  myMenu.Append new MenuItem("Python/GTK - Maemo Tablet")
		  myMenu.Append new MenuItem("Adobe Flex - Web")
		  'myMenu.Append new MenuItem("Adobe Flex/AIR - Desktop")
		  myMenu.Item(1).Enabled = false
		  'myMenu.Item(2).Enabled = false
		  'myMenu.Item(3).Enabled = false
		  
		  ToolButton(toolbarProject1.Item(4)).DropDownMenu = myMenu
		  
		  SetRunDropDownChecked
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropDownMenuAction(item As ToolItem, hitItem As MenuItem)
		  select case hitItem.Text
		    
		  case "Python/GTK - Desktop"
		    RunProjectPythonDesktop
		    modPrefs.defaultRunTarget = app.kpPythonDesktop
		    
		  case "Python/GTK - Maemo Tablet"
		    modPrefs.defaultRunTarget = app.kpPythonMaemo
		    
		  case "Adobe Flex - Web"
		    RunProjectFlexWeb
		    modPrefs.defaultRunTarget = app.kpFlexWeb
		    
		  case "Adobe Flex/AIR - Desktop"
		    modPrefs.defaultRunTarget = app.kpFlexAIRDesktop
		    
		  end select
		  
		  modPrefs.WriteAllPrefs
		  SetRunDropDownChecked
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events timeFirstRun
	#tag Event
		Sub Action()
		  if modPrefs.prefFirstRun = true then
		    'frmFirstRun.ShowModal
		    if app.kForUbuntuStore = true then
		      // Don't display
		    else
		      frmFirstRunSimple.Show
		    end if
		  else
		    if modPrefs.isRegGood = false then
		      'frmReg.ShowModal
		    end if
		  end if
		  
		  // How big?  5000x5000 is far too big
		  chartProject.Width = 1500
		  chartProject.Height = 1000
		  
		  ResetScrollBars
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chartProject
	#tag Event
		Sub Open()
		  me.AcceptRawDataDrop("text")
		  
		  AddNewObject("Application", 20, 20)
		  AddNewObject("ApplicationQuit", 420, 420)
		  
		  modFile.StartNewProject
		  frmProject.populateListVariables
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ShouldAllowLink(fromObject as ContentObject, toObject as ContentObject) As Boolean
		  'if fromObject = nil then
		  'Return false
		  'end if
		  '
		  'if toObject = nil then
		  'Return false
		  'end if
		  '
		  'if fromObject.ShowOutput = False then
		  'Return false
		  'end if
		  '
		  'if toObject.ShowInput = false then
		  'Return false
		  'end if
		  
		  //Allow All Links
		  modFile.fileisDirty = true
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  'if TargetLinux then
		  CurX = me.MouseX - me.Left
		  curY = me.MouseY - me.Top
		  'end if
		  
		  'if frmProject.chartProject.frames.Ubound > 9 then
		  'if modPrefs.isRegGood = false then
		  'modPrefs.ShowUnregisteredDialog
		  'Return
		  'end if
		  'end if
		  
		  AddNewObject(obj.PrivateRawData("text"), curx, cury)
		  
		  chartProject.Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  curx = x
		  cury = y
		End Sub
	#tag EndEvent
	#tag Event
		Sub FrameSelected(frame as contentFrame)
		  if frame <> nil then
		    if frame.tag <> nil then
		      ShowPropertiesForObject(ilObjectBase(frame.tag))
		    else
		      if conProperties <> nil then
		        conProperties.Close
		        ShowPropertiesForProject
		      end if
		    end if
		    
		  else
		    if conProperties <> nil then
		      conProperties.Close
		      ShowPropertiesForProject
		    end if
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  if chartProject.selectedFrame <> nil then
		    dim i as integer
		    dim j as integer
		    
		    if chartProject.selectedFrame.tag isa ilObjectApp or chartProject.selectedFrame.tag isa ilObjectAppQuit then
		    else
		      base.append(New MenuItem("Remove Block"))
		      base.append(New MenuItem(MenuItem.TextSeparator))
		    end if
		    
		    dim tester as integer
		    for tester = 0 to chartProject.selectedFrame.contents.Ubound
		      'base.append(New MenuItem(TextObject(chartProject.selectedFrame.contents(tester)).text))
		    next
		    
		    if chartProject.selectedFrame.contents.Ubound > -1 then
		      for i = 0 to chartProject.selectedFrame.contents.Ubound
		        if chartProject.selectedFrame.contents(i).outputs.Ubound > -1 then
		          for j = 0 to chartProject.selectedFrame.contents(i).outputs.Ubound
		            base.append(New MenuItem("Remove Link : " + _
		            TextObject(chartProject.selectedFrame.contents(i)).text + " -> " + _
		            TextObject(chartProject.selectedFrame.contents(i).outputs(j)).text))
		            base.Item(base.Count - 1).Tag  = str(i) + "*" + str(j)
		          next
		        end if
		      next
		    end if
		    
		    
		    Return True  //display the contextual menu
		    
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  if chartProject.selectedFrame <> nil then
		    Select Case hititem.text
		    case "Remove Block"
		      if chartProject.selectedFrame.tag isa ilObjectApp or chartProject.selectedFrame.tag isa ilObjectAppQuit then
		      else
		        chartProject.DeleteFrame(chartProject.selectedFrame)
		      end if
		      
		    case else
		      if hitItem.Text.InStr("Remove Link") > 0 then // Remove some links
		        dim theCO as integer
		        dim theOutput as integer
		        theCO = val(NthField(hitItem.Tag, "*", 1))
		        theOutput = val(NthField(hitItem.Tag, "*", 2))
		        chartProject.selectedFrame.RemoveLink(theCO, theOutput)
		        chartProject.Refresh
		        modFile.fileisDirty = true
		      end if
		      
		    end select
		  end if
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  if me.selectedFrame <> nil then
		    if me.selectedFrame.tag isa ilObjectWindow then
		      
		      frmUIEditor.ShowModal
		      
		    end if
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scrlVer
	#tag Event
		Sub ValueChanged()
		  dim newDeltaY as integer
		  
		  newDeltaY = - (curDeltaY + me.Value)
		  
		  canScroller.Scroll(0,newDeltaY)
		  
		  curDeltaY = -(me.Value)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scrlHor
	#tag Event
		Sub ValueChanged()
		  dim newDeltaX as integer
		  
		  newDeltaX = - (curDeltaX + me.Value)
		  
		  canScroller.Scroll(newDeltaX,0)
		  
		  curDeltaX = -(me.Value)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events timeNav
	#tag Event
		Sub Action()
		  'canNavigator.Graphics.DrawPicture chartProject.CurrentChartPic, 0, 0, canNavigator.Graphics.Width, canNavigator.Graphics.Height, 0, 0, chartProject.CurrentChartPic.Width, chartProject.CurrentChartPic.Height
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events listVariables
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  dim c as color
		  
		  select case me.RowTag(row)
		    
		  case "Text"
		    c = kcolText
		  case "Number"
		    c = kcolNumbers
		  case "Color"
		    c = kcolColor
		  case "Text File"
		    c = kcolFiles
		  case "Picture"
		    c = kcolPicture
		  case "Dictionary"
		    c = kcolDictionary
		    
		  end select
		  
		  
		  'Black Border
		  g.ForeColor = RGB(0,0,0)
		  g.FillRect(0,2,g.Width - 7, g.Height - 4)
		  
		  'Hilight stripe
		  g.ForeColor = rgb(c.Red+20,c.Green+20,c.Blue+20)
		  g.FillRect(1,3,g.Width - 9, 1)
		  
		  'Main fill
		  g.ForeColor = c
		  g.FillRect(1, 4, g.Width - 9, g.Height - 7)
		  
		  // Draw the name
		  g.TextSize = 10
		  g.ForeColor = rgb(0,0,0)
		  if TargetLinux = true then
		    g.DrawString(me.List(row) + " (" + me.RowTag(row) + ")", 3, g.Height - 16, g.Width -9, true)
		  ElseIf TargetWin32 = true then
		    g.DrawString(me.List(row) + " (" + me.RowTag(row) + ")", 3, g.Height - 15, g.Width -9, true)
		  elseif TargetMacOS = true then
		    g.DrawString(me.List(row) + " (" + me.RowTag(row) + ")", 3, g.Height - 15, g.Width -9, true)
		  end if
		  
		  g.ForeColor = rgb(255,255,255)
		  if TargetLinux = true then
		    g.DrawString(me.List(row) + " (" + me.RowTag(row) + ")", 3, g.Height - 15, g.Width -9, true)
		  ElseIf TargetWin32 = true then
		    g.DrawString(me.List(row) + " (" + me.RowTag(row) + ")", 3, g.Height - 13, g.Width -9, true)
		  elseif TargetMacOS = true then
		    g.DrawString(me.List(row) + " (" + me.RowTag(row) + ")", 3, g.Height - 13, g.Width -9, true)
		  end if
		  
		  // Draw the default
		  if me.RowTag(row) = "Color" then
		    dim defColor as color
		    defColor = modVariables.StringToColor(modVariables.VariableObjectFromName(me.List(row)).DefaultVal)
		    
		    // Draw the color border
		    g.ForeColor = rgb(0,0,0)
		    g.FillRect(3, 16, g.Width - 13, 8)
		    
		    // Draw the fill color itself
		    g.ForeColor = defColor
		    g.FillRect(4, 17, g.Width - 15, 6)
		    
		  ElseIf me.RowTag(row) = "Dictionary" then
		    
		    
		  else
		    
		    Dim strDefaultStuff as string
		    
		    if me.RowTag(row) = "Picture" then
		      strDefaultStuff = ReplaceAll(modVariables.VariableObjectFromName(me.List(row)).DefaultVal, "*", " X ")
		    else
		      strDefaultStuff = modVariables.VariableObjectFromName(me.List(row)).DefaultVal
		    end if
		    
		    
		    g.TextSize = 8
		    g.ForeColor = rgb(0,0,0)
		    if TargetLinux = true then
		      g.DrawString("Default = " + strDefaultStuff, 3, g.Height - 6, g.Width -9, true)
		    ElseIf TargetWin32 = true then
		      g.DrawString("Default =  "+ strDefaultStuff, 3, g.Height - 5, g.Width -9, true)
		    ElseIf TargetMacOS = true then
		      g.DrawString("Default =  "+ strDefaultStuff, 3, g.Height - 5, g.Width -9, true)
		    end if
		    
		    g.ForeColor = rgb(255,255,255)
		    if TargetLinux = true then
		      g.DrawString("Default = " + strDefaultStuff, 3, g.Height - 5, g.Width -9, true)
		    ElseIf TargetWin32 = true then
		      g.DrawString("Default = " + strDefaultStuff, 3, g.Height - 4, g.Width -9, true)
		    ElseIf TargetMacOS = true then
		      g.DrawString("Default = " + strDefaultStuff, 3, g.Height - 4, g.Width -9, true)
		    end if
		  end if
		  
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  if me.ListIndex > -1 then
		    
		    frmNewVariable.Show
		    frmNewVariable.LoadThisVariable(me.List(me.ListIndex))
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteVariable
	#tag Event
		Sub Action()
		  if listVariables.ListIndex > -1 then
		    
		    modVariables.DeleteVariable(listVariables.Text)
		    frmProject.chartProject.ReSelectCurrentFrame
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNewVariable
	#tag Event
		Sub Action()
		  frmNewVariable.ShowModal
		End Sub
	#tag EndEvent
#tag EndEvents
