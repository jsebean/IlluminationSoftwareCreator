#tag Class
Protected Class ilObjectWindow
Inherits ilObjectBase
	#tag Event
		Sub GenerateAndroidCode(theOrigin as string)
		  dim s as string
		  dim s2 as string
		  dim s3 as string
		  
		  dim i as integer
		  
		  // s = the layout XML
		  // s2 = The global variables
		  // s3 = The Function to load and initialize the view + event handler
		  
		  
		  // Start the layout
		  s = "<?xml version=""1.0"" encoding=""utf-8""?>" + EndOfLine
		  
		  s = s + "<RelativeLayout xmlns:android=""http://schemas.android.com/apk/res/android"" " + _
		  "android:id=""@+id/" + Lowercase(GetCodeName) + _
		  """ android:orientation=""vertical"" " + _
		  "android:layout_width=""fill_parent"" android:layout_height=""fill_parent"" >" + EndOfLine
		  
		  // Start the window loading function
		  s3 = "public void " + GetCodeName + "(){" + EndOfLine
		  s3 = s3 + "setContentView(R.layout." + Lowercase(GetCodeName) + "layout);" + EndOfLine
		  's3 = s3 + "
		  
		  'YourView.setBackgroundColor(Color.argb(255, 255, 255, 255));
		  
		  // Loop through and create all the controlls
		  if theUIObjects.Ubound > -1 then
		    for i = 0 to theUIObjects.Ubound
		      // Insert the buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcButton then
		        
		        // add the control to the layout
		        s = s + "<Button android:id=""@+id/" + theUIObjects(i).ISCClassLocalAndroidName + """" + _
		        " android:text=""" +  str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) +  """" + EndOfLine
		        
		        if theUIObjects(i).LockRight(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Works
		            // Left and Right locked
		            s = s + "android:layout_width=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            // Right Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentRight=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Left Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Left nor Right locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        if theUIObjects(i).LockTop(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Top Locked, Bottom Locked
		            s = s + "android:layout_height=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            
		            // Top Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            's = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Bottom Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentBottom=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Bottom nor Top locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        s = s + ">" + EndOfLine
		        
		        s = s + "</Button>" + EndOfLine
		        
		        // Add the global variable
		        s2 = s2 + "private Button " + theUIObjects(i).ISCClassLocalAndroidName + ";" + EndOfLine
		        
		        // Add the init code to s3
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + " = (Button)this.findViewById(R.id." + theUIObjects(i).ISCClassLocalAndroidName +");" + EndOfLine
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + ".setOnClickListener(new OnClickListener() {" + EndOfLine
		        s3 = s3 + "@Override" + EndOfLine
		        s3 = s3 + "public void onClick(View v) {" + EndOfLine
		        //s3 = s3 + "finish();
		        s3 = s3 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s3 = s3 + "}" + EndOfLine
		        s3 = s3 + "});" + EndOfLine
		        
		      end if
		      
		      // Insert the Color Buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcColorButton then
		        
		        
		      end if
		      
		      // Insert the Canvases
		      if theUIObjects(i).ControlType = theUIObjects(i).kcCanvas then
		        // <ImageView android:layout_height="50px" android:id="@+id/imageView1" android:layout_width="50px" 
		        // android:layout_x="9dip" android:layout_y="6dip"></ImageView>
		        
		        // add the control to the layout
		        s = s + "<ImageView android:id=""@+id/" + theUIObjects(i).ISCClassLocalAndroidName + """" + EndOfLine
		        
		        
		        if theUIObjects(i).LockRight(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Works
		            // Left and Right locked
		            s = s + "android:layout_width=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            // Right Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentRight=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Left Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Left nor Right locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        if theUIObjects(i).LockTop(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Top Locked, Bottom Locked
		            s = s + "android:layout_height=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            
		            // Top Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            's = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Bottom Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentBottom=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Bottom nor Top locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        s = s + ">" + EndOfLine
		        
		        
		        
		        s = s + "</ImageView>" + EndOfLine
		        
		        // Add the global variable
		        s2 = s2 + "private ImageView " + theUIObjects(i).ISCClassLocalAndroidName + ";" + EndOfLine
		        
		        'AndroidInsertCodeAtMarker(s2, "//EndOfGlobalVariables")
		        
		        // Add the init code to s3
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + " = (ImageView)this.findViewById(R.id." + theUIObjects(i).ISCClassLocalAndroidName +");" + EndOfLine
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + ".setOnClickListener(new OnClickListener() {" + EndOfLine
		        s3 = s3 + "@Override" + EndOfLine
		        s3 = s3 + "public void onClick(View v) {" + EndOfLine
		        //s3 = s3 + "finish();
		        s3 = s3 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s3 = s3 + "}" + EndOfLine
		        s3 = s3 + "});" + EndOfLine
		        
		      end if
		      
		      // Insert the labels
		      if theUIObjects(i).ControlType = theUIObjects(i).kcLabel then
		        
		        // add the control to the layout
		        s = s + "<TextView android:id=""@+id/" + theUIObjects(i).ISCClassLocalAndroidName + """" + EndOfLine + _
		        " android:text=""" +  str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) +  """" + EndOfLine
		        
		        if theUIObjects(i).LockRight(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Works
		            // Left and Right locked
		            s = s + "android:layout_width=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            // Right Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentRight=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Left Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Left nor Right locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        if theUIObjects(i).LockTop(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Top Locked, Bottom Locked
		            s = s + "android:layout_height=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            
		            // Top Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            's = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Bottom Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentBottom=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Bottom nor Top locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        s = s + ">" + EndOfLine
		        
		        s = s + "</TextView>" + EndOfLine
		        
		        // Add the global variable
		        s2 = s2 + "private TextView " + theUIObjects(i).ISCClassLocalAndroidName + ";" + EndOfLine
		        
		        
		      end if
		      
		      // Insert the WebBrowsers
		      if theUIObjects(i).ControlType = theUIObjects(i).kcWebBrowser then
		        
		        // add the control to the layout
		        s = s + "<WebView android:id=""@+id/" + theUIObjects(i).ISCClassLocalAndroidName + """" + EndOfLine
		        
		        if theUIObjects(i).LockRight(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Works
		            // Left and Right locked
		            s = s + "android:layout_width=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            // Right Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentRight=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Left Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Left nor Right locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        if theUIObjects(i).LockTop(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Top Locked, Bottom Locked
		            s = s + "android:layout_height=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            
		            // Top Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            's = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Bottom Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentBottom=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Bottom nor Top locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        s = s + ">" + EndOfLine
		        
		        
		        s = s + "</WebView>" + EndOfLine
		        
		        // Add the global variable
		        s2 = s2 + "private WebView " + theUIObjects(i).ISCClassLocalAndroidName + ";" + EndOfLine
		        
		        
		      end if
		      
		      // Insert the Textboxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextBox then
		        
		        
		        s = s + "<EditText android:id=""@+id/" + theUIObjects(i).ISCClassLocalAndroidName + """" + _
		        " android:text=""" +  str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) +  """" + EndOfLine
		        
		        if theUIObjects(i).LockRight(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Works
		            // Left and Right locked
		            s = s + "android:layout_width=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            // Right Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentRight=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Left Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Left nor Right locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        if theUIObjects(i).LockTop(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Top Locked, Bottom Locked
		            s = s + "android:layout_height=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            
		            // Top Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            's = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Bottom Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentBottom=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Bottom nor Top locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        s = s + ">" + EndOfLine
		        
		        s = s + "</EditText>" + EndOfLine
		        
		        
		        
		        // Add the global variable
		        s2 = s2 + "private EditText " + theUIObjects(i).ISCClassLocalAndroidName + ";" + EndOfLine
		        
		        'AndroidInsertCodeAtMarker(s2, "//EndOfGlobalVariables")
		        
		        // Add the init code to s3
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + " = (EditText)this.findViewById(R.id." + theUIObjects(i).ISCClassLocalAndroidName +");" + EndOfLine
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + ".setOnKeyListener(new OnKeyListener() {" + EndOfLine
		        s3 = s3 + "@Override" + EndOfLine
		        s3 = s3 + "public boolean onKey(View v, int keyCode, KeyEvent event) {" + EndOfLine
		        //s3 = s3 + "finish();
		        s3 = s3 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s3 = s3 + "return false;" + EndOfLine
		        s3 = s3 + "}" + EndOfLine
		        s3 = s3 + "});" + EndOfLine
		        
		      end if
		      
		      // Insert the Textfields
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextField then
		        
		        s = s + "<EditText android:id=""@+id/" + theUIObjects(i).ISCClassLocalAndroidName + """" + _
		        " android:text=""" +  str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) +  """" + EndOfLine
		        
		        
		        if theUIObjects(i).LockRight(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Works
		            // Left and Right locked
		            s = s + "android:layout_width=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            // Right Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentRight=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Left Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Left nor Right locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        if theUIObjects(i).LockTop(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Top Locked, Bottom Locked
		            s = s + "android:layout_height=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            
		            // Top Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            's = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Bottom Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentBottom=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Bottom nor Top locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        s = s + ">" + EndOfLine
		        
		        s = s + "</EditText>" + EndOfLine
		        
		        // Add the global variable
		        s2 = s2 + "private EditText " + theUIObjects(i).ISCClassLocalAndroidName + ";" + EndOfLine
		        
		        
		      end if
		      
		      // Insert the Progress Bars
		      if theUIObjects(i).ControlType = theUIObjects(i).kcProgressBar then
		        
		        s = s + "<ProgressBar android:id=""@+id/" + theUIObjects(i).ISCClassLocalAndroidName + """" + _
		        " android:progressDrawable=""@android:drawable/progress_horizontal""" + EndOfLine + _
		        " style=""?android:attr/progressBarStyleHorizontal""" + EndOfLine + _
		        " android:indeterminateDrawable=""@android:drawable/progress_indeterminate_horizontal""" + EndOfLine
		        
		        if theUIObjects(i).LockRight(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Works
		            // Left and Right locked
		            s = s + "android:layout_width=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            // Right Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentRight=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Left Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Left nor Right locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        if theUIObjects(i).LockTop(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Top Locked, Bottom Locked
		            s = s + "android:layout_height=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            
		            // Top Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            's = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Bottom Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentBottom=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Bottom nor Top locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        s = s + ">" + EndOfLine
		        
		        
		        s = s + "</ProgressBar>" + EndOfLine
		        
		        // Add the global variable
		        s2 = s2 + "private ProgressBar " + theUIObjects(i).ISCClassLocalAndroidName + ";" + EndOfLine
		        
		        
		      end if
		      
		      
		      // Insert the CheckBoxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcCheckBox then
		        
		        s = s + "<CheckBox android:id=""@+id/" + theUIObjects(i).ISCClassLocalAndroidName + """" + _
		        " android:text=""" +  str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) +  """" + EndOfLine
		        
		        if theUIObjects(i).LockRight(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Works
		            // Left and Right locked
		            s = s + "android:layout_width=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            // Right Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentRight=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Left Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Left nor Right locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        if theUIObjects(i).LockTop(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Top Locked, Bottom Locked
		            s = s + "android:layout_height=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            
		            // Top Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            's = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Bottom Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentBottom=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Bottom nor Top locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        s = s + ">" + EndOfLine
		        
		        
		        s = s + "</CheckBox>" + EndOfLine
		        
		        // Add the global variable
		        s2 = s2 + "private CheckBox " + theUIObjects(i).ISCClassLocalAndroidName + ";" + EndOfLine
		        
		        
		      end if
		      
		      // Insert the ListBoxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcListBox then
		        
		        s = s + "<ListView android:id=""@+id/" + theUIObjects(i).ISCClassLocalAndroidName + """" + EndOfLine
		        
		        if theUIObjects(i).LockRight(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Works
		            // Left and Right locked
		            s = s + "android:layout_width=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            // Right Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginRight=""" + str(theUIObjects(i).GetDistanceFromWindowRight(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentRight=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockLeft(modCodeGenerator.TargetInProcess) = true then
		            // Left Locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Left nor Right locked
		            s = s + "android:layout_width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginLeft=""" + str(theUIObjects(i).GetDistanceFromWindowLeft(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentLeft=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        if theUIObjects(i).LockTop(modCodeGenerator.TargetInProcess) = true then
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Top Locked, Bottom Locked
		            s = s + "android:layout_height=""fill_parent""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            
		          else
		            
		            // Top Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            's = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		          
		        else
		          
		          if theUIObjects(i).LockBottom(modCodeGenerator.TargetInProcess) = true then
		            
		            // Bottom Locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginBottom=""" + str(theUIObjects(i).GetDistanceFromWindowBottom(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentBottom=""true""" + EndOfLine
		            
		          else
		            
		            // Neither Bottom nor Top locked
		            s = s + "android:layout_height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_marginTop=""" + str(theUIObjects(i).GetDistanceFromWindowTop(modCodeGenerator.TargetInProcess)) + "px""" + EndOfLine
		            s = s + "android:layout_alignParentTop=""true""" + EndOfLine
		            
		          end if
		        end if
		        
		        s = s + ">" + EndOfLine
		        
		        
		        s = s + "</ListView>" + EndOfLine
		        
		        // Add the global variable
		        s2 = s2 + "private ListView " + theUIObjects(i).ISCClassLocalAndroidName + ";" + EndOfLine
		        s2 = s2 + "private ArrayAdapter<String> " + theUIObjects(i).ISCClassLocalAndroidName + "listAdapter;" + EndOfLine
		        s2 = s2 + "private String " + theUIObjects(i).ISCClassLocalAndroidName + "SelectedItem;" + EndOfLine
		        
		        // Add the init code to s3
		        
		        //iscWindow1ListBox0 = (ListView)this.findViewById(R.id.iscWindow1ListBox0);
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + " = (ListView)this.findViewById(R.id." + theUIObjects(i).ISCClassLocalAndroidName +");" + EndOfLine
		        
		        //String[] planets = new String[] { };
		        s3 = s3 + "String[] " + theUIObjects(i).ISCClassLocalAndroidName + "Strings = new String[] { };" + EndOfLine
		        
		        //ArrayList<String> planetList = new ArrayList<String>();
		        s3 = s3 + "ArrayList<String> " + theUIObjects(i).ISCClassLocalAndroidName + "List = new ArrayList<String>();" + EndOfLine
		        
		        //planetList.addAll( Arrays.asList(planets) );
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + "List.addAll(Arrays.asList(" + theUIObjects(i).ISCClassLocalAndroidName + _
		        "Strings) );" + EndOfLine
		        
		        //iscWindow1ListBox0listAdapter = new ArrayAdapter<String>(this,R.layout.listboxrow, planetList);
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + "listAdapter = new ArrayAdapter<String>(this,R.layout.listboxrow," + _
		        theUIObjects(i).ISCClassLocalAndroidName + "List);" + EndOfLine
		        
		        //iscWindow1ListBox0.setAdapter(iscWindow1ListBox0listAdapter);
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + ".setAdapter(" + theUIObjects(i).ISCClassLocalAndroidName + _
		        "listAdapter);" + EndOfLine
		        
		        
		        // Add Clicked to S3:
		        'iscWindow1ListBox0.setOnItemClickListener(new OnItemClickListener() {
		        'public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
		        'String tempStr = (String) ((TextView) view).getText();
		        '}
		        '});
		        
		        
		        
		        // Add the init code to s3
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + ".setOnItemClickListener(new OnItemClickListener() {" + EndOfLine
		        s3 = s3 + "@Override" + EndOfLine
		        s3 = s3 + "public void onItemClick(AdapterView<?> parent, View view, int position, long id) {" + EndOfLine
		        // Set the clicked text
		        s3 = s3 + theUIObjects(i).ISCClassLocalAndroidName + "SelectedItem = (String) ((TextView) view).getText();" + EndOfLine
		        // Call the clicked
		        s3 = s3 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s3 = s3 + "}" + EndOfLine
		        s3 = s3 + "});" + EndOfLine
		        
		      end if
		      
		    next
		  end if
		  
		  
		  
		  // End the Layout
		  s = s + "</RelativeLayout>" + EndOfLine
		  
		  // Write the Layout to file
		  dim t as TextOutputStream
		  dim f2 as FolderItem
		  f2 = modCodeGenerator.AndroidLayoutFolder.child(Lowercase(GetCodeName) + "layout.xml")
		  If f2 <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(s)
		    t.Close
		  End if
		  
		  // Insert the variable code
		  AndroidInsertCodeAtMarker(s2, "//EndOfGlobalVariables")
		  
		  
		  // Add the background color
		  s3 = s3 + "findViewById(R.id." + Lowercase(GetCodeName) + ").setBackgroundColor(Color.argb(255, " + _
		  str(theWindowObject.BackgroundColor(modCodeGenerator.TargetInProcess).red) + ", " + _
		  str(theWindowObject.BackgroundColor(modCodeGenerator.TargetInProcess).Green) + ", " + _
		  str(theWindowObject.BackgroundColor(modCodeGenerator.TargetInProcess).Blue) + "));" + EndOfLine
		  
		  
		  // Insert the function code
		  s3 = s3 + "//" + GetCodeName + "Opened" + EndOfLine
		  
		  s3 = s3 + "}"+ EndOfLine
		  AndroidInsertCodeAtMarker(s3, "//EndOfFunctions")
		  
		  
		  
		  
		  setCodeToCallThisObjectForName("Open", GetCodeName + "();")
		  
		  // Add the window closed event function
		  
		  's = "private function " + GetCodeName + "Closed" + "():void" + EndOfLine
		  's = s + "{" + EndOfLine
		  's = s + "//" + GetCodeName + "Closed" + EndOfLine
		  's = s + "}" + EndOfLine + EndOfLine
		  'FlexWebInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateFlexWebCode(theOrigin as string)
		  '<!--EndOfMXML-->
		  dim s as string
		  dim s2 as string
		  
		  dim i as integer
		  
		  // Start the panel
		  s = "<me:DraggablePanel id=""" + theWindowObject.ISCClassLocalPythonName + """ height=""" + str(theWindowObject.Height(modCodeGenerator.TargetInProcess)+21) + _
		  """ width=""" + str(theWindowObject.Width(modCodeGenerator.TargetInProcess)) + """ title=""" + theWindowObject.Text(modCodeGenerator.TargetInProcess) + _
		  """ x=""20"" y=""20"" visible=""false"" layout=""absolute"" hide=""" + GetCodeName + "Closed()"">" + EndOfLine
		  
		  // Add the controls to the panel
		  // Loop through and create all the controlls
		  if theUIObjects.Ubound > -1 then
		    for i = 0 to theUIObjects.Ubound
		      // Insert the buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcButton then
		        s = s + "<s:Button x=""" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        """ y=""" + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + _
		        """ label=""" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + _
		        """ width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess))
		        
		        if theUIObjects(i).Height(modCodeGenerator.TargetInProcess) < 21 then
		          s = s + """ height=""" + "21"
		        else
		          s = s + """ height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess))
		        end if
		        
		        s = s + """ id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ click=""" + GetCodeName + theUIObjects(i).ContentOutputName + "()" +_
		        """ />" + EndOfLine
		        
		        s2 = "private function " + GetCodeName + theUIObjects(i).ContentOutputName + "():void" + EndOfLine
		        s2 = s2 + "{" + EndOfLine
		        s2 = s2 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s2 = s2 + "}" + EndOfLine + EndOfLine
		        FlexWebInsertCodeAtMarker(s2, "//EndOfFunctions")
		        
		      end if
		      
		      // Insert the Color Buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcColorButton then
		        
		        s = s + "<mx:ColorPicker x=""" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        """ y=""" + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + _
		        """ width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess))
		        
		        
		        s = s + """ height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess))
		        
		        
		        s = s + """ id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ change=""" + GetCodeName + theUIObjects(i).ContentOutputName + "(event)" +_
		        """ />" + EndOfLine
		        
		        s2 = "private function " + GetCodeName + theUIObjects(i).ContentOutputName + "(event:ColorPickerEvent):void" + EndOfLine
		        s2 = s2 + "{" + EndOfLine
		        s2 = s2 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s2 = s2 + "}" + EndOfLine + EndOfLine
		        FlexWebInsertCodeAtMarker(s2, "//EndOfFunctions")
		        
		      end if
		      
		      // Insert the Canvases
		      if theUIObjects(i).ControlType = theUIObjects(i).kcCanvas then
		        
		        s = s + "<mx:Canvas x=""" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        """ y=""" + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + _
		        """ width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess))
		        
		        
		        s = s + """ height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess))
		        
		        
		        s = s + """ id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ click=""" + GetCodeName + theUIObjects(i).ContentOutputName + "()" +_
		        """ />" + EndOfLine
		        
		        s2 = "private function " + GetCodeName + theUIObjects(i).ContentOutputName + "():void" + EndOfLine
		        s2 = s2 + "{" + EndOfLine
		        s2 = s2 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s2 = s2 + "}" + EndOfLine + EndOfLine
		        FlexWebInsertCodeAtMarker(s2, "//EndOfFunctions")
		        
		      end if
		      
		      // Insert the labels
		      if theUIObjects(i).ControlType = theUIObjects(i).kcLabel then
		        s = s + "<s:Label x=""" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        """ y=""" + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + _
		        """ text=""" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + _
		        """ width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + _
		        """ height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + _
		        """ id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ />" + EndOfLine
		      end if
		      
		      // Insert the Textboxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextBox then
		        
		        s = s + "<s:TextInput x=""" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        """ y=""" + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + _
		        """ text=""" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + _
		        """ width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + _
		        """ height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + _
		        """ id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ change=""" + GetCodeName + theUIObjects(i).ContentOutputName + "()" +_
		        """ />" + EndOfLine
		        
		        s2 = "private function " + GetCodeName + theUIObjects(i).ContentOutputName + "():void" + EndOfLine
		        s2 = s2 + "{" + EndOfLine
		        s2 = s2 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s2 = s2 + "}" + EndOfLine + EndOfLine
		        FlexWebInsertCodeAtMarker(s2, "//EndOfFunctions")
		        
		      end if
		      
		      // Insert the Textfields
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextField then
		        
		        s = s + "<s:TextArea x=""" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        """ y=""" + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + _
		        """ text=""" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + _
		        """ width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + _
		        """ height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + _
		        """ id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ />" + EndOfLine
		        
		      end if
		      
		      // Insert the Progress Bars
		      if theUIObjects(i).ControlType = theUIObjects(i).kcProgressBar then
		        
		        s = s + "<mx:ProgressBar x=""" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        """ y=""" + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + _
		        """ label=""" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + _
		        """ width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + _
		        """ height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + _
		        """ id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ mode=""" + "manual" + _
		        """ maximum=""" + "100" + _
		        """ />" + EndOfLine
		        
		      end if
		      
		      
		    next
		  end if
		  
		  
		  // End the Panel
		  s = s + "</me:DraggablePanel>" + EndOfLine
		  
		  // Insert the MXML  <!--EndOfMXML-->
		  
		  FlexWebInsertCodeAtMarker(s, "<!--EndOfMXML-->")
		  
		  
		  
		  // Add the Window open funciton
		  
		  s = "private function " + GetCodeName + "():void" + EndOfLine
		  s = s + "{" + EndOfLine
		  s = s + theWindowObject.ISCClassLocalPythonName + ".visible=true;" + EndOfLine
		  s = s + "//" + GetCodeName + "Done" + EndOfLine
		  s = s + "//" + GetCodeName + "Opened" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  FlexWebInsertCodeAtMarker(s, "//EndOfFunctions")
		  setCodeToCallThisObjectForName("Open", GetCodeName + "()")
		  
		  // Add the window closed event function
		  
		  s = "private function " + GetCodeName + "Closed" + "():void" + EndOfLine
		  s = s + "{" + EndOfLine
		  s = s + "//" + GetCodeName + "Closed" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  FlexWebInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateiOSCode(theOrigin as string)
		  dim s as string
		  dim s2 as string
		  dim s3 as string
		  
		  dim i as integer
		  
		  if modCodeGenerator.BuildingForiPad = true then
		    modCodeGenerator.TargetInProcess = app.kpiOSiPad
		  end if
		  
		  
		  // Add controls to delegate header
		  if theUIObjects.Ubound > -1 then
		    s = ""
		    for i = 0 to theUIObjects.Ubound
		      // Insert the buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcButton then
		        
		        s = s + "UIButton *" + theUIObjects(i).ISCiOSName + ";" + EndOfLine
		        
		      end if
		      
		      // Insert the Color Buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcColorButton then
		        
		        
		      end if
		      
		      // Insert the Canvases
		      if theUIObjects(i).ControlType = theUIObjects(i).kcCanvas then
		        
		        s = s + "UIImageView *" + theUIObjects(i).ISCiOSName + ";" + EndOfLine
		        
		      end if
		      
		      // Insert the labels
		      if theUIObjects(i).ControlType = theUIObjects(i).kcLabel then
		        
		        s = s + "UILabel *" + theUIObjects(i).ISCiOSName + ";" + EndOfLine
		        
		      end if
		      
		      // Insert the WebBrowsers
		      if theUIObjects(i).ControlType = theUIObjects(i).kcWebBrowser then
		        
		        s = s + "UIWebView *" + theUIObjects(i).ISCiOSName + ";" + EndOfLine
		        
		      end if
		      
		      // Insert the Textboxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextBox then
		        
		        s = s + "UITextField *" + theUIObjects(i).ISCiOSName + ";" + EndOfLine
		        
		      end if
		      
		      // Insert the Textfields
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextField then
		        
		        s = s +"UITextField *" + theUIObjects(i).ISCiOSName + ";" + EndOfLine
		        
		      end if
		      
		      // Insert the Progress Bars
		      if theUIObjects(i).ControlType = theUIObjects(i).kcProgressBar then
		        
		        s = s + "UIProgressView *" + theUIObjects(i).ISCiOSName + ";" + EndOfLine
		        
		      end if
		      
		      
		    next
		  end if
		  
		  
		  iOSHInsertCodeAtMarker(s, "//EndUIVariables")
		  
		  
		  // Create window creation function
		  
		  s = "- (void)" + GetCodeName + " {" + EndOfLine
		  s = s + "window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];" + EndOfLine
		  s = s + "window.backgroundColor = [UIColor whiteColor];" + EndOfLine + EndOfLine
		  
		  
		  
		  // Add controls to be created in the window
		  if theUIObjects.Ubound > -1 then
		    for i = 0 to theUIObjects.Ubound
		      // Insert the buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcButton then
		        
		        s = s + theUIObjects(i).ISCiOSName + " = [UIButton buttonWithType:UIButtonTypeRoundedRect];" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".frame = CGRectMake(" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + ");" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + " setTitle:@""" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + """ forState:UIControlStateNormal];" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + " addTarget:self action:@selector(" + GetCodeName + theUIObjects(i).ContentOutputName + ") forControlEvents:UIControlEventTouchUpInside];"
		        s = s + "[window addSubview:" + theUIObjects(i).ISCiOSName + "];" + EndOfLine
		        
		        s2 = "- (void)" + GetCodeName + theUIObjects(i).ContentOutputName + " {" + EndOfLine
		        s2 = s2 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s2 = s2 + "}" + EndOfLine + EndOfLine
		        iOSMInsertCodeAtMarker(s2, "//EndOfFunctions")
		        
		      end if
		      
		      // Insert the Color Buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcColorButton then
		        
		        
		      end if
		      
		      // Insert the Canvases
		      if theUIObjects(i).ControlType = theUIObjects(i).kcCanvas then
		        
		        s = s + theUIObjects(i).ISCiOSName + " = [UIButton buttonWithType:UIButtonTypeCustom];" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".frame = CGRectMake(" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + ");" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + " setTitle:@""" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + """ forState:UIControlStateNormal];" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + " addTarget:self action:@selector(" + GetCodeName + theUIObjects(i).ContentOutputName + ") forControlEvents:UIControlEventTouchUpInside];" + EndOfLine
		        s = s + "[window addSubview:" + theUIObjects(i).ISCiOSName + "];" + EndOfLine
		        
		        s2 = "- (void)" + GetCodeName + theUIObjects(i).ContentOutputName + " {" + EndOfLine
		        s2 = s2 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s2 = s2 + "}" + EndOfLine + EndOfLine
		        iOSMInsertCodeAtMarker(s2, "//EndOfFunctions")
		        
		        
		        // For using Actual Canvases
		        's = s + theUIObjects(i).ISCiOSName + " = [[UIImageView alloc] init];" + EndOfLine
		        's = s + theUIObjects(i).ISCiOSName + ".frame = CGRectMake(" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + ");" + EndOfLine
		        's = s + "[" + theUIObjects(i).ISCiOSName + " addTarget:self action:@selector(" + GetCodeName + theUIObjects(i).ContentOutputName + ") forControlEvents:UIControlEventTouchUpInside];" + EndOfLine
		        's = s + "[window addSubview:" + theUIObjects(i).ISCiOSName + "];" + EndOfLine
		        '
		        's2 = "- (void)" + GetCodeName + theUIObjects(i).ContentOutputName + " {" + EndOfLine
		        's2 = s2 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        's2 = s2 + "}" + EndOfLine + EndOfLine
		        'iOSMInsertCodeAtMarker(s2, "//EndOfFunctions")
		        
		      end if
		      
		      // Insert the labels
		      if theUIObjects(i).ControlType = theUIObjects(i).kcLabel then
		        
		        s = s + theUIObjects(i).ISCiOSName + " = [[UILabel alloc] init];" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".frame = CGRectMake(" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + ");" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".textAlignment = UITextAlignmentCenter;" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".text = @""" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + """;" + EndOfLine
		        s = s + "[window addSubview:" + theUIObjects(i).ISCiOSName + "];" + EndOfLine
		        
		      end if
		      
		      // Insert the WebBrowsers
		      if theUIObjects(i).ControlType = theUIObjects(i).kcWebBrowser then
		        
		        s = s + theUIObjects(i).ISCiOSName + " = [[UIWebView alloc] init];" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".frame = CGRectMake(" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + ");" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".delegate = self;" + EndOfLine
		        s = s + "[window addSubview:" + theUIObjects(i).ISCiOSName + "];" + EndOfLine
		        
		      end if
		      
		      // Insert the Textboxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextBox then
		        
		        s = s + theUIObjects(i).ISCiOSName + " = [[UITextField alloc] init];" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".frame = CGRectMake(" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + ");" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + ".layer setBackgroundColor:[[UIColor whiteColor] CGColor]];" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + ".layer setBorderColor:[[UIColor grayColor] CGColor]];" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + ".layer setBorderWidth: 1.0];" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + ".layer setCornerRadius:5.0];" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + ".layer setMasksToBounds:YES];" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".keyboardType = UIKeyboardTypeDefault;" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".returnKeyType = UIReturnKeyDone;" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".delegate = self;" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + " setText:@""" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + """];" + EndOfLine
		        s = s + "[window addSubview:" + theUIObjects(i).ISCiOSName + "];" + EndOfLine
		        
		      end if
		      
		      // Insert the Textfields
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextField then
		        
		        s = s + theUIObjects(i).ISCiOSName + " = [[UITextField alloc] init];" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".frame = CGRectMake(" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + ");" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + ".layer setBackgroundColor:[[UIColor whiteColor] CGColor]];" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + ".layer setBorderColor:[[UIColor grayColor] CGColor]];" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + ".layer setBorderWidth: 1.0];" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + ".layer setCornerRadius:5.0];" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + ".layer setMasksToBounds:YES];" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".keyboardType = UIKeyboardTypeDefault;" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".returnKeyType = UIReturnKeyDone;" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".delegate = self;" + EndOfLine
		        s = s + "[" + theUIObjects(i).ISCiOSName + " setText:@""" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + """];" + EndOfLine
		        s = s + "[window addSubview:" + theUIObjects(i).ISCiOSName + "];" + EndOfLine
		        
		      end if
		      
		      // Insert the Progress Bars
		      if theUIObjects(i).ControlType = theUIObjects(i).kcProgressBar then
		        
		        s = s + theUIObjects(i).ISCiOSName + " = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];" + EndOfLine
		        s = s + theUIObjects(i).ISCiOSName + ".frame = CGRectMake(" + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + ");" + EndOfLine
		        s = s + "[window addSubview:" + theUIObjects(i).ISCiOSName + "];" + EndOfLine
		        
		      end if
		      
		      
		    next
		  end if
		  
		  s = s + "[window makeKeyAndVisible];" + EndOfLine + EndOfLine
		  
		  s = s + "//" + GetCodeName + "Done" + EndOfLine
		  s = s + "//" + GetCodeName + "Opened" + EndOfLine
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  iOSMInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		  setCodeToCallThisObjectForName("Open", "[self " + GetCodeName + "];")
		  
		  if modCodeGenerator.BuildingForiPad = true then
		    modCodeGenerator.TargetInProcess = app.kpiOSiPhone
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateJavaScriptWebCode(theOrigin as string)
		  '<!--EndOfMXML-->
		  dim s as string
		  dim s2 as string
		  
		  dim i as integer
		  
		  // Start the div panel
		  s = "<div id=""" + theWindowObject.ISCClassLocalPythonName + """ class=""window"" style=""visibility:hidden;height:" + _
		  str(theWindowObject.Height(modCodeGenerator.TargetInProcess) + 28) + "px;width:" + _
		  str(theWindowObject.Width(modCodeGenerator.TargetInProcess)) + "px;x:20px;y:20px;"">" + EndOfLine
		  s = s + "<h1>" + theWindowObject.Text(modCodeGenerator.TargetInProcess) + "</h1>" + EndOfLine
		  s = s + "<div class=""windowinner"">" + EndOfLine
		  
		  
		  // Set the window color
		  
		  dim WinColorS as string
		  //s = s + "//WindowColor" + EndOfLine
		  WinColorS = "background: rgb(" + str(theWindowObject.BackgroundColor(modCodeGenerator.TargetInProcess).red) + "," + _
		  str(theWindowObject.BackgroundColor(modCodeGenerator.TargetInProcess).Green) + "," + _
		  str(theWindowObject.BackgroundColor(modCodeGenerator.TargetInProcess).Blue) + ");" + EndOfLine
		  HTML5InsertCodeAtMarker(WinColorS, "//WindowColor")
		  
		  
		  // this is where the controlls go
		  
		  
		  
		  // Add the controls to the panel
		  // Loop through and create all the controlls
		  if theUIObjects.Ubound > -1 then
		    for i = 0 to theUIObjects.Ubound
		      // Insert the buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcButton then
		        
		        // The Div and Form
		        s = s + "<div style=""position: absolute; left: " + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        "px; top: " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess) + 0) + "px;"">" + EndOfLine
		        
		        //s = s + "<form>" + EndOfLine
		        s = s + "<input type=""button"" id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ onClick=""" + GetCodeName + theUIObjects(i).ContentOutputName + "()" + _
		        """ value=""" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) +  _
		        """style=""width:" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px;" + _
		        " height:" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px""" + _
		        "/>" + EndOfLine
		        //s = s + "</form>" + EndOfLine
		        s = s + "</div>" + EndOfLine
		        
		        // The Function
		        s2 = "function " + GetCodeName + theUIObjects(i).ContentOutputName + "()" + EndOfLine
		        s2 = s2 + "{" + EndOfLine
		        s2 = s2 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s2 = s2 + "}" + EndOfLine + EndOfLine
		        HTML5InsertCodeAtMarker(s2, "//EndOfFunctions")
		        
		      end if
		      
		      // Insert the labels
		      if theUIObjects(i).ControlType = theUIObjects(i).kcLabel then
		        // The Div and Form
		        s = s + "<div style=""position: absolute; left: " + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        "px; top: " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess) + 28) + "px;" + _
		        " width: " + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px;" + _
		        " height: " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px;" + _
		        """>" + EndOfLine
		        //s = s + "<form>" + EndOfLine
		        s = s + "<label id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """>" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + "</label>" + EndOfLine
		        //s = s + "</form>" + EndOfLine
		        s = s + "</div>" + EndOfLine
		      end if
		      
		      // Insert the Textboxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextBox then
		        
		        // The Div and Form
		        s = s + "<div style=""position: absolute; left: " + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        "px; top: " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess) + 0) + "px;"">" + EndOfLine
		        //s = s + "<form>" + EndOfLine
		        s = s + "<input type=""text"" id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ style='width:" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + _
		        "px;' value=""" +  str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + """ onChange=""" + _
		        GetCodeName + theUIObjects(i).ContentOutputName + "()"">" + EndOfLine
		        //s = s + "</form>" + EndOfLine
		        s = s + "</div>" + EndOfLine
		        
		        // The Function
		        s2 = "function " + GetCodeName + theUIObjects(i).ContentOutputName + "()" + EndOfLine
		        s2 = s2 + "{" + EndOfLine
		        s2 = s2 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s2 = s2 + "}" + EndOfLine + EndOfLine
		        HTML5InsertCodeAtMarker(s2, "//EndOfFunctions")
		        
		        
		      end if
		      
		      // Insert the Listboxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcListBox then
		        
		        // The Div and Form
		        s = s + "<div style=""position: absolute; left: " + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        "px; top: " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess) + 0) + "px;"">" + EndOfLine
		        //s = s + "<form>" + EndOfLine
		        s = s + "<select id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		         """ name=""" + theUIObjects(i).ISCClassLocalPythonName + _
		         """ size=""2""" + _
		        """ style='width:" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + "px;" + _
		        "height:" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + "px;'" + _
		        "' onChange=""" + _
		        GetCodeName + theUIObjects(i).ContentOutputName + "()"">" + EndOfLine
		        
		        s = s + "</select>" + EndOfLine
		        s = s + "</div>" + EndOfLine
		        
		        // The Function
		        s2 = "function " + GetCodeName + theUIObjects(i).ContentOutputName + "()" + EndOfLine
		        s2 = s2 + "{" + EndOfLine
		        s2 = s2 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s2 = s2 + "}" + EndOfLine + EndOfLine
		        HTML5InsertCodeAtMarker(s2, "//EndOfFunctions")
		        
		        
		      end if
		      
		      // Insert the Textfields
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextField then
		        
		        // The Div and Form
		        s = s + "<div style=""position: absolute; left: " + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        "px; top: " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess) + 28) + "px;"">" + EndOfLine
		        //s = s + "<form>" + EndOfLine
		        s = s + "<textarea id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ style='width:" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + _
		        ";height:" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + _
		        """;'>" + str(theUIObjects(i).Text(modCodeGenerator.TargetInProcess)) + "</textarea>" + EndOfLine
		        //s = s + "</form>" + EndOfLine
		        s = s + "</div>" + EndOfLine
		        
		      end if
		      
		      // Insert the Progress Bars
		      if theUIObjects(i).ControlType = theUIObjects(i).kcProgressBar then
		        
		        // The Div and Form
		        s = s + "<div style=""position: absolute; left: " + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        "px; top: " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess) + 28) + "px;"">" + EndOfLine
		        //s = s + "<form>" + EndOfLine
		        s = s + "<progress id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ style='width:" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + _
		        ";height:" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + _
		        """;' value=""0"" max=""100"">" + EndOfLine + "</progress>" + EndOfLine
		        //s = s + "</form>" + EndOfLine
		        s = s + "</div>" + EndOfLine
		        
		      end if
		      
		      // Insert the Canvases
		      if theUIObjects(i).ControlType = theUIObjects(i).kcCanvas then
		        
		        // The Div and Form
		        s = s + "<div style=""position: absolute; left: " + str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + _
		        "px; top: " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess) + 28) + "px;"">" + EndOfLine
		        
		        s = s + "<canvas id=""" + theUIObjects(i).ISCClassLocalPythonName + _
		        """ width=""" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + _
		        "px"" height=""" + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess)) + _
		        "px"" onClick=""" + GetCodeName + theUIObjects(i).ContentOutputName + "()" + _
		        """/></canvas>" + EndOfLine
		        
		        s = s + "</div>" + EndOfLine
		        
		        // The Function
		        s2 = "function " + GetCodeName + theUIObjects(i).ContentOutputName + "()" + EndOfLine
		        s2 = s2 + "{" + EndOfLine
		        s2 = s2 + "//" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine
		        s2 = s2 + "}" + EndOfLine + EndOfLine
		        HTML5InsertCodeAtMarker(s2, "//EndOfFunctions")
		        
		      end if
		      
		    next
		  end if
		  
		  
		  // End the Panel
		  s = s + "</div>" + EndOfLine
		  s = s + "</div>" + EndOfLine
		  
		  // Insert the HTML
		  
		  HTML5InsertCodeAtMarker(s, "<!-- EndOfHTML -->")
		  
		  // Add the Window open funciton
		  
		  s = "function " + GetCodeName + "()" + EndOfLine
		  s = s + "{" + EndOfLine
		  s = s + "new Draggable('" + theWindowObject.ISCClassLocalPythonName + "');" + EndOfLine
		  s = s + "document.getElementById(""" + theWindowObject.ISCClassLocalPythonName + """).style.visibility = ""visible"";" + EndOfLine
		  s = s + "//" + GetCodeName + "Done" + EndOfLine
		  s = s + "//" + GetCodeName + "Opened" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  s = s + "function " + GetCodeName + "Closed()" + EndOfLine
		  s = s + "{" + EndOfLine
		  s = s + "//" + GetCodeName + "Closed" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  HTML5InsertCodeAtMarker(s, "//EndOfFunctions")
		  setCodeToCallThisObjectForName("Open", GetCodeName + "();")
		  
		  // Add the window closed event function
		  // No closed event for HTML5 for now
		  's = "private function " + GetCodeName + "Closed" + "():void" + EndOfLine
		  's = s + "{" + EndOfLine
		  's = s + "//" + GetCodeName + "Closed" + EndOfLine
		  's = s + "}" + EndOfLine + EndOfLine
		  'FlexWebInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GeneratePythonDesktopCode(theOrigin as string)
		  dim s as string
		  dim varS as string
		  
		  // Insert the global variables
		  // Window Variable
		  s = s + "" + theWindowObject.ISCClassLocalPythonName + " = gtk.Window(gtk.WINDOW_TOPLEVEL)" + EndOfLine
		  
		  // Fixed container for this window
		  s = s + " " + theWindowObject.ISCClassLocalPythonName + "Fixed = gtk.Fixed()" + EndOfLine
		  
		  dim tempVar as string
		  
		  dim i as integer
		  if theUIObjects.Ubound > -1 then
		    for i = 0 to theUIObjects.Ubound
		      // Insert the button variables
		      if theUIObjects(i).ControlType = theUIObjects(i).kcButton then
		        tempVar = theUIObjects(i).ISCClassLocalPythonName + " = gtk.Button(""" + theUIObjects(i).Text(modCodeGenerator.TargetInProcess) + """)" + EndOfLine
		        s = s + " " + tempVar
		        varS = varS + " " + "thisiscApp1."  + tempVar
		      end if
		      
		      // Labels
		      if theUIObjects(i).ControlType = theUIObjects(i).kcLabel then
		        tempVar =  theUIObjects(i).ISCClassLocalPythonName + " =gtk.Label(""" + theUIObjects(i).Text(modCodeGenerator.TargetInProcess) + """)" + EndOfLine
		        s = s + " " + tempVar
		        varS = varS + " " + "thisiscApp1."  + tempVar
		      end if
		      
		      // Textboxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextBox then
		        tempVar = theUIObjects(i).ISCClassLocalPythonName + " = gtk.Entry()" + EndOfLine
		        s = s + " " + tempVar
		        varS = varS + " " + "thisiscApp1."  + tempVar
		      end if
		      
		      // TextFields
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextField then
		        tempVar = theUIObjects(i).ISCClassLocalPythonName + " = gtk.TextView(buffer=None)" + EndOfLine
		        s = s + " " + tempVar
		        varS = varS + " " + "thisiscApp1."  + tempVar
		      end if
		      
		      // Progress Bars
		      if theUIObjects(i).ControlType = theUIObjects(i).kcProgressBar then
		        tempVar =  theUIObjects(i).ISCClassLocalPythonName + " = gtk.ProgressBar()" + EndOfLine
		        s = s + " " + tempVar
		        varS = varS + " " + "thisiscApp1."  + tempVar
		      end if
		      
		      // Web Browsers
		      if theUIObjects(i).ControlType = theUIObjects(i).kcWebBrowser then
		        //tempVar =  theUIObjects(i).ISCClassLocalPythonName + " = gtk.ProgressBar()" + EndOfLine
		        //s = s + " " + tempVar
		        //varS = varS + " " + "thisiscApp1."  + tempVar
		      end if
		      
		      // Color Buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcColorButton then
		        tempVar =  theUIObjects(i).ISCClassLocalPythonName + " = gtk.ColorButton(color=gtk.gdk.Color(0,0,0))" + EndOfLine
		        s = s + " " + tempVar
		        varS = varS + " " + "thisiscApp1."  + tempVar
		      end if
		      
		      // Canvases
		      if theUIObjects(i).ControlType = theUIObjects(i).kcCanvas then
		        tempVar =  theUIObjects(i).ISCClassLocalPythonName + " = gtk.Image()" + EndOfLine
		        s = s + " " + tempVar
		        varS = varS + " " + "thisiscApp1."  + tempVar
		      end if
		      
		      
		    next
		  end if
		  
		  PythonInsertCodeAtMarker(s, "#EndOfGlobalVariables")
		  
		  // Insert the Window creation function
		  s = "def " + GetCodeName + "():" + EndOfLine
		  s = s + varS
		  s = s + " " + theWindowObject.ISCPythonName + " = gtk.Window(gtk.WINDOW_TOPLEVEL)" + EndOfLine
		  s = s + " " + theWindowObject.ISCPythonName + "Fixed = gtk.Fixed()" + EndOfLine
		  s = s + " " + theWindowObject.ISCPythonName + ".set_title(""" + theWindowObject.Text(modCodeGenerator.TargetInProcess) + """)" + EndOfLine
		  s = s + " " + theWindowObject.ISCPythonName + ".set_default_size(" + str(theWindowObject.Width(modCodeGenerator.TargetInProcess)) + ", " + str(theWindowObject.Height(modCodeGenerator.TargetInProcess)) + ")" + EndOfLine
		  's = s + " " + theWindowObject.ISCPythonName + ".set_resizable(False)" + EndOfLine
		  s = s + " " + theWindowObject.ISCPythonName + ".add(" + theWindowObject.ISCPythonName + "Fixed" + ")" + EndOfLine
		  s = s + " " + theWindowObject.ISCPythonName + "Fixed.width = " + str(theWindowObject.Width(modCodeGenerator.TargetInProcess)) + EndOfLine
		  s = s + " " + theWindowObject.ISCPythonName + "Fixed.height = " + str(theWindowObject.Height(modCodeGenerator.TargetInProcess)) + EndOfLine
		  s = s + " " + theWindowObject.ISCPythonName + ".connect(""delete_event"", " + GetCodeName + "Closed"  + ")" + EndOfLine
		  s = s + " " + theWindowObject.ISCPythonName + ".set_resizable(False)" + EndOfLine
		  s = s + " " + theWindowObject.ISCPythonName + "Fixed.show()" + EndOfLine
		  's = s + " #" + GetCodeName + "Opened" + EndOfLine + EndOfLine
		  
		  // Loop through and create all the controlls
		  if theUIObjects.Ubound > -1 then
		    for i = 0 to theUIObjects.Ubound
		      // Insert the buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcButton then
		        s = s + " " + theWindowObject.ISCPythonName + "Fixed.put(" + theUIObjects(i).ISCPythonName + ", " + _
		        str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".set_size_request(" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess))  + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".connect(""clicked"", " + GetCodeName + theUIObjects(i).ContentOutputName + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".show()" + EndOfLine
		      end if
		      
		      // Insert the Color Buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcColorButton then
		        s = s + " " + theWindowObject.ISCPythonName + "Fixed.put(" + theUIObjects(i).ISCPythonName + ", " + _
		        str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".set_size_request(" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess))  + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".connect(""color-set"", " + GetCodeName + theUIObjects(i).ContentOutputName + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".show()" + EndOfLine
		      end if
		      
		      // Insert the Canvases
		      if theUIObjects(i).ControlType = theUIObjects(i).kcCanvas then
		        
		        s = s + " " + theUIObjects(i).ISCClassLocalPythonName + "EventBox = gtk.EventBox()" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCClassLocalPythonName + "EventBox.set_size_request(" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess))  + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCClassLocalPythonName + "EventBox.connect(""button_press_event"", " + GetCodeName + theUIObjects(i).ContentOutputName + ")" + EndOfLine
		        
		        s = s + " " + theUIObjects(i).ISCPythonName + ".set_size_request(" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess))  + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCClassLocalPythonName + "EventBox.add(" + theUIObjects(i).ISCPythonName + ")" + EndOfLine
		        
		        s = s + " " + theWindowObject.ISCPythonName + "Fixed.put(" + theUIObjects(i).ISCClassLocalPythonName + "EventBox" + ", " + _
		        str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ")" + EndOfLine
		        
		        s = s + " " + theUIObjects(i).ISCPythonName + ".show()" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCClassLocalPythonName + "EventBox.show()" + EndOfLine
		        
		      end if
		      
		      // Insert the labels
		      if theUIObjects(i).ControlType = theUIObjects(i).kcLabel then
		        s = s + " " + theWindowObject.ISCPythonName + "Fixed.put(" + theUIObjects(i).ISCPythonName + ", " + _
		        str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".set_size_request(" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess))  + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".show()" + EndOfLine
		      end if
		      
		      // Insert the Textboxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextBox then
		        s = s + " " + theWindowObject.ISCPythonName + "Fixed.put(" + theUIObjects(i).ISCPythonName + ", " + _
		        str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".set_text(""" + theUIObjects(i).Text(modCodeGenerator.TargetInProcess) + """)" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".set_size_request(" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess))  + ")" + EndOfLine
		        //s = s + " " + theUIObjects(i).ISCPythonName + ".connect(""insert-at-cursor"", " + GetCodeName + theUIObjects(i).ContentOutputName + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".connect(""changed"", " + GetCodeName + theUIObjects(i).ContentOutputName + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".show()" + EndOfLine
		      end if
		      
		      // Insert the Textboxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextField then
		        s = s + " " + theWindowObject.ISCPythonName + "Fixed.put(" + theUIObjects(i).ISCPythonName + ", " + _
		        str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ")" + EndOfLine
		        's = s + " " + theUIObjects(i).ISCPythonName + ".set_text(""" + theUIObjects(i).Text(modCodeGenerator.TargetInProcess) + """)" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".set_size_request(" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess))  + ")" + EndOfLine
		        //s = s + " " + theUIObjects(i).ISCPythonName + ".connect(""insert-at-cursor"", " + GetCodeName + theUIObjects(i).ContentOutputName + ")" + EndOfLine
		        's = s + " " + theUIObjects(i).ISCPythonName + ".connect(""changed"", " + GetCodeName + theUIObjects(i).ContentOutputName + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".show()" + EndOfLine
		      end if
		      
		      // Insert the Progress Bars
		      if theUIObjects(i).ControlType = theUIObjects(i).kcProgressBar then
		        s = s + " " + theWindowObject.ISCPythonName + "Fixed.put(" + theUIObjects(i).ISCPythonName + ", " + _
		        str(theUIObjects(i).X(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Y(modCodeGenerator.TargetInProcess)) + ")" + EndOfLine
		        's = s + " " + theUIObjects(i).ISCPythonName + ".set_text(""" + theUIObjects(i).Text(modCodeGenerator.TargetInProcess) + """)" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".set_size_request(" + str(theUIObjects(i).Width(modCodeGenerator.TargetInProcess)) + ", " + str(theUIObjects(i).Height(modCodeGenerator.TargetInProcess))  + ")" + EndOfLine
		        //s = s + " " + theUIObjects(i).ISCPythonName + ".connect(""changed"", " + GetCodeName + theUIObjects(i).ContentOutputName + ")" + EndOfLine
		        s = s + " " + theUIObjects(i).ISCPythonName + ".show()" + EndOfLine
		      end if
		      
		      
		    next
		  end if
		  
		  // Show the window
		  s = s + " " + theWindowObject.ISCPythonName + ".show()" + EndOfLine
		  s = s + " #" + GetCodeName + "Opened" + EndOfLine
		  
		  
		  s = s + " #" + GetCodeName + "Done" + EndOfLine + EndOfLine
		  
		  setCodeToCallThisObjectForName("Open", GetCodeName + "()")
		  
		  PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		  
		  // Insert the event functions for the controls
		  
		  '"  #" + GetCodeName + "No" + EndOfLine + _
		  
		  // Create window close function
		  s = "def " + GetCodeName + "Closed" + "(self, other):" + EndOfLine
		  s = s + " pass" + EndOfLine
		  s = s + " #" + GetCodeName + "Closed" + EndOfLine + EndOfLine
		  PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		  
		  // Loop through and create all functions to call for all the controls
		  if theUIObjects.Ubound > -1 then
		    for i = 0 to theUIObjects.Ubound
		      // Insert the buttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcButton then
		        s = "def " + GetCodeName + theUIObjects(i).ContentOutputName + "(self):" + EndOfLine
		        s = s + " pass" + EndOfLine
		        s = s + " #" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine + EndOfLine
		        PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		        
		        'def buttonWas(self):
		      end if
		      
		      // Insert the colorbuttons
		      if theUIObjects(i).ControlType = theUIObjects(i).kcColorButton then
		        s = "def " + GetCodeName + theUIObjects(i).ContentOutputName + "(self):" + EndOfLine
		        s = s + " pass" + EndOfLine
		        s = s + " #" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine + EndOfLine
		        PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		        
		        'def buttonWas(self):
		      end if
		      
		      // Insert the Canvases
		      if theUIObjects(i).ControlType = theUIObjects(i).kcCanvas then
		        s = "def " + GetCodeName + theUIObjects(i).ContentOutputName + "(widget, event):" + EndOfLine
		        s = s + " pass" + EndOfLine
		        s = s + " #" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine + EndOfLine
		        PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		        
		        'def buttonWas(self):
		      end if
		      
		      // Insert the labels
		      if theUIObjects(i).ControlType = theUIObjects(i).kcLabel then
		        
		      end if
		      
		      // Insert the Textboxes
		      if theUIObjects(i).ControlType = theUIObjects(i).kcTextBox then
		        s = "def " + GetCodeName + theUIObjects(i).ContentOutputName + "(self):" + EndOfLine
		        s = s + " pass" + EndOfLine
		        s = s + " #" + GetCodeName + theUIObjects(i).ContentOutputName + EndOfLine + EndOfLine
		        PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		      end if
		      
		    next
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddNewUIObject(type as string)
		  dim newUIObject as ilUIObject
		  newUIObject = new ilUIObject
		  
		  select case type
		  case "Button"
		    newUIObject.ControlType = newUIObject.kcButton
		  case "Label"
		    newUIObject.ControlType = newUIObject.kcLabel
		  case "TextBox"
		    newUIObject.ControlType = newUIObject.kcTextBox
		  case "Slider"
		    newUIObject.ControlType = newUIObject.kcSlider
		  case "ProgressBar"
		    newUIObject.ControlType = newUIObject.kcProgressBar
		  case "ColorButton"
		    newUIObject.ControlType = newUIObject.kcColorButton
		  case "TextField"
		    newUIObject.ControlType = newUIObject.kcTextField
		  case "Canvas"
		    newUIObject.ControlType = newUIObject.kcCanvas
		  end select
		  
		  newUIObject.myUniqueID = LocalUniqueIDGenerate
		  newUIObject.parent = me
		  newUIObject.InitControl
		  
		  newUIObject.Name = MakeUniqueName(newUIObject.Name)
		  
		  theUIObjects.Append newUIObject
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddNewUIObjectWithXY(type as string, theX as integer, theY as integer)
		  dim newUIObject as ilUIObject
		  newUIObject = new ilUIObject
		  
		  select case type
		  case "Button"
		    newUIObject.ControlType = newUIObject.kcButton
		  case "Label"
		    newUIObject.ControlType = newUIObject.kcLabel
		  case "TextBox"
		    newUIObject.ControlType = newUIObject.kcTextBox
		  case "Slider"
		    newUIObject.ControlType = newUIObject.kcSlider
		  case "ProgressBar"
		    newUIObject.ControlType = newUIObject.kcProgressBar
		  case "ColorButton"
		    newUIObject.ControlType = newUIObject.kcColorButton
		  case "TextField"
		    newUIObject.ControlType = newUIObject.kcTextField
		  case "Canvas"
		    newUIObject.ControlType = newUIObject.kcCanvas
		  case "WebBrowser"
		    newUIObject.ControlType = newUIObject.kcWebBrowser
		  case "CheckBox"
		    newUIObject.ControlType = newUIObject.kcCheckBox
		  case "ListBox"
		    newUIObject.ControlType = newUIObject.kcListBox
		  end select
		  
		  'MsgBox type
		  
		  newUIObject.myUniqueID = LocalUniqueIDGenerate
		  newUIObject.parent = me
		  newUIObject.InitControlWithXY(theX, theY)
		  
		  newUIObject.Name = MakeUniqueName(newUIObject.Name)
		  
		  theUIObjects.Append newUIObject
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  me.CodeNameBase = "iscWindow"
		  me.BGColor = rgb(0,70,190)
		  me.DisplayName = "Window"
		  me.DisplayCategory = "User Interface"
		  me.Title = "Window"
		  
		  me.Width = 150
		  
		  me.ObjectItems.Append "Open"
		  me.ObjectShowInput.Append true
		  me.ObjectShowOutput.Append false
		  
		  me.ObjectItems.Append "Opened"
		  me.ObjectShowInput.Append false
		  me.ObjectShowOutput.Append true
		  
		  me.ObjectItems.Append "Closed"
		  me.ObjectShowInput.Append false
		  me.ObjectShowOutput.Append true
		  
		  // Init theWindowObject
		  theWindowObject = new ilUIObject
		  theWindowObject.ControlType = theWindowObject.kcWindow
		  theWindowObject.parent = me
		  theWindowObject.myUniqueID = LocalUniqueIDGenerate
		  theWindowObject.InitControl
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteUIObject(theilui as iluiObject)
		  
		  // set the myiluiobject of the CO to nil
		  dim j as integer
		  
		  if ContentFrame(me.Parent).contents.Ubound > - 1 then
		    for j = ContentFrame(me.Parent).contents.Ubound DownTo 0
		      
		      if ContentFrame(me.Parent).contents(j).myilUIObject = theilui then
		        ContentFrame(me.Parent).contents(j).myilUIObject = nil
		      end if
		      
		    next
		  end if
		  
		  
		  // Remove the UI object
		  dim i as integer
		  
		  if theUIObjects.Ubound > -1 then
		    
		    for i = theUIObjects.Ubound DownTo 0
		      
		      if theUIObjects(i) = theilui then
		        theUIObjects.Remove(i)
		      end if
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isNameUnique(theName as String) As boolean
		  dim i as integer
		  dim starterName as string
		  
		  starterName = Lowercase(theName)
		  
		  if theWindowObject.Name = starterName then
		    Return false
		  end if
		  
		  if theUIObjects.Ubound > -1 then
		    for i = 0 to theUIObjects.Ubound
		      if Lowercase(theUIObjects(i).Name) = starterName then
		        Return false
		      end if
		    next
		  end if
		  
		  Return true
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalUniqueIDGenerate() As integer
		  mLocalUniqueID = mLocalUniqueID + 1
		  Return mLocalUniqueID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeUniqueName(baseName as string) As string
		  dim i as integer
		  dim uName as string
		  dim starterName as string
		  
		  if isNameUnique(baseName) then
		    Return baseName
		  else
		    uName = baseName
		    do until isNameUnique(uName)
		      i = i + 1
		      uName = baseName + str(i)
		    loop
		    Return uName
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateControlBlockItems()
		  dim i as integer
		  // Loop through and remove contentobjects with myilUIObject = nil
		  // Loop through the existing contentobjects and update with the data from their ilUIObject
		  if me.Parent.contents.Ubound > 2 then //More than 2 (item 0 will be the window "Open", 1: "Opened", 2: "Closed")
		    for i = me.Parent.contents.Ubound DownTo 3
		      if me.Parent.contents(i).myilUIObject = nil then
		        me.Parent.contents.Remove(i)
		      else
		        TextObject(me.Parent.contents(i)).text = ilUIObject(me.Parent.contents(i).myilUIObject).ContentOutputName
		      end if
		    next
		  end if
		  
		  dim j as integer
		  
		  // Loop through all the iluiobjects that have .hascontentobject = false
		  // Add new content objects, set .hascontentobject to true
		  // Set the myiiuiobject within the new contentobject
		  if theUIObjects.Ubound > -1 then
		    for i = 0 to theUIObjects.Ubound
		      
		      // Check to verify the object does not exist first
		      'for j = 0 to me.Parent.contents.Ubound
		      '
		      'if me.Parent.contents(j).myilUIObject <> nil then
		      'if me.Parent.contents(j).myilUIObject = theUIObjects(i) then
		      '// This uiobject already exists!
		      'theUIObjects(i).HasContentObject = true
		      'end if
		      'end if
		      '
		      'next
		      
		      if theUIObjects(i).HasContentObject = false then
		        'cf.AppendObject new TextObject(tempObj.ObjectItems(i))
		        'cf.contents(cf.contents.Ubound).ShowInput = tempObj.ObjectShowInput(i)
		        'cf.contents(cf.contents.Ubound).ShowOutput = tempObj.ObjectShowOutput(i)
		        
		        'MsgBox "workin!"
		        'MsgBox theUIObjects(i).ContentOutputName
		        
		        if theUIObjects(i).ControlType = theUIObjects(i).kcButton or theUIObjects(i).ControlType = theUIObjects(i).kcTextBox or theUIObjects(i).ControlType = theUIObjects(i).kcColorButton or theUIObjects(i).ControlType = theUIObjects(i).kcCanvas or theUIObjects(i).ControlType = theUIObjects(i).kcListBox then
		          'if ilUIObject(me.Parent.contents(i).myilUIObject).ControlType = ilUIObject(me.Parent.contents(i).myilUIObject).kcButton then
		          me.Parent.AppendObject new TextObject(theUIObjects(i).ContentOutputName)
		          me.Parent.contents(me.Parent.contents.Ubound).ShowInput = false
		          me.Parent.contents(me.Parent.contents.Ubound).ShowOutput = true
		          me.Parent.contents(me.Parent.contents.Ubound).myilUIObject = theUIObjects(i)
		          'MsgBox theUIObjects(i).ContentOutputName
		          theUIObjects(i).HasContentObject = true
		        end if
		        
		        
		        
		      end if
		    next
		  end if
		  
		  frmProject.chartProject.Refresh
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="BGColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="color"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CodeNameBase"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomMessage"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DBObjectType"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayCategory"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayName"
			Group="Behavior"
			Type="String"
			InheritedFrom="ilObjectBase"
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
			Name="MathVariable1"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable2"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable3"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable4"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable5"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable6"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageFromVariable"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mLocalUniqueID"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OriginVariable"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable1"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable2"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable3"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable4"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable5"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable6"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMessageFromVariable"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireOriginVariable"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequirevarControlName"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequirevarWindowName"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UniqueID"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseVariableForMessage"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="varControlName"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="varWindowName"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
