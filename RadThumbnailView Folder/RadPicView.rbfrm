#tag Window
Begin ContainerControl RadPicView
   AcceptFocus     =   ""
   AcceptTabs      =   ""
   AutoDeactivate  =   True
   BackColor       =   16777215
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   179
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
   Width           =   199
   Begin ScrollBar scrlVer
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   False
      Height          =   163
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   183
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   0
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
   Begin ScrollBar scrlHor
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   False
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   163
      Value           =   0
      Visible         =   True
      Width           =   183
   End
   Begin RadDBCanvas canPic
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      Enabled         =   True
      EraseBackground =   True
      Height          =   163
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   183
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  RegCheck
		  myZoom = 1
		  Open
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  CheckScrls
		  Resizing
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CheckScrls()
		  if myZoomedPic <> nil then
		    
		    if myZoomedPic.Width > canPic.Width then
		      
		      scrlHor.Maximum = myZoomedPic.Width - canPic.Width
		      'scrlHor.Value = 0
		      scrlHor.Enabled = true
		      
		    else
		      
		      scrlHor.Enabled = false
		      'scrlHor.Value = 0
		      scrlHor.Maximum = 0
		      
		    end if
		    
		    
		    if myZoomedPic.Height > canPic.Height then
		      
		      scrlVer.Maximum = myZoomedPic.Height - canPic.Height
		      'scrlVer.Value = 0
		      scrlVer.Enabled = true
		      
		    else
		      
		      scrlVer.Enabled = false
		      'scrlVer.Value = 0
		      scrlVer.Maximum = 0
		      
		    end if
		    
		  else
		    
		    scrlHor.Enabled = false
		    scrlHor.Value = 0
		    scrlHor.Maximum = 0
		    scrlVer.Enabled = false
		    scrlVer.Value = 0
		    scrlVer.Maximum = 0
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegCheck()
		  
		   
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReMakeZoomedPic()
		  dim h,w as Integer
		  dim scrX, scrY as Integer
		  
		  if myPicture <> nil then
		    
		    h = myPicture.Height * myZoom
		    w = myPicture.Width * myZoom
		    
		    scrx = HorizontalScroll
		    scry = VerticalScroll
		    
		    myZoomedPic  = NewPicture(w,h,32)
		    
		    myZoomedPic.Graphics.DrawPicture(myPicture,0,0,w,h,0,0,myPicture.Width,myPicture.Height)
		    
		    CheckScrls
		    
		    'app.YieldToNextThread
		    
		    'HorizontalScroll = scrX
		    'VerticalScroll = scry
		    
		  else
		    
		    myZoomedPic = nil
		    CheckScrls
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Resizing()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myHorizontalScroll
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myHorizontalScroll = value
			End Set
		#tag EndSetter
		HorizontalScroll As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mScrollX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScrollY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myHorizontalScroll As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myPicture As picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myVerticalScroll As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myZoom As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myZoomedPic As picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private offsetX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private offsetY As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myPicture
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myPicture = value
			  ReMakeZoomedPic
			  canPic.Redraw
			End Set
		#tag EndSetter
		Picture As picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myVerticalScroll
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myVerticalScroll = value
			End Set
		#tag EndSetter
		VerticalScroll As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return myZoom * 100
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  myZoom = (value / 100)
			  ReMakeZoomedPic
			  canPic.Redraw
			End Set
		#tag EndSetter
		Zoom As Integer
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events scrlVer
	#tag Event
		Sub ValueChanged()
		  myVerticalScroll = me.Value
		  canPic.Redraw
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scrlHor
	#tag Event
		Sub ValueChanged()
		  myHorizontalScroll = me.Value
		  canPic.Redraw
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events canPic
	#tag Event
		Sub Paint(g as graphics)
		  if myZoomedPic <> nil then
		    g.DrawPicture myZoomedPic,-myHorizontalScroll,-myVerticalScroll
		  else
		    g.ClearRect 0,0,g.Width,g.Height
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  me.MouseCursor = System.Cursors.HandOpen
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  dim newx, newy as Integer
		  
		  scrlHor.value = offsetX - x
		  scrlVer.value = offsetY - y
		  
		  'app.MouseCursor = System.Cursors.HandClosed
		  '
		  'mscrollX = mscrollX - (System.MouseX - offsetX)
		  'mscrollY = mscrollY - (System.MouseY - offsetY)
		  ''offsetX = System.mouseX
		  ''offsetY = System.mouseY
		  '
		  'if abs(mscrollX) + me.graphics.width >= me.mpicture.width _
		  'or mscrollX < 0 then
		  'if mscrollX < 0 then
		  'mscrollX = 0
		  'else
		  'mscrollX = (me.mpicture.width - me.graphics.width)
		  'end if
		  'end if
		  '
		  'if abs(mscrolly) + me.graphics.height >= me.mpicture.height _
		  'or mscrolly < 0 then
		  'if mscrolly < 0 then
		  'mscrolly = 0
		  'else
		  'mscrolly = (me.mpicture.height - me.graphics.height)
		  'end if
		  'end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  me.MouseCursor = System.Cursors.HandClosed
		  offsetX = x + scrlHor.Value
		  offsetY = y + scrlVer.Value
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  me.MouseCursor = System.Cursors.HandOpen
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  'if System.MouseDown = true then
		  '
		  'app.MouseCursor = System.Cursors.HandClosed
		  '
		  'end if
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  scrlVer.Value = scrlVer.Value + DeltaY
		End Function
	#tag EndEvent
#tag EndEvents
