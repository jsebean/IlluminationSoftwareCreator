#tag Menu
Begin Menu MenuBar1
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem FileSaveProject
         SpecialMenu = 0
         Text = "Save Project..."
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+S"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileSaveProjectAs
         SpecialMenu = 0
         Text = "Save Project As..."
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+Shift+S"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileOpenProject
         SpecialMenu = 0
         Text = "Open Project..."
         Index = -2147483648
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator6
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem FileSaveProjectAsImage
         SpecialMenu = 0
         Text = "Save Project As Image..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator2
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem FileNewProject
         SpecialMenu = 0
         Text = "New Project"
         Index = -2147483648
         ShortcutKey = "N"
         Shortcut = "Cmd+N"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator8
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem FileNewCustomBlock
         SpecialMenu = 0
         Text = "New Custom Block..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "&Edit"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cu&t"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "&Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "&Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "#App.kEditClear"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Text = "Select &All"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin PrefsMenuItem EditPreferences
         SpecialMenu = 0
         Text = "Preferences"
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem ProjectMenu
      SpecialMenu = 0
      Text = "Project"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem ProjectBuildProjectHTML5Web
         SpecialMenu = 0
         Text = "Build Project - HTML5 - Web"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ProjectBuildProjectPythonGTKDesktop
         SpecialMenu = 0
         Text = "Build Project - Python/GTK - Desktop"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ProjectBuildProjectPythonGTKMaemoN8x0
         SpecialMenu = 0
         Text = "Build Project - Python/GTK - Maemo Tablet"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ProjectBuildProjectAdobeFlexWeb
         SpecialMenu = 0
         Text = "Build Project - Adobe Flex - Web"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ProjectBuildProjectAndroid
         SpecialMenu = 0
         Text = "Build Project - Android"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ProjectBuildProjectiOSiPhone
         SpecialMenu = 0
         Text = "Build Project - iOS - iPhone"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ProjectBuildProjectiOSiPad
         SpecialMenu = 0
         Text = "Build Project - iOS - iPad"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator5
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ProjectCheckProjectForErrors
         SpecialMenu = 0
         Text = "Check Project For Errors"
         Index = -2147483648
         ShortcutKey = "E"
         Shortcut = "Cmd+E"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator7
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ProjectProjectSettings
         SpecialMenu = 0
         Text = "Project Settings"
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem HelpMenu
      SpecialMenu = 0
      Text = "Help"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem HelpRegisterIlluminationSoftwareCreator
         SpecialMenu = 0
         Text = "Register Illumination Software Creator"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator3
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem HelpWelcomeToIlluminationSoftwareCreator
         SpecialMenu = 0
         Text = "Welcome To Illumination Software Creator"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem HelpTutorials
         SpecialMenu = 0
         Text = "Lunduke.com"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem HelpSupportForum
         SpecialMenu = 0
         Text = "Support Forum"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin AppleMenuItem HelpAboutIlluminationSoftwareCreator
         SpecialMenu = 0
         Text = "About Illumination Software Creator"
         Index = -2147483648
         AutoEnable = True
      End
   End
End
#tag EndMenu
