#tag Module
Protected Module modFile
	#tag Method, Flags = &h0
		Sub ClearTheDB()
		  'CREATE TABLE GlobalVars (name text,type text)
		  'CREATE TABLE UIPlatforms (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,iluiobjectsRowID integer,platformConstantNum integer,enabled boolean,height integer,text text,visible boolean,width integer,x integer,y integer)'CREATE TABLE contentobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,framesRowID integer,name text,input boolean,output boolean)
		  'CREATE TABLE frames (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,x integer,y integer,width integer,title text,ilobjecttype text)
		  'CREATE TABLE ilobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, customMessage text, MathVariable1 text, MathVariable2 text, MessageFromVariable text, OriginVariable text, UseVariableForMessage boolean, varControlName text, varWindowName text, windowObjectRowID integer, frameRowID integer)
		  'CREATE TABLE iluiobjects (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,ilobjectsRowID integer,controlType integer,HasContentObject boolean,name text)
		  'CREATE TABLE links (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT,sourceCO integer,destinationCO integer)
		  
		  if theDB.Connect() then
		    theDB.SQLExecute("DELETE * FROM GlobalVars")
		    theDB.SQLExecute("DELETE * FROM ProjectInfo")
		    theDB.SQLExecute("DELETE * FROM UIPlatforms")
		    theDB.SQLExecute("DELETE * FROM contentobjects")
		    theDB.SQLExecute("DELETE * FROM frames")
		    theDB.SQLExecute("DELETE * FROM ilobjects")
		    theDB.SQLExecute("DELETE * FROM iluiobjects")
		    theDB.SQLExecute("DELETE * FROM links")
		    theDB.Commit
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCOFromUIObjOnFrame(onFrame as contentFrame, fromUI as iluiObject) As contentobject
		  dim i as integer
		  
		  for i = 0 to onFrame.contents.Ubound
		    
		    if onFrame.contents(i).myilUIObject <> nil then
		      if onFrame.contents(i).myilUIObject = fromUI then
		        Return onFrame.contents(i)
		      end if
		    end if
		    
		  next
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContentObjectForDBRowID(theRowID as integer) As contentObject
		  dim loopFrames as integer
		  dim loopCO as integer
		  
		  for loopFrames = 0 to frmProject.chartProject.frames.Ubound
		    
		    if frmProject.chartProject.frames(loopFrames).contents.ubound > -1 then
		      
		      for loopCO = 0 to frmProject.chartProject.frames(loopFrames).contents.ubound
		        'MsgBox str(ContentObject(frmProject.chartProject.frames(loopFrames).contents(loopCO)).DBRowID) + "/" + str(theRowID)
		        
		        if ContentObject(frmProject.chartProject.frames(loopFrames).contents(loopCO)).DBRowID = theRowID then
		          'MsgBox str(theRowID) + "YES"
		          
		          Return ContentObject(frmProject.chartProject.frames(loopFrames).contents(loopCO))
		        end if
		        
		      next
		      
		    end if
		    
		  next
		  'MsgBox str(theRowID) + "NO"
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetilObjectForDBRowID(theRowID as integer) As contentObject
		  dim loopFrames as integer
		  dim loopCO as integer
		  
		  for loopFrames = 0 to frmProject.chartProject.frames.Ubound
		    
		    'if ilObjectBase(frmProject.chartProject.frames(loopFrames).tag)then
		    
		    'end if
		    
		    if frmProject.chartProject.frames(loopFrames).contents.ubound > -1 then
		      
		      for loopCO = 0 to frmProject.chartProject.frames(loopFrames).contents.ubound
		        'MsgBox str(ContentObject(frmProject.chartProject.frames(loopFrames).contents(loopCO)).DBRowID) + "/" + str(theRowID)
		        
		        if ContentObject(frmProject.chartProject.frames(loopFrames).contents(loopCO)).DBRowID = theRowID then
		          Return ContentObject(frmProject.chartProject.frames(loopFrames).contents(loopCO))
		        end if
		        
		      next
		      
		    end if
		    
		  next
		  
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetISCCustomBlockFolder() As FolderItem
		  dim f as FolderItem
		  
		  if TargetMacOS = true then
		    
		    f = SpecialFolder.UserLibrary.Child("com.radicalbreeze.illumination")
		    
		    if f.Exists = false then
		      f.CreateAsFolder
		    end if
		    
		    f = f.Child("CustomBlocks")
		    
		    if f.Exists = false then
		      f.CreateAsFolder
		    end if
		    
		  else
		    
		    f = SpecialFolder.UserHome.Child("Illumination")
		    
		    if f.Exists = false then
		      f.CreateAsFolder
		    end if
		    
		    f = f.Child("CustomBlocks")
		    
		    if f.Exists = false then
		      f.CreateAsFolder
		    end if
		    
		  end if
		  
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitTheDB(f as FolderItem)
		  'CREATE TABLE GlobalVars (name text,type text)
		  'CREATE TABLE UIPlatforms (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,iluiobjectsRowID integer,platformConstantNum integer,enabled boolean,height integer,text text,visible boolean,width integer,x integer,y integer)'CREATE TABLE contentobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,framesRowID integer,name text,input boolean,output boolean)
		  'CREATE TABLE frames (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,x integer,y integer,width integer,title text,ilobjecttype text)
		  'CREATE TABLE ilobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, customMessage text, MathVariable1 text, MathVariable2 text, MessageFromVariable text, OriginVariable text, UseVariableForMessage boolean, varControlName text, varWindowName text, windowObjectRowID integer, frameRowID integer)
		  'CREATE TABLE iluiobjects (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,ilobjectsRowID integer,controlType integer,HasContentObject boolean,name text)
		  'CREATE TABLE links (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT,sourceCO integer,destinationCO integer)
		  
		  theDB=New REALSQLdatabase
		  theDB.databaseFile=f
		  If theDB.CreateDatabaseFile then
		    if theDB.Connect() then
		      
		      theDB.SQLExecute("CREATE TABLE GlobalVars (name text,type text,defaultval text)")
		      theDB.SQLExecute("CREATE TABLE ProjectInfo (name text,version text,chartheight integer,chartwidth integer)")
		      theDB.SQLExecute("CREATE TABLE UIPlatforms (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,iluiobjectsRowID integer,platformConstantNum integer,enabled boolean,height integer,text text,visible boolean,width integer,x integer,y integer,locktop integer,lockbottom integer,lockleft integer,lockright integer,color text)")
		      theDB.SQLExecute("CREATE TABLE contentobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,framesRowID integer,name text,input boolean,output boolean)")
		      theDB.SQLExecute("CREATE TABLE frames (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,x integer,y integer,width integer,title text,ilobjecttype text)")
		      theDB.SQLExecute("CREATE TABLE ilobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, customMessage text, MathVariable1 text, MathVariable2 text, MathVariable3 text, MathVariable4 text, MathVariable5 text, MathVariable6 text, MessageFromVariable text, OriginVariable text, UseVariableForMessage boolean, varControlName text, varWindowName text, windowObjectRowID integer, frameRowID integer)")
		      theDB.SQLExecute("CREATE TABLE iluiobjects (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,ilobjectsRowID integer,controlType integer,HasContentObject boolean,name text, coDBRowID integer)")
		      theDB.SQLExecute("CREATE TABLE links (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT,sourceCO integer,destinationCO integer)")
		      theDB.SQLExecute("CREATE TABLE imagefiles (name text,filename text,imagedata blob)")
		      
		    end if
		    
		  else
		    MsgBox "DB Error"
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadAllLinks()
		  'CREATE TABLE links (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT,sourceCO integer,destinationCO integer)
		  
		  
		  dim linksRS as RecordSet
		  
		  dim theSource as integer
		  dim theDestination as integer
		  
		  // Add all the links
		  linksRS = theDB.SQLSelect("select * from links")
		  If linksRS <> Nil then
		    do until linksRS.EOF
		      
		      'if modVariables.AddNewVariable(varRS.Field("name").StringValue, varRS.Field("type").StringValue) then
		      'end if
		      theSource = linksRS.Field("sourceCO").IntegerValue
		      theDestination = linksRS.Field("destinationCO").IntegerValue
		      
		      dim co1 as contentObject
		      dim co2 as contentObject
		      
		      co1 = GetContentObjectForDBRowID(theSource)
		      co2 = GetContentObjectForDBRowID(theDestination)
		      
		      if co1 <> nil and co1 <> nil then
		        GetContentObjectForDBRowID(theSource).AddOutputObject(GetContentObjectForDBRowID(theDestination))
		      end if
		      
		      linksRS.MoveNext
		    loop
		  End if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProject(f as FolderItem)
		  TotalCleanSlate
		  
		  theDB = new REALSQLDatabase
		  
		  theDB.DatabaseFile=f
		  If theDB.Connect() then
		    
		  else
		    MsgBox "There was an error openning this .isc file."
		    Return
		  end if
		  
		  dim varRS as RecordSet
		  dim iluiWinRS as RecordSet
		  dim iluiObjsRS as RecordSet
		  dim uiPlatRS as RecordSet
		  dim uiBounder as integer
		  
		  dim projInfoRS as RecordSet
		  projInfoRS = theDB.SQLSelect("select * from ProjectInfo")
		  if projInfoRS <> nil then
		    modVariables.ProjectApplicationName = projInfoRS.Field("name").StringValue
		    modVariables.ProjectVersion = projInfoRS.Field("version").StringValue
		    
		    if projInfoRS.Field("chartwidth") <> nil then
		      frmProject.chartProject.Width = projInfoRS.Field("chartwidth").IntegerValue
		      frmProject.chartProject.Height = projInfoRS.Field("chartheight").IntegerValue
		    end if
		    
		  end if
		  
		  
		  // Add all the variables
		  dim loopVar as integer
		  dim theDefault as string
		  
		  varRS = theDB.SQLSelect("select * from GlobalVars")
		  If varRS <> Nil then
		    do until varRS.EOF
		      'defaultval
		      if varRS.Field("defaultval") = nil then
		        theDefault = ""
		      else
		        theDefault = varRS.Field("defaultval").StringValue
		      end if
		      if modVariables.AddNewVariable(varRS.Field("name").StringValue, varRS.Field("type").StringValue, theDefault) then
		      end if
		      varRS.MoveNext
		    loop
		  End if
		  frmProject.populateListVariables
		  
		  
		  'theDB.SQLExecute("CREATE TABLE imagefiles (name text,filename text,imagedata blob)")
		  // Add all the variables
		  //dim loopVar2 as integer
		  //dim theDefault2 as string
		  
		  varRS = theDB.SQLSelect("select * from imagefiles")
		  If varRS <> Nil then
		    do until varRS.EOF
		      if modVariables.AddNewImageFileFromInfo(varRS.Field("filename").StringValue, varRS.Field("name").StringValue, varRS.Field("imagedata").StringValue) then
		      end if
		      varRS.MoveNext
		    loop
		  End if
		  frmProject.populateListVariables
		  
		  
		  
		  dim frameRS as RecordSet
		  dim iloRS as RecordSet
		  dim coRS as RecordSet
		  dim theUbound as integer
		  
		  // Add all the frames
		  frameRS = theDB.SQLSelect("select * from frames")
		  If frameRS <> Nil then
		    do until frameRS.EOF
		      
		      frmProject.AddNewObject(frameRS.Field("ilobjecttype").StringValue, frameRS.Field("x").IntegerValue, frameRS.Field("y").IntegerValue, true)
		      
		      // Now add the ilobject data for this frame
		      'CREATE TABLE ilobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, customMessage text, MathVariable1 text,
		      'MathVariable2 text, MessageFromVariable text, OriginVariable text, UseVariableForMessage boolean, varControlName text,
		      'varWindowName text, windowObjectRowID integer, frameRowID integer)
		      iloRS = theDB.SQLSelect("select * from ilobjects WHERE frameRowID=" + str(frameRS.Field("rowid").IntegerValue))
		      if iloRS <> Nil then
		        if frmProject.LastCustomBlockObjectAddedFailed = false then
		          do until iloRS.EOF
		            
		            ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).CustomMessage = iloRS.Field("customMessage").StringValue
		            ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).MathVariable1 = iloRS.Field("MathVariable1").StringValue
		            ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).MathVariable2 = iloRS.Field("MathVariable2").StringValue
		            if iloRS.Field("MathVariable3") <> nil then
		              ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).MathVariable3 = iloRS.Field("MathVariable3").StringValue
		              ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).MathVariable4 = iloRS.Field("MathVariable4").StringValue
		              ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).MathVariable5 = iloRS.Field("MathVariable5").StringValue
		              ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).MathVariable6 = iloRS.Field("MathVariable6").StringValue
		            end if
		            ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).MessageFromVariable = iloRS.Field("MessageFromVariable").StringValue
		            ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).OriginVariable = iloRS.Field("OriginVariable").StringValue
		            ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).UseVariableForMessage = iloRS.Field("UseVariableForMessage").BooleanValue
		            ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).varControlName = iloRS.Field("varControlName").StringValue
		            ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).varWindowName = iloRS.Field("varWindowName").StringValue
		            ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).Parent = frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound)
		            'CREATE TABLE UIPlatforms (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,iluiobjectsRowID integer,platformConstantNum integer,enabled boolean
		            ',height integer,text text,visible boolean,width integer,x integer,y integer)
		            'CREATE TABLE iluiobjects (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,ilobjectsRowID integer,controlType integer,HasContentObject boolean,name text)
		            // load the iluiobjects here  Window First.
		            
		            iluiWinRS = theDB.SQLSelect("select * from iluiobjects WHERE controlType=0 AND ilobjectsRowID=" + str(iloRS.Field("rowid").IntegerValue))
		            If iluiWinRS <> Nil then
		              if iluiWinRS.RecordCount > 0 then // There is a window!
		                
		                // Load the window specific stuff
		                ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.ControlType = iluiWinRS.Field("controlType").IntegerValue
		                ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.Name = iluiWinRS.Field("name").StringValue
		                
		                //TESTING REVERT IF BROKEN
		                'ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.HasContentObject = iluiWinRS.Field("HasContentObject").BooleanValue
		                ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.HasContentObject = false
		                
		                ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.parent = ilObjectWindow(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag)
		                
		                
		                // Loop through the Window only platform stuff
		                uiPlatRS = theDB.SQLSelect("select * from UIPlatforms WHERE iluiobjectsRowID=" + str(iluiWinRS.Field("rowid").IntegerValue))
		                do until uiPlatRS.EOF
		                  
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.Enabled(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("enabled").BooleanValue
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.Height(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("height").IntegerValue
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.Text(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("text").StringValue
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.Visible(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("visible").BooleanValue
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.Width(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("width").IntegerValue
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.X(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("x").IntegerValue
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.Y(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("y").IntegerValue
		                  if uiPlatRS.Field("color") <> Nil then
		                    ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theWindowObject.BackgroundColor(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("color").StringValue.ColorValue
		                  end if
		                  uiPlatRS.MoveNext
		                loop
		                
		                // Load and loop through all the controlls next
		                iluiObjsRS = theDB.SQLSelect("select * from iluiobjects WHERE controlType>0 AND ilobjectsRowID=" + str(iloRS.Field("rowid").IntegerValue))
		                do until iluiObjsRS.EOF
		                  
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects.Append new ilUIObject
		                  uiBounder = ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects.Ubound
		                  
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).ControlType = iluiObjsRS.Field("controlType").IntegerValue
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).Name = iluiObjsRS.Field("name").StringValue
		                  
		                  
		                  // TESTING REVERT IF BROKEN
		                  'ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).HasContentObject = iluiObjsRS.Field("HasContentObject").BooleanValue
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).HasContentObject = false
		                  
		                  
		                  ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).parent = ilObjectWindow(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag)
		                  
		                  if modFile.GetContentObjectForDBRowID(iluiObjsRS.Field("coDBRowID").IntegerValue) <> nil then
		                    modFile.GetContentObjectForDBRowID(iluiObjsRS.Field("coDBRowID").IntegerValue).myilUIObject = ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder)
		                  end if
		                  'if GetCOFromUIObjOnFrame(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound),) then
		                  'r.IntegerColumn("coDBRowID") = GetCOFromUIObjOnFrame(theFrame,ilObjectBase(theFrame.tag).theUIObjects(i)).DBRowID
		                  'end if
		                  
		                  // Loop through the Window only platform stuff
		                  uiPlatRS = theDB.SQLSelect("select * from UIPlatforms WHERE iluiobjectsRowID=" + str(iluiObjsRS.Field("rowid").IntegerValue))
		                  do until uiPlatRS.EOF
		                    
		                    ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).Enabled(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("enabled").BooleanValue
		                    ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).Height(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("height").IntegerValue
		                    ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).Text(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("text").StringValue
		                    ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).Visible(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("visible").BooleanValue
		                    ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).Width(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("width").IntegerValue
		                    ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).X(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("x").IntegerValue
		                    ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).Y(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("y").IntegerValue
		                    
		                    if uiPlatRS.Field("color") <> nil then
		                      ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).BackgroundColor(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("color").StringValue.ColorValue
		                      ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).LockTop(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("locktop").BooleanValue
		                      ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).LockBottom(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("lockbottom").BooleanValue
		                      ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).LockLeft(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("lockleft").BooleanValue
		                      ilObjectBase(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).theUIObjects(uiBounder).LockRight(uiPlatRS.Field("platformConstantNum").IntegerValue) = uiPlatRS.Field("lockright").BooleanValue
		                    end if
		                    
		                    uiPlatRS.MoveNext
		                  loop
		                  
		                  iluiObjsRS.MoveNext
		                  
		                loop
		                
		                
		              end if
		            end if
		            
		            iloRS.MoveNext
		            
		          loop
		        end if
		      end if
		      
		      
		      'frmProject.chartProject.Refresh
		      'app.YieldToNextThread
		      'app.DoEvents
		      'frmProject.chartProject.Refresh
		      
		      
		      
		      'CREATE TABLE contentobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,framesRowID integer,name text,input boolean,output boolean)
		      // Now loop through and add all contentobjects for this frame
		      coRS = theDB.SQLSelect("select * from contentobjects WHERE framesRowID=" + str(frameRS.Field("rowid").IntegerValue))
		      if frmProject.LastCustomBlockObjectAddedFailed = false then
		        do until coRS.EOF
		          
		          // New Way
		          
		          // Loop through all content objects on this frame, checking for a name match.  If name match is found, set the rowid of that content object.
		          dim loopFrames as integer
		          dim loopCO as integer
		          
		          // Loop through each content object
		          loopFrames = frmProject.chartProject.frames.Ubound
		          
		          if frmProject.chartProject.frames(loopFrames).tag isa ilObjectWindow then
		            'ilObjectWindow(frmProject.chartProject.frames(loopFrames).tag).theWindowObject.HasContentObject = false
		            ilObjectWindow(frmProject.chartProject.frames(loopFrames).tag).UpdateControlBlockItems
		            'MsgBox "yay!"
		          end if
		          
		          if frmProject.chartProject.frames(loopFrames).tag isa ilObjectNote then
		            'ilObjectWindow(frmProject.chartProject.frames(loopFrames).tag).theWindowObject.HasContentObject = false
		            'ilObjectWindow(frmProject.chartProject.frames(loopFrames).tag).UpdateControlBlockItems
		            'MsgBox "yay!"
		            
		            TextObject(frmProject.chartProject.frames(loopFrames).contents(0)).text = ilObjectNote(frmProject.chartProject.frames(loopFrames).tag).CustomMessage
		            
		          end if
		          
		          'ilObjectNote(frmProject.chartProject.selectedFrame.tag).CustomMessage = me.Text
		          'TextObject(ContentFrame(frmProject.chartProject.selectedFrame).contents(0)).text = me.Text
		          
		          
		          if frmProject.chartProject.frames(loopFrames).contents.ubound > -1 then
		            for loopCO = 0 to frmProject.chartProject.frames(loopFrames).contents.ubound
		              
		              
		              if frmProject.chartProject.frames(loopFrames).tag isa ilObjectWindow then
		                'MsgBox TextObject(frmProject.chartProject.frames(loopFrames).contents(loopCO)).text + " / " +  coRS.Field("name").StringValue
		              end if
		              
		              // Check for a name match to the CO from the database
		              if TextObject(frmProject.chartProject.frames(loopFrames).contents(loopCO)).text = coRS.Field("name").StringValue then
		                
		                TextObject(frmProject.chartProject.frames(loopFrames).contents(loopCO)).DBRowID = coRS.Field("rowid").IntegerValue
		                
		              end if
		              
		            next
		            
		            // If no match is found??
		            
		            
		          end if
		          
		          
		          coRS.MoveNext
		          
		          
		        loop
		      end if
		      
		      frameRS.MoveNext
		    loop
		  End if
		  
		  app.DoEvents
		  
		  'UpdateProjectWithCurrentBlocks
		  
		  
		  
		  
		  
		  // Now load the links
		  LoadAllLinks
		  
		  // Set ilobjectapp to be ISCapp1
		  SetTheAppBlockTo1
		  
		  currentSaveFile = f
		  fileisDirty = false
		  
		  frmProject.chartProject.Refresh
		  
		  frmProject.lblInfo.Text = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProjectFromFile()
		  Dim f as FolderItem
		  Dim iscType as New FileType
		  iscType.Name = "ISC Project"
		  iscType.MacType = ""
		  iscType.Extensions = "isc"
		  f=GetOpenFolderItem(iscType)
		  If f <> Nil then
		    if Lowercase(right(f.Name, 4)) = ".isc" then
		      LoadProject(f)
		    end if
		  End if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SafeProjectFileAs()
		  Dim dlg as New SaveAsDialog
		  Dim f as FolderItem
		  dlg.InitialDirectory=SpecialFolder.Documents
		  dlg.promptText="Save Project As..."
		  dlg.SuggestedFileName="NewProject.isc"
		  dlg.Title="Save Project As..."
		  'dlg.Filter=FileTypes1.Text  //defined as a file type in FileTypes1 file type set
		  Dim iscType as New FileType
		  iscType.Name = "ISC Project"
		  iscType.MacType = ""
		  iscType.Extensions = "isc"
		  dlg.Filter = iscType
		  f=dlg.ShowModal()
		  If f <> Nil then
		    SaveProject(f)
		  Else
		    //user canceled
		  End if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveAllLinks()
		  'CREATE TABLE links (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT,sourceCO integer,destinationCO integer)
		  
		  dim loopFrames as integer
		  dim loopCO as integer
		  dim loopLinks as integer
		  dim r as DatabaseRecord
		  
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    for each content as contentObject in frame.contents
		      
		      if content.outputs.Ubound >= 0 then
		        
		        for each link as contentObject in content.outputs
		          
		          ilObjectBase(frmProject.chartProject.frames(0).tag).HelperGeneratePythonDesktopCodePhase2(content, link)
		          
		          'MsgBox TextObject(content).text + " / " + str(content.DBRowID) + " / " + str(link.DBRowID)
		          
		          r=New DatabaseRecord
		          r.IntegerColumn("sourceCO") = content.DBRowID
		          r.IntegerColumn("destinationCO") = link.DBRowID
		          theDB.InsertRecord("links",r)
		          ///////////////////////theDB.Commit
		          
		        next
		        
		      end if
		      
		    next
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveContentFrame(theFrame as ContentFrame)
		  'CREATE TABLE GlobalVars (name text,type text)
		  'CREATE TABLE UIPlatforms (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,iluiobjectsRowID integer,platformConstantNum integer,enabled boolean,height integer,text text,visible boolean,width integer,x integer,y integer)'CREATE TABLE contentobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,framesRowID integer,name text,input boolean,output boolean)
		  'CREATE TABLE frames (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,x integer,y integer,width integer,title text,ilobjecttype text)
		  'CREATE TABLE contentobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,framesRowID integer,name text,input boolean,output boolean)
		  'CREATE TABLE ilobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, contentobjectsRowID integer, customMessage text, MathVariable1 text, MathVariable2 text, MessageFromVariable text, OriginVariable text, UseVariableForMessage boolean, varControlName text, varWindowName text, windowObjectRowID integer)
		  'CREATE TABLE iluiobjects (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,ilobjectsRowID integer,controlType integer,HasContentObject boolean,name text)
		  'CREATE TABLE links (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT,sourceCO integer,destinationCO integer)
		  
		  
		  
		  dim r as DatabaseRecord
		  dim frameRowID as integer
		  
		  r=New DatabaseRecord
		  r.IntegerColumn("x") = theFrame.X
		  r.IntegerColumn("y") = theFrame.Y
		  r.IntegerColumn("width") = theFrame.width
		  r.Column("title") = theFrame.title
		  r.Column("ilobjecttype") = ilObjectBase(theFrame.tag).DBObjectType
		  theDB.InsertRecord("frames",r)
		  ////////////////theDB.Commit
		  frameRowID = theDB.LastRowID
		  
		  dim i as integer
		  
		  if theFrame.contents.Ubound > -1 then
		    for i = 0 to theFrame.contents.Ubound
		      SaveContentObject(theFrame.contents(i), frameRowID)
		    next
		  end if
		  
		  
		  'CREATE TABLE ilobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, customMessage text, MathVariable1 text, 
		  'MathVariable2 text, MessageFromVariable text, OriginVariable text, UseVariableForMessage boolean, varControlName text, 
		  'varWindowName text, windowObjectRowID integer, frameRowID integer)
		  
		  'CREATE TABLE ilobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, customMessage text, MathVariable1 text, 
		  'MathVariable2 text, MessageFromVariable text, OriginVariable text, UseVariableForMessage boolean, varControlName text, 
		  'varWindowName text, windowObjectRowID integer, frameRowID integer)
		  
		  // Add the ilobject record
		  r=New DatabaseRecord
		  r.Column("customMessage") = ilObjectBase(theFrame.tag).CustomMessage
		  
		  //dim s as string
		  //s = ilObjectBase(theFrame.tag).CustomMessage
		  
		  r.Column("MathVariable1") = ilObjectBase(theFrame.tag).MathVariable1
		  r.Column("MathVariable2") = ilObjectBase(theFrame.tag).MathVariable2
		  r.Column("MathVariable3") = ilObjectBase(theFrame.tag).MathVariable3
		  r.Column("MathVariable4") = ilObjectBase(theFrame.tag).MathVariable4
		  r.Column("MathVariable5") = ilObjectBase(theFrame.tag).MathVariable5
		  r.Column("MathVariable6") = ilObjectBase(theFrame.tag).MathVariable6
		  r.Column("MessageFromVariable") = ilObjectBase(theFrame.tag).MessageFromVariable
		  r.Column("OriginVariable") = ilObjectBase(theFrame.tag).OriginVariable
		  r.BooleanColumn("UseVariableForMessage") = ilObjectBase(theFrame.tag).UseVariableForMessage
		  r.Column("varControlName") = ilObjectBase(theFrame.tag).varControlName
		  r.Column("varWindowName") = ilObjectBase(theFrame.tag).varWindowName
		  'r.IntegerColumn("windowObjectRowID") = 
		  r.IntegerColumn("frameRowID") = frameRowID
		  theDB.InsertRecord("ilobjects",r)
		  //////////////theDB.Commit
		  
		  
		  dim ilobjectRowID as integer
		  
		  ilobjectRowID = theDB.LastRowID
		  
		  dim iluiobjectsRowID as integer
		  
		  // If there is a window iluiobject, add it.
		  'CREATE TABLE UIPlatforms (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,iluiobjectsRowID integer,platformConstantNum integer,
		  'enabled boolean,height integer,text text,visible boolean,width integer,x integer,y integer)
		  'CREATE TABLE iluiobjects (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT,ilobjectsRowID integer,controlType integer,HasContentObject boolean,name text)
		  dim loopPlat as integer
		  
		  if ilObjectBase(theFrame.tag).theWindowObject <> nil then
		    
		    r=New DatabaseRecord
		    r.IntegerColumn("ilobjectsRowID") = ilobjectRowID
		    r.IntegerColumn("controlType") = ilObjectBase(theFrame.tag).theWindowObject.ControlType
		    r.BooleanColumn("HasContentObject") = ilObjectBase(theFrame.tag).theWindowObject.HasContentObject
		    r.Column("name") = ilObjectBase(theFrame.tag).theWindowObject.Name
		    theDB.InsertRecord("iluiobjects",r)
		    //////////////////theDB.Commit
		    
		    iluiobjectsRowID = theDB.LastRowID
		    
		    for loopPlat = 0 to 9
		      
		      r=New DatabaseRecord
		      r.IntegerColumn("iluiobjectsRowID") = iluiobjectsRowID
		      r.IntegerColumn("platformConstantNum") = loopPlat
		      r.BooleanColumn("enabled") = ilObjectBase(theFrame.tag).theWindowObject.Enabled(loopPlat)
		      r.IntegerColumn("height") = ilObjectBase(theFrame.tag).theWindowObject.Height(loopPlat)
		      r.Column("text") = ilObjectBase(theFrame.tag).theWindowObject.Text(loopPlat)
		      r.BooleanColumn("visible") = ilObjectBase(theFrame.tag).theWindowObject.Visible(loopPlat)
		      r.IntegerColumn("width") = ilObjectBase(theFrame.tag).theWindowObject.Width(loopPlat)
		      r.IntegerColumn("x") = ilObjectBase(theFrame.tag).theWindowObject.X(loopPlat)
		      r.IntegerColumn("y") = ilObjectBase(theFrame.tag).theWindowObject.Y(loopPlat)
		      r.Column("color") = ilObjectBase(theFrame.tag).theWindowObject.BackgroundColor(loopPlat).stringvalue
		      
		      theDB.InsertRecord("UIPlatforms",r)
		      ////////////////////theDB.Commit
		      
		    next
		    
		  end if
		  
		  
		  // Loop through and add the rest of the uiobjects, if they exist.
		  
		  if ilObjectBase(theFrame.tag).theUIObjects.Ubound > -1 then
		    for i = 0 to ilObjectBase(theFrame.tag).theUIObjects.Ubound
		      
		      r=New DatabaseRecord
		      r.IntegerColumn("ilobjectsRowID") = ilobjectRowID
		      r.IntegerColumn("controlType") = ilObjectBase(theFrame.tag).theUIObjects(i).ControlType
		      r.BooleanColumn("HasContentObject") = ilObjectBase(theFrame.tag).theUIObjects(i).HasContentObject
		      r.Column("name") = ilObjectBase(theFrame.tag).theUIObjects(i).Name
		      
		      if GetCOFromUIObjOnFrame(theFrame,ilObjectBase(theFrame.tag).theUIObjects(i)) <> nil then
		        r.IntegerColumn("coDBRowID") = GetCOFromUIObjOnFrame(theFrame,ilObjectBase(theFrame.tag).theUIObjects(i)).DBRowID
		      end if
		      
		      theDB.InsertRecord("iluiobjects",r)
		      ////////////////////theDB.Commit
		      
		      iluiobjectsRowID = theDB.LastRowID
		      
		      for loopPlat = 0 to 9
		        
		        r=New DatabaseRecord
		        r.IntegerColumn("iluiobjectsRowID") = iluiobjectsRowID
		        r.IntegerColumn("platformConstantNum") = loopPlat
		        r.BooleanColumn("enabled") = ilObjectBase(theFrame.tag).theUIObjects(i).Enabled(loopPlat)
		        r.IntegerColumn("height") = ilObjectBase(theFrame.tag).theUIObjects(i).Height(loopPlat)
		        r.Column("text") = ilObjectBase(theFrame.tag).theUIObjects(i).Text(loopPlat)
		        r.BooleanColumn("visible") = ilObjectBase(theFrame.tag).theUIObjects(i).Visible(loopPlat)
		        r.IntegerColumn("width") = ilObjectBase(theFrame.tag).theUIObjects(i).Width(loopPlat)
		        r.IntegerColumn("x") = ilObjectBase(theFrame.tag).theUIObjects(i).X(loopPlat)
		        r.IntegerColumn("y") = ilObjectBase(theFrame.tag).theUIObjects(i).Y(loopPlat)
		        
		        r.BooleanColumn("locktop") = ilObjectBase(theFrame.tag).theUIObjects(i).LockTop(loopPlat)
		        r.BooleanColumn("lockleft") = ilObjectBase(theFrame.tag).theUIObjects(i).LockLeft(loopPlat)
		        r.BooleanColumn("lockright") = ilObjectBase(theFrame.tag).theUIObjects(i).LockRight(loopPlat)
		        r.BooleanColumn("lockbottom") = ilObjectBase(theFrame.tag).theUIObjects(i).LockBottom(loopPlat)
		        r.Column("color") = ilObjectBase(theFrame.tag).theUIObjects(i).BackgroundColor(loopPlat).stringvalue
		        
		        theDB.InsertRecord("UIPlatforms",r)
		        //////////////////theDB.Commit
		        
		      next
		      
		    next
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveContentObject(theContent as ContentObject, frameRowID as integer)
		  'CREATE TABLE GlobalVars (name text,type text)
		  'CREATE TABLE UIPlatforms (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,platformConstantNum integer,enabled boolean,height integer,text text,visible boolean,width integer,x integer,y integer)
		  'CREATE TABLE contentobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,framesRowID integer,name text,input boolean,output boolean)
		  'CREATE TABLE frames (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,x integer,y integer,width integer,title text,ilobjecttype text)
		  'CREATE TABLE ilobjects (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, customMessage text, MathVariable1 text, MathVariable2 text, MessageFromVariable text, OriginVariable text, UseVariableForMessage boolean, varControlName text, varWindowName text, windowObjectRowID integer)
		  'CREATE TABLE iluiobjects (rowID integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,controlType integer,HasContentObject boolean,name text)
		  'CREATE TABLE links (rowid integer NOT NULL PRIMARY KEY AUTOINCREMENT,sourceCO integer,destinationCO integer)
		  
		  
		  
		  dim r as DatabaseRecord
		  dim coRowID as integer
		  
		  r=New DatabaseRecord
		  
		  r.IntegerColumn("framesRowID") = frameRowID
		  r.Column("name") = TextObject(theContent).text
		  r.BooleanColumn("input") = theContent.ShowInput
		  r.BooleanColumn("output") = theContent.ShowOutput
		  
		  theDB.InsertRecord("contentobjects",r)
		  ////////////////theDB.Commit
		  
		  coRowID = theDB.LastRowID
		  
		  theContent.DBRowID = coRowID
		  
		  'MsgBox TextObject(theContent).text + " / " + str(theContent.DBRowID)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveProject(f as FolderItem)
		  // File exist?
		  if f.Exists = true then
		    if theDB <> nil then
		      theDB.Close
		      theDB.DatabaseFile = Nil
		      app.DoEvents
		    end if
		    f.Delete
		  end if
		  
		  if f.Exists = true then
		    // We can't delete it.  So we need to clear it out.
		    'ClearTheDB
		    if TargetWin32 then
		      
		      dim shellDel as Shell
		      shellDel = new Shell
		      
		      shellDel.Execute "del " + f.ShellPath
		      
		    end if
		    
		  else
		    
		    
		  end if
		  
		  if f.Exists = true then
		    'MsgBox "F"
		  end if
		  
		  
		  // Init the database
		  InitTheDB(f)
		  
		  dim r as DatabaseRecord
		  
		  'theDB.SQLExecute("CREATE TABLE ProjectInfo (name text,version text)")
		  // Save the project info
		  r = new DatabaseRecord
		  r.Column("name") = modVariables.ProjectApplicationName
		  r.Column("version") = modVariables.ProjectVersion
		  r.IntegerColumn("chartwidth") = frmProject.chartProject.Width
		  r.IntegerColumn("chartheight") = frmProject.chartProject.Height
		  
		  theDB.InsertRecord("ProjectInfo", r)
		  //////////////////theDB.Commit
		  
		  
		  // Loop through the Variables
		  dim loopVar as integer
		  
		  if modVariables.projectVariables.Ubound > -1 then
		    for loopVar = modVariables.projectVariables.Ubound DownTo 0
		      'CREATE TABLE GlobalVars (name text,type text)
		      r=New DatabaseRecord
		      r.Column("name")=modVariables.projectVariables(loopVar).Name
		      r.Column("type")=modVariables.projectVariables(loopVar).Type
		      r.Column("defaultval")=modVariables.projectVariables(loopVar).DefaultVal
		      theDB.InsertRecord("GlobalVars",r)
		      ///////////theDB.Commit
		    next
		  end if
		  
		  // Loop through the Image Files
		  dim loopVar2 as integer
		  
		  if modVariables.projectImages.Ubound > -1 then
		    for loopVar2 = modVariables.projectImages.Ubound DownTo 0
		      'theDB.SQLExecute("CREATE TABLE imagefiles (name text,filename text,imagedata blob)")
		      r=New DatabaseRecord
		      r.Column("name")=modVariables.projectImages(loopVar2).Name
		      r.Column("filename")=modVariables.projectImages(loopVar2).FileName
		      r.Column("imagedata")=modVariables.projectImages(loopVar2).ImageData
		      theDB.InsertRecord("imagefiles",r)
		      ///////////theDB.Commit
		    next
		  end if
		  
		  
		  // Loop through the Frames
		  dim loopFrames as integer
		  
		  if frmProject.chartProject.frames.Ubound > -1 then
		    for loopFrames = frmProject.chartProject.frames.Ubound DownTo 0
		      SaveContentFrame(frmProject.chartProject.frames(loopFrames))
		    next
		  end if
		  
		  // Loop through the links
		  // Save the links
		  SaveAllLinks
		  
		  theDB.Commit
		  
		  currentSaveFile = f
		  fileisDirty = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTheAppBlockTo1()
		  for each frame as contentFrame in frmProject.chartProject.frames
		    
		    for each content as contentObject in frame.contents
		      
		      if content.tag isa ilObjectApp then
		        ilObjectApp(content.tag).UniqueID = "1"
		      end if
		      
		    next
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartNewProject()
		  // Loop through the Variables and Clear them out.
		  dim loopVar as integer
		  
		  modVariables.ProjectApplicationName = "MyNewApplication"
		  modVariables.ProjectVersion = "1.0.0"
		  
		  if modVariables.projectVariables.Ubound > -1 then
		    for loopVar = modVariables.projectVariables.Ubound DownTo 0
		      modVariables.projectVariables.Remove(loopVar)
		    next
		  end if
		  
		  if modVariables.projectImages.Ubound > -1 then
		    for loopVar = modVariables.projectImages.Ubound DownTo 0
		      modVariables.projectImages.Remove(loopVar)
		    next
		  end if
		  
		  // Loop through the Frames and clear them out.
		  dim loopFrames as integer
		  
		  if frmProject.chartProject.frames.Ubound > -1 then
		    for loopFrames = frmProject.chartProject.frames.Ubound DownTo 0
		      frmProject.chartProject.frames.Remove(loopFrames)
		    next
		  end if
		  
		  // Clear out the images in the library
		  modVariables.ClearAllProjectImageFiles
		  
		  
		  
		  // Re-set the unique counter.
		  frmProject.UniqueIDCount = 0
		  
		  // Add App and AppQuit
		  frmProject.AddNewObject("Application", 20, 20)
		  frmProject.AddNewObject("ApplicationQuit", 300, 200)
		  
		  // Add Note
		  frmProject.AddNewObject("Note", 140, 20)
		  TextObject(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).contents(0)).text = "This is a starter project.  Double click the Window Block below to begin designing the look and feel of your new app."
		  ilObjectNote(frmProject.chartProject.frames(frmProject.chartProject.frames.Ubound).tag).CustomMessage = "This is a starter project.  Double click the Window Block below to begin designing the look and feel of your new app."
		  
		  
		  // Add Window
		  frmProject.AddNewObject("Window", 140, 120)
		  
		  // Add Links
		  ContentObject(frmProject.chartProject.frames(0).contents(0)).AddOutputObject(ContentObject(frmProject.chartProject.frames(3).contents(0)))
		  ContentObject(frmProject.chartProject.frames(3).contents(2)).AddOutputObject(ContentObject(frmProject.chartProject.frames(1).contents(0)))
		  
		  
		  
		  
		  // Refresh the variable display
		  frmProject.populateListVariables
		  
		  frmProject.chartProject.SelectFrame(nil)
		  
		  fileisDirty = false
		  currentSaveFile = nil
		  
		  frmProject.scrlHor.Value = 0
		  frmProject.scrlVer.Value = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TotalCleanSlate()
		  modVariables.ProjectApplicationName = "MyNewApplication"
		  modVariables.ProjectVersion = "1.0.0"
		  
		  // Loop through the Variables and Clear them out.
		  dim loopVar as integer
		  
		  if modVariables.projectVariables.Ubound > -1 then
		    for loopVar = modVariables.projectVariables.Ubound DownTo 0
		      modVariables.projectVariables.Remove(loopVar)
		    next
		  end if
		  
		  // Loop through the Frames and clear them out.
		  dim loopFrames as integer
		  
		  if frmProject.chartProject.frames.Ubound > -1 then
		    for loopFrames = frmProject.chartProject.frames.Ubound DownTo 0
		      frmProject.chartProject.frames.Remove(loopFrames)
		    next
		  end if
		  
		  // Re-set the unique counter.
		  frmProject.UniqueIDCount = 0
		  
		  // Add App and AppQuit
		  'frmProject.AddNewObject("Application", 20, 20)
		  'frmProject.AddNewObject("ApplicationQuit", 420, 420)
		  
		  // Refresh the variable display
		  frmProject.populateListVariables
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateProjectWithCurrentBlocks()
		  '// New Way
		  '
		  '// Loop through all content objects on this frame, checking for a name match.  If name match is found, set the rowid of that content object.
		  'dim loopFrames as integer
		  'dim loopCO as integer
		  '
		  '// Loop through each content object
		  'for loopFrames = 0 to frmProject.chartProject.frames.Ubound
		  'if frmProject.chartProject.frames(loopFrames).contents.ubound > -1 then
		  'for loopCO = 0 to frmProject.chartProject.frames(loopFrames).contents.ubound
		  '
		  '// Check for a name match to the CO from the database
		  'if TextObject(frmProject.chartProject.frames(loopFrames).contents(loopCO)).text = coRS.Field("name").StringValue then
		  '
		  'TextObject(frmProject.chartProject.frames(loopFrames).contents(loopCO)).DBRowID = coRS.Field("rowid").IntegerValue
		  '
		  ''Return ContentObject(frmProject.chartProject.frames(loopFrames).contents(loopCO))
		  'end if
		  '
		  'next
		  'end if
		  'next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		currentSaveFile As folderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		fileisDirty As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		theDB As REALSQLDatabase
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="fileisDirty"
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
