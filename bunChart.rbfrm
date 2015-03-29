#tag Window
Begin ContainerControl bunChart
   AcceptFocus     =   ""
   AcceptTabs      =   ""
   AutoDeactivate  =   True
   BackColor       =   16777215
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   252
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
   Width           =   265
   Begin Canvas canChart
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   234
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   247
   End
   Begin ScrollBar scrlVer
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   237
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   248
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   True
      Maximum         =   0
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   1
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
      Left            =   0
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Maximum         =   0
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   235
      Value           =   0
      Visible         =   True
      Width           =   249
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  SelectionColor = rgb(20,150,60)
		  NewChart(1000,1000)
		  ChartBackgroundColor = rgb(255,255,255)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  'RedrawChart
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  if myChartPic <> nil then
		    scrlVer.Maximum = myChartPic.Height - canChart.Height
		    scrlHor.Maximum = myChartPic.Width - canChart.Width
		    
		    // Draw the chart to the canvas
		    canChart.Graphics.DrawPicture myChartPic, 0-scrlHor.Value, 0-scrlVer.Value
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  if myChartPic <> nil then
		    scrlVer.Maximum = myChartPic.Height - canChart.Height
		    scrlHor.Maximum = myChartPic.Width - canChart.Width
		    
		    // Draw the chart to the canvas
		    canChart.Graphics.DrawPicture myChartPic, 0-scrlHor.Value, 0-scrlVer.Value
		    
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddObjectPicture(Image as Picture)
		  dim tempObject as bunChartObject
		  
		  tempObject = new bunChartObject
		  tempObject.ObjectType = tempObject.kTypePicture
		  
		  tempObject.Image = Image
		  tempObject.Top = 50
		  tempObject.Left = 50
		  tempObject.Width = Image.Width
		  tempObject.Height = Image.Height
		  
		  Objects.Append tempObject
		  
		  RedrawChart
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddObjectString(Text as string)
		  dim tempObject as bunChartObject
		  
		  tempObject = new bunChartObject
		  tempObject.ObjectType = tempObject.kTypeString
		  
		  tempObject.TextString = Text
		  tempObject.TextFont = "Helvetica"
		  tempObject.Top = 50
		  tempObject.Left = 50
		  tempObject.Width = 200
		  tempObject.Height = 200
		  
		  Objects.Append tempObject
		  
		  RedrawChart
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddObjectUI(theilUIObject as iluiObject)
		  dim tempObject as bunChartObject
		  
		  tempObject = new bunChartObject
		  tempObject.ObjectType = tempObject.kTypeUI
		  
		  tempObject.myilUIObject = theilUIObject
		  
		  Objects.Append tempObject
		  
		  RedrawChart
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddObjectVector()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSelectionGraphicsAtIndex(AtIndex as integer)
		  dim WinX as integer
		  dim WinY as integer
		  
		  WinX = thisUIObject(0).X(CurTarget)
		  WinY = thisUIObject(0).Y(CurTarget)
		  
		  if AtIndex = 0 then // The Window
		    //Add selection graphics
		    if objects(AtIndex).Selcted = true then
		      myChartPic.Graphics.ForeColor = SelectionColor
		      myChartPic.Graphics.FillRect Objects(AtIndex).left-5, Objects(AtIndex).top-5, 5, 5
		      myChartPic.Graphics.FillRect Objects(AtIndex).left-5, Objects(AtIndex).top+Objects(AtIndex).Height, 5, 5
		      myChartPic.Graphics.FillRect Objects(AtIndex).left+Objects(AtIndex).Width, Objects(AtIndex).top-5, 5, 5
		      myChartPic.Graphics.FillRect Objects(AtIndex).left+Objects(AtIndex).Width, Objects(AtIndex).top+Objects(AtIndex).Height, 5, 5
		    end if
		  else  // All other controls
		    //Add selection graphics
		    if objects(AtIndex).Selcted = true then
		      myChartPic.Graphics.ForeColor = SelectionColor
		      myChartPic.Graphics.FillRect Objects(AtIndex).left-5 +WinX, Objects(AtIndex).top-5 + WinY, 5, 5
		      myChartPic.Graphics.FillRect Objects(AtIndex).left-5 +WinX, Objects(AtIndex).top+Objects(AtIndex).Height + WinY, 5, 5
		      myChartPic.Graphics.FillRect Objects(AtIndex).left+Objects(AtIndex).Width +WinX, Objects(AtIndex).top-5 + WinY, 5, 5
		      myChartPic.Graphics.FillRect Objects(AtIndex).left+Objects(AtIndex).Width +WinX, Objects(AtIndex).top+Objects(AtIndex).Height + WinY, 5, 5
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAllSelectedObjects()
		  dim i as integer
		  dim j as integer
		  
		  j = UBound(Objects)
		  
		  for i = 0 to j
		    Objects(i).Selcted = false
		  next
		  
		  RedrawChart
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurTarget() As integer
		  Return frmUIEditor.popTarget.ListIndex
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsAnyObjectSelected() As boolean
		  dim i as integer
		  
		  for i = 0 to UBound(Objects)
		    
		    if objects(i).Selcted = true then
		      Return true
		    end if
		    
		  next
		  
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewChart(Width as integer, Height as integer)
		  myChartPic = NewPicture(Width, Height, 32)
		  scrlVer.Maximum = Height - canChart.Height
		  scrlHor.Maximum = Width - canChart.Width
		  RedrawChart
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectAtIndexFromXY(X as integer, Y as integer) As integer
		  dim i as integer
		  dim WinX as integer
		  dim WinY as integer
		  dim FoundObject as integer
		  
		  WinX = thisUIObject(0).X(CurTarget)
		  WinY = thisUIObject(0).Y(CurTarget)
		  
		  if Objects.Ubound > 0 then
		    for i = UBound(objects) DownTo 1
		      
		      if x > objects(i).Left + WinX then
		        if x < Objects(i).left + objects(i).Width + WinX then
		          if y > Objects(i).top + WinY then
		            if y < Objects(i).top + Objects(i).Height + WinY then
		              Return i
		            end if
		          end if
		        end if
		      end if
		      
		    next
		  end if
		  
		  // No control found.  Look for Window
		  
		  
		  if x > objects(0).Left then
		    if x < Objects(0).left + objects(0).Width then
		      if y > Objects(0).top then
		        if y < Objects(0).top + Objects(0).Height then
		          Return 0
		        end if
		      end if
		    end if
		  end if
		  
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OverResizeWidgetOfObject(AtIndex as integer, x as integer, y as integer) As integer
		  dim i as integer
		  dim j as Integer
		  dim WinX as integer
		  dim WinY as integer
		  
		  WinX = thisUIObject(0).X(CurTarget)
		  WinY = thisUIObject(0).Y(CurTarget)
		  
		  if AtIndex = 0 then
		    winx = 0
		    winy = 0
		  end if
		  
		  if x >= Objects(AtIndex).left-5 + WinX then
		    if x <= Objects(AtIndex).left + WinX then
		      if y >= Objects(AtIndex).top-5 + WinY then
		        if y <= Objects(AtIndex).top + WinY then
		          Return 1 //Top Left corner
		        end if
		      end if
		    end if
		  end if
		  
		  if x >= Objects(AtIndex).left-5 + WinX then
		    if x <= Objects(AtIndex).left + WinX then
		      if y >= Objects(AtIndex).top+Objects(AtIndex).Height + WinY then
		        if y <= Objects(AtIndex).top+Objects(AtIndex).Height+5 + WinY then
		          Return 2 //Bottom Left Corner
		        end if
		      end if
		    end if
		  end if
		  
		  if x >= Objects(AtIndex).left+Objects(AtIndex).Width + WinX then
		    if x <= Objects(AtIndex).left+Objects(AtIndex).Width+5 + WinX then
		      if y >= Objects(AtIndex).top-5 + WinY then
		        if y <= Objects(AtIndex).top + WinY then
		          Return 3 //Top Right corner
		        end if
		      end if
		    end if
		  end if
		  
		  if x >= Objects(AtIndex).left+Objects(AtIndex).Width + WinX then
		    if x <= Objects(AtIndex).left+Objects(AtIndex).Width+5 + WinX then
		      if y >= Objects(AtIndex).top+Objects(AtIndex).Height + WinY then
		        if y <= Objects(AtIndex).top+Objects(AtIndex).Height+5 + WinY then
		          Return 4 //Bottom Right corner
		        end if
		      end if
		    end if
		  end if
		  
		  
		  if x >= Objects(AtIndex).left+Objects(AtIndex).Width + WinX then
		    if x <= Objects(AtIndex).left+Objects(AtIndex).Width+5 + WinX then
		      if y >= Objects(AtIndex).top+((Objects(AtIndex).Height/2)-3) + WinY then
		        if y <= Objects(AtIndex).top+((Objects(AtIndex).Height/2)+3) + WinY then
		          Return 5 //Rotate Widget (Left side center)
		        end if
		      end if
		    end if
		  end if
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedrawChart()
		  if myChartPic = nil then
		    Return
		  end if
		  
		  // Set the background color of the chart
		  myChartPic.Graphics.ForeColor = myChartBackgroundColor
		  myChartPic.Graphics.FillRect 0,0,myChartPic.Width, myChartPic.Height
		  
		  
		  // Draw the objects in order within array
		  dim i as integer
		  for i = 0 to UBound(Objects)
		    
		    // Draw a string object
		    if Objects(i).ObjectType = Objects(i).kTypeString then
		      RedrawStringObject(i)
		    end if
		    
		    // Draw a Picture object
		    if Objects(i).ObjectType = Objects(i).kTypePicture then
		      RedrawPictureObject(i)
		    end if
		    
		    // Draw a UI object
		    if Objects(i).ObjectType = Objects(i).kTypeUI then
		      RedrawUIObject(i)
		    end if
		    
		    
		    
		  next
		  
		  // Draw the chart to the canvas
		  canChart.Graphics.DrawPicture myChartPic, 0-scrlHor.Value, 0-scrlVer.Value
		  
		  paintcount = paintcount + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedrawPictureObject(AtIndex as integer)
		  dim p as picture
		  
		  p = Rotate(objects(AtIndex).Image, Objects(AtIndex).RotationInDegrees, rgb(255,255,255), ImagePlayEffectsLibrary.kRotateModeJaggy)
		  p.Transparent = 1
		  
		  myChartPic.Graphics.DrawPicture p, objects(AtIndex).Left, objects(AtIndex).Top, objects(AtIndex).Width, objects(AtIndex).Height, 0, 0, p.width, p.height
		  
		  
		  // This way doesn't support rotation... but it's fast
		  'myChartPic.Graphics.DrawPicture objects(AtIndex).Image, objects(AtIndex).Left, objects(AtIndex).Top, objects(AtIndex).Width, objects(AtIndex).Height, 0, 0, objects(AtIndex).Image.width, objects(AtIndex).Image.height
		  
		  //Add selection graphics
		  if objects(AtIndex).Selcted = true then
		    AddSelectionGraphicsAtIndex(AtIndex)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedrawStringObject(AtIndex as integer)
		  
		  dim strheight as integer
		  dim strwidth as integer
		  
		  'strheight =myChartPic.Graphics.TextHeight
		  'myChartPic.Graphics.StringHeight(Objects(AtIndex).TextString, Objects(AtIndex).Width)
		  
		  myChartpic.Graphics.ForeColor = rgb(0,0,0)
		  myChartPic.Graphics.TextFont = Objects(AtIndex).TextFont
		  strheight =myChartPic.Graphics.TextHeight
		  myChartPic.Graphics.DrawString Objects(AtIndex).TextString, Objects(AtIndex).left, objects(AtIndex).top + strheight, objects(AtIndex).Width, false
		  
		  
		  //Add selection graphics
		  if objects(AtIndex).Selcted = true then
		    AddSelectionGraphicsAtIndex(AtIndex)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedrawUIObject(AtIndex as integer)
		  dim p as Picture
		  dim WinX as integer
		  dim WinY as integer
		  
		  WinX = thisUIObject(0).X(CurTarget)
		  WinY = thisUIObject(0).Y(CurTarget)
		  
		  if thisUIObject(AtIndex).Width(CurTarget) < 10 then
		    thisUIObject(AtIndex).Width(CurTarget) = 10
		  end if
		  
		  if thisUIObject(AtIndex).Height(CurTarget) < 10 then
		    thisUIObject(AtIndex).Height(CurTarget) = 10
		  end if
		  
		  // Draw a window
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcWindow then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget) + 20, 32)
		    // Draw Titlebar
		    p.Graphics.ForeColor = rgb(143,143,143)
		    p.Graphics.FillRect 0,0,p.Width, 20
		    // Draw Title Text
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.TextSize = 11
		    p.Graphics.DrawString(thisUIObject(AtIndex).Text(CurTarget),10,15)
		    // Draw Window Region
		    'p.Graphics.ForeColor = windowEditorBackColor
		    p.Graphics.ForeColor = thisUIObject(AtIndex).BackgroundColor(CurTarget)
		    p.Graphics.FillRect 0,20,p.Width, p.Height
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget), thisUIObject(AtIndex).Y(CurTarget) - 20
		  end if
		  
		  // Draw a Button
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcButton then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget), 32)
		    // Draw background
		    p.Graphics.ForeColor = rgb(85,85,85)
		    p.Graphics.FillRoundRect 0,0,p.Width, p.Height,3,3
		    // Draw Border
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.DrawRoundRect 0,0,p.Width, p.Height, 3, 3
		    // Draw Text
		    p.Graphics.ForeColor = rgb(255,255,255)
		    p.Graphics.TextSize = 11
		    p.Graphics.DrawString(thisUIObject(AtIndex).Text(CurTarget), 6, thisUIObject(AtIndex).Height(CurTarget) / 2 + 4)
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget) + WinX, thisUIObject(AtIndex).Y(CurTarget) + WinY
		  end if
		  
		  // Draw a Color Button
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcColorButton then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget), 32)
		    // Draw background
		    p.Graphics.ForeColor = rgb(85,85,85)
		    p.Graphics.FillRoundRect 0,0,p.Width, p.Height,3,3
		    // Draw Border
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.DrawRoundRect 0,0,p.Width, p.Height, 3, 3
		    //Draw Color square
		    p.Graphics.ForeColor = rgb(20,20,85)
		    p.Graphics.FillRect 4,4,p.Width -8, p.Height - 8
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget) + WinX, thisUIObject(AtIndex).Y(CurTarget) + WinY
		  end if
		  
		  
		  // Draw a TextBox
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcTextBox then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget), 32)
		    // Draw background
		    p.Graphics.ForeColor = rgb(255,255,255)
		    p.Graphics.FillRect 0,0,p.Width, p.Height
		    // Draw Border
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.DrawRect 0,0,p.Width, p.Height
		    // Draw Text
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.TextSize = 11
		    p.Graphics.DrawString(thisUIObject(AtIndex).Text(CurTarget), 6, 16)'thisUIObject(AtIndex).Height(CurTarget) / 2 + 4)
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget) + WinX, thisUIObject(AtIndex).Y(CurTarget) + WinY
		  end if
		  
		  // Draw a TextField
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcTextField then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget), 32)
		    // Draw background
		    p.Graphics.ForeColor = rgb(255,255,255)
		    p.Graphics.FillRect 0,0,p.Width, p.Height
		    // Draw Border
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.DrawRect 0,0,p.Width, p.Height
		    // Draw Text
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.TextSize = 11
		    
		    // Single Line
		    //p.Graphics.DrawString(thisUIObject(AtIndex).Text(CurTarget), 6, 16)'thisUIObject(AtIndex).Height(CurTarget) / 2 + 4)
		    
		    // Multi-line
		    p.Graphics.DrawString(thisUIObject(AtIndex).Text(CurTarget), 6, 14,  thisUIObject(AtIndex).Width(CurTarget) - 5)
		    
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget) + WinX, thisUIObject(AtIndex).Y(CurTarget) + WinY
		  end if
		  
		  // Draw a Canvas
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcCanvas then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget), 32)
		    // Draw background
		    p.Graphics.ForeColor = rgb(200,200,200)
		    p.Graphics.FillRect 0,0,p.Width, p.Height
		    // Draw Border
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.DrawRect 0,0,p.Width, p.Height
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget) + WinX, thisUIObject(AtIndex).Y(CurTarget) + WinY
		  end if
		  
		  // Draw a Checkbox
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcCheckBox then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget), 32)
		    // Draw background
		    p.Graphics.ForeColor = rgb(200,200,200)
		    p.Graphics.FillRect 0,0,p.Width, p.Height
		    // Draw Border
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.DrawRect 0,0,p.Width, p.Height
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget) + WinX, thisUIObject(AtIndex).Y(CurTarget) + WinY
		    // Draw Check
		    p.Graphics.DrawLine 0,0, p.Height, p.Height
		    p.Graphics.DrawLine p.Height, 0, 0, p.Height
		  end if
		  
		  // Draw a ListBox
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcListBox then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget), 32)
		    // Draw background
		    p.Graphics.ForeColor = rgb(200,200,200)
		    p.Graphics.FillRect 0,0,p.Width, p.Height
		    // Draw Border
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.DrawRect 0,0,p.Width, p.Height
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget) + WinX, thisUIObject(AtIndex).Y(CurTarget) + WinY
		  end if
		  
		  // Draw a WebBrowser
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcWebBrowser then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget), 32)
		    // Draw background
		    p.Graphics.ForeColor = rgb(123,123,123)
		    p.Graphics.FillRect 0,0,p.Width, p.Height
		    // Draw Border
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.DrawRect 0,0,p.Width, p.Height
		    // Draw "Android Only"
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.TextSize = 11
		    p.Graphics.DrawString("WebBrowser (Android & iOS)", 6, 16)'thisUIObject(AtIndex).Height(CurTarget) / 2 + 4)
		    
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget) + WinX, thisUIObject(AtIndex).Y(CurTarget) + WinY
		  end if
		  
		  // Draw a Slider
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcSlider then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget), 32)
		    // Draw Background
		    p.Graphics.ForeColor = windowEditorBackColor
		    p.Graphics.FillRect 0,0,p.Width, p.Height
		    // Draw a center line
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.FillRect 0, (p.Height / 2) -3,p.Width, 6
		    p.Graphics.ForeColor = rgb(100,100,100)
		    p.Graphics.FillRect 1, (p.Height / 2) -2,p.Width-2, 4
		    // Draw a nub on that line
		    p.Graphics.ForeColor = rgb(60,60,60)
		    p.Graphics.FillRect p.Width * .7,(p.Height / 2) - 5,3, 10
		    
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget) + WinX, thisUIObject(AtIndex).Y(CurTarget) + WinY
		  end if
		  
		  // Draw a Progress Bar
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcProgressBar then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget), 32)
		    // Draw background
		    p.Graphics.ForeColor = rgb(255,255,255)
		    p.Graphics.FillRect 0,0,p.Width, p.Height
		    // Draw background
		    p.Graphics.ForeColor = rgb(190, 190, 190)
		    p.Graphics.FillRect 0,0,p.Width * .7, p.Height
		    // Draw Border
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.DrawRect 0,0,p.Width, p.Height
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget) + WinX, thisUIObject(AtIndex).Y(CurTarget) + WinY
		  end if
		  
		  // Draw a Label
		  if thisUIObject(AtIndex).ControlType = thisUIObject(AtIndex).kcLabel then
		    p = NewPicture(thisUIObject(AtIndex).Width(CurTarget), thisUIObject(AtIndex).Height(CurTarget), 32)
		    // Draw background
		    p.Graphics.ForeColor = windowEditorBackColor
		    p.Graphics.FillRect 0,0,p.Width, p.Height
		    // Draw Text
		    p.Graphics.ForeColor = rgb(0,0,0)
		    p.Graphics.TextSize = 11
		    
		    // Single line
		    //p.Graphics.DrawString(thisUIObject(AtIndex).Text(CurTarget), 6, thisUIObject(AtIndex).Height(CurTarget) / 2 + 4)
		    
		    // Multi-line
		    dim theWidth as integer
		    theWidth = thisUIObject(AtIndex).Width(CurTarget)
		    p.Graphics.DrawString(thisUIObject(AtIndex).Text(CurTarget), 6, 14,  thisUIObject(AtIndex).Width(CurTarget) - 5)
		    
		    myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget) + WinX, thisUIObject(AtIndex).Y(CurTarget) + WinY
		  end if
		  
		  
		  'myChartPic.Graphics.DrawPicture p, thisUIObject(AtIndex).X(CurTarget), thisUIObject(AtIndex).Y(CurTarget)
		  
		  //Add selection graphics
		  if objects(AtIndex).Selcted = true then
		    AddSelectionGraphicsAtIndex(AtIndex)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedrawWindowObject(AtIndex as integer)
		  dim p as picture
		  
		  'p = Rotate(objects(AtIndex).Image, Objects(AtIndex).RotationInDegrees, rgb(255,255,255), ImagePlayEffectsLibrary.kRotateModeJaggy)
		  'p.Transparent = 1
		  
		  dim theWidth as integer
		  dim theHeight as integer
		  dim theX as integer
		  dim theY as integer
		  dim theText as integer
		  
		  
		  
		  myChartPic.Graphics.DrawPicture p, objects(AtIndex).Left, objects(AtIndex).Top, objects(AtIndex).Width, objects(AtIndex).Height, 0, 0, p.width, p.height
		  
		  
		  // This way doesn't support rotation... but it's fast
		  'myChartPic.Graphics.DrawPicture objects(AtIndex).Image, objects(AtIndex).Left, objects(AtIndex).Top, objects(AtIndex).Width, objects(AtIndex).Height, 0, 0, objects(AtIndex).Image.width, objects(AtIndex).Image.height
		  
		  //Add selection graphics
		  if objects(AtIndex).Selcted = true then
		    AddSelectionGraphicsAtIndex(AtIndex)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllObjects()
		  dim i as integer
		  dim j as integer
		  
		  j = UBound(Objects)
		  if j > -1 then
		    for i = j DownTo 0
		      Objects.Remove(i)
		    next
		  end if
		  
		  RedrawChart
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAllObjects()
		  dim i as integer
		  dim j as integer
		  
		  j = UBound(Objects)
		  
		  for i = 0 to j
		    Objects(i).Selcted = true
		  next
		  
		  RedrawChart
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedObject() As integer
		  dim i as integer
		  
		  if Objects.Ubound > -1 then
		    
		    for i = 0 to Objects.Ubound
		      
		      if Objects(i).Selcted = true then
		        Return i
		      end if
		      
		    next
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function thisUIObject(AtIndex as integer) As iluIObject
		  if ilUIObject(objects(AtIndex).myilUIObject) <> nil then
		    Return ilUIObject(objects(AtIndex).myilUIObject) 
		  end if
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event NoObjectSelected()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ObjectMoved(ObjectIndex as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ObjectSelected(ObjectIndex as integer)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myChartBackgroundColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myChartBackgroundColor = value
			  RedrawChart
			End Set
		#tag EndSetter
		ChartBackgroundColor As color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		myChartBackgroundColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		myChartPic As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		myLastX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		myLastY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		myResizeWidgetSelected As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Objects() As bunChartObject
	#tag EndProperty

	#tag Property, Flags = &h0
		paintcount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectionColor As color
	#tag EndProperty


	#tag Constant, Name = windowEditorBackColor, Type = Color, Dynamic = False, Default = \"&cEAEAEA", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events canChart
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  dim t as integer
		  dim k as integer
		  
		  for t = 0 to UBound(objects)
		    
		    k = OverResizeWidgetOfObject(t,x,y)
		    
		    if k > -1 then
		      
		      if ilUIObject(Objects(SelectedObject).myilUIObject).ControlType = 0 then // It's a window
		        
		        if frmUIEditor.popTarget.ListIndex = app.kpiOSiPad or frmUIEditor.popTarget.ListIndex = app.kpiOSiPhone or frmUIEditor.popTarget.ListIndex = app.kpPythonMaemo then // it's a mobile device
		          
		        else
		          
		          myResizeWidgetSelected = k
		          myLastX = X
		          myLastY = Y
		          Return true
		          
		        end if
		      else
		        
		        myResizeWidgetSelected = k
		        myLastX = X
		        myLastY = Y
		        Return true
		        
		      end if
		      
		    else
		      myResizeWidgetSelected = -1
		    end if
		    
		  next
		  
		  dim i as integer
		  i = ObjectAtIndexFromXY(x+scrlHor.Value,y+scrlVer.value)
		  
		  if i = -1 then
		    ClearAllSelectedObjects
		  end if
		  
		  if i > -1 then
		    'if Keyboard.AsyncShiftKey = true then
		    'if Objects(i).Selcted = true then
		    'objects(i).Selcted = false
		    'else
		    'objects(i).Selcted = true
		    'end if
		    'RedrawChart
		    'else
		    '
		    'if Objects(i).Selcted = true then
		    '
		    'else
		    ClearAllSelectedObjects
		    objects(i).Selcted = true
		    RedrawChart
		    ObjectSelected(i)
		    'end if
		    '
		    'end if
		  else
		    ClearAllSelectedObjects
		    NoObjectSelected
		  end if
		  
		  myLastX = X
		  myLastY = Y
		  
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics)
		  if myChartPic <> nil then
		    
		    // Draw the chart to the canvas
		    canChart.Graphics.DrawPicture myChartPic, 0-scrlHor.Value, 0-scrlVer.Value
		    
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  frmProject.CurX = X
		  frmProject.CurY = Y
		  
		  if myResizeWidgetSelected = -1 then  // simply moving
		    
		    dim i as integer
		    for i = 0 to UBound(Objects)
		      
		      if Objects(i).Selcted = true then
		        
		        Objects(i).left = Objects(i).left + (x - myLastX)
		        Objects(i).top = Objects(i).top + (y - myLasty)
		        ObjectMoved(i)
		        
		      end if
		      
		    next
		    myLastx = x
		    myLasty = y
		    
		  else  // Resizing or rotating
		    
		    
		    
		    select case myResizeWidgetSelected
		      
		    case 1 // top left
		      dim i as integer
		      for i = 0 to UBound(Objects)
		        if Objects(i).Selcted = true then
		          Objects(i).left = Objects(i).left + (x - myLastX)
		          Objects(i).top = Objects(i).top + (y - myLasty)
		          Objects(i).Width = Objects(i).Width - (x - myLastX)
		          Objects(i).Height = Objects(i).Height - (y - myLasty)
		          ObjectMoved(i)
		        end if
		      next
		      myLastx = x
		      myLasty = y
		      
		    case 2  // Bottom Left
		      dim i as integer
		      for i = 0 to UBound(Objects)
		        if Objects(i).Selcted = true then
		          Objects(i).left = Objects(i).left + (x - myLastX)
		          Objects(i).Width = Objects(i).Width - (x - myLastX)
		          Objects(i).Height = Objects(i).Height + (y - myLasty)
		          ObjectMoved(i)
		        end if
		      next
		      myLastx = x
		      myLasty = y
		      
		      
		    case 3 // top right
		      dim i as integer
		      for i = 0 to UBound(Objects)
		        if Objects(i).Selcted = true then
		          Objects(i).top = Objects(i).top + (y - myLasty)
		          Objects(i).Width = Objects(i).Width + (x - myLastX)
		          Objects(i).Height = Objects(i).Height - (y - myLasty)
		          ObjectMoved(i)
		        end if
		      next
		      myLastx = x
		      myLasty = y
		      
		    case 4 // bottom right
		      dim i as integer
		      for i = 0 to UBound(Objects)
		        if Objects(i).Selcted = true then
		          
		          //if frmUIEditor.popTarget.ListIndex = app.kpiOSiPad or frmUIEditor.popTarget.ListIndex = app.kpiOSiPad or frmUIEditor.popTarget.ListIndex = app.kpPythonMaemo and ilUIObject(Objects(i).myilUIObject).ControlType = 0 then
		          
		          //else
		          
		          Objects(i).Width = Objects(i).Width + (x - myLastX)
		          Objects(i).Height = Objects(i).Height + (y - myLasty)
		          ObjectMoved(i)
		          
		          //end if
		          
		        end if
		      next
		      myLastx = x
		      myLasty = y
		      
		    case 5 // Rotate widget
		      dim i as integer
		      for i = 0 to UBound(Objects)
		        if Objects(i).Selcted = true then
		          Objects(i).RotationInDegrees = Objects(i).RotationInDegrees + (y - myLasty)
		        end if
		      next
		      myLastx = x
		      myLasty = y
		      
		    end select
		    
		    
		  end if
		  
		  RedrawChart
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  frmProject.CurX = X
		  frmProject.CurY = Y
		  
		  if IsAnyObjectSelected = true then
		    
		    dim i as integer
		    dim j as integer
		    
		    for i = 0 to UBound(objects)
		      
		      j = OverResizeWidgetOfObject(i,x,y)
		      
		      if j > -1 then
		        
		        select case j
		          
		        case 1 // top left
		          me.MouseCursor = System.Cursors.ArrowNorthwestSoutheast
		        case 2  // Bottom Left
		          me.MouseCursor = System.Cursors.ArrowNortheastSouthwest
		        case 3 // top right
		          me.MouseCursor = System.Cursors.ArrowNortheastSouthwest
		        case 4 // bottom right
		          me.MouseCursor = System.Cursors.ArrowNorthwestSoutheast
		        case 5 // Rotate widget
		          me.MouseCursor = System.Cursors.FingerPointer
		        end select
		        
		        Return
		        
		      end if
		      
		    next
		    
		    me.MouseCursor = System.Cursors.StandardPointer
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scrlVer
	#tag Event
		Sub ValueChanged()
		  
		  // Draw the chart to the canvas
		  canChart.Graphics.DrawPicture myChartPic, 0-scrlHor.Value, 0-scrlVer.Value
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scrlHor
	#tag Event
		Sub ValueChanged()
		  
		  // Draw the chart to the canvas
		  canChart.Graphics.DrawPicture myChartPic, 0-scrlHor.Value, 0-scrlVer.Value
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
