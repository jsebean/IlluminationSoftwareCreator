#tag Class
Protected Class ColorsPicker
Inherits Canvas
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  dim c as Color
		  dim i as Integer
		  
		  if bAllowMultipleColors=False then
		    if key=" " or key=chr(13) or key=chr(3) then
		      
		      bIsDown=true
		      me.Refresh
		      
		      i=Ticks+2
		      While Ticks<i
		      Wend
		      
		      bIsDown=False
		      Draw( False )
		      
		      c=ColorList(0)
		      if SelectColor( c , "Select a new color" ) then
		        ColorList(0)=c
		        Draw( False )
		        Changed()
		      end
		      
		      Return true
		    end
		  end
		End Function
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i,u as Integer
		  dim c as Color
		  
		  if bAllowMultipleColors and x<iOffsetLeft then
		    i=(me.Height-pAdd.Height)\2
		    if y>i and y<i+pAdd.Height+2 then
		      if AddColor()=False then
		        if SelectColor(c,"Add a new color") then
		          ColorList.Append c
		          Draw( False )
		          Changed()
		        end
		      end
		    end
		  Else
		    iClickX=x
		    iClickY=y
		    iMouseX=x
		    iMouseY=y
		    iBoxX=-11
		    iBoxY=-11
		    u=UBound(ItemList)
		    if u=0 then
		      bIsDown=true
		      Draw( False )
		    Else
		      for i=u DownTo 0
		        if x>ItemList(i) then
		          if bHasRemoveButtons and x<ItemList(i)+13 and y<14 then
		            bIsDown=False
		            if RemoveColor(i)=False then
		              ColorList.Remove i
		              Draw( False )
		              Changed()
		            end
		            Return False
		          Else
		            bIsDown=true
		            Draw( False )
		            iIndexClicked=i
		            bDoingDrag=true
		            exit
		          end
		        end
		      next
		    end
		    Return true
		  end
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if x=iMouseX and y=iMouseY then
		    Return
		  end
		  
		  iMouseX=x
		  iMouseY=y
		  
		  dim xx,yy,ox,oy as Integer
		  dim b as Boolean
		  
		  if bAllowMultipleColors Then
		    if bIsDown then
		      bIsDown=False
		      Draw( False )
		    end
		    
		    xx=x-5
		    yy=y-5
		    if xx<iOffsetLeft+3 then
		      xx=iOffsetLeft+3
		    Elseif xx>me.Width-11 then
		      xx=me.Width-11
		    end
		    if yy<3 then
		      yy=3
		    ElseIf yy>me.Height-11 then
		      yy=me.Height-11
		    end
		    
		    if iBoxX=xx and iBoxY=yy then
		      Return
		    end
		    
		    ox=iBoxX
		    oy=iBoxY
		    
		    iBoxX=xx
		    iBoxY=yy
		    
		    me.RefreshRect iBoxX-1,iBoxY-1,10,10, False
		    me.RefreshRect ox-1,oy-1,10,10, False
		    
		  Else
		    b=not (x<0 or x>me.Width or y<0 or y>me.Height)
		    if b=bIsDown then
		      Return
		    end
		    bIsDown=b
		    Draw( False )
		  end
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i,u,t as Integer
		  dim c as Color
		  dim b as Boolean
		  
		  bDoingDrag=False
		  
		  u=UBound(ItemList)
		  
		  if (iClickX=x and iClickY=y) or (bAllowMultipleColors=False and bIsDown) then
		    bIsDown=False
		    Draw( False )
		    
		    for i=u DownTo 0
		      if x>ItemList(i) then
		        c=ColorList(i)
		        if SelectColor( c , "Select a new color" ) then
		          ColorList(i)=c
		          Draw( False )
		          b=true
		        end
		        Exit
		      end
		    next
		    
		  Elseif u>0 then
		    bIsDown=False
		    
		    t=-1
		    for i=u DownTo 1
		      if x>ItemList(i) then
		        t=i
		        Exit
		      end
		    next
		    
		    if t=-1 then
		      i=0
		    Else
		      i=t
		    end
		    
		    if iIndexClicked<>i then
		      if Keyboard.AsyncOptionKey then
		        ColorList(i)=ColorList(iIndexClicked)
		      Else
		        MoveColor( iIndexClicked, i )
		      end
		      b=true
		    end
		    
		    Draw( False )
		    
		  end
		  
		  if b then
		    Changed()
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  pRemove=NewPicture(10,10,24)
		  pRemove.Graphics.UseOldRenderer=true
		  pRemove.Graphics.ForeColor=&cBBBBBB
		  pRemove.Graphics.FillRect 0,0,pRemove.Width,pRemove.Height
		  pRemove.Graphics.ForeColor=&cFFFFFF
		  pRemove.Graphics.FillRect 2,(pRemove.Height\2)-1,pRemove.Width-4,2
		  pRemove.Mask.Graphics.ClearRect 0,0,pRemove.Width,pRemove.Height
		  pRemove.Mask.Graphics.ForeColor=&c555555
		  pRemove.Mask.Graphics.FillRoundRect 0,0,pRemove.Width,pRemove.Height,pRemove.Width,pRemove.Height
		  
		  pAdd=NewPicture(10,10,24)
		  pAdd.Graphics.UseOldRenderer=true
		  pAdd.Graphics.ForeColor=&cBBBBBB
		  pAdd.Graphics.FillRect 0,0,pAdd.Width,pAdd.Height
		  pAdd.Graphics.ForeColor=&cFFFFFF
		  pAdd.Graphics.FillRect 2,(pAdd.Height\2)-1,pAdd.Width-4,2
		  pAdd.Graphics.FillRect (pAdd.Width\2)-1,2,2,pAdd.Height-4
		  pAdd.Mask.Graphics.ClearRect 0,0,pAdd.Width,pAdd.Height
		  pAdd.Mask.Graphics.ForeColor=&c555555
		  pAdd.Mask.Graphics.FillRoundRect 0,0,pAdd.Width,pAdd.Height,pAdd.Width,pAdd.Height
		  pAdd.Mask.Graphics.ForeColor=&cCCCCCC
		  pAdd.Mask.Graphics.FillRect 3,(pAdd.Height\2)-1,pAdd.Width-6,2
		  pAdd.Mask.Graphics.FillRect (pAdd.Width\2)-1,3,2,pAdd.Height-6
		  
		  AllowMultipleColors=true
		  ColorList=Array(&c000000)
		  
		  Open()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  Draw( True )
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AllowMultipleColors() As Boolean
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return bAllowMultipleColors
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AllowMultipleColors(assigns b as boolean)
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if bAllowMultipleColors<>b then
		    me.AcceptFocus=bAllowMultipleColors
		    if b then
		      iOffsetLeft=pAdd.Width+1
		    Else
		      iOffsetLeft=0
		    end
		    bAllowMultipleColors=b
		    if me.Visible then
		      me.Refresh
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorCount() As Integer
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return UBound(ColorList)+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Draw(WithAddButton as boolean)
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i,u,xx as Integer
		  dim x,w as Double
		  dim g as Graphics
		  dim b as Boolean
		  
		  if me.Visible=False then
		    Return
		  end
		  
		  g=me.Graphics
		  if g=nil then
		    Return
		  end
		  
		  u=UBound(ColorList)
		  if bAllowMultipleColors=False then
		    w=me.Width
		    u=0
		    b=False
		  Else
		    w=me.Width-(pAdd.Width+1)
		    if WithAddButton then
		      g.DrawPicture pAdd, 0,(g.Height-pAdd.Height)\2
		    end
		    b=(u>0)
		  end
		  DrawRect( g, iOffsetLeft, w)
		  w=(w-4)/(u+1)
		  if b then
		    b=(w>14 or (me.Height>16 and w>12))
		  end
		  bHasRemoveButtons=b
		  Redim ItemList(u)
		  x=iOffsetLeft
		  for i=0 to u
		    g.ForeColor=ColorList(i)
		    ItemList(i)=x
		    g.FillRect x+3,3,w-2,me.Height-6
		    if b then
		      g.DrawPicture pRemove,x+2,2
		    end
		    x=x+w
		    g.FillRect x,3,1,me.Height-6
		  Next
		  
		  'g.FillRect g.Width-4,3,1,me.Height-6
		  
		  if bDoingDrag then
		    g.ForeColor=ColorList(iIndexClicked)
		    g.FillRect iBoxX,iBoxY,8,8
		    g.ForeColor=&c7F7F7F
		    g.DrawRect iBoxX-1,iBoxY-1,10,10
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawRect(g as graphics, x as integer, w as integer)
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  #if TargetMacOS then
		    '
		    'if 1 = 2 then //NO
		    '
		    'Dim m,state As MemoryBlock
		    '
		    '#if TargetCarbon then
		    'Declare Function DrawThemeButton Lib CarbonLibName (inBounds as Ptr, inKind as integer, inNewInfo as Ptr, inPrevInfo as integer, inEraseProc as integer, inLabelProc as integer, inUserData as integer) as integer
		    '#else
		    'Declare Function DrawThemeButton Lib "AppearanceLib" (inBounds as Ptr, inKind as integer, inNewInfo as Ptr, inPrevInfo as integer, inEraseProc as integer, inLabelProc as integer, inUserData as integer) as integer
		    '#endif
		    '
		    'state = NewMemoryBlock(8)
		    'm = NewMemoryBlock(8)
		    'm.short(0) = me.top
		    'm.short(2) = me.left+ x
		    'm.short(4) = me.top + me.height
		    'm.short(6) = me.left + x+w
		    'state.long(4) = 0
		    '
		    'if me.Enabled and me.Active then
		    'if bIsDown then
		    'state.long(0) = 2
		    'Else
		    'state.long(0) = 1
		    'end
		    'else
		    'state.long(0) = 0
		    'end if
		    '
		    'call DrawThemeButton(m, 8, state, 0, 0, 0, 0)
		    'end if
		  #else
		    dim c as Color
		    if bIsDown then
		      c=FillColor
		      g.ForeColor=HSV( c.hue, c.saturation, c.value-0.2)
		    Else
		      g.ForeColor=FillColor
		    end
		    g.FillRect x,0,w,g.Height
		    g.ForeColor=&c999999
		    g.DrawRect x,0,w,g.Height
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetColor() As Color
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if UBound( ColorList )>-1 then
		    Return ColorList(0)
		  Else
		    Return &c000000
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetColors() As Color()
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim t,c() as Color
		  for each t in ColorList
		    c.Append t
		  Next
		  
		  Return c
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveColor(FromIndex as integer, ToIndex as integer)
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if ToIndex<FromIndex then
		    ColorList.Insert ToIndex, ColorList(FromIndex)
		    ColorList.Remove FromIndex+1
		  Else
		    ColorList.Insert ToIndex+1, ColorList(FromIndex)
		    ColorList.Remove FromIndex
		  end
		  Draw(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColors(ColorArray() as color)
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if UBound(ColorArray)=-1 then
		    Redim ColorList(0)
		    ColorList(0)=&c000000
		  Else
		    ColorList=ColorArray
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColors(ParamArray Colors as color)
		  // by Tomis Erwin <gostcoder@yahoo.com>
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  SetColors Colors
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AddColor() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Changed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RemoveColor(ColorIndex as integer) As Boolean
	#tag EndHook


	#tag Property, Flags = &h21
		Private bAllowMultipleColors As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private bDoingDrag As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private bHasRemoveButtons As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private bIsDown As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ColorList() As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iBoxX As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iBoxY As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iClickX As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iClickY As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iIndexClicked As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iMouseX As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iMouseY As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iOffsetLeft As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ItemList() As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pAdd As picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pRemove As picture
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
