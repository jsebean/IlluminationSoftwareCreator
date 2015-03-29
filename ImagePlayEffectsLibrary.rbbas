#tag Module
Protected Module ImagePlayEffectsLibrary
	#tag Method, Flags = &h0
		Sub ApplyMap(pic as picture, map() as integer)
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim s as RGBSurface
		  
		  if pic=nil then
		    Return
		  end
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  s.Transform map
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ApplyMap(pic as picture, MapR() as integer, MapG() as integer, MapB() as integer)
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim s as RGBSurface
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  s.Transform mapr,mapg,mapb
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AquaBevel(width as integer, height as integer, TheColor as color) As Picture
		  // by Tomis Erwin
		  
		  // a wrapper to FillBevelRect
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  dim g as Graphics
		  
		  if width<1 or height<1 then
		    Return nil
		  end
		  
		  p=NewPicture(width,height,32)
		  if p=nil then
		    Return nil
		  end
		  
		  p.Graphics.UseOldRenderer=true
		  
		  FillBevelRect p.Graphics,0,0,width,height,TheColor
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BlackWhite(pic as picture, MidVal as integer)
		  // by Tomis Erwin
		  
		  // convert the image to black & white (not Greyscale)
		  
		  // ReduceBits() tends to be faster than this older method
		  
		  
		  const kFastMode = 0
		  const kAcurateMode = 1
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim x,y,w,h as Integer
		  dim s as RGBSurface
		  dim c,g(255) as Color
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  for x=0 to 255
		    if x<=MidVal then
		      g(x)=&c000000
		    Else
		      g(x)=&cFFFFFF
		    end
		  Next
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      c=s.Pixel(x,y)
		      s.Pixel(x,y)=g( (c.red+c.green+c.blue)\3 )
		    next
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Blow(pic as picture, SlurHorizontal as integer, SlurVertical as integer)
		  // by Tomis Erwin
		  
		  // "blow" RGB values horizontally/vertically
		  
		  // this is done by mixing Red Green and Blue values sepperately
		  
		  // Blow slurs the R G & B values sepperately
		  // Blow2 tries to only slur similar colors
		  
		  dim p as Picture
		  dim c as color
		  dim x,y,w,h as Integer
		  dim r,g,b as Integer
		  dim s as RGBSurface
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  'pImage=NewPicture(pic.Width, pic.height,32)
		  'o=pImage.RGBSurface
		  
		  if SlurHorizontal<0 then
		    SlurHorizontal=abs(SlurHorizontal)
		    w=pic.Width-1
		    for y=pic.Height-1 DownTo 0
		      for x=w DownTo 0
		        c=s.Pixel(x,y)
		        if abs(c.red-r)>SlurHorizontal then
		          r=c.red
		        end
		        if abs(c.green-g)>SlurHorizontal then
		          g=c.green
		        end
		        if abs(c.blue-b)>SlurHorizontal then
		          b=c.blue
		        end
		        
		        s.Pixel(x,y)=rgb(r,g,b)
		        
		      next
		    next
		  elseif SlurHorizontal>0 then
		    w=pic.Width-1
		    h=pic.Height-1
		    for y=0 to h
		      for x=0 to w
		        c=s.Pixel(x,y)
		        if abs(c.red-r)>SlurHorizontal then
		          r=c.red
		        end
		        if abs(c.green-g)>SlurHorizontal then
		          g=c.green
		        end
		        if abs(c.blue-b)>SlurHorizontal then
		          b=c.blue
		        end
		        
		        s.Pixel(x,y)=rgb(r,g,b)
		        
		      next
		    next
		  end
		  
		  if SlurVertical<0 then
		    SlurVertical=abs(SlurVertical)
		    for x=pic.Width DownTo 0
		      for y=pic.Height DownTo 0
		        c=s.Pixel(x,y)
		        if abs(c.red-r)>SlurVertical then
		          r=c.red
		        end
		        if abs(c.green-g)>SlurVertical then
		          g=c.green
		        end
		        if abs(c.blue-b)>SlurVertical then
		          b=c.blue
		        end
		        
		        s.Pixel(x,y)=rgb(r,g,b)
		        
		      next
		    next
		  elseif SlurVertical>0 then
		    w=pic.Width
		    h=pic.Height
		    for x=0 to w
		      for y=0 to h
		        c=s.Pixel(x,y)
		        if abs(c.red-r)>SlurVertical then
		          r=c.red
		        end
		        if abs(c.green-g)>SlurVertical then
		          g=c.green
		        end
		        if abs(c.blue-b)>SlurVertical then
		          b=c.blue
		        end
		        
		        s.Pixel(x,y)=rgb(r,g,b)
		        
		      next
		    next
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Blow2(pic as picture, SlurHorizontal as integer, SlurVertical as integer)
		  // by Tomis Erwin
		  
		  // "blow" RGB values horizontally/vertically
		  
		  // Blow slurs the R G & B values sepperately
		  // Blow2 tries to only slur similar colors
		  
		  dim p as Picture
		  dim c as color
		  dim x,y,w,h as Integer
		  dim r,g,b as Integer
		  dim s as RGBSurface
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  'pImage=NewPicture(pic.Width, pic.height,32)
		  'o=pImage.RGBSurface
		  
		  if SlurHorizontal<0 then
		    SlurHorizontal=abs(SlurHorizontal)
		    w=pic.Width-1
		    for y=pic.Height-1 DownTo 0
		      for x=w DownTo 0
		        c=s.Pixel(x,y)
		        
		        if abs(c.red-r)>SlurHorizontal and abs(c.green-g)>SlurHorizontal and abs(c.blue-b)>SlurHorizontal then
		          r=c.red
		          g=c.green
		          b=c.blue
		        end
		        
		        s.Pixel(x,y)=rgb(r,g,b)
		        
		      next
		    next
		  elseif SlurHorizontal>0 then
		    w=pic.Width-1
		    h=pic.Height-1
		    for y=0 to h
		      for x=0 to w
		        c=s.Pixel(x,y)
		        
		        if abs(c.red-r)>SlurHorizontal and abs(c.green-g)>SlurHorizontal and abs(c.blue-b)>SlurHorizontal then
		          r=c.red
		          g=c.green
		          b=c.blue
		        end
		        
		        s.Pixel(x,y)=rgb(r,g,b)
		        
		      next
		    next
		  end
		  
		  if SlurVertical<0 then
		    SlurVertical=abs(SlurVertical)
		    for x=pic.Width DownTo 0
		      for y=pic.Height DownTo 0
		        c=s.Pixel(x,y)
		        
		        if abs(c.red-r)>SlurVertical and abs(c.green-g)>SlurVertical and abs(c.blue-b)>SlurVertical then
		          r=c.red
		          g=c.green
		          b=c.blue
		        end
		        
		        s.Pixel(x,y)=rgb(r,g,b)
		        
		      next
		    next
		  elseif SlurVertical>0 then
		    w=pic.Width
		    h=pic.Height
		    for x=0 to w
		      for y=0 to h
		        c=s.Pixel(x,y)
		        
		        if abs(c.red-r)>SlurVertical and abs(c.green-g)>SlurVertical and abs(c.blue-b)>SlurVertical then
		          r=c.red
		          g=c.green
		          b=c.blue
		        end
		        
		        s.Pixel(x,y)=rgb(r,g,b)
		        
		      next
		    next
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Blur(pic as picture, Level as double, SpeedMode as integer) As Picture
		  // by Tomis Erwin
		  
		  // a wrapper to reduce the needed parameters
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return Blur(pic, Level, SpeedMode, 0, False, False )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Blur(pic as picture, Level as double, SpeedMode as integer, Style as integer, PostBlurFocus as boolean) As Picture
		  // by Tomis Erwin
		  
		  // a wrapper to reduce the needed parameters
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return Blur(pic, Level, SpeedMode, Style, PostBlurFocus, False )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Blur(Pic as picture, Level as double, SpeedMode as integer, Style as integer , PostBlurFocus as boolean, ExtendEdge as boolean) As Picture
		  // by Tomis Erwin
		  
		  // as the name says, blur up an image
		  
		  // there are a number of performance optimizations included, but it could stand to be quite a bit faster
		  
		  
		  // kBlurModeAcurate
		  // kBlurModeFast
		  // kBlurModeFaster
		  
		  // kBlurStyleDiagonal
		  // kBlurStyleParallel
		  
		  // PostBlurFocus will overlay the original image at 50% transparency over the blur result
		  
		  // ExtendEdge will extend the dimensions of the image to encompass the edge of the blur
		  
		  dim p,t as Picture
		  dim i,L,w,h,o as Integer
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if level=0 then
		    Return pic
		  end
		  if pic=nil then
		    Return nil
		  end
		  
		  if ExtendEdge then
		    o=Level * kBlurEdgeMult
		    w=pic.Width+o+o
		    h=pic.Height+o+o
		    p=NewPicture(w,h,32)
		    p.Graphics.UseOldRenderer=true
		    p.Graphics.DrawPicture pic,o,o
		  Else
		    o=0
		    w=pic.Width
		    h=pic.Height
		    p=NewPicture(w,h,32)
		    p.Graphics.UseOldRenderer=true
		    p.Graphics.DrawPicture pic,0,0
		  end
		  
		  // *** FAST MODES ***
		  
		  if (SpeedMode=kBlurModeFast or SpeedMode=kBlurModeFaster) and Level>1 then
		    L=Level-round(Level*.4)
		    
		    if SpeedMode=kBlurModeFaster and Level>5 then
		      // shrink the image, blur it
		      p=Resize(p,25)
		      p=Blur(p, L*.5 , 0, Style , False )
		      // enlarge the image, smooth it
		      p=Resize(p,200)
		      p=Blur(p, max(Level*.4,1) , 0, Style, False)
		      
		      // back to normal
		      p=Resize(p, w, h, 0)
		      
		    else
		      // shrink the image, blur it
		      p=Resize(p,50)
		      p=Blur(p, L , 0 , Style, False )
		      
		      // back to normal, smooth it
		      p=Resize(p, w, h, 0)
		      
		      if SpeedMode=kBlurModeFast then'and Level<5 then
		        p=Blur(p, 1, 0, Style, False)
		      end
		      
		    end
		    
		    if PostBlurFocus then
		      t=NewPicture(pic.Width,pic.Height,32)
		      t.Mask.Graphics.UseOldRenderer=true
		      t.Mask.Graphics.ForeColor=&c7F7F7F
		      t.Mask.Graphics.FillRect 0,0,t.Width,t.Height
		      t.Graphics.UseOldRenderer=true
		      t.Graphics.DrawPicture pic,0,0
		      
		      if ExtendEdge then
		        p.Graphics.DrawPicture t,o,o
		      Else
		        p.Graphics.DrawPicture t,0,0
		      end
		    end
		    
		    Return P
		  end
		  
		  // *** NORMAL MODE ***
		  
		  t=NewPicture(w,h,32)
		  t.Graphics.UseOldRenderer=true
		  t.Mask.Graphics.UseOldRenderer=true
		  t.Mask.Graphics.ForeColor=&c7F7F7F
		  t.Mask.Graphics.FillRect 0,0,t.Width,t.Height
		  
		  if Style=kBlurStyleDiagonal then
		    for L=abs(Level) DownTo 1
		      t.Graphics.DrawPicture p,0,0
		      p.Graphics.DrawPicture t,-L,-L// upper left
		      
		      t.Graphics.DrawPicture p,0,0
		      p.Graphics.DrawPicture t,-L,L//lower left
		      
		      t.Graphics.DrawPicture p,0,0
		      p.Graphics.DrawPicture t,L,L//lower right
		      
		      t.Graphics.DrawPicture p,0,0
		      p.Graphics.DrawPicture t,L,-L//upper right
		    next
		  else
		    for L=abs(Level) DownTo 1
		      t.Graphics.DrawPicture p,0,0
		      p.Graphics.DrawPicture t,-L,0//left
		      
		      t.Graphics.DrawPicture p,0,0
		      p.Graphics.DrawPicture t,L,0//right
		      
		      t.Graphics.DrawPicture p,0,0
		      p.Graphics.DrawPicture t,0,-L//up
		      
		      t.Graphics.DrawPicture p,0,0
		      p.Graphics.DrawPicture t,0,L//down
		    next
		  end
		  
		  if PostBlurFocus then
		    if ExtendEdge then
		      t=NewPicture(pic.Width,pic.Height,32)
		      t.Graphics.UseOldRenderer=true
		      t.Mask.Graphics.UseOldRenderer=true
		      t.Mask.Graphics.ForeColor=&c7F7F7F
		      t.Mask.Graphics.FillRect 0,0,t.Width,t.Height
		      t.Graphics.DrawPicture pic,0,0
		      
		      p.Graphics.DrawPicture t,o,o
		    Else
		      t.Graphics.DrawPicture pic,0,0
		      
		      p.Graphics.DrawPicture t,0,0
		    end
		  end
		  
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Border(byref pic as picture, BorderSpace as integer, BorderStyle as integer, BlurLevel as integer, BorderColor as color)
		  // by Tomis Erwin
		  
		  // place a border inside the image (positive values), or add it outside the image (negative values)
		  
		  const kBorderStyleRect = 0
		  const kBorderStyleOval = 1
		  const kBlurMode = 1
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  
		  if pic=nil then
		    Return
		  end
		  
		  if BorderSpace<0 then
		    // switch to the external border
		    pic= Frame(pic, abs(BorderSpace),BorderColor)
		    if BorderStyle=kBorderStyleRect then
		      Return
		    end
		  end
		  
		  p=NewPicture(pic.width,pic.Height,32)
		  p.Mask.Graphics.FillRect 0,0,p.Width,p.Height
		  p.Mask.Graphics.ForeColor=&cFFFFFF
		  Select case BorderStyle
		  case kBorderStyleRect
		    p.Mask.Graphics.UseOldRenderer=true
		    p.mask.Graphics.FillRect BorderSpace,BorderSpace,pic.Width-BorderSpace-BorderSpace,pic.Height-BorderSpace-BorderSpace
		  case kBorderStyleOval
		    p.mask.Graphics.FillOval BorderSpace,BorderSpace,pic.Width-BorderSpace-BorderSpace,pic.Height-BorderSpace-BorderSpace
		  end
		  
		  // the blur routine should be optimzied to only render sections of the edge 
		  // currently it blurs the entire mask
		  if BlurLevel>0 then
		    p.Mask.Graphics.DrawPicture Blur( p.mask, BlurLevel, kBlurMode ),0,0
		  end
		  
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.ForeColor=BorderColor
		  p.Graphics.FillRect 0,0,p.Width,p.Height
		  
		  pic.Graphics.UseOldRenderer=true
		  pic.Graphics.DrawPicture p,0,0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Brightness(byref map() as integer, Value as integer)
		  // by Tomis Erwin
		  
		  // apply a brightness change to a Map array to be used in an RGBsurface.Transform call
		  
		  dim i as Integer
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if Value=0 then
		    Return
		  end
		  
		  for i=0 to 255
		    map(i) = min( max( map(i)+Value , 0 ) , 255 )
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Brightness(pic as picture, Num as integer)
		  // by Tomis Erwin
		  
		  // apply a brightness change to an image
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i,map(255) as Integer
		  dim s as RGBSurface
		  
		  if num=0 or pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  for i=0 to 255
		    map(i)= max(min(i+num,255),0)
		  Next
		  
		  s.Transform map
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bubble(Pic as picture, HorizontalBubble as double, HorizontalPlacement as double, VerticalBubble as double, VerticalPlacement as double, Quality as integer) As Picture
		  // by Tomis Erwin
		  
		  // NOT FINISHED
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  dim i,n,t as Integer
		  dim w,h as Integer
		  dim d as Double
		  
		  if pic=nil or HorizontalBubble=1 and VerticalBubble=1 then
		    Return pic
		  end
		  
		  if Quality>0 then
		    pic=Resize(pic,Quality*200)
		  end
		  
		  if HorizontalBubble<>1 then
		    w=pic.Width*HorizontalBubble
		    h=pic.Height*HorizontalPlacement
		    
		    p=NewPicture( max( pic.Width, w ), pic.Height, 32 )
		    p.Graphics.UseOldRenderer=true
		    
		    for i=h DownTo 0
		      d=(i/h)
		      n=(d*w ) + ((1-d)*pic.Width ) 
		      
		      p.Graphics.DrawPicture pic,(p.Width-n)/2, i, n, 1, 0,i,pic.Width,1
		    Next
		    
		    t=p.height-h
		    for i=p.Height DownTo h
		      d=((i-h)/t)
		      n=(d*pic.Width ) + ((1-d)*w ) 
		      
		      p.Graphics.DrawPicture pic,(p.width-n)/2, i, n, 1, 0,i,pic.Width,1
		    Next
		    
		    
		    if VerticalBubble<>1 then
		      p=Bubble(p, 1,1, VerticalBubble, VerticalPlacement, 0 )
		    end
		  Elseif VerticalBubble<>1 then
		    w=pic.Width*VerticalPlacement
		    h=pic.Height*VerticalBubble
		    
		    p=NewPicture( pic.Width, max( pic.Height, h ), 32 )
		    p.Graphics.UseOldRenderer=true
		    
		    for i=w DownTo 0
		      d=(i/h)
		      n=(d*h ) + ((1-d)*pic.Height ) 
		      
		      p.Graphics.DrawPicture pic,i,(p.Height-n)/2, 1,n, i,0,1,pic.Height
		    Next
		    
		    't=p.Width-w
		    'for i=p.Width DownTo w
		    'd=((i-w)/t)
		    'n=(d*pic.Height ) + ((1-d)*h)
		    '
		    'p.Graphics.DrawPicture pic,i,(p.Height-n)/2, 1,n, i,0,1,pic.Height
		    'Next
		    
		  end
		  
		  if Quality>0 then
		    Return Resize( p, 100/(Quality*2) )
		  Else
		    Return p
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CMY(pic as picture, Cyan as double, Magenta as double, Yellow as double)
		  // by Tomis Erwin
		  // Value : -1 to 1
		  
		  dim t as Color
		  dim x,y,w,h as Integer
		  dim s as RGBSurface
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if (cyan=0 and magenta=0 and yellow=0) or pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      
		      t=s.Pixel(x,y)
		      's.Pixel(x,y)=CMY( max(t.cyan+cyan,0), max(t.magenta+magenta,0) ,  max(t.yellow+yellow,0) )
		      s.Pixel(x,y)=CMY( t.cyan+cyan, t.magenta+magenta ,  t.yellow+yellow )
		      
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColorArrayToString(Colors() as color) As String
		  // by Tomis Erwin
		  // convert an array of colors into a string list
		  // output: "FF0000,4423Ad,093B50"
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim r,g,b,s() as String
		  dim c as Color
		  for each c in Colors
		    r=HEX(c.red)
		    if lenb(r)=1 then
		      r="0"+r
		    end
		    g=HEX(c.green)
		    if lenb(g)=1 then
		      g="0"+g
		    end
		    b=HEX(c.blue)
		    if lenb(b)=1 then
		      b="0"+b
		    end
		    s.Append r+g+b
		  Next
		  Return join(s,",")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColorArrayToString(ParamArray Colors as color) As String
		  // by Tomis Erwin
		  // convert an array of colors into a string list
		  // output: "FF0000,4423Ad,093B50"
		  
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return ColorArrayToString(Colors)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColorCache_Demo(pic as picture, AlterColorCache as boolean)
		  // by Tomis Erwin
		  
		  // a method for various speed tests
		  
		  dim c(),t as Color
		  dim s as RGBSurface
		  dim x,y,w,i,h,u as Integer
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  
		  //copy the pixels
		  for y=0 to h
		    for x=0 to w
		      c.Append s.Pixel(x,y)
		    next
		  next
		  
		  // transform the pixels
		  if AlterColorCache then
		    u=UBound( c )
		    for i=0 to u
		      x=( c(i).red+c(i).green+c(i).blue) \ 3
		      'c(i)=rgb( (c(i).red+c(i).red)\2, (c(i).green+c(i).green)\2, (c(i).blue+c(i).blue)\2 )
		      't=rgb( (t.red+t.red)\2, (t.green+t.green)\2, (t.blue+t.blue)\2 )
		      c(i)=rgb(x,x,x)
		    next
		  end
		  
		  // apply the pixels back
		  i=0
		  for y=0 to h
		    for x=0 to w
		      s.Pixel(x,y)=c(i)
		      i=i+1
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Colorize(pic as picture, TheColor as color, NormalizeBrightness as boolean)
		  // by Tomis Erwin
		  
		  // works on a similar principle to greyscale
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim s as RGBSurface
		  dim x,y,w,h as Integer
		  dim ir,ig,ib as Integer
		  dim c,g(255) as Color
		  dim d as Double
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  if NormalizeBrightness then
		    // center the brightness to avoid blowout
		    TheColor=hsv( TheColor.hue, TheColor.saturation, .5 ) 
		  end
		  
		  ir=TheColor.red
		  ig=TheColor.green
		  ib=TheColor.blue
		  
		  // mix darks
		  for x=0 to 127
		    d=x/128
		    g(x)=rgb(ir*d, ig*d, ib*d )
		  Next
		  
		  // mix lights
		  for x=128 to 255
		    d=1 - ( (x-128)/128 )
		    y=(255*(1-d))
		    g(x)=rgb(y+(ir*d), y+(ig*d), y+(ib*d) )
		  Next
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      c=s.Pixel(x,y)
		      s.Pixel(x,y)=g( ( c.red + c.green + c.blue ) \3 )
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColorMap(pic as picture, ColorList() as color)
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim K,L as Double
		  dim n,i,u,j as Integer
		  dim x,y,w,h as Integer
		  dim g(255),c1,c2 as Color
		  dim s as RGBSurface
		  
		  u=UBound(ColorList)
		  
		  if pic=nil or u=-1 then
		    Return
		  end
		  
		  if u=0 then
		    pic.Graphics.UseOldRenderer=true
		    pic.Graphics.ForeColor=ColorList(0)
		    pic.Graphics.FillRect 0,0,pic.Width,pic.Height
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  j=256\(u)
		  
		  // build color lookup
		  
		  c1=ColorList(0)
		  for n=1 to u
		    c2=c1
		    c1=ColorList(n)
		    for i=0 to J-1
		      K=i/J
		      L=1-K
		      g(x)=rgb( (c1.red*K)+(c2.red*L) , (c1.green*K)+(c2.green*L) ,(c1.blue*K)+(c2.blue*L) )
		      x=x+1
		    next
		  Next
		  
		  x=x-1
		  for i=x+1 to 255
		    g(i)=g(x)
		  Next
		  
		  // apply colors
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      c1=s.Pixel(x,y)
		      s.Pixel(x,y)=g( ( c1.red + c1.green + c1.blue ) \3 )
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColorStringToArray(ColorString as string) As Color()
		  // by Tomis Erwin
		  // "#ff4da6, fa3290, 5fd" -- a possible valid string 
		  // take a list of colors in String form and convert it to a color array
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim c() as Color
		  dim s,sList() as String
		  
		  ColorString=replaceall(replaceall(ColorString,"#","")," ","")
		  
		  sList=Split(ColorString,",")
		  
		  for each s in sList
		    if len(s)=3 then
		      c.Append rgb( val("&h"+mid(s,1,1)+mid(s,1,1)) ,  val("&h"+mid(s,2,1)+mid(s,2,1)) , val("&h"+mid(s,3,1)+mid(s,3,1)) )
		    Else
		      c.Append rgb( val("&h"+mid(s,1,2)) ,  val("&h"+mid(s,3,2)) , val("&h"+mid(s,5,2)) )
		    end
		  Next
		  
		  Return C
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compare(NewPic as picture, OldPic as picture, Ammount as double, Mode as integer) As Picture
		  // by Tomis Erwin
		  
		  // take two images, compare them in some way and output the result
		  
		  // kCompareModeCrossFade
		  // kCompareModeDifference
		  // kCompareModeAddSubtract
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p,o as Picture
		  dim s,u as RGBSurface
		  dim x,y,w,h,t,m() as Integer
		  dim r,g,b as Integer
		  dim cOld,cNew as Color
		  dim d as Double
		  
		  if NewPic=nil or OldPic=nil then
		    Return nil
		  end
		  
		  p=NewPicture(NewPic.Width,NewPic.Height,32)
		  if p=nil then
		    Return nil
		  end
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.DrawPicture NewPic,0,0
		  
		  o=NewPicture(p.Width,p.Height,32)
		  if o=nil then
		    Return nil
		  end
		  o.Graphics.UseOldRenderer=true
		  // resize the OldPic to the size of the newpic
		  o.Graphics.DrawPicture OldPic,0,0,o.Width,o.Height, 0,0,OldPic.Width,OldPic.Height
		  
		  if mode<>kCompareModeCrossFade then
		    s=p.RGBSurface
		    u=o.RGBSurface
		    w=NewPic.Width-1
		    h=NewPic.Height-1
		    d=Ammount/100
		  end
		  
		  Select case Mode
		  case kCompareModeCrossFade
		    t=(255*(Ammount/100))
		    o.Mask.Graphics.UseOldRenderer=true
		    o.Mask.Graphics.ForeColor=rgb(t,t,t)
		    o.Mask.Graphics.FillRect 0,0,OldPic.Width,OldPic.Height
		    
		    p.Graphics.DrawPicture o,0,0
		    
		  case kCompareModeDifference
		    Redim m(510)
		    for y=0 to 510
		      m(y)=(y-255)*d
		    next
		    
		    for y=0 to h
		      for x=0 to w
		        cOld=u.Pixel(x,y)
		        r=cOld.red
		        g=cOld.green
		        b=cOld.blue
		        cNew=s.Pixel(x,y)
		        t=m( ((r+g+b)\3 - (cNew.red+cNew.green+cNew.blue )\3 ) + 255 )
		        s.Pixel(x,y)=rgb( r+t , g+t  , b+t )
		      next
		    Next
		    
		  case kCompareModeAddSubtract
		    Redim m(255)
		    for y=0 to 255
		      m(y)=y*d
		    next
		    
		    for y=0 to h
		      for x=0 to w
		        cOld=u.Pixel(x,y)
		        cNew=s.Pixel(x,y)
		        s.Pixel(x,y)=rgb( cOld.red-m(cNew.red) , cOld.green-m(cNew.green)  , cOld.blue-m(cNew.blue) )
		      next
		    Next
		    
		  end
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Contrast(byref map() as integer, Value as integer, Middle as integer)
		  // by Tomis Erwin
		  
		  // adjust the contrast of a Map arrray for use in RGBsurface.Transform
		  
		  // Middle sort of acts as a brightness control, it's not exactly the same though
		  
		  'const cMid = 127
		  dim i as Integer
		  dim d as Double
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  d=Value/100
		  
		  if d=0 then
		    Return
		  end
		  
		  for i=0 to 255
		    map(i) = min(max( map(i)+((map(i)-Middle)*D) , 0 ) , 255 )
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Contrast(pic as picture, Value as double, Middle as integer)
		  // by Tomis Erwin
		  
		  // adjust the contrast of an image
		  
		  // Middle sort of acts as a brightness control, it's not exactly the same though
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i,map(255) as Integer
		  dim d as Double
		  dim s as RGBSurface
		  
		  if Value=0 or pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  d=Value/100
		  for i=0 to 255
		    map(i)= min(max( i+ (i-Middle)*d , 0 ) , 255 )
		  Next
		  
		  s.Transform map
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CopyPicture(SourcePicture as picture) As PIcture
		  // return a copy of the source image in 32bit format (most of the effects need 32bit images)
		  // useful when you want to make changes to an image without messing up the original
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  
		  if SourcePicture=nil then
		    Return nil
		  end
		  
		  p=NewPicture( SourcePicture.Width, SourcePicture.Height, 32 )
		  if p=nil then
		    Return nil
		  end
		  
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.DrawPicture SourcePicture,0,0
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Crop(pic as picture, Left as double, Top as double, Right as double, Bottom as double) As Picture
		  // by Tomis Erwin
		  
		  // crop an image by percentage from the various sides
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  dim L,R,T,B as Integer
		  if pic=nil then
		    Return nil
		  end
		  L=pic.Width*(Left/100)
		  R=pic.Width*(Right/100)
		  T=pic.Width*(Top/100)
		  B=pic.Width*(Bottom/100)
		  p=NewPicture(pic.Width-(L+R),pic.Height-(T+B),32)
		  if p<>nil then
		    p.Graphics.UseOldRenderer=true
		    p.Graphics.DrawPicture pic,-L,-T
		    Return p
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawRect(p as picture, bFill as boolean, Mode as integer, PenThick as integer, DrawX as integer, DrawY as integer, DrawWidth as integer, DrawHeight as integer, RoundWidth as integer, RoundHeight as integer, TheColor as color)
		  // by Tomis Erwin
		  
		  // general use wrapper for drawing circle/rect on an image
		  
		  // kDrawRectModePercent
		  // kDrawRectModePixel
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i,iWidth,iHeight as Integer
		  dim x,y,w,h,rw,rh as Integer
		  dim g as Graphics
		  
		  if p=nil then
		    Return
		  end
		  
		  g=p.Graphics
		  g.ForeColor=TheColor
		  iWidth=p.Width
		  iHeight=p.Height
		  
		  if Mode=kDrawRectModePercent then
		    PenThick=(iWidth+iHeight)*(PenThick/1000)
		    x=iWidth*(DrawX/1000)
		    y=iHeight*(DrawY/1000)
		    w=iWidth*(DrawWidth/1000)
		    h=iHeight*(DrawHeight/1000)
		    rw=iWidth*(RoundWidth/1000)
		    rh=iHeight*(RoundHeight/1000)
		  Else
		    x=DrawX
		    y=DrawY
		    w=DrawWidth
		    h=DrawHeight
		    rw=RoundWidth
		    rh=RoundHeight
		  end
		  
		  g.UseOldRenderer=(rw<=0 or rh<=0)
		  g.PenWidth=PenThick
		  g.PenHeight=PenThick
		  
		  if bFill then
		    g.FillRoundRect x,y,w,h,rw,rh
		  Else
		    g.DrawRoundRect x,y,w,h,rw,rh
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Exposure(pic as picture, Ammount as integer)
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim x,y,w,h as Integer
		  dim d as Double
		  dim c as Color
		  dim s as RGBSurface
		  dim map(255) as Integer
		  
		  if Ammount=0 or pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  d=-(Ammount/100)
		  for x=0 to 255
		    map(x)=max( min( x-(x*d) , 255 ) , 0 )
		  Next
		  s.Transform map
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillBevelRect(g as graphics, X as integer, Y as integer, Width as integer, Height as integer, SourceColor as color)
		  // Draws a MacOS X worthy Bevel in any graphics context
		  // by Tomis Erwin - gostcoder@yahoo.com - 2005
		  
		  // NOTES: 
		  // For speed, we render the bevel into a picture buffer with a width of 1 pixel
		  // We then draw the picture stretched to the desired width
		  
		  // You would think that using DrawLine would be faster than stretching an image,
		  // but testing proves otherwise.
		  
		  // There is probably room for more optimization within the actual bevel rendering code.
		  
		  // Caching the temp picture would probably be most efficient, 
		  //   but not doing so keeps the code portable for other uses.
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  
		  dim s,t,r,e,b,sR,sG,sB as Double
		  dim i,yMid,wid,h as Integer
		  dim c2 as Color
		  dim o as Boolean
		  
		  dim p as Picture
		  dim f as RGBSurface
		  
		  // CREATE THE PICTURE BUFFER
		  
		  if g=nil then
		    Return
		  end
		  
		  p=NewPicture(1,Height,32)
		  f=p.RGBSurface
		  
		  // CALCULATE VARIABLES
		  
		  yMid=Height/2.8// placement of the vertex of the fade
		  
		  r=SourceColor.red
		  e=SourceColor.green
		  b=SourceColor.blue
		  wid=x+Width
		  
		  // RENDER TOP OF BEVEL
		  
		  s=15/yMid//step
		  for i=0 to yMid
		    f.Pixel(0,i)=rgb(r,e,b)
		    r=r-s
		    e=e-s
		    b=b-s
		  next
		  
		  // RGB() is faster than HSV() , but I only know how to get the desired color ofset by using HSV
		  c2=hsv( SourceColor.hue, SourceColor.saturation-.2, 1 )
		  
		  r=SourceColor.red-30
		  e=SourceColor.green-30
		  b=SourceColor.blue-30
		  
		  s=(Height-yMid)
		  sR=(c2.red-r)/s
		  sG=(c2.green-e)/s
		  sB=(c2.blue-b)/s
		  
		  // RENDER BOTTOM OF BEVEL
		  
		  h=Height-1
		  for i=yMid+1 to h
		    f.Pixel(0,i)=rgb(r,e,b)
		    r=r+sR
		    e=e+sG
		    b=b+sB
		  next
		  
		  // CHANGE RENDER MODE FOR SPEED
		  
		  o=g.UseOldRenderer// cache current state so we can set it back when we're done
		  g.UseOldRenderer=true//gives us a nice speed boost
		  
		  // DRAW BEVEL
		  
		  g.DrawPicture p,x,y,Width,Height, 0,0,1,Height
		  
		  // SET RENDER MODE BACK
		  g.UseOldRenderer=o
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FilmDust(pic as picture, Percent as integer, MaxSteps as integer)
		  // by Tomis Erwin
		  
		  // NOT FINISHED
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  
		  dim x,y,i,n,c as Integer
		  
		  c=(pic.Width*pic.Height)*(Percent/100)
		  
		  if rand=nil then
		    rand=new Random
		  end
		  rand.Seed=pic.Width*pic.Height
		  
		  for i=0 to c
		    // how many particles to make
		    
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FlattenColors(pic as picture, Level as integer, CaryOver as integer, BlockSize as integer, RandomPrc as integer)
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim xx,yy,ww,hh, x,y,w,h as Integer
		  dim StepBy,AddMid as Integer
		  dim s as RGBSurface
		  dim c1,c2,c3 as Color
		  dim d as Double
		  dim b as Boolean
		  
		  if pic=nil or Level=0 or BlockSize<2 then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  if RandomPrc>0 then
		    if rand=nil then
		      rand=new Random
		    end
		    rand.Seed=pic.Width*pic.Height*RandomPrc
		    d=RandomPrc/100
		  Else
		    b=true
		  end
		  
		  ww=pic.Width-1
		  hh=pic.Height-1
		  
		  StepBy=max( BlockSize-1, BlockSize/2 )
		  AddMid=BlockSize/2
		  
		  
		  
		  for yy=0 to hh Step StepBy
		    h=yy+StepBy
		    
		    for xx=0 to ww Step StepBy
		      w=xx+StepBy
		      
		      c1=s.Pixel(xx+AddMid,yy+AddMid)
		      
		      if b or rand.Number>d then
		        c2=s.Pixel((xx-StepBy)+AddMid,yy+AddMid)
		        if abs(c1.red-c2.red)<Level and abs(c1.green-c2.green)<Level and abs(c1.blue-c2.blue)<Level then
		          c3=s.Pixel(xx+AddMid,(yy-StepBy)+AddMid)
		          if abs(c1.red-c3.red)<CaryOver and abs(c1.green-c3.green)<CaryOver and abs(c1.blue-c3.blue)<CaryOver then
		            c1=c3
		          Else
		            c1=c2
		          end
		        end
		      end
		      
		      for y=yy to h
		        for x=xx to w
		          
		          c2=s.Pixel(x,y)
		          if abs(c1.red-c2.red)<Level and abs(c1.green-c2.green)<Level and abs(c1.blue-c2.blue)<Level then
		            s.Pixel(x,y)=c1
		          end
		          
		        Next
		      Next
		      
		    Next
		    
		    
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Flip(Pic as picture, Horiz as integer, Vert as integer)
		  // by Tomis Erwin
		  
		  // i'm sure this code could be optimized
		  
		  const kModeNone = 0
		  const kModeFlip = 1
		  const kModeMirror = 2
		  const kModeBlend = 3 // a transparent flip
		  
		  dim i,w,h as Integer
		  dim s,r as RGBSurface
		  dim p as Picture
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil or (Horiz=kModeNone and Vert=kModeNone) then
		    Return
		  end
		  
		  pic.Graphics.UseOldRenderer=true
		  
		  if vert=kModeMirror then
		    h=(pic.Height/2)+2
		  Else
		    h=pic.Height
		  end
		  
		  Select case Horiz
		  case kModeNone
		    //do nothing
		  case kModeFlip
		    w=pic.Width/2
		    if Vert<>kModeNone then
		      p=NewPicture(pic.width,pic.Height,32)
		    else
		      p=NewPicture(w,h,32)
		    end
		    p.Graphics.UseOldRenderer=true
		    p.Graphics.DrawPicture pic,0,0
		    
		    for i=0 to w
		      pic.Graphics.DrawPicture( pic,i,0,1,h, pic.width-i-1,0,1,h)
		    next
		    
		    for i=w to pic.Width
		      pic.Graphics.DrawPicture( p,i,0,1,h, pic.width-i-1,0,1,h)
		    next
		    
		  case kModeMirror
		    for i=(pic.Width/2) to pic.Width
		      pic.Graphics.DrawPicture( pic,i,0,1,h, pic.width-i-1,0,1,h)
		    next
		    
		  case kModeBlend
		    p=NewPicture(pic.width,h,32)
		    p.Graphics.UseOldRenderer=true
		    p.Mask.Graphics.UseOldRenderer=True
		    
		    for i=0 to pic.Width
		      p.Graphics.DrawPicture( pic,i,0,1,h, pic.width-i-1,0,1,h)
		    next
		    
		    p.Mask.Graphics.UseOldRenderer=true
		    p.Mask.Graphics.ForeColor=&c7f7f7f
		    p.Mask.Graphics.FillRect( 0,0,pic.Width,pic.height)
		    pic.Graphics.DrawPicture p,0,0
		    
		    if Vert<>kModeNone then
		      p.Mask.Graphics.ForeColor=&c000000
		      p.Mask.Graphics.FillRect( 0,0,pic.Width,pic.height)
		    end
		    
		  end
		  
		  if vert=kModeNone then
		    Return
		  else
		    if Vert=kModeMirror then
		      p=NewPicture(pic.width,pic.height/2,32)
		    else
		      p=NewPicture(pic.width,pic.Height,32)
		    end
		    p.Graphics.UseOldRenderer=true
		  end
		  
		  Select case Vert
		  case kModeFlip
		    p.Graphics.DrawPicture pic,0,0
		    
		    w=pic.width
		    h=pic.Height/2
		    
		    for i=0 to h
		      pic.Graphics.DrawPicture( pic,0,i,w,1, 0, pic.height-i-1,w,1)
		    next
		    
		    for i=h to pic.Height
		      pic.Graphics.DrawPicture( p,0,i,w,1, 0,pic.height-i-1,w,1)
		    next
		    
		  case kModeMirror
		    w=pic.width
		    h=pic.Height/2
		    for i=h to pic.Height
		      pic.Graphics.DrawPicture( pic,0,i,w,1, 0,pic.height-i-1,w,1)
		    next
		    
		  case kModeBlend
		    w=pic.width
		    
		    for i=0 to pic.Height
		      p.Graphics.DrawPicture( pic,0,i,w,1, 0, pic.height-i-1,w,1)
		    next
		    
		    p.Mask.Graphics.UseOldRenderer=true
		    p.Mask.Graphics.ForeColor=&c7f7f7f
		    p.Mask.Graphics.FillRect( 0,0,pic.Width,pic.height)
		    pic.Graphics.DrawPicture p,0,0
		    
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Frame(pic as picture, FrameThickness as integer, FrameColor as color) As Picture
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  dim i as Integer
		  
		  if pic=nil or FrameThickness=0 then
		    Return pic
		  end
		  
		  i=FrameThickness*2
		  p=NewPicture(pic.Width+i,pic.Height+i,32)
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.ForeColor=FrameColor
		  p.Graphics.FillRect 0,0,p.Width,FrameThickness // top
		  p.Graphics.FillRect 0,p.Height-FrameThickness,p.Width,FrameThickness // bottom
		  p.Graphics.FillRect 0,FrameThickness,FrameThickness,p.Height-i//left
		  p.Graphics.FillRect p.Width-FrameThickness,FrameThickness,FrameThickness,p.Height-i//right
		  p.Graphics.DrawPicture pic,FrameThickness,FrameThickness
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Garble(pic as picture, MaxWidth as integer, MaxHeight as integer, Passes as integer)
		  // by Tomis Erwin
		  
		  // make a mess of the image by scrambling portions of it all over
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i,w,h as Integer
		  
		  if pic=nil then
		    Return
		  end
		  
		  if rand=nil then
		    rand=new Random
		  end
		  rand.Seed=pic.Width*pic.Height*MaxWidth*MaxHeight
		  
		  pic.Graphics.UseOldRenderer=true
		  
		  for i=1 to Passes
		    w=rand.InRange(1,MaxWidth)
		    h=rand.InRange(1,MaxHeight)
		    pic.Graphics.DrawPicture pic,pic.Width*rand.Number,pic.Height*rand.Number,w,h, pic.Width*rand.Number,pic.Height*rand.Number,w,h
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Generator_Basic(ImageWidth as integer, ImageHeight as integer, TheColor as color) As picture
		  // by Tomis Erwin
		  
		  // make an image of the desired dimensions and color
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  p=NewPicture(ImageWidth,ImageHeight,32)
		  if p=nil then
		    Return nil
		  end
		  
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.ForeColor=TheColor
		  p.Graphics.FillRect 0,0,p.Width,p.Height
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Generator_Random(ImageWidth as integer, ImageHeight as integer, OptionalSeed as integer, OnlyShapes as boolean) As Picture
		  // by Tomis Erwin
		  
		  // make an image of the desired dimensions with random text and shapes
		  
		  dim p as Picture
		  dim i,t,z,n as Integer
		  dim s as String
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  ImageWidth=max( ImageWidth , 16 )
		  ImageHeight=max( ImageHeight , 16 )
		  
		  if rand=nil then
		    rand=new Random
		  end
		  
		  rand.Seed=(ImageWidth*ImageHeight)+OptionalSeed
		  
		  p=NewPicture(ImageWidth,ImageHeight,32)
		  
		  if p=nil Then
		    Return nil
		  end
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.ForeColor=rgb(rand.Number*255,rand.Number*255,rand.Number*255)
		  p.Graphics.FillRect 0,0,ImageWidth,ImageHeight
		  
		  p.Graphics.UseOldRenderer=False
		  z=(ImageWidth*ImageHeight)*.0008
		  for i=0 to z
		    p.Graphics.ForeColor=rgb(rand.Number*255,rand.Number*255,rand.Number*255)
		    Select case rand.InRange(1,3)
		    case 1
		      oval:
		      p.Graphics.FillOval rand.InRange(0,p.width),rand.InRange(0,p.height), rand.InRange(16,64),rand.InRange(16,64)
		    case 2
		      rect:
		      p.Graphics.UseOldRenderer=true
		      p.Graphics.FillRect rand.InRange(0,p.width),rand.InRange(0,p.height), rand.InRange(16,64),rand.InRange(16,64)
		      p.Graphics.UseOldRenderer=False
		    case 3
		      roundrect:
		      p.Graphics.FillRoundRect rand.InRange(0,p.width),rand.InRange(0,p.height), rand.InRange(16,64),rand.InRange(16,64),rand.InRange(3,16),rand.InRange(3,16)
		    end
		  next
		  
		  if not OnlyShapes then
		    z=(ImageWidth*ImageHeight)*.0005
		    for i=0 to z
		      Select case rand.InRange(1,25)
		      case 5
		        p.Graphics.UseOldRenderer=true
		        p.Graphics.DrawNoteIcon rand.InRange(0,p.width),rand.InRange(0,p.height)
		      case 10
		        p.Graphics.UseOldRenderer=true
		        p.Graphics.DrawCautionIcon rand.InRange(0,p.width),rand.InRange(0,p.height)
		      case 15
		        p.Graphics.UseOldRenderer=true
		        p.Graphics.DrawStopIcon rand.InRange(0,p.width),rand.InRange(0,p.height)
		      case 20
		        p.Graphics.UseOldRenderer=False
		        p.Graphics.ForeColor=rgb(rand.Number*255,rand.Number*255,rand.Number*255)
		        p.Graphics.TextSize=rand.InRange(12,24)
		        p.Graphics.TextFont=Font( rand.InRange(0, FontCount-1) )
		        s=""
		        n=rand.InRange(5,10)
		        for t=0 to n
		          s=s+chr( rand.InRange(33,125) )
		        next
		        p.Graphics.Bold=(rand.InRange(0,1)=1)
		        p.Graphics.Italic=(rand.InRange(0,1)=1)
		        p.Graphics.DrawString s,rand.InRange(0,p.width),rand.InRange(0,p.height)
		      end
		    next
		  end
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Glow(pic as picture, HighlightMode as integer, ProcessMode as integer, HoldTo as integer, BlurLevel as integer, MixLevel as integer)
		  // by Tomis Erwin
		  
		  // that "dreamy" look portrait photographers like to use too much, especially on wedding photos
		  
		  const kProcessBlackWhite = 0
		  const kProcessColor = 1
		  const kProcessBlackWhiteFast = 2
		  const kProcessColorFast = 3
		  
		  const kHighlightBrights = 0
		  const kHighlightDarks = 1
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i,x,y,a as Integer
		  dim s as RGBSurface
		  dim map(255) as Integer
		  dim d as Double
		  dim p as Picture
		  dim bCol,bFast as Boolean
		  
		  if pic=nil or MixLevel=0 then
		    Return
		  end
		  
		  Select case ProcessMode
		  case kProcessBlackWhite
		  case kProcessColor
		    bCol=true
		    bFast=False
		  case kProcessBlackWhiteFast
		    bCol=False
		    bFast=true
		  case kProcessColorFast
		    bCol=true
		    bFast=true
		  end
		  
		  //make the temp image
		  p=NewPicture(pic.width,pic.Height,32)
		  p.Graphics.UseOldRenderer=true
		  p.Mask.Graphics.UseOldRenderer=true
		  p.Graphics.DrawPicture pic,0,0
		  s=p.RGBSurface
		  
		  if not bCol then
		    //grey scale - there's gotta be a faster way to do this!
		    Greyscale(p)
		  end
		  
		  //alter the temp
		  Select case HighlightMode
		  case kHighlightBrights
		    for i=0 to 255
		      if i>HoldTo then
		        'map(i)=0//default is 0 anyway
		      else
		        map(i)=255
		      end
		    next
		  case kHighlightDarks
		    for i=0 to 255
		      if i<HoldTo then
		        'map(i)=0//default is 0 anyway
		      else
		        map(i)=255
		      end
		    next
		  end
		  
		  if MixLevel<100 then
		    a=255*(1-(MixLevel/100))
		    for i=0 to 255
		      map(i)=min( map(i)+a , 255 )
		    next
		  end
		  
		  s.Transform map//render change
		  
		  // make temp into an overlay
		  
		  'pic.Graphics.DrawPicture p,0,0 // debug
		  'Return // debug
		  
		  if BlurLevel<1 then
		    p.Mask.Graphics.DrawPicture p,0,0
		  else
		    if bFast then
		      p.Mask.Graphics.DrawPicture blur( p, BlurLevel, 2, 1, false ),0,0
		    else
		      p.Mask.Graphics.DrawPicture blur( p, BlurLevel, 1, 1, false ),0,0
		    end
		  end
		  
		  Select case HighlightMode
		  case kHighlightBrights
		    // faster than fillrect? or maybe just the same, I can't tell
		    p.Graphics.ClearRect 0,0,p.Width,p.Height
		  case kHighlightDarks
		    p.Graphics.ForeColor=&c000000
		    p.Graphics.FillRect 0,0,p.Width,p.Height
		  end
		  
		  // overlay the result
		  pic.Graphics.DrawPicture p,0,0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Gradient(width as integer, height as integer, Style as integer, ColorList() as color) As Picture
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return Gradient(width,height,Style,ColorList,50,50)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Gradient(width as integer, height as integer, Style as integer, ColorList() as color, OriginX as double, OriginY as double) As Picture
		  // by Tomis Erwin
		  
		  // a wrapper to make it easy to manage the various gradient styles
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if UBound(ColorList)=0 then
		    Return Generator_Basic(Width,Height, ColorList(0) )
		  Else
		    
		    if Style=kGradientStyleWipeHorizontal then
		      Return GradientWipe(Width,Height, false, ColorList)
		      
		    ElseIf Style=kGradientStyleWipeVertical then
		      Return GradientWipe(Width,Height, true, ColorList)
		      
		    Elseif Style=kGradientStyleRadial then
		      Return GradientRadial(Width,Height, ColorList, OriginX, OriginY)
		      
		    Elseif Style=kGradientStyleOval then
		      Return GradientExplosion(Width,Height, True, ColorList)
		      
		    ElseIf Style=kGradientStyleBox then
		      Return GradientExplosion(Width,Height, False, ColorList)
		      
		    end
		    
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Gradient(width as integer, height as integer, Style as integer, ColorList as string) As Picture
		  // by Tomis Erwin
		  // simple wrapper to use String list instead of Color array
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return Gradient( width, height, Style, ColorStringToArray(ColorList) )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Gradient(width as integer, height as integer, Style as integer, ColorList as String, OriginX as double, OriginY as double) As Picture
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return Gradient(width,height,Style,ColorStringToArray(ColorList),OriginX,OriginY)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GradientExplosion(width as integer, height as integer, IsOval as boolean , ColorList() as color) As Picture
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  dim g as Graphics
		  dim K,L,d,x,y,w,h as Double
		  dim n,i,u,e,j,t as Integer
		  dim c1,c2 as Color
		  dim s as RGBSurface
		  
		  if UBound(ColorList)<1 or width=0 or height=0 then
		    Return nil
		  end
		  
		  p=NewPicture(width,height,32)
		  if p=nil then
		    Return nil
		  end
		  g=p.Graphics
		  g.UseOldRenderer=true
		  if IsOval then
		    g.PenHeight=4
		    g.PenWidth=4
		  Else
		    g.PenHeight=2
		    g.PenWidth=2
		    ColorList.Append ColorList(UBound(ColorList))
		  end
		  
		  u=UBound(ColorList)
		  
		  j=(max(width,height)\2)\u
		  t=u*j
		  
		  w=g.Width/2
		  h=g.Height/2
		  
		  g.ForeColor=ColorList(u)
		  g.FillRect 0,0,g.Width,g.Height
		  
		  c1=ColorList(0)
		  for n=0 to u
		    c2=c1
		    
		    c1=ColorList(n)
		    
		    if IsOval then
		      for i=0 to J-1
		        K=i/J
		        L=1-K
		        g.ForeColor=rgb( (c1.red*K)+(c2.red*L) , (c1.green*K)+(c2.green*L) ,(c1.blue*K)+(c2.blue*L) )
		        
		        d=1-(e/t)
		        
		        x=w*d
		        y=h*d
		        
		        g.DrawOval x,y,g.Width-(x+x),g.Height-(y+y)
		        
		        e=e+1
		      next
		      
		    Else
		      
		      for i=0 to J-1
		        K=i/J
		        L=1-K
		        g.ForeColor=rgb( (c1.red*K)+(c2.red*L) , (c1.green*K)+(c2.green*L) ,(c1.blue*K)+(c2.blue*L) )
		        
		        d=1-(e/t)
		        
		        x=w*d
		        y=h*d
		        
		        g.DrawRect x,y,g.Width-(x+x),g.Height-(y+y)
		        
		        e=e+1
		      next
		      
		    end
		    
		  Next
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GradientRadial(width as integer, height as integer, ColorList() as color) As Picture
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return GradientRadial(width,height,ColorList,50,50)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GradientRadial(width as integer, height as integer, ColorList() as color, OriginX as double, OriginY as double) As Picture
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim K,L as Double
		  dim t,u,j as Integer
		  dim x,y as Integer
		  dim p as Picture
		  dim g as Graphics
		  dim c(),c1,c2 as Color
		  
		  if UBound(ColorList)<1 or width=0 or height=0 then
		    Return nil
		  end
		  
		  p=NewPicture(width,height,32)
		  g=p.Graphics
		  g.UseOldRenderer=true
		  
		  OriginX=width*(OriginX/100)
		  OriginY=height*(OriginY/100)
		  
		  // build color cache
		  t=width+width+height+height+4
		  
		  ColorList.Append ColorList(0)
		  
		  u=UBound(ColorList)
		  
		  c1=ColorList(0)
		  j=t\u
		  for x=1 to u
		    c2=c1
		    c1=ColorList(x)
		    
		    for y=0 to j
		      K=y/J
		      L=1-K
		      c.Append rgb( (c1.red*K)+(c2.red*L) , (c1.green*K)+(c2.green*L) ,(c1.blue*K)+(c2.blue*L) )
		    Next
		  Next
		  
		  for x=u*j to t
		    c.Append c1
		  Next
		  
		  // for debugging
		  'g.ForeColor=&c000000
		  'g.FillRect 0,0,g.Width,g.Height
		  
		  x=0
		  y=0
		  
		  t=0
		  for x=0 to width
		    g.ForeColor=c(t)
		    t=t+1
		    g.DrawLine x,y,OriginX,OriginY
		  next
		  
		  for y=0 to height
		    g.ForeColor=c(t)
		    t=t+1
		    g.DrawLine x,y,OriginX,OriginY
		  next
		  
		  for x=width+1 downto -1
		    g.ForeColor=c(t)
		    t=t+1
		    g.DrawLine x,y,OriginX,OriginY
		  next
		  
		  x=0
		  for y=height downto 0
		    g.ForeColor=c(t)
		    t=t+1
		    g.DrawLine x,y,OriginX,OriginY
		  next
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GradientWipe(width as integer, height as integer, IsVertical as boolean, ColorList() as color) As Picture
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p,m as Picture
		  dim K,L as Double
		  dim n,i,u,j,x as Integer
		  dim c1,c2 as Color
		  dim s as RGBSurface
		  
		  if UBound(ColorList)<1 or width=0 or height=0 then
		    Return nil
		  end
		  
		  p=NewPicture(width,height,32)
		  if p=nil then
		    Return nil
		  end
		  p.Graphics.UseOldRenderer=true
		  
		  u=UBound(ColorList)
		  
		  if IsVertical then
		    j=height\(u)
		    n=(u)*j
		    m=NewPicture(1,n,32)
		  Else
		    j=width\(u)
		    n=(u)*j
		    m=NewPicture(n,1,32)
		  end
		  
		  if m=nil then
		    Return nil
		  end
		  s=m.RGBSurface
		  if s=nil then
		    Return nil
		  end
		  
		  c1=ColorList(0)
		  for n=1 to u
		    c2=c1
		    
		    c1=ColorList(n)
		    
		    if IsVertical then
		      for i=0 to J-1
		        K=i/J
		        L=1-K
		        s.Pixel(0,x)=rgb( (c1.red*K)+(c2.red*L) , (c1.green*K)+(c2.green*L) ,(c1.blue*K)+(c2.blue*L) )
		        x=x+1
		      next
		    Else
		      for i=0 to J-1
		        K=i/J
		        L=1-K
		        s.Pixel(x,0)=rgb( (c1.red*K)+(c2.red*L) , (c1.green*K)+(c2.green*L) ,(c1.blue*K)+(c2.blue*L) )
		        x=x+1
		      next
		    end
		  Next
		  
		  p.Graphics.DrawPicture m,0,0,p.Width,p.Height, 0,0,m.Width,m.Height
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Greyscale(byref pic as picture)
		  // by Tomis Erwin
		  
		  // alter the original, converting it to greyscale
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim s as RGBSurface
		  dim x,y,w,h as Integer
		  dim c,g() as Color
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  // there's a very slight advantage in using a color cache instead of calling rgb() repeatedly
		  Redim g(255)
		  for x=0 to 255
		    g(x)=rgb(x,x,x)
		  Next
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      c=s.Pixel(x,y)
		      s.Pixel(x,y)=g( ( c.red + c.green + c.blue ) \3 )
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Greyscale(pic as picture) As Picture
		  // by Tomis Erwin
		  
		  // return a copy of the original, converted to greyscale
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  if pic=nil then
		    Return pic
		  end
		  
		  p=NewPicture(pic.Width,pic.Height,32)
		  if p=nil then
		    Return pic
		  end
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.DrawPicture pic,0,0
		  
		  Greyscale(p)
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HSV(Pic as picture, Hue as double, Saturation as double, Value as double, Mode as integer)
		  // by Tomis Erwin
		  
		  // Value : -1 to 1
		  
		  const kModeNormal = 0
		  const kModeInvert = 1
		  
		  dim t as Color
		  dim x,y,w,h as Integer
		  dim s as RGBSurface
		  dim d as Double
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if (value=0 and hue=0 and saturation=0) or pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  
		  if mode=kmodenormal then
		    
		    for y=0 to h
		      for x=0 to w
		        
		        t=s.Pixel(x,y)
		        
		        d=t.hue+Hue
		        if d<0 then
		          s.Pixel(x,y)=HSV( 1+d, max(t.saturation+Saturation,0) ,  max(t.value+value,0) )
		        ElseIf d>1 then
		          s.Pixel(x,y)=HSV( d-1, max(t.saturation+Saturation,0) ,  max(t.value+value,0) )
		        else
		          s.Pixel(x,y)=HSV( d, max(t.saturation+Saturation,0) ,  max(t.value+value,0) )
		        end
		        
		      next
		    next
		    
		  elseif mode=kmodeinvert then
		    
		    for y=0 to h
		      for x=0 to w
		        
		        t=s.Pixel(x,y)
		        
		        d=t.hue+Hue
		        if d<0 then
		          d=1+d
		        ElseIf d>1 then
		          d=d-1
		        end
		        
		        s.Pixel(x,y)=HSV( d , min( abs(t.saturation+Saturation) ,1) ,  min( abs(t.value+value),1) )
		        
		      next
		    next
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HSV_Hue(Pic as picture, Value as double)
		  // by Tomis Erwin
		  
		  // Value : -1 to 1
		  // Hue() is faster
		  
		  dim t as Color
		  dim x,y,w,h as Integer
		  dim s as RGBSurface
		  dim d as Double
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if value=0 or pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      
		      t=s.Pixel(x,y)
		      
		      d=t.hue+Value
		      
		      if d<0 then
		        s.Pixel(x,y)=HSV( 1+d, t.saturation , t.value )
		      ElseIf d>1 then
		        s.Pixel(x,y)=HSV( d-1, t.saturation , t.value )
		      else
		        s.Pixel(x,y)=HSV( d, t.saturation , t.value )
		      end
		      
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HSV_Invert(pic as picture, InvertHue as boolean, InvertSaturation as boolean, InvertValue as boolean)
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim x,y,w,h as integer
		  dim s as RGBSurface
		  dim c as color
		  
		  if pic=nil then
		    Return
		  end
		  
		  if invertHue and invertsaturation and invertvalue then// 1, 1, 1
		    // just do RGB invert for speed
		    Invert(pic)
		    return
		  end
		  
		  s=pic.rgBSurface
		  if s=nil then
		    return
		  end
		  
		  w=pic.width-1
		  h=pic.height-1
		  
		  // trap for all combinations, it's faster than handling them in the loop
		  
		  if invertHue and invertsaturation then// 2, 2
		    for y=h downTo 0
		      for x=w downTo 0
		        c=s.pixel(x,y)
		        s.pixel(x,y)=HSV( 1-c.hue, 1-c.saturation, c.value )
		      next
		    next
		    return
		  end
		  
		  if invertHue and invertvalue then// 3 , 2
		    for y=h downTo 0
		      for x=w downTo 0
		        c=s.pixel(x,y)
		        s.pixel(x,y)=HSV( 1-c.hue, c.saturation, 1-c.value )
		      next
		    next
		    return
		  end
		  
		  if inverthue then// 4
		    for y=h downTo 0
		      for x=w downTo 0
		        c=s.pixel(x,y)
		        s.pixel(x,y)=HSV( 1-c.hue, c.saturation, c.value )
		      next
		    next
		    return
		  end
		  
		  if invertsaturation and invertvalue then// 3, 3
		    for y=h downTo 0
		      for x=w downTo 0
		        c=s.pixel(x,y)
		        s.pixel(x,y)=HSV( c.hue, 1-c.saturation, 1-c.value )
		      next
		    next
		    return
		  end
		  
		  if invertsaturation then// 4
		    for y=h downTo 0
		      for x=w downTo 0
		        c=s.pixel(x,y)
		        s.pixel(x,y)=HSV( c.hue, 1-c.saturation, c.value )
		      next
		    next
		    return
		  end
		  
		  if invertvalue then// 4
		    for y=h downTo 0
		      for x=w downTo 0
		        c=s.pixel(x,y)
		        s.pixel(x,y)=HSV( c.hue, c.saturation, 1-c.value )
		      next
		    next
		    return
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HSV_Saturation(Pic as picture, Value as double)
		  // by Tomis Erwin
		  
		  // Value: -1 to 1
		  // Saturation() is faster
		  
		  dim t as Color
		  dim x,y,w,h as Integer
		  dim s as RGBSurface
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if value=0 or pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      
		      t=s.Pixel(x,y)
		      
		      if t.red=t.green and t.green=t.blue Then
		        // greyscale color, there's no saturation to alter
		      else
		        s.Pixel(x,y)=HSV( t.hue, max(t.saturation+Value,0) , t.value )
		      end
		      
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HSV_Value(Pic as picture, ChangeBy as double)
		  // by Tomis Erwin
		  
		  // Value: -1 to 1
		  // Brightness() is faster
		  
		  dim t as Color
		  dim x,y,w,h as Integer
		  dim s as RGBSurface
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if changeby=0 or pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      
		      t=s.Pixel(x,y)
		      
		      s.Pixel(x,y)=HSV( t.hue, t.saturation , max(t.value+changeby,0) )
		      
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Hue(pic as picture, ShiftByPercent as integer)
		  // by Tomis Erwin
		  // Hue( pPicture, 100 ) -- shifts the image hue by 100%
		  
		  // an RGB based version of HSV_Saturation()
		  // this tends to be 2x faster than the HSV version
		  
		  // slide the rgb channels anywhere from -300% to +300%
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim c as Color
		  dim x,y,w,h as Integer
		  dim s as RGBSurface
		  
		  dim n as Integer
		  dim cd(),cdi() as Integer
		  dim r,g,b as Integer
		  dim r2,g2,b2 as Integer
		  dim d,di as Double
		  
		  if pic=nil or ShiftByPercent=0 or ShiftByPercent=300 or ShiftByPercent=-300 then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  if ShiftByPercent<0 then
		    ShiftByPercent=300+ShiftByPercent
		  end
		  
		  d=ShiftByPercent/100
		  n=ShiftByPercent/101
		  d=d-n
		  di=1-d
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  
		  if n=0 then// rgb > brg
		    if d=1 then
		      for y=0 to h
		        for x=0 to w
		          c=s.Pixel(x,y)
		          s.Pixel(x,y)=rgb( c.blue , c.red , c.green )
		        next
		      Next
		    Else
		      redim cd(255)
		      redim cdi(255)
		      for x=0 to 255
		        cd(x)=x*d
		        cdi(x)=x*di
		      next
		      
		      for y=0 to h
		        for x=0 to w
		          c=s.Pixel(x,y)
		          r=c.red
		          g=c.green
		          b=c.blue
		          s.Pixel(x,y)=rgb( cdi(r)+cd(b) , cdi(g)+cd(r) , cdi(b)+cd(g) )
		          's.Pixel(x,y)=rgb( (c.red*di)+(c.blue*d) , (c.green*di)+(c.red*d) , (c.blue*di)+(c.green*d) )
		        next
		      Next
		    end
		    
		  elseif n=1 then// brg > gbr
		    if d=1 then
		      for y=0 to h
		        for x=0 to w
		          c=s.Pixel(x,y)
		          s.Pixel(x,y)=rgb( c.green , c.blue , c.red )
		        next
		      Next
		    Else
		      redim cd(255)
		      redim cdi(255)
		      for x=0 to 255
		        cd(x)=x*d
		        cdi(x)=x*di
		      next
		      
		      for y=0 to h
		        for x=0 to w
		          c=s.Pixel(x,y)
		          r=c.red
		          g=c.green
		          b=c.blue
		          s.Pixel(x,y)=rgb( cdi(b)+cd(g) , cdi(r)+cd(b) , cdi(g)+cd(r) )
		        next
		      Next
		    end
		    
		  elseif n=2 then// gbr > rgb
		    // if d=1 ~ no change , that is to say -300 or +300, these are handled at the beginging though
		    
		    redim cd(255)
		    redim cdi(255)
		    for x=0 to 255
		      cd(x)=x*d
		      cdi(x)=x*di
		    next
		    
		    for y=0 to h
		      for x=0 to w
		        c=s.Pixel(x,y)
		        r=c.red
		        g=c.green
		        b=c.blue
		        s.Pixel(x,y)=rgb( cdi(g)+cd(r) , cdi(b)+cd(g) , cdi(r)+cd(b) )
		      next
		    Next
		    
		  end
		  
		  
		  // original code, simpler but much slower
		  'for y=0 to h
		  'for x=0 to w
		  'c=s.Pixel(x,y)
		  'r=c.red
		  'g=c.green
		  'b=c.blue
		  'select case n
		  'case 0// rgb > brg
		  's.Pixel(x,y)=rgb( (r*di)+(b*d) , (g*di)+(r*d) , (b*di)+(g*d) )
		  'case 1// brg > gbr
		  's.Pixel(x,y)=rgb( (b*di)+(g*d) , (r*di)+(b*d) , (g*di)+(r*d) )
		  'case 2// gbr > rgb
		  's.Pixel(x,y)=rgb( (g*di)+(r*d) , (b*di)+(g*d) , (r*di)+(b*d) )
		  'end
		  'next
		  'Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Interlace(pic as picture, VertStyle as integer, HorizStyle as integer, TheColor as color)
		  // by Tomis Erwin
		  
		  const kStyleNoLines = 0
		  const kStyleEvenLines = 1
		  const kStyleOddLines = 2
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i,w,h as Integer
		  dim g as Graphics
		  
		  if pic=nil then
		    Return
		  end
		  
		  g=pic.Graphics
		  if g=nil then
		    Return
		  end
		  
		  g.UseOldRenderer=true
		  g.ForeColor=TheColor
		  
		  if VertStyle>kStyleNoLines then
		    w=pic.Width-1
		    h=pic.Height
		    for i=(VertStyle-1) to w step 2
		      g.DrawLine i,0,i,h
		    next
		  end
		  
		  if HorizStyle>kStyleNoLines then
		    h=pic.Height-1
		    w=pic.Width
		    for i=(HorizStyle-1) to h step 2
		      g.DrawLine 0,i,w,i
		    next
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Invert(byref map() as integer, Mode as integer)
		  // by Tomis Erwin
		  
		  // invert the Map for use with RGBsurface.Transform
		  
		  // you can choose to invert only the even or odd color values if you want
		  
		  const kModeFull = 0
		  const kModeEven = 1
		  const kModeOdd = 2
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i as Integer
		  
		  Select case Mode
		  case kModeFull
		    for i=0 to 255
		      map(i) = 255-map(i)
		    next
		  case kModeEven
		    for i=0 to 255 step 2
		      map(i) = 255-map(i)
		    next
		  case kModeOdd
		    for i=1 to 255 step 2
		      map(i) = 255-map(i)
		    next
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Invert(byref p as picture)
		  // by Tomis Erwin
		  
		  // invert the color spectrum of the image
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i,m(255) as Integer
		  dim s as rgBSurface
		  if p=nil then
		    Return
		  end
		  s=p.rgBSurface
		  if s=nil then
		    return
		  end
		  for i=0 to 255
		    m(i)=255-i
		  Next
		  s.Transform m
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvertBrightness(Pic as picture)
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim s as RGBSurface
		  dim x,y,w,h,t as Integer
		  dim r,g,b as Integer
		  dim c as Color
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  
		  for y=0 to h
		    for x=0 to w
		      c=s.Pixel(x,y)
		      r=c.red
		      g=c.green
		      b=c.blue
		      't=( ( ( (r+g+b)\3 ) - 128 ) * -2 ) -1
		      t= 255 - ((r+g+b)\3)*2
		      s.Pixel(x,y)=rgb( r+t , g+t  , b+t )
		    next
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Luminance(byref pic as picture)
		  // by Tomis Erwin
		  
		  // like Greyscale(), except this represents how the human eye perceives the lights and darks
		  // greyscaling just averages the channels
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim s as RGBSurface
		  dim x,y,w,h,n as Integer
		  dim c,g() as Color
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  // there's a very slight advantage in using a color cache instead of calling rgb() repeatedly
		  Redim g(255)
		  for x=0 to 255
		    g(x)=rgb(x,x,x)
		  Next
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      c=s.Pixel(x,y)
		      s.Pixel(x,y)=g( c.red*0.30 + c.green*0.59 + c.blue*0.11 )
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MemoryBlockAdjust(Pic as picture, Ammount as integer)
		  // basic framework for loading image into a memoryblock, 
		  //  manipulating it, and then writing it back out
		  
		  // by Tomis Erwin : gostcoder@yahoo.com
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim x,y,w,h, i,L,t as integer
		  dim s as RGBSurface
		  dim mb as MemoryBlock
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  
		  L=(pic.Width*pic.Height)*3
		  if mb=nil or mb.Size<>L then
		    mb=NewMemoryBlock(L)
		    for y=0 to h
		      for x=0 to w
		        mb.ColorValue(i,24)=s.Pixel(x,y)
		        i=i+3
		      next
		    next
		  end
		  
		  't=(L-3)-Ammount
		  'for i=0 to t
		  'mb.Byte(i)=mb.Byte(i+Ammount)
		  'next
		  
		  t=(pic.Width-1)*3
		  w=pic.Width*3
		  x=0
		  y=0
		  
		  for i=0 to L step 3
		    s.Pixel(x,y)=mb.ColorValue(i,24)
		    if i=t then
		      t=t+w
		      x=0
		      y=y+1
		    Else
		      x=x+1
		    end
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Mix(byref NewPic as picture, OldPic as picture, WeightTowardsNew as integer)
		  // by Tomis Erwin
		  
		  dim i as Integer
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if NewPic=nil or OldPic=nil or WeightTowardsNew>99 then
		    Return
		  end
		  
		  i=(255*(WeightTowardsNew/100))
		  
		  OldPic.Mask.Graphics.UseOldRenderer=true
		  OldPic.Mask.Graphics.ForeColor=rgb(i,i,i)
		  OldPic.Mask.Graphics.FillRect 0,0,OldPic.Width,OldPic.Height
		  
		  NewPic.Graphics.DrawPicture OldPic,0,0,NewPic.Width,NewPic.Height, 0,0,OldPic.Width,OldPic.Height
		  
		  // cleanup
		  OldPic.Mask.Graphics.ForeColor=&c000000
		  OldPic.Mask.Graphics.FillRect 0,0,OldPic.Width,OldPic.Height
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MotionBlur(Pic as picture, XShift as integer, YShift as integer, TwoWay as boolean, CameraJitter as boolean, ExtendEdge as boolean) As Picture
		  // by Tomis Erwin
		  
		  dim g as Graphics
		  dim p,t as Picture
		  dim i,c,n as Integer
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil then
		    Return nil
		  end
		  
		  if XShift=0 and YShift=0 then
		    Return pic
		  end
		  
		  c=max(abs(XShift),abs(YShift))
		  
		  if ExtendEdge then
		    p=NewPicture(pic.width+c+c,pic.Height+c+c,32)
		    g=p.Graphics
		    if g=nil then
		      Return pic
		    end
		    g.DrawPicture pic,c,c
		    n=c
		  Else
		    g=pic.Graphics
		    if g=nil then
		      Return pic
		    end
		    n=0
		  end
		  
		  g.UseOldRenderer=true
		  
		  t=NewPicture(pic.Width,pic.Height,32)
		  t.Graphics.UseOldRenderer=true
		  t.Mask.Graphics.UseOldRenderer=true
		  i=255-(255/(c+1))
		  t.Mask.Graphics.ForeColor=rgb(i,i,i)
		  t.Mask.Graphics.FillRect 0,0,t.Width,t.Height
		  t.Graphics.DrawPicture pic,0,0
		  
		  if CameraJitter then
		    if TwoWay then
		      for i=0 to c
		        g.DrawPicture t, n+ (i/c)*XShift, n+ (i/c)*YShift
		        g.DrawPicture t, n+ (i/c)*-XShift, n+ (i/c)*-YShift
		      next
		    Else
		      for i=0 to c
		        g.DrawPicture t, n+ (i/c)*XShift, n+ (i/c)*YShift
		      next
		    end
		  Else
		    if TwoWay then
		      for i=c DownTo 0
		        g.DrawPicture t, n+ (i/c)*XShift, n+ (i/c)*YShift
		        g.DrawPicture t, n+ (i/c)*-XShift, n+ (i/c)*-YShift
		      next
		    Else
		      for i=c DownTo 0
		        g.DrawPicture t, n+ (i/c)*XShift, n+ (i/c)*YShift
		      next
		    end
		  end
		  
		  if ExtendEdge then
		    Return p
		  Else
		    Return pic
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Noise(pic as picture, NoisePercent as integer, Mode as integer)
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim s as RGBSurface
		  dim x,y,w,n,h as Integer
		  dim pr,m,t as Double
		  dim c as color
		  
		  if pic=nil or NoisePercent=0 then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  if rand=nil then
		    rand=new Random
		  end
		  
		  rand.Seed=pic.Width*pic.Height*NoisePercent
		  
		  pr=NoisePercent/100
		  w=pic.Width-1
		  h=pic.Height-1
		  
		  Select case Mode
		  case 0// B&W 
		    
		    for y=0 to h
		      for x=0 to w
		        if (pr>rand.Number) then
		          n=rand.InRange(0,255)
		          s.Pixel(x,y)=rgb( n,n,n )
		        end
		      next
		    next
		    
		  case 1// Color
		    
		    for y=0 to h
		      for x=0 to w
		        m=rand.number
		        if (pr>m) then
		          c=s.pixel(x,y)
		          m=255*rand.Number
		          s.pixel(x,y)=rgb( rand.inrange(c.red-m,c.red+m), rand.inrange(c.green-m,c.green+m), rand.inrange(c.blue-m,c.blue+m) )
		        end if
		      next
		    next
		    
		  case 2// Brightness
		    for y=0 to h
		      for x=0 to w
		        if (pr>rand.Number) then
		          'm=rand.InRange( NoisePercent,100) /100
		          'n=rand.InRange(0,255)*m
		          't=1-m
		          c=s.Pixel(x,y)
		          n=rand.InRange(-255,255)
		          's.Pixel(x,y)=rgb( (s.Pixel(x,y).red*t)+n,(s.Pixel(x,y).green*t)+n,(s.Pixel(x,y).blue*t)+n )
		          s.Pixel(x,y)=rgb( c.red+n, c.green+n, c.blue+n )
		          
		        end
		      next
		    next
		    
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Normalize(byref pic as picture, OldColor as color, NewColor as color, Mode as integer)
		  // by Tomis Erwin
		  
		  // adjust the color spectrum  so that you can for example; bring a photo with a slight blue tint back to a "normal" color range
		  
		  const kModeDifNewOld = 0
		  const kModeDifOldNew = 1
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i, ar, r(255), ag, g(255), ab, b(255) as Integer
		  dim s as RGBSurface
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  Select case Mode
		  case kModeDifNewOld
		    AR=NewColor.red-OldColor.red
		    AG=NewColor.green-OldColor.green
		    AB=NewColor.blue-OldColor.blue
		  case kModeDifOldNew
		    AR=OldColor.red-NewColor.red
		    AG=OldColor.green-NewColor.green
		    AB=OldColor.blue-NewColor.blue
		  end
		  
		  for i=0 to 255
		    r(i)=max(min(i+AR,255),0)
		    g(i)=max(min(i+AG,255),0)
		    b(i)=max(min(i+AB,255),0)
		  Next
		  
		  s.Transform r,g,b
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Outline(pic as picture, Ammount as integer, Radius as integer, LineResistence as integer, LineColor as color)
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim x,y,w,h as integer
		  dim s,r as RGBSurface
		  dim c,o as Color
		  dim d as Double
		  dim p as Picture
		  
		  if pic=nil or Ammount=0 or Radius=0 Then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  p=Blur(pic,Radius,1)
		  
		  r=p.RGBSurface
		  if r=nil then
		    p=nil
		    Return
		  end
		  
		  h=p.Height-1
		  w=p.Width-1
		  d=Ammount/100
		  
		  for y=0 to h
		    for x=0 to w
		      c=r.Pixel(x,y)
		      o=s.Pixel(x,y)
		      if ( ( (o.red+o.green+o.blue)\3 ) - ( (c.red+c.green+c.blue ) \3 ) ) * d > LineResistence then
		        s.Pixel(x,y)=LineColor  'rgb( o.red+t , o.green+t  , o.blue+t )
		      end
		    next
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OverlayWithMask(pSource as picture, pOverlay as picture, pMask as picture, bColorMask as boolean)
		  // by Tomis Erwin : gostcoder@yahoo.com
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pSource=nil or pOverlay=nil or pMask=nil then
		    Return
		  end
		  
		  dim p as Picture
		  
		  p=NewPicture(pOverlay.Width,pOverlay.Height,24)
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.DrawPicture pOverlay,0,0
		  p.Mask.Graphics.UseOldRenderer=true
		  if bColorMask then
		    p.Mask.Graphics.DrawPicture pMask,0,0
		  Else
		    p.Mask.Graphics.DrawPicture Greyscale(pMask),0,0
		  end
		  
		  pSource.Graphics.UseOldRenderer=true
		  pSource.Graphics.DrawPicture p,0,0,pSource.Width,pSource.Height, 0,0,p.Width,p.Height
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Perspective(pic as picture, TopDouble as double, BottomDouble as double, LeftDouble as double, RightDouble as double, Quality as integer) As Picture
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  dim i,n,w,h as integer
		  dim d as Double
		  dim L,R,B,T as Integer
		  dim g as Graphics
		  
		  if pic=nil or (LeftDouble=1 and RightDouble=1 and TopDouble=1 and BottomDouble=1) or (LeftDouble=0 and RightDouble=0) or (TopDouble=0 and BottomDouble=0) then
		    Return pic
		  end
		  
		  if Quality>0 then
		    pic=Resize(pic,Quality*200)
		  end
		  
		  L=pic.Height*LeftDouble
		  R=pic.Height*RightDouble
		  T=pic.Width*TopDouble
		  B=pic.Width*BottomDouble
		  
		  if LeftDouble<>1 or RightDouble<>1 then
		    p=NewPicture( pic.Width , max( L , R ) , 32 )
		  Else
		    p=NewPicture( max( T , B) , pic.Height , 32 )
		  end
		  
		  if p=nil or p.Width=0 or p.Height=0 then
		    Return pic
		  end
		  
		  p.Graphics.UseOldRenderer=true
		  
		  h=p.Height
		  w=p.Width
		  
		  // do height
		  if LeftDouble<>1 or RightDouble<>1 then
		    for i=w DownTo 0
		      d=i/w
		      n=(L*(1-d))+(R*d)
		      
		      p.Graphics.DrawPicture pic,i, (h-n)*.5, 1,n, i,0,1,pic.Height
		    Next
		    
		    if TopDouble<>1 or BottomDouble<>1 then
		      // we need to use a 2nd draw cache in this instance, so it's simpler to just call the method again with modified values
		      p=Perspective( p, TopDouble, BottomDouble, 1, 1, 0 )
		    end
		    Goto TheEnd
		  end
		  
		  //do width
		  if TopDouble<>1 or BottomDouble<>1 then
		    for i=h DownTo 0
		      d=i/h
		      n=(T*(1-d))+(B*d)
		      
		      p.Graphics.DrawPicture pic,(w-n)*.5,i,n,1, 0,i,pic.Width,1
		    Next
		  end
		  
		  TheEnd:
		  if Quality>0 then
		    Return Resize( p, 100/(Quality*2) )
		  Else
		    Return p
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pixelize(Pic as picture, Level as double)
		  // by Tomis Erwin
		  
		  dim p as Picture
		  dim w,h as Integer
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if Level<=0 or Pic=nil then
		    Return
		  end
		  
		  w=round(pic.Width/Level)
		  h=round(pic.Height/Level)
		  
		  p=NewPicture(w,h,32)
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.DrawPicture pic, 0,0,w,h, 0,0,pic.Width,pic.Height
		  
		  pic.Graphics.UseOldRenderer=true
		  pic.Graphics.DrawPicture p, 0,0,pic.Width, pic.Height, 0,0,w,h
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Range(pic as picture, Minimum as integer, Maximum as integer, Change as integer)
		  // by Tomis Erwin
		  
		  // adjust the brighntess of the pixels within the given luminosity range
		  
		  dim c as Color
		  dim a,x,y,w,mi,ma,h as Integer
		  dim s as RGBSurface
		  dim d as Double
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil or Change=0 then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  mi=Minimum-1
		  ma=Maximum+1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      
		      c=s.Pixel(x,y)
		      a=( c.red + c.green + c.blue ) \ 3
		      
		      if a>mi and a<ma then
		        s.Pixel(x,y)=rgb( min( max( c.red+Change , 0 ) , 255 ) , min( max( c.green+Change , 0 ) , 255 ) , min( max( c.blue+Change , 0 ) , 255 ) )
		      end
		      
		    next
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadWriteDemo(pic as picture, iMode as integer)
		  // by Tomis Erwin
		  
		  // speed test to see what the overhead for various operations is
		  
		  const kModeRead = 0
		  const kModeWrite = 1
		  const kModeCopy = 2
		  const kModeProcess = 3
		  
		  dim s as RGBSurface
		  dim x,y,w,h as Integer
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  
		  Select case iMode
		  case kModeRead
		    
		    for y=0 to h
		      for x=0 to w
		        call s.Pixel(x,y)
		      next
		    next
		    
		  case kModeWrite
		    
		    for y=0 to h
		      for x=0 to w
		        s.Pixel(x,y)=&c000000
		      next
		    next
		    
		  case kModeCopy
		    
		    for y=0 to h
		      for x=0 to w
		        s.Pixel(x,y)=s.Pixel(x,y)
		      next
		    next
		    
		  case kModeProcess
		    
		    for y=0 to h
		      for x=0 to w
		        s.Pixel(x,y)=rgb( (s.Pixel(x,y).red+s.Pixel(x,y).red)\2, (s.Pixel(x,y).green+s.Pixel(x,y).green)\2, (s.Pixel(x,y).blue+s.Pixel(x,y).blue)\2 )
		      next
		    next
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReduceBits(pic as picture, DepthMode as integer)
		  // by Tomis Erwin
		  // convert the image into a lower bit depth and draw it back to it's self
		  
		  // the purpose is not to alter the actual depth of the source image, 
		  // but to change its perceived depth
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  dim i as Integer
		  
		  if pic=nil then
		    Return
		  end
		  
		  Select case DepthMode
		  case 0
		    i=1
		  case 1
		    i=2
		  case 2
		    i=4
		  case 3
		    i=8
		  case 4
		    i=16
		  case 5
		    i=24
		  end
		  
		  p=NewPicture( pic.Width, pic.Height, i )
		  p.Graphics.UseOldRenderer=True
		  p.Graphics.DrawPicture pic,0,0
		  pic.Graphics.UseOldRenderer=true
		  pic.Graphics.DrawPicture p,0,0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReduceColors(byref map() as integer, Level as integer)
		  // by Tomis Erwin
		  
		  // reduce the overal color variations in the spectrum by a given ammount
		  
		  // Level defines how many steps there are between colors
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i as Integer
		  
		  if Level<2 then
		    Return
		  end
		  
		  for i=0 to 255
		    
		    map(i) = (map(i)\level)*level // faster
		    
		    'map.Append round(map(i)/level)*level // causes some weird inversion stuff and is slower
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReduceColors(pic as picture, Level as integer, MaintainBrightness as boolean)
		  // by Tomis Erwin
		  
		  // reduce the overal color variations in the spectrum by a given ammount
		  
		  // Level defines how many steps there are between colors
		  // MaintainBrightness attempts to maintain the perceived overall brightness of the image
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i,map(255),Brit as Integer
		  dim s as RGBSurface
		  
		  if pic=nil or Level=0 then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  if MaintainBrightness then
		    Brit=ceil(Level/2)
		    for i=0 to 255
		      // round to the nearest value based on level
		      map(i)=min( ( (i\Level)*Level ) + Brit , 255 )
		    Next
		  Else
		    for i=0 to 255
		      // round to the nearest value based on level
		      map(i)=( (i\Level)*Level )
		    Next
		  end
		  s.Transform map
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Reflect(pic as picture, Percent as double, ScalePercent as double, Spacing as integer, FadeColor as color, BlurBy as integer, NoFade as boolean) As Picture
		  // by Tomis Erwin
		  
		  // does a slick reflection of the image acrosss the horizontal axis
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p,t as Picture
		  dim h,y,i as Integer
		  dim d as Double
		  
		  if pic=nil or Percent<=0 then
		    Return pic
		  end
		  
		  h=pic.Height+Spacing
		  p=NewPicture(pic.Width,h+(pic.Height*Percent/100),32)
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.DrawPicture pic,0,0
		  p.Graphics.ForeColor=FadeColor
		  p.Graphics.FillRect 0,pic.Height,p.Width,Spacing
		  
		  t=NewPicture( pic.Width, pic.Height, 32 )
		  t.Graphics.UseOldRenderer=true
		  t.Graphics.DrawPicture pic,0,0
		  
		  Flip(t,0,1)
		  
		  p.Graphics.DrawPicture t,0,h,p.Width,max( (p.Height-h) , t.Height*(ScalePercent/100) ), 0,0,t.Width,t.Height
		  
		  if BlurBy>0 then
		    // optimize blur by scaling the image before feeding it through the blur
		    
		    t=NewPicture(p.Width,(p.Height-pic.Height)+1,32)
		    t.Graphics.UseOldRenderer=true
		    t.Graphics.DrawPicture p,0,-(pic.Height-1)
		    
		    p.Graphics.DrawPicture Blur(t,BlurBy,1,1,False),0,pic.Height-1
		  end
		  
		  // do fade
		  if NoFade=False then
		    t=NewPicture(p.Width, (p.Height-pic.Height)-Spacing, 32 )
		    if t=nil or t.Graphics=nil then
		      Return p
		    end
		    t.Graphics.UseOldRenderer=true
		    t.Graphics.ForeColor=FadeColor
		    t.Graphics.FillRect 0,0,t.Width,t.Height
		    t.Mask.Graphics.UseOldRenderer=true
		    for y=0 to t.Height
		      i=255*(1-(y/t.Height))
		      t.Mask.Graphics.ForeColor=rgb(i,i,i)
		      t.Mask.Graphics.DrawLine 0,y,t.Width,y
		    Next
		    
		    p.Graphics.DrawPicture t,0,h
		  end
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceColor(pic as picture, OldColor as color, NewColor as color, WithinRange as integer, BlurBy as integer)
		  // by Tomis Erwin
		  
		  // replace every occurence of a given color (and similar colors with a range) with a new color
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim c as Color
		  dim p as Picture
		  dim x,y,w,h as Integer
		  dim rMin,rMax,gMin,gMax,bMin,bMax as Integer
		  dim s,r as RGBSurface
		  dim b as Boolean
		  if pic=nil or OldColor=NewColor or WithinRange=0 then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  
		  rMin=OldColor.red-WithinRange
		  rMax=OldColor.red+WithinRange
		  gMin=OldColor.green-WithinRange
		  gMax=OldColor.green+WithinRange
		  bMin=OldColor.blue-WithinRange
		  bMax=OldColor.blue+WithinRange
		  
		  if BlurBy=0 then
		    
		    for y=0 to h
		      for x=0 to w
		        c=s.Pixel(x,y)
		        If c.red>rMin and c.red<rMax and c.green>gMin and c.green<gMax and c.blue>bMin and c.blue<bMax then
		          s.Pixel(x,y)=NewColor
		        end
		      next
		    next
		    
		  Else
		    
		    p=NewPicture(pic.width,pic.Height,32)
		    p.Mask.Graphics.UseOldRenderer=true
		    p.Graphics.UseOldRenderer=true
		    r=p.RGBSurface
		    
		    for y=0 to h
		      for x=0 to w
		        c=s.Pixel(x,y)
		        if c.red>rMin and c.red<rMax and c.green>gMin and c.green<gMax and c.blue>bMin and c.blue<bMax then
		          r.Pixel(x,y)=&c000000
		          b=true
		        end
		      next
		    next
		    
		    if b then
		      p.Mask.Graphics.DrawPicture Blur(p,BlurBy,1,1,false),0,0
		      p.Graphics.ForeColor=NewColor
		      p.Graphics.FillRect 0,0,p.Width,p.Height
		      pic.Graphics.UseOldRenderer=true
		      pic.Graphics.DrawPicture p,0,0
		    end
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resize(pic as picture, percent as double) As Picture
		  // by Tomis Erwin
		  // wrapper to make it easier
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return Resize(pic, percent, kResizeTypeNormal )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resize(Pic as picture, Percent as double, Type as integer) As Picture
		  // by Tomis Erwin
		  
		  // change the dimensions of the image
		  
		  // kResizeTypeNormal
		  // kResizeTypePixel
		  // kResizeTypeRows
		  // kResizeTypeSmooth
		  
		  dim by,w,h,xs,ys as Double
		  dim x,y as Integer
		  dim p,t as Picture
		  dim s,r as RGBSurface
		  dim xx(),yy as Integer
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil or Percent=100 then
		    Return pic
		  end
		  
		  by=Percent/100
		  w=pic.Width*by
		  h=pic.Height*by
		  
		  if w=0 or h=0 then
		    Return pic
		  end
		  
		  if type=kResizeTypeSmooth then
		    if pic.Depth=32 then
		      Return ScalePicture( pic, w, h )
		    Else
		      p=NewPicture(pic.Width,pic.Height,32)
		      p.Graphics.UseOldRenderer=true
		      p.Graphics.DrawPicture pic,0,0
		      Return ScalePicture( p, w, h )
		    end
		  Elseif Type=kResizeTypeFastest then
		    if by<.11 then
		      Type=kResizeTypePixel
		    Elseif by<.50 then
		      Type=kResizeTypeRows
		    Else
		      Type=kResizeTypeNormal
		    end
		  end
		  
		  p=NewPicture(w,h,32)
		  if p=nil then
		    Return pic
		  end
		  p.Graphics.UseOldRenderer=true
		  
		  if Type=kResizeTypeRows then
		    // skip some lines when reducing the image
		    'xs=pic.Width/p.Width
		    ys=pic.Height/p.Height
		    
		    // faster
		    x=pic.Width
		    for y=0 to h
		      p.Graphics.DrawPicture pic,0,y,w,1, 0,y*ys,x,1
		    Next
		    
		  elseif Type=kResizeTypePixel then
		    r=pic.RGBSurface
		    xs=pic.Width/p.Width
		    ys=pic.Height/p.Height
		    
		    s=p.RGBSurface
		    w=p.Width-1
		    h=p.Height-1
		    
		    Redim xx(w)
		    for x=0 to w
		      xx(x)=x*xs
		    next
		    
		    for y=0 to h
		      yy=y*ys
		      for x=0 to w
		        's.Pixel(x,y)=r.Pixel(x*xs,y*ys)
		        s.Pixel(x,y)=r.Pixel(xx(x),yy)
		      Next
		    Next
		    
		    
		  Else
		    p.Graphics.DrawPicture pic,0,0,p.Width,p.Height, 0,0,pic.Width, pic.Height
		  end
		  
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resize(pic as picture, NewWidth as integer, NewHeight as integer, Mode as integer) As Picture
		  // by Tomis Erwin
		  
		  // kResizeModeByPercent
		  // kResizeModeByPixel
		  // kResizeModeRestrictToPercent
		  // kResizeModeRestrictToPixel
		  
		  dim p as Picture
		  dim w,h as Integer
		  dim d as Double
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  
		  if pic=nil then
		    Return pic
		  end
		  
		  Select case Mode
		  case kResizeModeByPixel
		    w=NewWidth
		    h=NewHeight
		  case kResizeModeByPercent
		    w=pic.Width*(NewWidth/100)
		    h=pic.Height*(NewHeight/100)
		  case kResizeModeRestrictToPixel
		    w=pic.Width
		    h=pic.Height
		    
		    While w>NewWidth or h>newHeight
		      if w>NewWidth then
		        d=(NewWidth/w)
		      ElseIf h>NewHeight then
		        d=(NewHeight/h)
		      end
		      
		      w=w*d
		      h=h*d
		    Wend
		  case kResizeModeRestrictToPercent
		    beep
		    MsgBox "kResizeModeRestrictToPercent not implemented."
		    Return nil
		  end
		  
		  
		  if w=0 and h=0 then
		    Return pic
		  end
		  
		  p=NewPicture(w,h,32)
		  if p=nil then
		    Return pic
		  end
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.DrawPicture pic,0,0,p.Width,p.Height, 0,0,pic.Width, pic.Height
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RGB(pic as picture, Style as integer, RedBy as integer, GreenBy as integer, BlueBy as integer)
		  // by Tomis Erwin
		  
		  // adjust the Red Green & Blue spectrums of the image
		  
		  const kStyleNormal = 0
		  const kStyleInvert = 1
		  const kStyleAcid = 2
		  
		  dim s as RGBSurface
		  dim i,rMap(255),gMap(255),bMap(255),c as Integer
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  // Pre-Flight check
		  
		  if (RedBy=0 and GreenBy=0 and BlueBy=0) or pic=nil Then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  // Let's boogie!
		  
		  Select case Style
		  case kStyleNormal
		    for i=0 to 255
		      rMap(i) = max( min( i+RedBy , 255 ) , 0 )
		      gMap(i) = max( min( i+GreenBy , 255 ) , 0 )
		      bMap(i) = max( min( i+BlueBy , 255 ) , 0 )
		    next
		  case kStyleInvert
		    for i=0 to 255
		      rMap(i) = min( abs( i+RedBy ) , 255 )
		      gMap(i) = min( abs( i+GreenBy ) , 255 )
		      bMap(i) = min( abs( i+BlueBy ) , 255 )
		    next
		  case kStyleAcid
		    for i=0 to 255
		      rMap(i) = abs( i+RedBy )
		      gMap(i) = abs( i+GreenBy )
		      bMap(i) = abs( i+BlueBy )
		    next
		  end
		  
		  s.Transform rMap,gMap,bMap
		  
		  // Wow, that was fast!
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rotate(pic as picture, RotateDegrees as double, BackgroundColor as color) As Picture
		  // by Tomis Erwin
		  // this a wrapper around Rotate() to lessen the needed parameters
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return Rotate( pic, RotateDegrees, BackgroundColor, kRotateModeSmooth )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rotate(pic as picture, RotateDegrees as double, BackgroundColor as color, Mode as integer) As Picture
		  // by Tomis Erwin
		  // with code by "Freakintosh" from www.DigitalCalamity.org
		  
		  // Note that this code includes optimizations for 90,180,270,360 degree rotations
		  // Other rotations will be noticably slower
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  // Note: kModeSmooth is actually done by doubling the image size, doing the rotate, and then halving the result
		  //          this takes advantage of the automatic anti-aliasing we receive when reducing pictures
		  
		  const kDegToRad = 57.29578
		  'const kDegToRadMult = 0.0174532925
		  
		  dim c as Color
		  dim w,h,x,y,n as Integer
		  dim p,p2 as Picture
		  dim obj as Object2D
		  dim s,r as RGBSurface
		  
		  dim w2,h2,w3,h3 as integer
		  dim a,t,d,tx,ty,i, RadianAngle, sn, csn,tySin,tyCos as double
		  dim lastx,lasty,outX,outY as Integer
		  dim xCache(),yCache() as Double
		  dim b as Boolean
		  
		  if pic=nil Then
		    Return nil
		  end
		  
		  if RotateDegrees<0 then
		    RotateDegrees=RotateDegrees+360
		  end
		  
		  if RotateDegrees=0 or RotateDegrees=360 then
		    Return pic
		  end
		  
		  if RotateDegrees=90 or RotateDegrees=270 then
		    w=pic.Height
		    h=pic.Width
		  elseif RotateDegrees=180 then
		    p=NewPicture( pic.Width, pic.Height, 32 )
		    p.Graphics.UseOldRenderer=true
		    p.Graphics.DrawPicture pic,0,0
		    flip(p,1,1)
		    Return p
		  else
		    if Mode=kRotateModeSmooth then
		      p=NewPicture(pic.Width*2,pic.Height*2,32)
		      p.Graphics.UseOldRenderer=true
		      p.Graphics.DrawPicture pic,0,0,p.Width,p.Height, 0,0,pic.Width,pic.Height
		      pic=p
		      p=nil
		    end
		    
		    RadianAngle=RotateDegrees / kDegToRad
		    
		    // BOUNDS CALCULATION
		    
		    // minor edits by tomis, more optimization could probably be done here
		    
		    // Bounds calculation taken from PicTransform v1.0
		    // 25 January, 2005
		    // Freakintosh@DigitalCalamity.org
		    // www.DigitalCalamity.org
		    
		    w2=pic.width\2
		    h2=pic.height\2
		    if pic.width=1 then
		      w=abs( sin(RadianAngle)*pic.height )
		      h=abs( cos(RadianAngle)*pic.height )
		    elseif pic.height=1 then
		      w=abs( cos(RadianAngle)*pic.width )
		      h=abs( sin(RadianAngle)*pic.width )
		    else
		      d=sqrt((w2*w2)+(h2*h2))
		      t=atan(h2/w2)
		      tx=abs(sin(RadianAngle+t))
		      ty=abs(sin(t-RadianAngle))
		      if ty>tx then
		        h=2*ty*d+2
		      else
		        h=2*tx*d+2
		      end if
		      tx=abs(cos(RadianAngle+t))
		      ty=abs(cos(t-RadianAngle))
		      if ty>tx then
		        w=2*ty*d+2
		      else
		        w=2*tx*d+2
		      end if
		      
		      // END BOUNDS CALCULATION
		      
		    end if
		    
		  end
		  
		  p = NewPicture( w, h , 32 )
		  if p=nil then
		    Return nil
		  end
		  
		  r=pic.RGBSurface
		  s=p.RGBSurface
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  
		  Select case RotateDegrees
		  case 90
		    for y=0 to h
		      i=h-y
		      for x=0 to w
		        s.Pixel(i,x)=r.Pixel(x,y)
		      next
		    next
		  case 270
		    for x=0 to w
		      i=w-x
		      for y=0 to h
		        s.Pixel(y,i)=r.Pixel(x,y)
		      next
		    next
		    
		  Else
		    p.Graphics.UseOldRenderer=true
		    
		    if Mode=kRotateModeRB then
		      // the Object2D class supports anti-aliased rotation, though it is slow
		      obj = new PixmapShape( pic )
		      obj.Rotation = RadianAngle
		      if BackgroundColor<>&cFFFFFF then
		        p.Graphics.ForeColor=BackgroundColor
		        p.Graphics.FillRect 0,0,p.Width,p.Height
		      end
		      p.Graphics.DrawObject obj,(p.width\2),(p.height\2)
		      Return p
		    Else
		      RadianAngle=(360-RotateDegrees) / kDegToRad
		      
		      w2=pic.Width/2
		      h2=pic.Height/2
		      w3=p.width/2
		      h3=p.height/2
		      if mode=kRotateModeJaggy or mode=kRotateModeSmooth then
		        // writen by Tomis
		        // this code renders the result by looping through the source image
		        // this makes it much faster than kModeJaggySlow
		        
		        // also, because of the way it calculate pixel coordinates you could do anti-aliasing, though 
		        // this is not implemented due to the speed decrease it would cause
		        
		        // the core calculation goes like this
		        // X' =  X * Cos(angle) + Y * Sin(angle)
		        // Y' = -X * Sin(angle) + Y * Cos(angle)
		        
		        // that code will rotate the image around point (0,0)
		        // we do additional work to adjust for calculating around the image's center instead
		        
		        // apply the background color
		        if BackgroundColor<>&cFFFFFF then
		          p.Graphics.ForeColor=BackgroundColor
		          p.Graphics.FillRect 0,0,p.Width,p.Height
		        end
		        
		        // cache values for speed
		        sn=sin(RadianAngle)
		        csn=cos(RadianAngle)
		        
		        'redim txSnCache(w)
		        'redim txCsnCache(w)
		        'for x=0 to w
		        'txSnCache(x)=(x-w2)*sn
		        'txCsnCache(x)=(x-w2)*csn
		        'next
		        
		        for y=0 to h
		          // its good to move as much stuff out of loops as we can, for speed
		          tySin=(y-h2)*sn +w3
		          tyCos=(y-h2)*csn +h3
		          for x=0 to w
		            tx=x-w2
		            outY= tyCos - tx*sn
		            outX= tx*csn + tySin
		            
		            c=r.pixel(x,y)
		            s.pixel( outX , outY ) = c// set the main pixel
		            s.pixel( outX , outY+1 ) = c// set the second pixel to avoid "holes"
		          next
		        Next
		        
		        if mode=kRotateModeSmooth then
		          p2=NewPicture(p.Width\2,p.Height\2,32)
		          p2.Graphics.UseOldRenderer=true
		          p2.Graphics.DrawPicture p,0,0,p2.Width,p2.Height, 0,0,p.Width,p.Height
		          p=nil
		          Return p2
		        end
		      elseif mode= kRotateModeJaggy2 then
		        // based on code by Freakintosh
		        // this code renders the result by looping through the resultant image
		        
		        // this method is much slower than kModeJaggy for several reasons
		        //   * loops through the resultant instead of the source (more pixels to process)
		        //   * a number of expensive math operations (sqrt,pow,atan2,cos,sin)
		        
		        // originally this routine contained code to support background colors
		        // but this has been removed due to the extreme performance reduction it caused
		        
		        w=p.width-1
		        h=p.height-1
		        
		        redim xCache(w)
		        for x=0 to w
		          tx=x-w3
		          xCache(x)=pow(tx,2)
		        Next
		        
		        for y=0 to h
		          ty=h3-y
		          tyCos=pow(ty,2)
		          for x=0 to w
		            'tx=x-w3
		            'd=sqrt(pow(tx,2)+pow(ty,2))
		            'a=atan2(ty,tx)-RadianAngle
		            
		            d=sqrt(xCache(x)+tyCos)
		            a=atan2(ty,x-w3)-RadianAngle
		            s.pixel(x,y)=r.pixel(cos(a)*d+w2,h2-sin(a)*d)
		          next
		          'exit
		        next
		        
		        
		      end
		    end
		    
		  end
		  
		  
		  TheEnd:
		  Return p
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Saturation(Pic as picture, Ammount as integer)
		  // by Tomis Erwin
		  // Saturation( pPicture, -100 ) -- make the image Greyscale
		  // Saturation( pPicture, 100 ) -- increase the saturation by 100%
		  
		  dim c as color
		  dim d as Double
		  dim a,x,y,w,h,m() as Integer
		  dim s as RGBSurface
		  dim p as Picture
		  
		  dim ir,ig,ib as Integer
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil or Ammount=0 then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  if Ammount=-100 then
		    Greyscale(pic)
		    Return
		  end
		  
		  d=Ammount/100
		  w=pic.Width-1
		  h=pic.Height-1
		  
		  Redim m(510)
		  for x=0 to 510
		    m(x)=(x-255)*d
		  Next
		  
		  for y=0 to h
		    for x=0 to w
		      c=s.Pixel(x,y)
		      ir=c.red
		      ig=c.green
		      ib=c.blue
		      a=( ir + ig + ib ) \ 3
		      s.Pixel(x,y)=rgb( ir+m(ir-a+255) , ig+m(ig-a+255) , ib+m(ib-a+255) )
		    next
		  next
		  
		  'end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScalePicture(p as Picture, newWidth as integer, newHeight as Integer) As Picture
		  // based on code from Dr. Gerard Hammond
		  
		  // with performance/functional improvements by Tomis Erwin
		  
		  #if DebugBuild=False then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim pIn,pOut as Picture
		  Dim s As RGBSurface
		  Dim o As RGBSurface
		  Dim x,y,xMax, yMax As Integer
		  dim xx() as Double
		  Dim c1, c2, c3, c4, c5 As Color
		  dim xMult,yMult, a,b, xSub,ySub, xAdd,yAdd as Double
		  
		  if p=nil then
		    Return p
		  end
		  
		  s=p.RGBSurface
		  if s=nil then
		    Return nil
		  end
		  
		  pOut=NewPicture( newWidth, newHeight, 32 )
		  if pOut=nil then
		    Return nil
		  end
		  
		  o=pOut.RGBSurface
		  if o=nil Then
		    Return nil
		  end
		  
		  xMax = pOut.Width - 1
		  yMax = pOut.Height - 1
		  
		  yMult=p.Height/newHeight
		  xMult=p.Width/newWidth
		  
		  a=newWidth/p.Width
		  if a>.5 then
		    xSub=.45
		    xAdd=.5
		  Elseif a<.5 then
		    xSub=.75
		    xAdd=2
		  else
		    xSub=0
		    xAdd=1
		  end
		  
		  a=newHeight/p.Height
		  if a>.5 then
		    ySub=.45
		    yAdd=.5
		  Elseif a<.5 then
		    ySub=.75
		    yAdd=2
		  else
		    ySub=0
		    yAdd=1
		  end
		  
		  redim xx(xMax)
		  for x=0 to xMax
		    xx(x)=(x * xMult)- xSub
		  next
		  
		  For y = 0 To yMax
		    b = (y * yMult)- ySub
		    For x = 0 To xMax
		      a = xx(x)
		      c1 = s.Pixel(a       , b  )
		      c2 = s.Pixel(a + xAdd , b )
		      c3 = s.Pixel(a       , b + yAdd)
		      c4 = s.Pixel(a + xAdd , b + yAdd)
		      
		      o.Pixel(x, y) = RGB( _
		      (c1.Red + c2.Red + c3.Red + c4.Red) \ 4, _
		      (c1.Green + c2.Green + c3.Green + c4.Green) \ 4, _
		      (c1.Blue + c2.Blue + c3.Blue + c4.Blue) \ 4 _
		      )
		      
		    Next
		  Next
		  
		  
		  Return pOut
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScalePictureHalf(p as picture) As Picture
		  // original code from Dr. Gerard Hammond
		  // Note it is designed ONLY to do 50% scaling 
		  
		  // Tomis: Added Nil protection, slight modifications to fit the method inputs
		  
		  #if DebugBuild=False then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim pOut as Picture
		  Dim s As RGBSurface
		  Dim o As RGBSurface
		  Dim x, y, xMax, yMax, a, b As Integer
		  Dim c1, c2, c3, c4 As Color
		  dim xMult, yMult as Double
		  
		  if p=nil then
		    Return p
		  end
		  
		  s=p.RGBSurface
		  if s=nil then
		    Return nil
		  end
		  
		  pOut=NewPicture( p.Width\2, p.Height\2, 32 )
		  if pOut=nil then
		    Return nil
		  end
		  
		  o=pOut.RGBSurface
		  if o=nil Then
		    Return nil
		  end
		  
		  xMax = pOut.Width - 1
		  yMax = pOut.Height - 1
		  
		  For y = 0 To yMax
		    b = (y * 2)
		    For x = 0 To xMax
		      a = (x * 2)
		      c1 = s.Pixel(a, b)
		      c2 = s.Pixel(a + 1, b)
		      c3 = s.Pixel(a, b + 1)
		      c4 = s.Pixel(a + 1, b + 1)
		      o.Pixel(x, y) = RGB( _
		      (c1.Red + c2.Red + c3.Red + c4.Red) \ 4, _
		      (c1.Green + c2.Green + c3.Green + c4.Green) \ 4, _
		      (c1.Blue + c2.Blue + c3.Blue + c4.Blue) \ 4 _
		      )
		    Next
		  Next
		  
		  Return pOut
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Scatter(Pic as picture, MixColors as boolean, Horiz as integer, Vert as integer)
		  // by Tomis Erwin
		  
		  // scatter pixels across the horizontal and vertical axis
		  
		  dim s as RGBSurface
		  dim x,y,w,h,i,t,n as Integer
		  dim c as Color
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  if rand=nil then
		    rand=new Random
		  end
		  rand.Seed=pic.Width*pic.Height
		  
		  if Horiz>0 then
		    w=pic.Width/2
		    i=(pic.Height*w)*(Horiz/100)
		    if MixColors then
		      for t=0 to i
		        x=rand.Number*w
		        y=rand.Number*pic.Height
		        
		        n=pic.Width-x
		        c=rgb( (s.Pixel(n,y).red+s.Pixel(x,y).red) \ 2, (s.Pixel(n,y).green+s.Pixel(x,y).green) \ 2, (s.Pixel(n,y).blue+s.Pixel(x,y).blue) \ 2 )
		        
		        s.Pixel(x,y)=c
		        s.Pixel(n,y)=c
		        
		      next
		    else
		      for t=0 to i
		        x=rand.Number*w
		        y=rand.Number*pic.Height
		        
		        c=s.Pixel(x,y)
		        s.Pixel(x,y)=s.Pixel(pic.Width-x,y)
		        s.Pixel(pic.Width-x,y)=c
		      next
		    end
		  end
		  
		  if Vert>0 then
		    h=pic.Height/2
		    i=(pic.WIdth*h)*(Vert/100)
		    if MixColors then
		      for t=0 to i
		        x=rand.Number*pic.Width
		        y=rand.Number*h
		        
		        n=pic.Width-y
		        c=rgb( (s.Pixel(x,n).red+s.Pixel(x,y).red) \ 2, (s.Pixel(x,n).green+s.Pixel(x,y).green) \ 2, (s.Pixel(x,n).blue+s.Pixel(x,y).blue) \ 2 )
		        
		        s.Pixel(x,y)=c
		        s.Pixel(x,n)=c
		      next
		    else
		      for t=0 to i
		        x=rand.Number*pic.Width
		        y=rand.Number*h
		        
		        c=s.Pixel(x,y)
		        s.Pixel(x,y)=s.Pixel(x,pic.height-y)
		        s.Pixel(x,pic.height-y)=c
		      next
		    end
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Shadow(Pic as picture, BlurBy as integer, Horizontal as double, Verticle as double, TheBrightness as integer, TheContrast as integer, TheColor as color) As Picture
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p,t as Picture
		  dim i,h,v,h2,v2,iHorz,iVert as Integer
		  
		  if pic=nil then
		    Return pic
		  end
		  
		  iHorz=pic.Width*(Horizontal/100)
		  iVert=pic.Height*(Verticle/100)
		  
		  // render the new shadow
		  if BlurBy>0 then
		    t=blur(pic.Mask,BlurBy,kBlurModeFast,kBlurStyleParallel,False,true)
		  Else
		    t=CopyPicture(pic.Mask)
		  end
		  if t=nil then
		    Return pic
		  end
		  Brightness(t,TheBrightness)
		  Contrast(t,TheContrast,127)
		  
		  i=BlurBy * kBlurEdgeMult
		  
		  // create the new output image
		  p=NewPicture( pic.Width+i+i+abs(iHorz),pic.Height+i+i+abs(iVert),32)
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.ForeColor=TheColor//determine's the shadow color
		  p.Graphics.FillRect 0,0,p.Width,p.Height
		  if Horizontal<0 then
		    h=-iHorz
		  end
		  if Verticle<0 then
		    v=-iVert
		  end
		  p.Graphics.DrawPicture pic,i+h,i+v
		  
		  
		  p.Mask.Graphics.UseOldRenderer=true
		  p.Mask.Graphics.ForeColor=&cFFFFFF
		  p.Mask.Graphics.FillRect 0,0,p.Width,p.Height
		  if iHorz>0 then
		    h2=iHorz
		  end
		  if iVert>0 then
		    v2=iVert
		  end
		  p.Mask.Graphics.DrawPicture t,h2,v2
		  
		  'p.Mask.Graphics.ForeColor=&c000000
		  'p.Mask.Graphics.DrawRect 0,0,p.Width,p.Height
		  
		  // original image mask overlay
		  t=NewPicture(pic.Mask.Width,pic.Mask.Height,32)
		  if t=nil then
		    Return pic
		  end
		  t.Mask.Graphics.UseOldRenderer=true
		  t.Mask.Graphics.DrawPicture pic.Mask,0,0
		  t.Graphics.UseOldRenderer=true
		  t.Graphics.ForeColor=&c000000
		  t.Graphics.FillRect 0,0,t.Width,t.Height
		  
		  p.Mask.Graphics.DrawPicture t,i+h,i+v
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sharpen(Pic as picture, Ammount as double, Radius as double)
		  // by Tomis Erwin
		  
		  // kSharpenModeSelf
		  // kSharpenModeBlur
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim x,y,w,h,t,m() as integer
		  dim s,r as RGBSurface
		  dim c,o as Color
		  dim d as Double
		  dim p as Picture
		  
		  dim ir,ig,ib as Integer
		  
		  if pic=nil or Ammount=0 then
		    Return
		  end
		  
		  if Radius<1 then
		    Radius=1
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  p=Blur(pic,Radius,kBlurModeFast)
		  
		  r=p.RGBSurface
		  if r=nil then
		    p=nil
		    Return
		  end
		  
		  h=p.Height-1
		  w=p.Width-1
		  d=Ammount/100
		  
		  Redim m(510)
		  for x=0 to 510
		    m(x)=((x-255)*d)
		  next
		  
		  for y=0 to h
		    for x=0 to w
		      c=r.Pixel(x,y)
		      o=s.Pixel(x,y)
		      ir=o.red
		      ig=o.green
		      ib=o.blue
		      t=m( ( (ir+ig+ib)\3 - (c.red+c.green+c.blue)\3 ) + 255 )
		      s.Pixel(x,y)=rgb( ir+t , ig+t  , ib+t )
		    next
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SharpenToSelf(Pic as picture, Ammount as double, Radius as double)
		  // by Tomis Erwin : gostcoder@yahoo.com
		  
		  dim c as Color
		  dim c1,c2,c3,c4 as Color
		  dim p as picture
		  dim x,y, xA,xS,yA,yS, t ,w,h, z, xAA(),xSS(),yAA(),ySS() as integer
		  dim s,r as RGBSurface
		  dim d as Double
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil or Ammount=0 or Radius=0 then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  p=NewPicture(pic.width,pic.Height,32)
		  if p=nil then
		    Return
		  end
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.DrawPicture pic,0,0
		  
		  r=p.RGBSurface
		  if r=nil Then
		    Return
		  end
		  
		  d=Ammount/100 // this smoothes out the range, so we can get more exact
		  
		  w=pic.width-1
		  h=pic.Height-1
		  
		  // *** EDGES ***
		  
		  Redim xAA(w)
		  Redim xSS(w)
		  for x=0 to w
		    xAA(x)=Within(x+Radius,w)
		    xSS(x)=Within(x-Radius,w)
		  Next
		  
		  Redim yAA(h)
		  Redim ySS(h)
		  for y=0 to h
		    yAA(y)=Within(y+Radius,h)
		    ySS(y)=Within(y-Radius,h)
		  Next
		  
		  // top
		  for y=0 to Radius
		    yA=yAA(y)
		    yS=ySS(y)
		    for x=0 to w
		      xA=xAA(x)
		      xS=xSS(x)
		      c=r.Pixel(x,y)
		      c1=r.Pixel(xS,y)
		      c2=r.Pixel(xA,y)
		      c3=r.Pixel(x,yS)
		      c4=r.Pixel(x,yA)
		      't= ( ((c.red+c.green+c.blue)\3) - (( c1.red+c2.red+c3.red+c4.red + c1.green+c2.green+c3.green+c4.green + c1.blue+c2.blue+c3.blue+c4.blue)\12) )*d
		      t= ( ((c.red+c.green+c.blue)\3) - ((c1.red+c1.green+c1.blue + c2.red+c2.green+c2.blue + c3.red+c3.green+c3.blue + c4.red+c4.green+c4.blue)\12) )*d
		      if t<>0 then // difference of zero means there's no difference!
		        s.pixel( x , y ) = rgb( c.red+t , c.green+t, c.blue+t )
		        'Else
		        's.Pixel(x,y)=c
		      end
		    next
		  next
		  //bottom
		  for y=pic.Height-Radius to h
		    yA=yAA(y)
		    yS=ySS(y)
		    for x=0 to w
		      xA=xAA(x)
		      xS=xSS(x)
		      c=r.Pixel(x,y)
		      c1=r.Pixel(xS,y)
		      c2=r.Pixel(xA,y)
		      c3=r.Pixel(x,yS)
		      c4=r.Pixel(x,yA)
		      't= ( ((c.red+c.green+c.blue)\3) - (( c1.red+c2.red+c3.red+c4.red + c1.green+c2.green+c3.green+c4.green + c1.blue+c2.blue+c3.blue+c4.blue)\12) )*d
		      t= ( ((c.red+c.green+c.blue)\3) - ((c1.red+c1.green+c1.blue + c2.red+c2.green+c2.blue + c3.red+c3.green+c3.blue + c4.red+c4.green+c4.blue)\12) )*d
		      if t<>0 then // difference of zero means there's no difference!
		        s.pixel( x , y ) = rgb( c.red+t , c.green+t, c.blue+t )
		        'Else
		        's.Pixel(x,y)=c
		      end
		    next
		  next
		  //left
		  z=pic.Height-Radius
		  for y=Radius to z
		    yA=yAA(y)
		    yS=ySS(y)
		    for x=0 to Radius
		      xA=xAA(x)
		      xS=xSS(x)
		      c=r.Pixel(x,y)
		      c1=r.Pixel(xS,y)
		      c2=r.Pixel(xA,y)
		      c3=r.Pixel(x,yS)
		      c4=r.Pixel(x,yA)
		      't= ( ((c.red+c.green+c.blue)\3) - (( c1.red+c2.red+c3.red+c4.red + c1.green+c2.green+c3.green+c4.green + c1.blue+c2.blue+c3.blue+c4.blue)\12) )*d
		      t= ( ((c.red+c.green+c.blue)\3) - ((c1.red+c1.green+c1.blue + c2.red+c2.green+c2.blue + c3.red+c3.green+c3.blue + c4.red+c4.green+c4.blue)\12) )*d
		      if t<>0 then // difference of zero means there's no difference!
		        s.pixel( x , y ) = rgb( c.red+t , c.green+t, c.blue+t )
		        'Else
		        's.Pixel(x,y)=c
		      end
		    next
		  next
		  // right
		  z=pic.Height-Radius
		  for x=pic.width-radius to w
		    xA=xAA(x)
		    xS=xSS(x)
		    for y=Radius to z
		      yA=yAA(y)
		      yS=ySS(y)
		      c=r.Pixel(x,y)
		      c1=r.Pixel(xS,y)
		      c2=r.Pixel(xA,y)
		      c3=r.Pixel(x,yS)
		      c4=r.Pixel(x,yA)
		      't= ( ((c.red+c.green+c.blue)\3) - (( c1.red+c2.red+c3.red+c4.red + c1.green+c2.green+c3.green+c4.green + c1.blue+c2.blue+c3.blue+c4.blue)\12) )*d
		      t= ( ((c.red+c.green+c.blue)\3) - ((c1.red+c1.green+c1.blue + c2.red+c2.green+c2.blue + c3.red+c3.green+c3.blue + c4.red+c4.green+c4.blue)\12) )*d
		      if t<>0 then // difference of zero means there's no difference!
		        s.pixel( x , y ) = rgb( c.red+t , c.green+t, c.blue+t )
		        'Else
		        's.Pixel(x,y)=c
		      end
		    next
		  next
		  
		  // *** MAIN LOOP ***
		  
		  w=pic.width-(Radius+1)
		  z=Radius+1
		  h=pic.height-(Radius+1)
		  for y=z to h
		    for x=z to w
		      c=r.Pixel(x,y)
		      c1=r.Pixel(x-Radius,y)
		      c2=r.Pixel(x+Radius,y)
		      c3=r.Pixel(x,y-Radius)
		      c4=r.Pixel(x,y+Radius)
		      't= ( ((c.red+c.green+c.blue)\3) - (( c1.red+c2.red+c3.red+c4.red + c1.green+c2.green+c3.green+c4.green + c1.blue+c2.blue+c3.blue+c4.blue)\12) )*d
		      t= ( ((c.red+c.green+c.blue)\3) - ((c1.red+c1.green+c1.blue + c2.red+c2.green+c2.blue + c3.red+c3.green+c3.blue + c4.red+c4.green+c4.blue)\12) )*d
		      if t<>0 then // difference of zero means there's no difference!
		        // apply the difference
		        's.Pixel(x,y)=&c00FF00// debuging
		        
		        s.pixel( x , y ) = rgb( c.red+t , c.green+t, c.blue+t )
		        'Else
		        's.Pixel(x,y)=c
		      end
		      
		    next
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShiftColorMap(pic as picture, ShiftBy as integer)
		  '// by Tomis Erwin
		  '
		  '#if DebugBuild=False and kUsePragmas then
		  '#pragma BackgroundTasks false
		  '#pragma BoundsChecking false
		  '#pragma NilObjectChecking false
		  '#pragma StackOverflowChecking false
		  '#endif
		  '
		  'dim x,y,w,h,idx as Integer
		  'dim s as RGBSurface
		  'dim c,cLookup() as Color
		  'dim sLookup() as String
		  'dim m as MemoryBlock
		  '
		  '
		  'if pic=nil then
		  'Return
		  'end
		  '
		  's=pic.RGBSurface
		  'if s=nil then
		  'Return
		  'end
		  '
		  'w=pic.Width-1
		  'h=pic.Height-1
		  '
		  '// load the map
		  'for y=0 to h
		  'for x=0 to w
		  'c=s.Pixel(x,y)
		  'if cLookup.IndexOf(c)=-1 then
		  'cLookup.Append c
		  'end
		  ''idx=format( (c.red*1000000)+(c.green*1000)+c.blue, "000000000" )
		  ''if sLookup.indexof(idx)=-1 then
		  ''sLookup.append idx
		  ''cLookup.append c
		  ''end
		  'next
		  'next
		  '
		  'w=UBound(cLookup)
		  'for x=0 to w
		  'c=cLookup(x)
		  'sLookup.Append chr(c.red)+chr(c.green)+chr(c.blue)'format( (c.red*1000000)+(c.green*1000)+c.blue, "000000000" )
		  'Next
		  'sLookup.Sort
		  '
		  'for x=0 to w
		  'm=sLookup(x)
		  'cLookup(x)=m.ColorValue(0,24)
		  'Next
		  '
		  '
		  '
		  '// apply the map
		  'for y=0 to h
		  'for x=0 to w
		  'c=s.Pixel(x,y)
		  'idx=cLookup.IndexOf(c)
		  's.Pixel(x,y)=cLookup(idx)
		  'next
		  'next
		  '
		  '
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShiftColorMapOLD(pic as picture, ShiftBy as integer)
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim x,y,i,w,t,h as Integer
		  dim s as RGBSurface
		  dim c,m(),a() as Color
		  dim p as Picture
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  w=pic.Width-1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      c=s.Pixel(x,y)
		      if m.IndexOf(c)=-1 then
		        m.Append c
		      end
		    next
		  next
		  
		  // get the color map
		  t=UBound(m)
		  p=NewPicture( t+1,1,32)
		  s=p.RGBSurface
		  i=0
		  for x=0 to t
		    s.Pixel(x,0)=m(x)
		  next
		  Step2:
		  
		  // transform the color map
		  SlideRows( p, ShiftBy, 0, 1, 1 )
		  'pic.Graphics.DrawPicture p,0,0
		  'Return
		  
		  // load up the transformed map
		  s=p.RGBSurface
		  for x=0 to t
		    a.append s.Pixel(x,0)
		  next
		  
		  // apply the transformed map
		  s=pic.RGBSurface
		  w=pic.Width-1
		  h=pic.Height-1
		  for y=0 to h
		    for x=0 to w
		      s.Pixel(x,y)=a( m.IndexOf(s.Pixel(x,y)) )
		    next
		  next
		  
		  // return the result
		  'Return pic
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Shimmer(Pic as picture, Level as double, Radius as double, WithBlur as boolean, ToEdge as boolean)
		  // by Tomis Erwin : gostcoder@yahoo.com
		  // a more randomized blur
		  
		  dim s as RGBSurface
		  dim cRadius, c2, cT as Color
		  dim x,y,h,v,L,wm,hm as Integer
		  
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  
		  if Level=0 or Radius<1 or Pic=nil then
		    Return
		  end
		  
		  // we gain speed by directly modifying the RGBsurface
		  // don't bother modifying the picture otherwise
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  if rand=nil then
		    rand=new Random
		  end
		  rand.Seed=pic.Width*pic.Height
		  
		  // LOOP RENDERING
		  
		  // *** TO EDGE ***
		  
		  if ToEdge then
		    wm=pic.Width-1
		    hm=pic.Height-1
		    
		    for L=1 to Level
		      
		      if WithBlur then
		        // BLURRY SHIMMER
		        
		        for y=hm DownTo 0
		          for x=0 to wm
		            v=Within( y-rand.InRange(-Radius,Radius) , hm )
		            h=Within( x-rand.InRange(-Radius,Radius) , wm )
		            if h<>x or v<>y then// no need to set a pixel back to it's self
		              // mix the colors
		              cT=rgb( (s.Pixel(h,v).red+s.Pixel(x,y).red) \ 2, (s.Pixel(h,v).green+s.Pixel(x,y).green) \ 2, (s.Pixel(h,v).blue+s.Pixel(x,y).blue) \ 2 )
		              // apply the mix
		              s.Pixel(h,v)=cT
		              s.Pixel(x,y)=cT
		            end
		          next
		        next
		        
		      else
		        // PIXELY SHIMMER
		        
		        for y=hm DownTo 0
		          for x=0 to wm
		            v=Within( y-rand.InRange(-Radius,Radius) , hm )
		            h=Within( x-rand.InRange(-Radius,Radius) , wm )
		            if h<>x or v<>y then// no need to set a pixel back to it's self
		              cT=s.Pixel( h, v )
		              s.Pixel( h, v )=s.Pixel(x,y)
		              s.Pixel(x,y)=cT
		            end
		          next
		        next
		        
		      end
		      
		    next
		    
		    Return
		  end
		  
		  
		  // *** NOT TO EDGE ***
		  
		  for L=1 to Level
		    wm=pic.Width-(Radius)
		    hm=pic.Height-(Radius)
		    
		    if WithBlur then
		      // BLURRY SHIMMER
		      
		      for y=hm DownTo Radius
		        for x=Radius to wm
		          v=y-rand.InRange(-Radius,Radius)
		          h=x-rand.InRange(-Radius,Radius)
		          if h<>x or v<>y then// no need to set a pixel back to it's self
		            // mix the colors
		            cT=rgb( (s.Pixel(h,v).red+s.Pixel(x,y).red) \ 2, (s.Pixel(h,v).green+s.Pixel(x,y).green) \ 2, (s.Pixel(h,v).blue+s.Pixel(x,y).blue) \ 2 )
		            // apply the mix
		            s.Pixel(h,v)=cT
		            s.Pixel(x,y)=cT
		          end
		        next
		      next
		      
		    else
		      // PIXELY SHIMMER
		      
		      for y=hm DownTo Radius
		        for x=Radius to wm
		          v=y-rand.InRange(-Radius,Radius)
		          h=x-rand.InRange(-Radius,Radius)
		          if h<>x or v<>y then// no need to set a pixel back to it's self
		            cT=s.Pixel( h, v )
		            s.Pixel( h, v )=s.Pixel(x,y)
		            s.Pixel(x,y)=cT
		          end
		        next
		      next
		      
		    end
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Skew(pic as picture, LeftPercent as double, RightPercent as double, TopPercent as double, BottomPercent as double) As Picture
		  // by Tomis Erwin
		  // NOT FINISHED
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim LeftHeight, RightHeight, TopWidth, BottomWidth as Integer
		  dim p as Picture
		  
		  if pic=nil then
		    Return pic
		  end
		  
		  LeftHeight=pic.Height*(LeftPercent/100)
		  RightHeight=pic.Height*(RightPercent/100)
		  TopWidth=pic.Width*(TopPercent/100)
		  BottomWidth=pic.Width*(BottomPercent/100)
		  
		  p=NewPicture( max(TopWidth,BottomWidth), max(LeftHeight, RightHeight ), 32 )
		  p.Graphics.UseOldRenderer=true
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Slant(pic as picture, HorizontalBy as integer, VerticalBy as integer, SmoothSlant as boolean, iMode as integer) As picture
		  // by Tomis Erwin : gostcoder@yahoo.com
		  
		  dim x,y,i,e as Integer
		  dim p as Picture
		  dim b,invH,invV as Boolean
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil or (VerticalBy=0 and HorizontalBy=0) then
		    Return pic
		  end
		  
		  if SmoothSlant then
		    pic=Resize(pic, 200)
		  end
		  
		  if iMode=kSlantModePercent or iMode=kSlantModePercentLoop Then // percent
		    HorizontalBy=pic.Width*(HorizontalBy/100)
		    VerticalBy=pic.Height*(VerticalBy/100)
		  end
		  
		  if (iMode=kSlantModePercentLoop or iMode=kSlantModePixelLoop)=False then
		    if HorizontalBy<>0 and VerticalBy<>0 then
		      pic= SlantVertical( SlantHorizontal(pic,HorizontalBy) ,VerticalBy)
		    Elseif HorizontalBy<>0 then
		      pic= SlantHorizontal(pic,HorizontalBy)
		    Else
		      pic= SlantVertical(pic,VerticalBy)
		    end
		    if SmoothSlant then
		      Return Resize(pic, 50)
		    else
		      Return pic
		    end
		  end
		  
		  p=NewPicture(pic.width,pic.Height,32)
		  p.Graphics.UseOldRenderer=true
		  pic.Graphics.UseOldRenderer=true
		  
		  if HorizontalBy<>0 then
		    e=pic.Height-1
		    for y=0 to e
		      x=(y/e)*HorizontalBy
		      
		      p.Graphics.DrawPicture pic, x,y, pic.Width,1 , 0,y,pic.Width,1
		      
		      if x<>0 then
		        if x<0 then
		          p.Graphics.DrawPicture pic, pic.Width+x,y, pic.Width,1 , 0,y,pic.Width,1
		        else
		          p.Graphics.DrawPicture pic, (-pic.Width)+x,y, pic.Width,1 , 0,y,pic.Width,1
		        end
		      end
		      
		    next
		    pic.Graphics.DrawPicture p,0,0
		  end
		  
		  if VerticalBy<>0 then
		    e=pic.Width-1
		    for x=0 to e
		      y=(x/e)*VerticalBy
		      
		      p.Graphics.DrawPicture pic, x,y, 1,pic.height , x,0,1,pic.Height
		      
		      if y<>0 then
		        if y<0 then
		          p.Graphics.DrawPicture pic, x,y+pic.height, 1,pic.height , x,0,1,pic.Height
		        else
		          p.Graphics.DrawPicture pic, x,(-pic.height)+y, 1,pic.height , x,0,1,pic.Height
		        end
		      end
		      
		    next
		    pic.Graphics.DrawPicture p,0,0
		  end
		  
		  if SmoothSlant then
		    Return Resize(pic, 50)
		  else
		    Return pic
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SlantHorizontal(pic as picture, SlantBy as integer) As Picture
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim y,z,n as Integer
		  dim p as Picture
		  
		  if pic=nil then
		    Return pic
		  end
		  
		  if SlantBy<>0 then
		    p=NewPicture( pic.Width+abs(SlantBy), pic.Height, 32 )
		    p.Graphics.UseOldRenderer=true
		    
		    z=pic.Height-1
		    n=pic.Width
		    if SlantBy<0 then
		      SlantBy=abs(SlantBy)
		      for y=0 to z
		        p.Graphics.DrawPicture pic, SlantBy-((y/z)*SlantBy) ,y, n,1,0,y,n,1
		      next
		    Else
		      for y=0 to z
		        p.Graphics.DrawPicture pic, (y/z)*SlantBy ,y,n,1,0,y,n,1
		      next
		    end
		    
		    Return p
		  Else
		    Return pic
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SlantVertical(pic as picture, SlantBy as integer) As Picture
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim x,z,n as Integer
		  dim p as Picture
		  
		  if pic=nil then
		    Return pic
		  end
		  
		  if SlantBy<>0 then
		    p=NewPicture( pic.Width, pic.Height+abs(SlantBy) , 32 )
		    p.Graphics.UseOldRenderer=true
		    
		    z=pic.Width-1
		    n=pic.Height
		    if SlantBy<0 then
		      SlantBy=abs(SlantBy)
		      for x=0 to z
		        p.Graphics.DrawPicture pic, x,SlantBy-((x/z)*SlantBy), 1,n , x,0,1,n
		      next
		    Else
		      for x=0 to z
		        p.Graphics.DrawPicture pic, x,(x/z)*SlantBy, 1,n , x,0,1,n
		      next
		    end
		    
		    Return p
		  Else
		    Return pic
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SlideRows(Pic as picture, HorizontalBy as integer, VerticalBy as integer, SectionWidth as integer, iMode as integer)
		  // by Tomis Erwin : gostcoder@yahoo.com
		  
		  // Modes:
		  // 0 - unison/percent
		  // 1 - unison/pixel
		  // 2 - scatter/percent
		  // 3 - scatter/pixel
		  
		  dim x,y,i,h,w,s as Integer
		  dim p as Picture
		  dim Unison,ByPercent as Boolean
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil or (VerticalBy=0 and HorizontalBy=0) or SectionWidth=0 then
		    Return
		  end
		  
		  Unison=(iMode=0 or iMode=1)
		  ByPercent=(iMode=0 or iMode=2)
		  
		  if not Unison then
		    if rand=nil then
		      rand=new Random
		    end
		    rand.Seed=pic.Width*pic.Height
		  end
		  
		  p=NewPicture(pic.width,pic.Height,32)
		  p.Graphics.UseOldRenderer=true
		  pic.Graphics.UseOldRenderer=true
		  
		  if HorizontalBy<>0 then
		    if ByPercent then
		      s=max( pic.Height*(SectionWidth/100) , 1 )
		      HorizontalBy=pic.Width*(HorizontalBy/100)
		    Else
		      s=SectionWidth
		    end
		    h=pic.Height-1
		    for y=0 to h step s
		      if Unison then
		        x=HorizontalBy
		      Else
		        x=rand.InRange(-HorizontalBy, HorizontalBy)
		      end
		      
		      p.Graphics.DrawPicture pic, x,y, pic.Width,s , 0,y,pic.Width,s
		      
		      if x<>0 then
		        if x<0 then
		          p.Graphics.DrawPicture pic, pic.Width+x,y, pic.Width,s , 0,y,pic.Width,s
		        else
		          p.Graphics.DrawPicture pic, (-pic.Width)+x,y, pic.Width,s , 0,y,pic.Width,s
		        end
		      end
		      
		    next
		    pic.Graphics.DrawPicture p,0,0
		  end
		  
		  if VerticalBy<>0 then
		    if ByPercent then
		      s=max( pic.Width*(SectionWidth/100) , 1 )
		      VerticalBy=pic.Height*(VerticalBy/100)
		    Else
		      s=SectionWidth
		    end
		    w=pic.Width-1
		    for x=0 to w step s
		      if Unison Then
		        y=VerticalBy
		      Else
		        y=rand.InRange(-VerticalBy, VerticalBy)
		      end
		      
		      p.Graphics.DrawPicture pic, x,y, s,pic.height , x,0,s,pic.Height
		      
		      if y<>0 then
		        if y<0 then
		          p.Graphics.DrawPicture pic, x,y+pic.height, s,pic.height , x,0,s,pic.Height
		        else
		          p.Graphics.DrawPicture pic, x,(-pic.height)+y, s,pic.height , x,0,s,pic.Height
		        end
		      end
		      
		    next
		    pic.Graphics.DrawPicture p,0,0
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Smooth(Pic as picture, Ammount as integer, Radius as integer, ReplaceColor as boolean)
		  // by Tomis Erwin : gostcoder@yahoo.com
		  
		  dim p  as picture
		  dim x , y, cR, cG, cB, w,h as integer
		  dim r,s as rgBSurface
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  
		  if pic=nil or Ammount=0 or Radius<1 then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  p=NewPicture(pic.width,pic.Height,32)
		  p.Graphics.UseOldRenderer=True
		  p.Graphics.DrawPicture pic,0,0
		  r=p.RGBSurface
		  
		  if ReplaceColor then
		    h=pic.height-(Radius+1)
		    w=pic.width-(Radius+1)
		    for y=Radius to h
		      for x = Radius to w
		        
		        // get the average of the colors around the pixel
		        cr=(r.pixel(x-Radius,y).red + r.pixel(x+Radius,y).red +  r.pixel(x,y-Radius).red + r.pixel(x,y+Radius).red) \ 4
		        cg=(r.pixel(x-Radius,y).green + r.pixel(x+Radius,y).green +  r.pixel(x,y-Radius).green + r.pixel(x,y+Radius).green) \ 4
		        cb=(r.pixel(x-Radius,y).blue + r.pixel(x+Radius,y).blue +  r.pixel(x,y-Radius).blue + r.pixel(x,y+Radius).blue) \ 4
		        
		        // get the difference between the pixels around it
		        
		        if (abs(r.pixel(x,y).red - cR) + abs(r.pixel(x,y).green - cG) + abs(r.pixel(x,y).blue - cB) )>=Ammount then
		          // apply the difference
		          s.pixel( x , y ) = rgb( cR, cG, cB )
		        end
		        
		      next
		    next
		    
		  else
		    h=pic.height-(Radius+1)
		    w=pic.width-(Radius+1)
		    
		    for y=Radius to h
		      for x = Radius to w
		        
		        // get the average of the colors around the pixel
		        cr=(r.pixel(x-Radius,y).red + r.pixel(x+Radius,y).red +  r.pixel(x,y-Radius).red + r.pixel(x,y+Radius).red) \ 4
		        cg=(r.pixel(x-Radius,y).green + r.pixel(x+Radius,y).green +  r.pixel(x,y-Radius).green + r.pixel(x,y+Radius).green) \ 4
		        cb=(r.pixel(x-Radius,y).blue + r.pixel(x+Radius,y).blue +  r.pixel(x,y-Radius).blue + r.pixel(x,y+Radius).blue) \ 4
		        
		        // get the difference between the pixels around it
		        
		        if (abs(r.pixel(x,y).red - cR) + abs(r.pixel(x,y).green - cG) + abs(r.pixel(x,y).blue - cB) )>=Ammount then
		          // apply the difference
		          s.pixel( x , y ) = rgb( (r.pixel(x,y).red+cR )\2 , (r.pixel(x,y).green+cG)\2 , (r.pixel(x,y).blue+cB)\2 )
		        end
		        
		      next
		    next
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Spotty(pic as picture, DiameterPx as integer, IsSmooth as boolean)
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  dim g as Graphics
		  dim x,y,wd,ht,i,u,xx,yy,n,wi as Integer
		  dim xList(), yList(),iKey() as Integer
		  dim s as RGBSurface
		  dim w as Double
		  
		  if pic=nil or DiameterPx<2 then
		    Return
		  end
		  
		  if IsSmooth then
		    p=NewPicture(pic.Width*2,pic.Height*2,32)
		    if p=nil then
		      goto RoughRun
		    end
		    s=p.RGBSurface
		    g=p.Graphics
		    g.UseOldRenderer=true
		    g.DrawPicture pic,0,0,g.Width,g.Height, 0,0,pic.Width,pic.Height
		    DiameterPx=DiameterPx*2
		  Else
		    RoughRun:
		    s=pic.RGBSurface
		    g=pic.Graphics
		    g.UseOldRenderer=True
		  end
		  
		  if s=nil then
		    Return
		  end
		  
		  
		  if rand=nil then
		    rand=new Random
		  end
		  
		  rand.Seed=(pic.Width*pic.Height)\DiameterPx
		  
		  w=DiameterPx/2
		  wi=w
		  wd=g.Width-1
		  ht=g.Height-1
		  
		  // build cordinate list
		  u=((g.Width/wi)*(g.Height/wi))+1
		  Redim xList(u)
		  Redim yList(u)
		  
		  // build a key to use for accessing entries in the list randomly
		  Redim iKey(u)
		  for i=0 to u
		    iKey(i)= i
		  Next
		  iKey.Shuffle
		  
		  i=0
		  for y=w to ht Step wi
		    for x=w to wd Step wi
		      'xList(i)= max( min( rand.InRange(x-w,x+w) , wd ) , 0 )
		      'yList(i)= max( min( rand.InRange(y-w,y+w) , ht ) , 0 )
		      
		      n = rand.InRange(x-2,x+2)
		      if n<0 then
		        xList(i)=0
		      Elseif n>wd then
		        xList(i)=wd
		      Else
		        xList(i)=n
		      end
		      
		      n = rand.InRange(y-2,y+2)
		      if n<0 then
		        yList(i)=0
		      Elseif n>ht then
		        yList(i)=ht
		      Else
		        yList(i)=n
		      end
		      
		      i=i+1
		    Next
		  Next
		  
		  
		  // traverse the list according to the key
		  for i=0 to u
		    x=iKey(i)
		    xx=xList(x)
		    yy=yList(x)
		    g.ForeColor=s.Pixel(xx,yy)
		    g.FillOval(xx-w,yy-w,DiameterPx,DiameterPx)
		  Next
		  
		  // copy the result back
		  if IsSmooth then
		    pic.Graphics.UseOldRenderer=true
		    #if TargetMacOS=False then
		      pic.Graphics.DrawPicture ScalePictureHalf( p ),0,0
		    #else
		      pic.Graphics.DrawPicture p,0,0,pic.Width,pic.Height, 0,0,p.Width,p.Height
		    #endif
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Text(Pic as picture, Text as string, TextColor as color, ShadowColor as color, AlignHorizPrc as integer, AlignVertPrc as integer, SizePrc as integer, BlurShadow as integer)
		  // by Tomis Erwin
		  
		  // an older version that modifies the source picture directly
		  // left in to avoid breaking older code that may use it
		  
		  dim iSize,iX,iY,iW,iH,iA as integer
		  dim d as Double
		  dim p as Picture
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if pic=nil or text="" then
		    Return
		  end
		  
		  iSize=pic.Width*(SizePrc/100)
		  
		  p=NewPicture(1,1,32)
		  p.Graphics.TextFont="System"
		  p.Graphics.TextSize=iSize
		  iW=p.Graphics.StringWidth( Text )
		  iH=p.Graphics.TextHeight
		  iA=p.Graphics.TextAscent
		  
		  d=(AlignVertPrc/100)
		  iY=(pic.Height*d)+(iH*d)
		  
		  d=(AlignHorizPrc/100)
		  iX=(pic.Width*d)-(iW*d)
		  
		  //align text
		  'Select case AlignHorizMode
		  'case 0//left
		  'iX=pic.Width*.01
		  'case 1//center
		  'iX=(pic.Width/2)-(iW/2)
		  'case 2//right
		  'iX=pic.width-((pic.Width*.01)+iW)
		  'end
		  
		  pic.Graphics.TextSize=iSize
		  pic.Graphics.TextFont="System"
		  
		  if BlurShadow>0 then
		    if BlurShadow=1 then
		      pic.Graphics.UseOldRenderer=false
		      pic.Graphics.ForeColor=ShadowColor
		      pic.Graphics.DrawString Text,iX,iY+2
		    else
		      blurshadow=blurshadow-1
		      //make drop shadow
		      iw=iW+(BlurShadow*6)
		      if p=nil or p.Width<>iw or p.Height<>ih then
		        p=NewPicture(iw,iH,32)
		        p.Graphics.TextSize=iSize
		        p.Graphics.TextFont="System"
		        p.Graphics.DrawString Text, BlurShadow*3, iA
		        p.Mask.Graphics.UseOldRenderer=true
		        p.Mask.Graphics.DrawPicture Blur( p, BlurShadow, min( BlurShadow\2, 1 ) ),0,0
		        p.Graphics.UseOldRenderer=true
		        p.Graphics.ForeColor=ShadowColor
		        p.Graphics.FillRect 0,0,p.Width,p.Height
		      end
		      
		      pic.Graphics.UseOldRenderer=true
		      pic.Graphics.DrawPicture p, iX-(BlurShadow*3), (iY-iA)+2
		    end
		  end
		  
		  //draw overlay text
		  pic.Graphics.ForeColor=TextColor
		  pic.Graphics.UseOldRenderer=false
		  pic.Graphics.DrawString Text,iX,iY
		  pic.Graphics.UseOldRenderer=true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text(Pic as picture, Text as string, TextColor as color, ShadowColor as color, AlignHorizPrc as integer, AlignVertPrc as integer, SizePrc as integer, BlurShadow as integer, FontName as string, TextBold as boolean, TextItalic as boolean, TextUnderline as boolean) As Picture
		  #if not DebugBuild then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Return Text( pic, Text, TextColor, ShadowColor, AlignHorizPrc, AlignVertPrc, SizePrc, BlurShadow, FontName, TextBold, TextItalic, TextUnderline , False )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text(Pic as picture, Text as string, TextColor as color, ShadowColor as color, AlignHorizPrc as integer, AlignVertPrc as integer, SizePrc as integer, BlurShadow as integer, FontName as string, TextBold as boolean, TextItalic as boolean, TextUnderline as boolean, FillBackground as boolean) As Picture
		  // by Tomis Erwin
		  
		  dim iSize,iX,iY,iW,iH,iA,iEdge as integer
		  dim d as Double
		  dim p as Picture
		  dim g as Graphics
		  dim s() as String
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  if text="" then
		    Return pic
		  end
		  
		  if pic=nil then
		    iSize=SizePrc
		  Else
		    iSize=pic.Width*(SizePrc/100)
		  end
		  
		  Text=ReplaceLineEndings(Text,chr(13))
		  
		  p=NewPicture(1,1,32)
		  g=p.Graphics
		  g.TextFont=FontName
		  g.TextSize=iSize
		  g.Bold=TextBold
		  g.Italic=TextItalic
		  g.Underline=TextUnderline
		  
		  if InStrB( Text, chr(13) )>0 then
		    // find the longest line
		    s=Split(Text,chr(13))
		    iW=0
		    for iY=UBound(s) DownTo 0
		      iX=g.StringWidth(s(iY))
		      if iX>iW then
		        iW=iX
		      end
		    Next
		  Else
		    iW=g.StringWidth( Text )
		  end
		  
		  iH=g.StringHeight( Text, iW+5 )
		  iA=g.TextAscent
		  
		  if pic=nil then
		    pic=NewPicture( iw+(BlurShadow*BlurShadow), iH+(BlurShadow*BlurShadow), 32 )
		    if pic=nil then
		      Return nil
		    end
		  end
		  
		  g=pic.Graphics
		  g.UseOldRenderer=true
		  
		  d=(AlignVertPrc/100)
		  iY=((pic.Height+iH)*d)-(iH-iA)
		  
		  d=(AlignHorizPrc/100)
		  iX=(pic.Width-iW)*d
		  
		  //align text
		  'Select case AlignHorizMode
		  'case 0//left
		  'iX=pic.Width*.01
		  'case 1//center
		  'iX=(pic.Width/2)-(iW/2)
		  'case 2//right
		  'iX=pic.width-((pic.Width*.01)+iW)
		  'end
		  
		  g.TextSize=iSize
		  g.TextFont=FontName
		  g.Bold=TextBold
		  g.Italic=TextItalic
		  g.Underline=TextUnderline
		  
		  if FillBackground then
		    if BlurShadow>0 then
		      g.ForeColor=ShadowColor
		      g.FillRect 0,0,pic.Width,pic.Height
		      
		      //draw overlay text
		      g=pic.Graphics
		      g.ForeColor=TextColor
		      g.UseOldRenderer=false
		      g.DrawString Text,iX,iY
		      g.UseOldRenderer=true
		    Else
		      g.ForeColor=TextColor
		      g.FillRect 0,0,pic.Width,pic.Height
		    end
		  Else
		    if BlurShadow>0 then
		      if BlurShadow=1 then
		        g.UseOldRenderer=false
		        g.ForeColor=ShadowColor
		        g.DrawString Text,iX,iY+2
		      else
		        //make drop shadow
		        BlurShadow=BlurShadow-1
		        iEdge=(BlurShadow*kBlurEdgeMult)
		        
		        p=NewPicture(iw+iEdge+iEdge,iH+iEdge+iEdge,32)
		        g=p.Graphics
		        g.TextSize=iSize
		        g.TextFont=FontName
		        g.Bold=TextBold
		        g.Italic=TextItalic
		        g.Underline=TextUnderline
		        g.DrawString Text, iEdge, iA+iEdge
		        p.Mask.Graphics.UseOldRenderer=true
		        p.Mask.Graphics.DrawPicture Blur( p, BlurShadow, min( BlurShadow\2, 1 ) ),0,0
		        g.UseOldRenderer=true
		        g.ForeColor=ShadowColor
		        g.FillRect 0,0,p.Width,p.Height
		        
		        pic.Graphics.DrawPicture p, iX-iEdge, ((iY-iA)-iEdge)+2
		      end
		    end
		    
		    //draw overlay text
		    g=pic.Graphics
		    g.ForeColor=TextColor
		    g.UseOldRenderer=false
		    g.DrawString Text,iX,iY
		    g.UseOldRenderer=true
		  end
		  
		  
		  
		  Return pic
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tile(pic as picture, TilesAcross as integer, TilesDown as integer) As Picture
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  dim x,y as Integer
		  if pic=nil or TilesAcross<1 or TilesDown<1 or (TilesAcross=1 and TilesDown=1) then
		    Return pic
		  end
		  
		  p=NewPicture(pic.Width*TilesAcross,pic.Height*TilesDown,32)
		  if p=nil then
		    Beep
		    MsgBox "Couldn't tile image, not enough memory."
		    Return pic
		  end
		  
		  p.Graphics.UseOldRenderer=true
		  
		  for y=0 to p.Height Step pic.Height
		    for x=0 to p.Width Step pic.Width
		      p.Graphics.DrawPicture pic,x,y
		    next
		  Next
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Tint(pic as picture, Hue as integer, Saturation as integer, Value as integer, Invert as boolean, GreyScaleMask as boolean)
		  // by Tomis Erwin
		  
		  // Note, this effect abuses a weird bug in the way RB handles masks that contain color Images.
		  // Instead of mixing the mask down to it's greyscale version, 
		  // RB lets the mask alter the image's colors.
		  
		  // I'm not sure exactly what the corolation is but you can muck with an image's colors using it.
		  
		  // If RB ever fixes the way they handle masks then this effect will still work for tinting an image,
		  // but it won't cause the same result.
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  
		  if pic=nil then
		    Return
		  end
		  
		  if GreyScaleMask then
		    // force RB to greyscale the mask, which it doesn't on its own
		    
		    Greyscale(pic)
		  end
		  
		  // build the image using pic as the mask...
		  
		  p=NewPicture(pic.width,pic.Height,32)
		  p.Graphics.UseOldRenderer=true
		  p.Mask.Graphics.UseOldRenderer=true
		  p.Mask.Graphics.DrawPicture pic,0,0
		  
		  // draw the images color
		  p.Graphics.ForeColor=hsv( hue/1000, Saturation/1000, Value/1000 )
		  p.Graphics.FillRect 0,0,p.Width,p.Height
		  
		  // overlay the masked image back, ie, return the value
		  
		  if Invert then
		    pic.Graphics.ForeColor=&c000000// try using a color here instead? see what we get
		    pic.Graphics.FillRect 0,0,p.Width,p.Height
		  Else
		    pic.Graphics.ClearRect 0,0,pic.Width,pic.Height
		  end
		  
		  pic.Graphics.DrawPicture p,0,0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Tint2(pic as picture, TintColor as color, OverlayColor as color, GreyScaleMask as boolean)
		  // by Tomis Erwin
		  
		  // Note, this effect abuses a weird bug in the way RB handles masks that contain color Images.
		  // Instead of mixing the mask down to it's greyscale version, 
		  // RB lets the mask alter the image's colors.
		  
		  // I'm not sure exactly what the corolation is but you can muck with an image's colors using it.
		  
		  // If RB ever fixes the way they handle masks then this effect will still work for tinting an image,
		  // but it won't cause the same result.
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim p as Picture
		  dim s as RGBSurface
		  dim x,y,w,a,h as Integer
		  
		  if pic=nil then
		    Return
		  end
		  
		  if GreyScaleMask then
		    // force RB to greyscale the mask, which it doesn't on its own
		    
		    Greyscale(pic)
		  end
		  
		  // build the image using pic as the mask...
		  
		  p=NewPicture(pic.width,pic.Height,32)
		  p.Graphics.UseOldRenderer=true
		  p.Mask.Graphics.UseOldRenderer=true
		  p.Mask.Graphics.DrawPicture pic,0,0
		  
		  // draw the images color
		  p.Graphics.ForeColor=TintColor
		  p.Graphics.FillRect 0,0,p.Width,p.Height
		  
		  // overlay the masked image back, ie, return the value
		  
		  pic.Graphics.ForeColor=OverlayColor
		  pic.Graphics.FillRect 0,0,p.Width,p.Height
		  
		  pic.Graphics.DrawPicture p,0,0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnFocus(pic as picture, Level as integer, Style as integer) As Picture
		  // by Tomis Erwin
		  
		  dim p,t as Picture
		  dim L as Integer
		  
		  const kStyleDiagonal = 0
		  const kStyleParallel = 1
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  
		  if pic=nil or Level=0 then
		    Return pic
		  end
		  
		  p=NewPicture(pic.width,pic.Height,32)
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.DrawPicture pic,0,0
		  
		  t=NewPicture(pic.Width,pic.Height,32)
		  t.Graphics.UseOldRenderer=true
		  't.Mask.Graphics.ForeColor=rgb(63,63,63)
		  t.Mask.Graphics.ForeColor=&c7F7F7F
		  t.Mask.Graphics.FillRect 0,0,t.Width,t.Height
		  
		  if Style=kStyleDiagonal then
		    t.Graphics.DrawPicture p,0,0
		    p.Graphics.DrawPicture t,-Level,-Level// upper left
		    
		    t.Graphics.DrawPicture p,0,0
		    p.Graphics.DrawPicture t,-Level,Level//lower left
		    
		    t.Graphics.DrawPicture p,0,0
		    p.Graphics.DrawPicture t,Level,Level//lower right
		    
		    t.Graphics.DrawPicture p,0,0
		    p.Graphics.DrawPicture t,Level,-Level//upper right
		  else
		    t.Graphics.DrawPicture p,0,0
		    p.Graphics.DrawPicture t,-Level,0//left
		    
		    t.Graphics.DrawPicture p,0,0
		    p.Graphics.DrawPicture t,Level,0//right
		    
		    t.Graphics.DrawPicture p,0,0
		    p.Graphics.DrawPicture t,0,-Level//up
		    
		    t.Graphics.DrawPicture p,0,0
		    p.Graphics.DrawPicture t,0,Level//down
		  end
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Within(Num as integer, MaxNum as integer) As Integer
		  // by Tomis Erwin
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  // keep the number Between the min and max
		  // this is not the same as min() or max() which cut the number down to the min/max value
		  // if the number is under or over it will be rolled back to be between the min/max
		  
		  // example: Within( x , y ) : if x<0 then x = -x , if x>y then x=y-(x-y)
		  // example: Within( -5 , 10 ) : -5 = 5
		  // example: Within( 12 , 10 ) : 12 = 8 , because 12-10=2 and 10-2=8
		  
		  dim i as Integer
		  
		  if num < 0 Then
		    i = -num
		  else
		    i = num
		  end
		  
		  if i > MaxNum Then
		    Return MaxNum - ( i-MaxNum )
		  end
		  
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Zoom(Pic as picture, Level as integer, StepBy as integer)
		  // by Tomis Erwin
		  
		  // a zoom blur, not to be confused with the Resize() effect
		  
		  dim p,t as Picture
		  dim L,iStep as Integer
		  
		  
		  #if DebugBuild=False and kUsePragmas then
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  
		  if pic=nil or level=0 then
		    Return
		  end
		  
		  p=NewPicture(pic.width,pic.Height,32)
		  p.Graphics.UseOldRenderer=true
		  p.Graphics.DrawPicture pic,0,0
		  
		  t=NewPicture(pic.Width,pic.Height,32)
		  t.Graphics.UseOldRenderer=true
		  t.Mask.Graphics.ForeColor=&c7F7F7F
		  t.Mask.Graphics.FillRect 0,0,t.Width,t.Height
		  
		  iStep=max( StepBy ,1 ) // use max to avoid potential freezing
		  
		  if Level<0 then
		    for L=-1 downto Level step iStep
		      t.Graphics.DrawPicture p,0,0
		      p.Graphics.DrawPicture t,-L,-L, p.Width+(L*2), p.Height+(L*2), 0,0,p.Width,p.Height
		    next
		  else
		    for L=Level DownTo 1 step iStep
		      t.Graphics.DrawPicture p,0,0
		      p.Graphics.DrawPicture t,-L,-L, p.Width+(L*2), p.Height+(L*2), 0,0,p.Width,p.Height
		    next
		  end
		  
		  pic.Graphics.UseOldRenderer=true
		  pic.Graphics.DrawPicture p,0,0
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		
		
		HISTORY
		
		This effects library all started when Joshua Coventry needed some more optimized 
		effects for a project he was working on. I rewrote the effects he had, and wrote a few 
		more. Then the idea came to me; what if we stacked these effects up? And soon I had 
		ImagePlay 1.0pr1
		
		The next version was ImagePlay 0.1, which really got the ball rolling with not only layered 
		effects, but image layers as well. So thank you Josh for having some code that needed 
		improving. Otherwise I probably never would have fallen into this.
		
		
		USE
		
		This module has no dependancies. That means that you can just pull this module out, drop it
		in your own project, and you're ready to use the effects. You don't need anything else!
		
		You can read about using this module in your own projects in the License section.
		
		Basically, I would like as many people as possible to use the ImagePlay Effects Library, 
		for free, no fee. Other languages have open source effects libraries, it's time 
		REALbasic did as well.
		
		~ Tomis Erwin < http://imageplay.sourceforge.net >
		
	#tag EndNote

	#tag Note, Name = Credits
		ScalePicture() - based on code from Dr. Gerard Hammond
		Rotate() - contains code by Freakintosh, DigitalCalamity.org
		
	#tag EndNote

	#tag Note, Name = License
		* Feel free to use this module in your project, commercial, or non-commercial. 
		   For free, no fee.
		
		* Make sure you give credit somewhere; 
		"Portions of this program are from the ImagePlay Effects Library - http://imageplay.sourceforge.net"
		
		And if you want to put my name in there too "by Tomis Erwin", that'd be nice, but I'm not fussy.
		
		What is important to me is that the name "ImagePlay" and the URL are credited, 
		so that others may locate it for use in their own projects.
		
		
	#tag EndNote

	#tag Note, Name = Template_RGBsurface
		// A template for writing RGB surface loops
		
		  dim x,y,w,h as Integer
		  dim s as RGBSurface
		  
		  if pic=nil then
		    Return
		  end
		  
		  s=pic.RGBSurface
		  if s=nil then
		    Return
		  end
		  
		  h=pic.Height-1
		  w=pic.Width-1
		  for y=0 to h
		    for x=0 to w
		      s.Pixel(x,y)=
		    next
		  next
		
	#tag EndNote

	#tag Note, Name = Usage within ImagePlay
		If you are adding/editing effects in this module within the ImagePlay project,
		there's a few things you need to know. 
		
		The image processing related stuff is located in the "ProjectSupport" folder of the project.
		
		* ImagePlayEffectsSupport.LoadEffects is where the entries for effects are created, 
		   if you want your wonderful new effect to show up in the interface, add an entry there.
		   
		* EffectThread.RunEffects is where effects get called when they are run.
		   If you want your wonderful new effect to actually do anything, add an entry there.
		   
		* EffectTypeConstants contains the type code for every Effect. This is how Effects are identified.
		   If you add an effect, add a 4 character code for it here.
		   
		If you change the parameters used by an effect, you will have to edit entries @ LoadEffects and RunEffects
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected rand As random
	#tag EndProperty


	#tag Constant, Name = kBlurEdgeMult, Type = Double, Dynamic = False, Default = \"3.3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBlurModeAcurate, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBlurModeFast, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBlurModeFaster, Type = Integer, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBlurStyleDiagonal, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBlurStyleParallel, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCompareModeAddSubtract, Type = Integer, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCompareModeCrossFade, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCompareModeDifference, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDrawRectModePercent, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDrawRectModePixel, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGradientStyleBox, Type = Integer, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGradientStyleOval, Type = Integer, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGradientStyleRadial, Type = Integer, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGradientStyleWipeHorizontal, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGradientStyleWipeVertical, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kResizeModeByPercent, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kResizeModeByPixel, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kResizeModeRestrictToPercent, Type = Integer, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kResizeModeRestrictToPixel, Type = Integer, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kResizeTypeFastest, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kResizeTypeNormal, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kResizeTypePixel, Type = Integer, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kResizeTypeRows, Type = Integer, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kResizeTypeSmooth, Type = Integer, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kRotateModeJaggy, Type = Integer, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kRotateModeJaggy2, Type = Integer, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kRotateModeRB, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kRotateModeSmooth, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSharpenModeBlur, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSharpenModeSelf, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlantModePercent, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlantModePercentLoop, Type = Integer, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlantModePixel, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlantModePixelLoop, Type = Integer, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUsePragmas, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Version, Type = Integer, Dynamic = False, Default = \"18", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
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
End Module
#tag EndModule
