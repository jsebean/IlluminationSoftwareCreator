#tag Menu
Begin Menu menuUI
   Begin MenuItem LayoutMenu
      SpecialMenu = 0
      Text = "Layout"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem CopyLayoutFrom
         SpecialMenu = 0
         Text = "Copy Layout From..."
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Begin MenuItem PythonGTKDesktopPythonGTKDesktop
            SpecialMenu = 0
            Text = "Python/GTK - Desktop"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CopyLayoutFromPythonGTKMaemoTablet
            SpecialMenu = 0
            Text = "Python/GTK - Maemo Tablet"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CopyLayoutFromAdobeFlexWeb
            SpecialMenu = 0
            Text = "Adobe Flex - Web"
            Index = -2147483648
            AutoEnable = False
         End
         Begin MenuItem CopyLayoutFromHaikuDesktop
            SpecialMenu = 0
            Text = "Haiku - Desktop"
            Index = -2147483648
            AutoEnable = True
         End
      End
   End
End
#tag EndMenu
