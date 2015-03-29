#tag Window
Begin ContainerControl RadThumbnailView
   AcceptFocus     =   ""
   AcceptTabs      =   ""
   AutoDeactivate  =   True
   BackColor       =   16777215
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   154
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
   Width           =   200
   Begin ScrollBar scrlVer
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   154
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   184
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   16
   End
   Begin RadDBCanvas canThumb
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   154
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
      Width           =   184
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  myZoom = 128
		  myThumbBGColor = rgb(255,255,255)
		  myThumbTextColor = rgb(0,0,0)
		  mySelectionColor = rgb(0,30,100)
		  mySelectionTextColor = rgb(255,255,255)
		  myShadowColor = rgb(90,90,90)
		  
		  RegCheck
		  
		  Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  'setScrollMax
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  createThumbFullView
		  setScrollMax
		  canThumb.Redraw
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddNewPicture(p as picture, name as string)
		  dim tempPic as RadThumbnailPicture
		  
		  tempPic = new RadThumbnailPicture
		  
		  tempPic.Picture = p
		  tempPic.Name = name
		  
		  myThumbs.Append tempPic
		  
		  createThumbFullView
		  
		  setScrollMax
		  
		  canThumb.Redraw
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub createThumbFullView()
		  dim p as Picture
		  dim h,w as Integer
		  dim perRow as Integer
		  dim i,j as Integer
		  dim soFar as Integer
		  dim strWidth as Integer
		  dim shadowp as Picture
		  
		  if SuspendDrawing = false then
		    
		    soFar = 0
		    
		    w = canThumb.Width
		    
		    'perRow = w / (myZoom + 50)
		    '
		    'h =  (PictureCount / perRow) * (myZoom + 50) + 50
		    
		    ' The new ones!
		    perRow = floor(w \ (myZoom + myHorSpacing))
		    
		    h =  Ceil(PictureCount / perRow) * (myZoom + myVerSpacing)
		    
		    if h = 0 then
		      h = 1
		    end if
		    
		    p = NewPicture(w,h*2,32)
		    
		    p.Graphics.ForeColor = myThumbBGColor
		    p.Graphics.FillRect 0,0,w,h
		    
		    shadowp = NewPicture(myZoom, myZoom, 32)
		    
		    for i = 0 to (PictureCount / perRow)
		      
		      for j = 1 to perRow
		        
		        if soFar < PictureCount then
		          
		          soFar = soFar + 1
		          
		          myThumbPosX(soFar - 1) = (j-1)*(myZoom+myHorSpacing)+10
		          myThumbPosY(soFar - 1) = i*(myZoom+myVerSpacing)+10
		          
		          if myDrawShadow = true then
		            
		            shadowp.Graphics.ForeColor = myShadowColor
		            shadowp.Graphics.FillRect 0,0,shadowp.Width, shadowp.Height
		            
		            shadowp.Mask.Graphics.DrawPicture ThumbnailPictureAtIndex(soFar - 1).GetThumb(myZoom).Mask,0,0
		            
		            p.Graphics.DrawPicture shadowp, myThumbPosX(soFar -1) + myShadowDistance, myThumbPosY(soFar - 1) + myShadowDistance
		            
		          end if
		          
		          if mySelected(soFar - 1) = true then
		            
		            p.Graphics.ForeColor = mySelectionColor
		            p.Graphics.FillRoundRect(myThumbPosX(soFar - 1) - 5, myThumbPosY(soFar - 1) - 5, myZoom + 10, myZoom + 25,8,8)
		            
		          end if
		          
		          p.Graphics.DrawPicture(ThumbnailPictureAtIndex(soFar - 1).GetThumb(myZoom),myThumbPosX(soFar - 1), myThumbPosY(soFar - 1))
		          
		          
		          'Draw the name of the image.
		          if mySelected(soFar - 1) = true then
		            p.Graphics.ForeColor = mySelectionTextColor
		          else
		            p.Graphics.ForeColor = myThumbTextColor
		          end if
		          strWidth = p.Graphics.StringWidth(ThumbnailPictureAtIndex(soFar - 1).Name)
		          
		          strWidth = (j-1)*(myZoom+myHorSpacing)+10+ ((myZoom / 2) - (strWidth / 2))
		          
		          if strWidth < ((j-1)*(myZoom+myHorSpacing)+10) then
		            
		            strWidth = (j-1)*(myZoom+myHorSpacing)+10
		            
		          end if
		          
		          p.Graphics.DrawString(ThumbnailPictureAtIndex(soFar - 1).Name, strWidth, i*(myZoom+myVerSpacing)+25+myZoom,myZoom, true)
		          
		          
		        else
		          
		          
		        end if
		        
		      next
		      
		    next
		    
		    myThumbFullView = p
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub drawThumbFullViewAtScroll(g as graphics)
		  if SuspendDrawing = false then
		    g.DrawPicture myThumbFullView,0,-scrlVer.Value
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetIndexAtXY(x as integer, y as integer) As integer
		  dim i as Integer
		  
		  y = y + scrlVer.Value
		  
		  for i = 0 to PictureCount
		    
		    if myThumbPosX(i) <= x then
		      if (myThumbPosX(i) + myZoom) >= x then
		        if myThumbPosY(i) <= y then
		          if (myThumbPosY(i) + myZoom) >= y then
		            Return i
		          end if
		        end if
		      end if
		    end if
		    
		  next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub myThumbSelected(i as integer)
		  'if mDoubleClickSelectedThumb <> -1 then
		  'mDoubleClickSelectedThumb = -1
		  'mDoubleClickLastClickTicks = 0
		  'if WasDoubleClick then
		  'end if
		  'else
		  'if WasDoubleClick then
		  'myWILLDoubleClick = true
		  ''DoubleClickOnThumb(mDoubleClickSelectedThumb)
		  'end if
		  'end if
		  
		  if mDoubleClickSelectedThumb <> i then
		    mDoubleClickSelectedThumb = i
		    mDoubleClickLastClickTicks = 0
		    if WasDoubleClick then
		    end if
		    ThumbSelected(i)
		  else
		    if WasDoubleClick then
		      'myWILLDoubleClick = true
		      DoubleClickOnThumb(mDoubleClickSelectedThumb)
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PictureCount() As integer
		  Return (UBound(myThumbs) + 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegCheck()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllPictures()
		  dim i as integer
		  
		  if myThumbs.Ubound > -1 then
		    for i = myThumbs.Ubound DownTo 0
		      myThumbs.Remove(i)
		      mySelected(i) = false
		    next
		    
		    createThumbFullView
		    
		    setScrollMax
		    
		    canThumb.Redraw
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePictureAtIndex(index as integer)
		  myThumbs.Remove(index)
		  
		  mySelected(index) = false
		  
		  createThumbFullView
		  
		  setScrollMax
		  
		  canThumb.Redraw
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Selected(Index as integer) As boolean
		  Return mySelected(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Selected(Index as integer, assigns isSelected as boolean)
		  mySelected(Index) = isSelected
		  
		  createThumbFullView
		  
		  setScrollMax
		  
		  canThumb.Redraw
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setScrollMax()
		  dim h,w as Integer
		  dim perRow as Integer
		  
		  w = canThumb.Width
		  
		  perRow = floor(w \ (myZoom + myHorSpacing))
		  
		  h =  Ceil(PictureCount / perRow) * (myZoom + myVerSpacing)
		  
		  if (h - canThumb.Height) > 0 then
		    
		    scrlVer.Maximum = h - canThumb.Height
		    
		  else
		    
		    scrlVer.Maximum = 0
		    scrlVer.Value = 0
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ThumbnailPictureAtIndex(index as integer) As RadThumbnailPicture
		  Return myThumbs(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub updateThumbViewForSingleThumb(index as integer)
		  dim p as Picture
		  dim h,w as Integer
		  dim perRow as Integer
		  dim i,j as Integer
		  dim soFar as Integer
		  dim strWidth as Integer
		  dim shadowp as Picture
		  
		  if SuspendDrawing = false then
		    
		    soFar = 0
		    
		    w = canThumb.Width
		    
		    'perRow = w / (myZoom + 50)
		    '
		    'h =  (PictureCount / perRow) * (myZoom + 50) + 50
		    
		    ' The new ones!
		    perRow = floor(w \ (myZoom + myHorSpacing))
		    
		    h =  Ceil(PictureCount / perRow) * (myZoom + myVerSpacing)
		    
		    
		    
		    p = NewPicture(w,h*2,32)
		    
		    'p.Graphics.ForeColor = myThumbBGColor
		    'p.Graphics.FillRect 0,0,w,h
		    
		    p.Graphics.DrawPicture myThumbFullView,0,0
		    '= myThumbFullView
		    
		    shadowp = NewPicture(myZoom, myZoom, 32)
		    
		    for i = 0 to (PictureCount / perRow)
		      
		      for j = 1 to perRow
		        
		        if soFar < PictureCount then
		          
		          soFar = soFar + 1
		          
		          myThumbPosX(soFar - 1) = (j-1)*(myZoom+myHorSpacing)+10
		          myThumbPosY(soFar - 1) = i*(myZoom+myVerSpacing)+10
		          
		          if soFar = index then
		            
		            'MsgBox str(index)
		            
		            if myDrawShadow = true then
		              
		              shadowp.Graphics.ForeColor = myShadowColor
		              shadowp.Graphics.FillRect 0,0,shadowp.Width, shadowp.Height
		              
		              shadowp.Mask.Graphics.DrawPicture ThumbnailPictureAtIndex(soFar - 1).GetThumb(myZoom).Mask,0,0
		              
		              p.Graphics.DrawPicture shadowp, myThumbPosX(soFar -1) + myShadowDistance, myThumbPosY(soFar - 1) + myShadowDistance
		              
		            end if
		            
		            if mySelected(soFar - 1) = true then
		              
		              p.Graphics.ForeColor = mySelectionColor
		              p.Graphics.FillRoundRect(myThumbPosX(soFar - 1) - 5, myThumbPosY(soFar - 1) - 5, myZoom + 10, myZoom + 25,8,8)
		              
		            end if
		            
		            p.Graphics.DrawPicture(ThumbnailPictureAtIndex(soFar - 1).GetThumb(myZoom),myThumbPosX(soFar - 1), myThumbPosY(soFar - 1))
		            
		            
		            'Draw the name of the image.
		            if mySelected(soFar - 1) = true then
		              p.Graphics.ForeColor = mySelectionTextColor
		            else
		              p.Graphics.ForeColor = myThumbTextColor
		            end if
		            strWidth = p.Graphics.StringWidth(ThumbnailPictureAtIndex(soFar - 1).Name)
		            
		            strWidth = (j-1)*(myZoom+myHorSpacing)+10+ ((myZoom / 2) - (strWidth / 2))
		            
		            if strWidth < ((j-1)*(myZoom+myHorSpacing)+10) then
		              
		              strWidth = (j-1)*(myZoom+myHorSpacing)+10
		              
		            end if
		            
		            p.Graphics.DrawString(ThumbnailPictureAtIndex(soFar - 1).Name, strWidth, i*(myZoom+myVerSpacing)+25+myZoom,myZoom, true)
		            
		          end if
		          
		        else
		          
		          
		        end if
		        
		      next
		      
		    next
		    
		    myThumbFullView = p
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function WasDoubleClick() As boolean
		  if (Ticks - mDoubleClickLastClickTicks) <= DoubleClickTime then
		    Return true
		  end if
		  
		  mDoubleClickLastClickTicks = Ticks
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ContextualClickOnThumb(index as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DoubleClickOnThumb(index as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ThumbSelected(index as integer)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myThumbBGColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myThumbBGColor = value
			  
			  createThumbFullView
			  
			  setScrollMax
			  
			  canThumb.Redraw
			End Set
		#tag EndSetter
		BackGroundColor As color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DoubleClickTime As Integer = 15
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myDrawShadow
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myDrawShadow = value
			  
			  createThumbFullView
			  
			  setScrollMax
			  
			  canThumb.Redraw
			End Set
		#tag EndSetter
		DrawThumbShadow As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDoubleClickLastClickTicks As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDoubleClickSelectedThumb As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myDrawShadow As boolean = true
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myHorSpacing As Integer = 15
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mySelected(10000) As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mySelectionColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mySelectionTextColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myShadowColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myShadowDistance As Integer = 2
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mySuspendDrawing As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myThumbBGColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myThumbFullView As picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myThumbPosX(10000) As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myThumbPosY(10000) As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myThumbs() As RadThumbnailPicture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myThumbTextColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myVerSpacing As Integer = 30
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myWILLDoubleClick As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myZoom As Integer = 100
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mySelectionColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mySelectionColor = value
			  
			  createThumbFullView
			  
			  setScrollMax
			  
			  canThumb.Redraw
			End Set
		#tag EndSetter
		SelectionColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mySelectionTextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mySelectionTextColor = value
			  
			  createThumbFullView
			  
			  setScrollMax
			  
			  canThumb.Redraw
			End Set
		#tag EndSetter
		SelectionTextColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mySuspendDrawing
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mySuspendDrawing = value
			  
			  if value = false then
			    
			    createThumbFullView
			    
			    setScrollMax
			    
			    canThumb.Redraw
			    
			  end if
			End Set
		#tag EndSetter
		SuspendDrawing As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myThumbTextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myThumbTextColor = value
			  
			  createThumbFullView
			  
			  setScrollMax
			  
			  canThumb.Redraw
			End Set
		#tag EndSetter
		TextColor As color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		TheSelectedThumb As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myShadowColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myShadowColor = value
			  
			  createThumbFullView
			  
			  setScrollMax
			  
			  canThumb.Redraw
			End Set
		#tag EndSetter
		ThumbShadowColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myShadowDistance
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myShadowDistance = value
			  
			  createThumbFullView
			  
			  setScrollMax
			  
			  canThumb.Redraw
			End Set
		#tag EndSetter
		ThumbShadowDistance As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myHorSpacing
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myHorSpacing = value
			  
			  myHorSpacing = myHorSpacing + 15
			  
			  createThumbFullView
			  
			  setScrollMax
			  
			  canThumb.Redraw
			End Set
		#tag EndSetter
		ThumbSpacingHorizontal As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myVerSpacing - 25
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myVerSpacing = value
			  
			  myVerSpacing = myVerSpacing + 25
			  
			  createThumbFullView
			  
			  setScrollMax
			  
			  canThumb.Redraw
			End Set
		#tag EndSetter
		ThumbSpacingVertical As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myZoom
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myZoom = value
			  
			  createThumbFullView
			  
			  setScrollMax
			  
			  canThumb.Redraw
			End Set
		#tag EndSetter
		Zoom As Integer
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events scrlVer
	#tag Event
		Sub ValueChanged()
		  canThumb.Redraw
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events canThumb
	#tag Event
		Sub Paint(g as graphics)
		  g.ForeColor = myThumbBGColor
		  g.FillRect 0,0,g.Width, g.Height
		  
		  drawThumbFullViewAtScroll(g)
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  scrlVer.Value = scrlVer.Value + (deltaY * 3)
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  dim i as Integer
		  dim j as Integer
		  i = GetIndexAtXY(x,y)
		  
		  if i < PictureCount then
		    for j = 0 to 10000
		      
		      mySelected(j) = false
		      
		    next
		    
		    
		    if i > -1 then
		      
		      mySelected(i) = true
		      TheSelectedThumb = i
		      
		    end if
		    
		    'createThumbFullView
		    
		    'updateThumbViewForSingleThumb(i)
		    
		    setScrollMax
		    
		    'if mDoubleClickSelectedThumb <> i then
		    'mDoubleClickSelectedThumb = i
		    'mDoubleClickLastClickTicks = 0
		    'if WasDoubleClick then
		    'end if
		    '
		    'else
		    '
		    'if WasDoubleClick then
		    'myWILLDoubleClick = true
		    ''DoubleClickOnThumb(mDoubleClickSelectedThumb)
		    'end if
		    '
		    'end if
		    
		    'ThumbSelected(i)
		    myThumbSelected(i)
		    
		    createThumbFullView
		    canThumb.Redraw
		    if WasDoubleClick then
		    end if
		    if IsContextualClick then
		      ContextualClickOnThumb(i)
		    end if
		    
		  else
		    
		    'if mDoubleClickSelectedThumb <> -1 then
		    'mDoubleClickSelectedThumb = -1
		    'mDoubleClickLastClickTicks = 0
		    'if WasDoubleClick then
		    'end if
		    'else
		    'if WasDoubleClick then
		    'myWILLDoubleClick = true
		    ''DoubleClickOnThumb(mDoubleClickSelectedThumb)
		    'end if
		    'end if
		    
		    
		    'ThumbSelected(-1)
		    myThumbSelected(-1)
		    TheSelectedThumb = -1
		    
		    'createThumbFullView
		    if IsContextualClick then
		      ContextualClickOnThumb(-1)
		    end if
		    
		  end if
		  
		  
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  'if myWILLDoubleClick = true then
		  'DoubleClickOnThumb(mDoubleClickSelectedThumb)
		  'myWILLDoubleClick = false
		  'else
		  '
		  'end if
		  
		  
		  
		  
		  
		  
		  
		  '
		  'if WasDoubleClick then 
		  'DoubleClickOnThumb(mDoubleClickSelectedThumb)
		  'end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
