#tag Class
Protected Class ilUIObject
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContentOutputName() As String
		  dim s as string
		  
		  if ControlType = kcButton then
		    s = Name + "Clicked"
		  end if
		  
		  if ControlType = kcTextBox then
		    s = Name + "Changed"
		  end if
		  
		  if ControlType = kcLabel then
		    's = Name + "Changed"
		  end if
		  
		  if ControlType = kcWindow then
		    s = name + "Closed"
		  end if
		  
		  if ControlType = kcColorButton then
		    s = Name + "Changed"
		  end if
		  
		  if ControlType = kcCanvas then
		    s = Name + "Clicked"
		  end if
		  if ControlType = kcListBox then
		    s = Name + "Clicked"
		  end if
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDistanceFromWindowBottom(currentPlatform as integer) As integer
		  dim theDist as integer
		  
		  theDist = ilObjectWindow(me.parent).theWindowObject.Height(currentPlatform) - (me.Y(currentPlatform) + me.Height(currentPlatform))
		  
		  Return theDist
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDistanceFromWindowLeft(currentPlatform as integer) As integer
		  dim theDist as integer
		  
		  theDist = me.X(currentPlatform)
		  
		  Return theDist
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDistanceFromWindowRight(currentPlatform as integer) As integer
		  dim theDist as integer
		  
		  theDist = ilObjectWindow(me.parent).theWindowObject.Width(currentPlatform) - (me.X(currentPlatform) + me.Width(currentPlatform))
		  
		  Return theDist
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDistanceFromWindowTop(currentPlatform as integer) As integer
		  dim theDist as integer
		  
		  theDist = me.Y(currentPlatform)
		  
		  Return theDist
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height(platform as integer) As integer
		  Return MyHeight(platform)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Height(platform as integer, assigns value as integer)
		  if ControlType = 0 then // It's a window
		    
		    'if platform = app.kpiOSiPad or platform = app.kpPythonMaemo then // it's a mobile device
		    '
		    'MyHeight(app.kpiOSiPhone) = 460
		    'MyHeight(app.kpiOSiPad) = 1024
		    '
		    '// Don't set.
		    '
		    'else
		    '
		    'MyHeight(platform) = value
		    '
		    'end if
		    
		    MyHeight(platform) = value
		    
		    
		  else
		    
		    MyHeight(platform) = value
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitControl()
		  // Initialize The properties
		  dim theX as integer
		  dim theY as integer
		  
		  theX = 50
		  theY = 50
		  
		  dim i as integer
		  
		  for i = 0 to 10
		    
		    Enabled(i) = true
		    
		    if ControlType = kcWindow then
		      x(i) = 20
		      y(i) = 25
		      if i = app.kpPythonDesktop then
		        Height(i) = 300
		        Width(i) = 300
		      ElseIf i = app.kpPythonMaemo then
		        Height(i) = 424
		        Width(i) = 740
		      elseif i = app.kpPHPJavascriptWeb then
		        Height(i) = 300
		        Width(i) = 300
		      elseif i = app.kpFlexWeb then
		        Height(i) = 300
		        Width(i) = 300
		      elseif i = app.kpFlexAIRDesktop then
		        Height(i) = 300
		        Width(i) = 300
		      ElseIf i = app.kpAndroid then
		        Height(i) = 320
		        Width(i) = 240
		      ElseIf i = app.kpiOSiPhone then
		        Height(i) = 460
		        Width(i) = 320
		      ElseIf i = app.kpiOSiPad then
		        Height(i) = 1024
		        Width(i) = 768
		      ElseIf i = app.kpWinPhone7 then
		        Height(i) = 1024
		        Width(i) = 768
		      end if
		      Text(i) = "Window"
		      Visible(i) = true
		      BackgroundColor(i) = rgb(255,255,255)
		      name = "Window"
		    end if
		    
		    if ControlType = kcButton then
		      Height(i) = 26
		      Text(i) = "Button"
		      Visible(i) = true
		      Width(i) = 80
		      x(i) = theX
		      y(i) = theY
		      name = "Button"
		    end if
		    
		    if ControlType = kcColorButton then
		      Height(i) = 26
		      Text(i) = "ColorButton"
		      Visible(i) = true
		      Width(i) = 80
		      x(i) = theX
		      y(i) = theY
		      name = "ColorButton"
		    end if
		    
		    if ControlType = kcLabel then
		      Height(i) = 12
		      Text(i) = "Label"
		      Visible(i) = true
		      Width(i) = 40
		      x(i) = theX
		      y(i) = theY
		      name = "Label"
		    end if
		    
		    if ControlType = kcTextBox then
		      Height(i) = 22
		      Text(i) = "TextBox"
		      Visible(i) = true
		      Width(i) = 80
		      x(i) = theX
		      y(i) = theY
		      name = "TextBox"
		    end if
		    
		    
		    if ControlType = kcTextField then
		      Height(i) = 80
		      Text(i) = "TextField"
		      Visible(i) = true
		      Width(i) = 100
		      x(i) = theX
		      y(i) = theY
		      name = "TextField"
		    end if
		    
		    if ControlType = kcCanvas then
		      Height(i) = 80
		      Text(i) = "Canvas"
		      Visible(i) = true
		      Width(i) = 80
		      x(i) = theX
		      y(i) = theY
		      name = "Canvas"
		    end if
		    
		    if ControlType = kcWebBrowser then
		      Height(i) = 100
		      Text(i) = "WebBrowser"
		      Visible(i) = true
		      Width(i) = 100
		      x(i) = theX
		      y(i) = theY
		      name = "WebBrowser"
		    end if
		    
		    if ControlType = kcProgressBar then
		      Height(i) = 20
		      Text(i) = "ProgressBar"
		      Visible(i) = true
		      Width(i) = 120
		      x(i) = theX
		      y(i) = theY
		      name = "ProgressBar"
		    end if
		    
		    if ControlType = kcSlider then
		      Height(i) = 16
		      Text(i) = "Slider"
		      Visible(i) = true
		      Width(i) = 120
		      x(i) = theX
		      y(i) = theY
		      name = "Slider"
		    end if
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitControlWithXY(theX as integer, theY as integer)
		  // Initialize The properties
		  'dim theX as integer
		  'dim theY as integer
		  
		  dim i as integer
		  
		  for i = 0 to 10
		    
		    Enabled(i) = true
		    
		    if ControlType = kcWindow then
		      x(i) = 20
		      y(i) = 25
		      if i = app.kpPythonDesktop then
		        Height(i) = 300
		        Width(i) = 300
		      ElseIf i = app.kpPythonMaemo then
		        Height(i) = 424
		        Width(i) = 740
		      elseif i = app.kpPHPJavascriptWeb then
		        Height(i) = 300
		        Width(i) = 300
		      elseif i = app.kpFlexWeb then
		        Height(i) = 300
		        Width(i) = 300
		      elseif i = app.kpFlexAIRDesktop then
		        Height(i) = 300
		        Width(i) = 300
		      ElseIf i = app.kpAndroid then
		        Height(i) = 320
		        Width(i) = 240
		      ElseIf i = app.kpiOSiPhone then
		        Height(i) = 460
		        Width(i) = 320
		      ElseIf i = app.kpiOSiPad then
		        Height(i) = 1024
		        Width(i) = 768
		      end if
		      Text(i) = "Window"
		      Visible(i) = true
		      BackgroundColor(i) = rgb(255,255,255)
		      name = "Window"
		    end if
		    
		    if ControlType = kcButton then
		      Height(i) = 26
		      Text(i) = "Button"
		      Visible(i) = true
		      Width(i) = 80
		      x(i) = theX
		      y(i) = theY
		      name = "Button"
		      'MsgBox str(i)
		    end if
		    
		    if ControlType = kcColorButton then
		      Height(i) = 26
		      Text(i) = "ColorButton"
		      Visible(i) = true
		      Width(i) = 80
		      x(i) = theX
		      y(i) = theY
		      name = "ColorButton"
		    end if
		    
		    if ControlType = kcLabel then
		      Height(i) = 12
		      Text(i) = "Label"
		      Visible(i) = true
		      Width(i) = 40
		      x(i) = theX
		      y(i) = theY
		      name = "Label"
		    end if
		    
		    if ControlType = kcTextBox then
		      Height(i) = 22
		      Text(i) = "TextBox"
		      Visible(i) = true
		      Width(i) = 80
		      x(i) = theX
		      y(i) = theY
		      name = "TextBox"
		    end if
		    
		    
		    if ControlType = kcTextField then
		      Height(i) = 80
		      Text(i) = "TextField"
		      Visible(i) = true
		      Width(i) = 100
		      x(i) = theX
		      y(i) = theY
		      name = "TextField"
		    end if
		    
		    if ControlType = kcCanvas then
		      Height(i) = 80
		      Text(i) = "Canvas"
		      Visible(i) = true
		      Width(i) = 80
		      x(i) = theX
		      y(i) = theY
		      name = "Canvas"
		    end if
		    
		    if ControlType = kcWebBrowser then
		      Height(i) = 100
		      Text(i) = "WebBrowser"
		      Visible(i) = true
		      Width(i) = 100
		      x(i) = theX
		      y(i) = theY
		      name = "WebBrowser"
		    end if
		    
		    if ControlType = kcProgressBar then
		      Height(i) = 20
		      Text(i) = "ProgressBar"
		      Visible(i) = true
		      Width(i) = 120
		      x(i) = theX
		      y(i) = theY
		      name = "ProgressBar"
		    end if
		    
		    if ControlType = kcSlider then
		      Height(i) = 16
		      Text(i) = "Slider"
		      Visible(i) = true
		      Width(i) = 120
		      x(i) = theX
		      y(i) = theY
		      name = "Slider"
		    end if
		    
		    if ControlType = kcListBox then
		      Height(i) = 120
		      Text(i) = "ListBox"
		      Visible(i) = true
		      Width(i) = 120
		      x(i) = theX
		      y(i) = theY
		      name = "ListBox"
		    end if
		    
		    if ControlType = kcCheckBox then
		      Height(i) = 16
		      Text(i) = "CheckBox"
		      Visible(i) = true
		      Width(i) = 120
		      x(i) = theX
		      y(i) = theY
		      name = "CheckBox"
		    end if
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ISCClassLocalAndroidName() As string
		  dim s as string
		  
		  s = parent.GetCodeName + Name + str(myUniqueID)
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ISCClassLocalFlexName() As string
		  dim s as string
		  
		  s = parent.GetCodeName + Name + str(myUniqueID)
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ISCClassLocalPythonName() As string
		  dim s as string
		  
		  s = parent.GetCodeName + Name + str(myUniqueID)
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ISCFunctionName() As string
		  dim s as string
		  s = ISCClassLocalPythonName + "Call"
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ISCiOSName() As string
		  dim s as string
		  
		  s = parent.GetCodeName + Name + str(myUniqueID)
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ISCPythonName() As String
		  dim s as string
		  
		  s = "thisiscApp1." + ISCClassLocalPythonName
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Width(platform as integer) As integer
		  Return MyWidth(platform)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Width(platform as integer, assigns value as integer)
		  if ControlType = 0 then // It's a window
		    
		    'if platform = app.kpiOSiPad or platform = app.kpiOSiPad or platform = app.kpPythonMaemo then // it's a mobile device
		    '
		    'myWidth(app.kpiOSiPhone) = 320
		    '
		    '// Don't set.
		    '
		    'else
		    '
		    'MyWidth(platform) = value
		    '
		    'end if
		    
		    MyWidth(platform) = value
		    
		    
		  else
		    
		    MyWidth(platform) = value
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BackgroundColor(10) As color
	#tag EndProperty

	#tag Property, Flags = &h0
		ControlType As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Enabled(10) As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		HasContentObject As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LockBottom(10) As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LockLeft(10) As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LockRight(10) As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LockTop(10) As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		MyHeight(10) As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		myUniqueID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MyWidth(10) As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		parent As ilObjectWindow
	#tag EndProperty

	#tag Property, Flags = &h0
		Text(10) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Visible(10) As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		X(10) As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Y(10) As Integer
	#tag EndProperty


	#tag Constant, Name = kcButton, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcCanvas, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcCheckBox, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcColorButton, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcLabel, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcListBox, Type = Double, Dynamic = False, Default = \"11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcProgressBar, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcSlider, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcTextBox, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcTextField, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcWebBrowser, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kcWindow, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ControlType"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasContentObject"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="myUniqueID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
