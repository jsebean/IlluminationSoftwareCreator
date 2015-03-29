#tag Class
Protected Class ilObjectCustomBlock
Inherits ilObjectBase
	#tag Event
		Sub GenerateAndroidCode(theOrigin as string)
		  dim s as string
		  
		  s = "public void " + GetCodeName + "()" + EndOfLine
		  
		  s = s + "{" + EndOfLine
		  
		  s = s + TemplateCodeAndroid
		  
		  if Out1Enabled = true then
		    s = s.ReplaceAll("//Output1", "//" + GetCodeName + Out1Name)
		  end if
		  
		  if Out2Enabled = true then
		    s = s.ReplaceAll("//Output2", "//" + GetCodeName + Out2Name)
		  end if
		  
		  if Var1Enabled = true then
		    s = s.ReplaceAll("ISCVariable1",  modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalAndroidName)
		  end if
		  
		  if Var2Enabled = true then
		    s = s.ReplaceAll("ISCVariable2", modVariables.VariableObjectFromName(MathVariable2).ISCClassLocalAndroidName)
		  end if
		  
		  if Var3Enabled = true then
		    s = s.ReplaceAll("ISCVariable3", modVariables.VariableObjectFromName(MathVariable3).ISCClassLocalAndroidName)
		  end if
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  
		  setCodeToCallThisObjectForName(InputName, GetCodeName + "();")
		  
		  AndroidInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		  AndroidAddImports("//EndImports", TemplateImportsAndroid)
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateFlexWebCode(theOrigin as string)
		  dim s as string
		  
		  s = "private function " + GetCodeName + "():void" + EndOfLine
		  
		  s = s + "{" + EndOfLine
		  
		  s = s + TemplateCodeFlexWeb
		  
		  if Out1Enabled = true then
		    s = s.ReplaceAll("//Output1", "//" + GetCodeName + Out1Name)
		  end if
		  
		  if Out2Enabled = true then
		    s = s.ReplaceAll("//Output2", "//" + GetCodeName + Out2Name)
		  end if
		  
		  if Var1Enabled = true then
		    s = s.ReplaceAll("ISCVariable1",  modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalFlexName)
		  end if
		  
		  if Var2Enabled = true then
		    s = s.ReplaceAll("ISCVariable2", modVariables.VariableObjectFromName(MathVariable2).ISCClassLocalFlexName)
		  end if
		  
		  if Var3Enabled = true then
		    s = s.ReplaceAll("ISCVariable3", modVariables.VariableObjectFromName(MathVariable3).ISCClassLocalFlexName)
		  end if
		  
		  setCodeToCallThisObjectForName(InputName, GetCodeName + "();")
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  FlexWebInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		  FlexAddImports("//EndImports", TemplateImportsFlexWeb)
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateiOSCode(theOrigin as string)
		  dim s as string
		  
		  s = "- (void) " + GetCodeName + " {" + EndOfLine
		  
		  s = s + TemplateCodeiOS
		  
		  if Out1Enabled = true then
		    s = s.ReplaceAll("//Output1", "//" + GetCodeName + Out1Name)
		  end if
		  
		  if Out2Enabled = true then
		    s = s.ReplaceAll("//Output2", "//" + GetCodeName + Out2Name)
		  end if
		  
		  if Var1Enabled = true then
		    s = s.ReplaceAll("ISCVariable1",  modVariables.VariableObjectFromName(MathVariable1).ISCiOSName)
		  end if
		  
		  if Var2Enabled = true then
		    s = s.ReplaceAll("ISCVariable2", modVariables.VariableObjectFromName(MathVariable2).ISCiOSName)
		  end if
		  
		  if Var3Enabled = true then
		    s = s.ReplaceAll("ISCVariable3", modVariables.VariableObjectFromName(MathVariable3).ISCiOSName)
		  end if
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  
		  setCodeToCallThisObjectForName(InputName, GetCodeName + "();")
		  
		  iOSMInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateJavaScriptWebCode(theOrigin as string)
		  dim s as string
		  
		  s = "function " + GetCodeName + "()" + EndOfLine
		  
		  s = s + "{" + EndOfLine
		  
		  s = s + TemplateCodeHTML5Web
		  
		  if Out1Enabled = true then
		    s = s.ReplaceAll("//Output1", "//" + GetCodeName + Out1Name)
		  end if
		  
		  if Out2Enabled = true then
		    s = s.ReplaceAll("//Output2", "//" + GetCodeName + Out2Name)
		  end if
		  
		  if Var1Enabled = true then
		    s = s.ReplaceAll("ISCVariable1",  modVariables.VariableObjectFromName(MathVariable1).ISCClassLocalFlexName)
		  end if
		  
		  if Var2Enabled = true then
		    s = s.ReplaceAll("ISCVariable2", modVariables.VariableObjectFromName(MathVariable2).ISCClassLocalFlexName)
		  end if
		  
		  if Var3Enabled = true then
		    s = s.ReplaceAll("ISCVariable3", modVariables.VariableObjectFromName(MathVariable3).ISCClassLocalFlexName)
		  end if
		  
		  setCodeToCallThisObjectForName(InputName, GetCodeName + "();")
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  HTML5InsertCodeAtMarker(s, "//EndOfFunctions")
		  
		  HTML5AddImports("//EndImports", TemplateImportsHTML5Web)
		End Sub
	#tag EndEvent

	#tag Event
		Sub GeneratePythonDesktopCode(theOrigin as string)
		  dim s as string
		  
		  s = "def " + GetCodeName + "():" + EndOfLine
		  
		  s = s + TemplateCodePythonDesktop
		  
		  if Out1Enabled = true then
		    s = s.ReplaceAll("#Output1", "#" + GetCodeName + Out1Name)
		  end if
		  
		  if Out2Enabled = true then
		    s = s.ReplaceAll("#Output2", "#" + GetCodeName + Out2Name)
		  end if
		  
		  if Var1Enabled = true then
		    s = s.ReplaceAll("ISCVariable1",  modVariables.VariableObjectFromName(MathVariable1).ISCPythonName)
		  end if
		  
		  if Var2Enabled = true then
		    s = s.ReplaceAll("ISCVariable2", modVariables.VariableObjectFromName(MathVariable2).ISCPythonName)
		  end if
		  
		  if Var3Enabled = true then
		    s = s.ReplaceAll("ISCVariable3", modVariables.VariableObjectFromName(MathVariable3).ISCPythonName)
		  end if
		  
		  setCodeToCallThisObjectForName(InputName, GetCodeName + "()")
		  
		  PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		  
		  PythonAddImports("#EndImports", TemplateImportsPythonDesktop)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AndroidAddImports(ImportEnder as string, theImports as string)
		  dim s as string
		  
		  dim i as Integer
		  
		  dim importCount as integer
		  
		  importCount = CountFields(theImports, EndOfLine)
		  
		  if importCount = 0 then
		    
		    if len(trim(theImports)) = 0 then
		      
		    else
		      AndroidInsertCodeAtMarker(trim(theImports),ImportEnder)
		    end if
		    
		  else
		    
		    for i = 1 to importCount
		      s = NthField(theImports, EndOfLine, i)
		      AndroidInsertCodeAtMarker(trim(s), ImportEnder)
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  me.CodeNameBase = "isc" + ReplaceAll(BlockName, " ", "_")
		  me.BGColor = frmProject.kcolCustom
		  me.DisplayName = BlockName
		  me.DisplayCategory = BlockCategory
		  me.Title = BlockName
		  me.Width = 150
		  
		  if BlockName.Len > 0 then
		    me.ObjectItems.Append InputName
		    me.ObjectShowOutput.Append false
		    me.ObjectShowInput.Append true
		  end if
		  
		  if Out1Enabled = true then
		    me.ObjectItems.Append Out1Name
		    me.ObjectShowOutput.Append true
		    me.ObjectShowInput.Append false
		  end if
		  
		  if Out2Enabled = true then
		    me.ObjectItems.Append Out2Name
		    me.ObjectShowOutput.Append true
		    me.ObjectShowInput.Append false
		  end if
		  
		  if Var1Enabled = true then
		    RequireMathVariable1 = true
		  end if
		  
		  if Var2Enabled = true then
		    RequireMathVariable2 = true
		  end if
		  
		  if Var3Enabled = true then
		    RequireMathVariable3 = true
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FlexAddImports(ImportEnder as string, theImports as string)
		  dim s as string
		  
		  dim i as Integer
		  
		  dim importCount as integer
		  
		  importCount = CountFields(theImports, EndOfLine)
		  
		  if importCount = 0 then
		    
		    if len(trim(theImports)) = 0 then
		      
		    else
		      FlexWebInsertCodeAtMarker(trim(theImports),ImportEnder)
		    end if
		    
		  else
		    
		    for i = 1 to importCount
		      s = NthField(theImports, EndOfLine, i)
		      FlexWebInsertCodeAtMarker(trim(s), ImportEnder)
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HTML5AddImports(ImportEnder as string, theImports as string)
		  dim s as string
		  
		  dim i as Integer
		  
		  dim importCount as integer
		  
		  importCount = CountFields(theImports, EndOfLine)
		  
		  if importCount = 0 then
		    
		    if len(trim(theImports)) = 0 then
		      
		    else
		      HTML5InsertCodeAtMarker(trim(theImports),ImportEnder)
		    end if
		    
		  else
		    
		    for i = 1 to importCount
		      s = NthField(theImports, EndOfLine, i)
		      HTML5InsertCodeAtMarker(trim(s), ImportEnder)
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub iOSAddImports(ImportEnder as string, theImports as string)
		  dim s as string
		  
		  dim i as Integer
		  
		  dim importCount as integer
		  
		  importCount = CountFields(theImports, EndOfLine)
		  
		  if importCount = 0 then
		    
		    if len(trim(theImports)) = 0 then
		      
		    else
		      iOSMInsertCodeAtMarker(trim(theImports),ImportEnder)
		    end if
		    
		  else
		    
		    for i = 1 to importCount
		      s = NthField(theImports, EndOfLine, i)
		      iOSMInsertCodeAtMarker(trim(s), ImportEnder)
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadBlockFromFile(f as FolderItem)
		  // Connect to the DB file
		  myDBFile = f
		  myDB = new REALSQLDatabase
		  
		  myDB.DatabaseFile = f
		  If myDB.Connect() then
		    
		  else
		    MsgBox "There was an error openning block file: " + f.Name
		    Return
		  end if
		  
		  dim rsBlock as RecordSet
		  
		  // Load the Block info
		  'myDB.SQLExecute("CREATE TABLE BlockInfo (blockname text,blockcategory text,blockdescription text,inputname text)")
		  rsBlock = myDB.SQLSelect("select * from BlockInfo")
		  if rsBlock <> nil then
		    if rsBlock.RecordCount > 0 then
		      BlockCategory = rsBlock.Field("blockcategory").StringValue
		      BlockDescription = rsBlock.Field("blockdescription").StringValue
		      BlockName = rsBlock.Field("blockname").StringValue
		      InputName = rsBlock.Field("inputname").StringValue
		    end if
		  end if
		  
		  
		  // Load the Code for all targets
		  'myDB.SQLExecute("CREATE TABLE TheCode (code text,target text)")
		  rsBlock = myDB.SQLSelect("select * from TheCode WHERE target='Android'")
		  if rsBlock <> nil then
		    if rsBlock.RecordCount > 0 then
		      TemplateCodeAndroid = rsBlock.Field("code").StringValue
		      if rsBlock.Field("importstatements") <> nil then
		        TemplateImportsAndroid = rsBlock.Field("importstatements").StringValue
		      end if
		    end if
		  end if
		  
		  rsBlock = myDB.SQLSelect("select * from TheCode WHERE target='Adobe Flex - Web'")
		  if rsBlock <> nil then
		    if rsBlock.RecordCount > 0 then
		      TemplateCodeFlexWeb = rsBlock.Field("code").StringValue
		      if rsBlock.Field("importstatements") <> nil then
		        TemplateImportsFlexWeb = rsBlock.Field("importstatements").StringValue
		      end if
		    end if
		  end if
		  
		  rsBlock = myDB.SQLSelect("select * from TheCode WHERE target='Python/GTK - Maemo Tablet'")
		  if rsBlock <> nil then
		    if rsBlock.RecordCount > 0 then
		      TemplateCodePythonMaemo = rsBlock.Field("code").StringValue
		      if rsBlock.Field("importstatements") <> nil then
		        TemplateImportsPythonMaemo= rsBlock.Field("importstatements").StringValue
		      end if
		    end if
		  end if
		  
		  rsBlock = myDB.SQLSelect("select * from TheCode WHERE target='Python/GTK - Desktop'")
		  if rsBlock <> nil then
		    if rsBlock.RecordCount > 0 then
		      TemplateCodePythonDesktop = rsBlock.Field("code").StringValue
		      if rsBlock.Field("importstatements") <> nil then
		        TemplateImportsPythonDesktop = rsBlock.Field("importstatements").StringValue
		      end if
		    end if
		  end if
		  
		  rsBlock = myDB.SQLSelect("select * from TheCode WHERE target='iOS'")
		  if rsBlock <> nil then
		    if rsBlock.RecordCount > 0 then
		      TemplateCodeiOS = rsBlock.Field("code").StringValue
		      if rsBlock.Field("importstatements") <> nil then
		        TemplateImportsiOS = rsBlock.Field("importstatements").StringValue
		      end if
		    end if
		  end if
		  
		  rsBlock = myDB.SQLSelect("select * from TheCode WHERE target='HTML5'")
		  if rsBlock <> nil then
		    if rsBlock.RecordCount > 0 then
		      TemplateCodeHTML5Web = rsBlock.Field("code").StringValue
		      if rsBlock.Field("importstatements") <> nil then
		        TemplateImportsHTML5Web = rsBlock.Field("importstatements").StringValue
		      end if
		    end if
		  end if
		  
		  // Load the Ouputs
		  'myDB.SQLExecute("CREATE TABLE Outputs (outname text,enabled boolean)")
		  rsBlock = myDB.SQLSelect("select * from Outputs")
		  if rsBlock <> nil then
		    if rsBlock.RecordCount > 1 then
		      'do until rsBlock.EOF
		      Out1Name = rsBlock.Field("outname").StringValue
		      Out1Enabled = rsBlock.Field("enabled").BooleanValue
		      rsBlock.MoveNext
		      Out2Name = rsBlock.Field("outname").StringValue
		      Out2Enabled = rsBlock.Field("enabled").BooleanValue
		      'loop
		    end if
		  end if
		  
		  
		  
		  // Load the Variables
		  'myDB.SQLExecute("CREATE TABLE Vars (enabled boolean,type text,description text)")
		  rsBlock = myDB.SQLSelect("select * from Vars")
		  if rsBlock <> nil then
		    if rsBlock.RecordCount > 2 then
		      'do until rsBlock.EOF
		      Var1Description = rsBlock.Field("description").StringValue
		      Var1Enabled = rsBlock.Field("enabled").BooleanValue
		      Var1Type = rsBlock.Field("type").StringValue
		      rsBlock.MoveNext
		      Var2Description = rsBlock.Field("description").StringValue
		      Var2Enabled = rsBlock.Field("enabled").BooleanValue
		      Var2Type = rsBlock.Field("type").StringValue
		      rsBlock.MoveNext
		      Var3Description = rsBlock.Field("description").StringValue
		      Var3Enabled = rsBlock.Field("enabled").BooleanValue
		      Var3Type = rsBlock.Field("type").StringValue
		      'loop
		    end if
		  end if
		  
		  myDB.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PythonAddImports(ImportEnder as string, theImports as string)
		  dim s as string
		  
		  dim i as Integer
		  
		  dim importCount as integer
		  
		  importCount = CountFields(theImports, EndOfLine)
		  
		  if importCount = 0 then
		    
		    if len(trim(theImports)) = 0 then
		      
		    else
		      PythonInsertCodeAtMarker(trim(theImports),ImportEnder)
		    end if
		    
		  else
		    
		    for i = 1 to importCount
		      s = NthField(theImports, EndOfLine, i)
		      PythonInsertCodeAtMarker(trim(s), ImportEnder)
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveBlockToFile(f as FolderItem)
		  // Delete the file if it already exists
		  
		  myDBFile = f
		  
		  // File exist?
		  if f.Exists = true then
		    if myDB <> nil then
		      myDB.Close
		      myDB.DatabaseFile = Nil
		      app.DoEvents
		    end if
		    f.Delete
		  end if
		  
		  if f.Exists = true then
		    // We can't delete it.  So we need to clear it out.
		    
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
		  
		  
		  // Create the Database structure
		  
		  myDB=New REALSQLdatabase
		  myDB.databaseFile=f
		  
		  myDB.AutoCommit = true
		  
		  If myDB.CreateDatabaseFile then
		    
		    if myDB.Connect() then
		      myDB.SQLExecute("CREATE TABLE BlockInfo (blockname text,blockcategory text,blockdescription text,inputname text)")
		      myDB.SQLExecute("CREATE TABLE TheCode (code text,importstatements text,target text)")
		      myDB.SQLExecute("CREATE TABLE Outputs (outname text,enabled boolean)")
		      myDB.SQLExecute("CREATE TABLE Vars (enabled boolean,type text,description text)")
		    end if
		    
		  else
		    MsgBox "Error Writing File"
		  end if
		  
		  
		  // Put all the properties into the database
		  dim r as DatabaseRecord
		  
		  r = new DatabaseRecord
		  r.Column("blockname") = BlockName
		  r.Column("blockcategory") = BlockCategory
		  r.Column("blockdescription") = BlockDescription
		  r.Column("inputname") = InputName
		  myDB.InsertRecord("BlockInfo", r)
		  
		  
		  // Add in each of the target template codes
		  r = new DatabaseRecord
		  r.Column("code") = TemplateCodeAndroid
		  r.Column("importstatements") = TemplateImportsAndroid
		  r.Column("target") = "Android"
		  myDB.InsertRecord("TheCode", r)
		  
		  r = new DatabaseRecord
		  r.Column("code") = TemplateCodeFlexWeb
		  r.Column("importstatements") = TemplateImportsFlexWeb
		  r.Column("target") = "Adobe Flex - Web"
		  myDB.InsertRecord("TheCode", r)
		  
		  r = new DatabaseRecord
		  r.Column("code") = TemplateCodePythonDesktop
		  r.Column("importstatements") = TemplateImportsPythonDesktop
		  r.Column("target") = "Python/GTK - Desktop"
		  myDB.InsertRecord("TheCode", r)
		  
		  r = new DatabaseRecord
		  r.Column("code") = TemplateCodePythonMaemo
		  r.Column("importstatements") = TemplateImportsPythonMaemo
		  r.Column("target") = "Python/GTK - Maemo Tablet"
		  myDB.InsertRecord("TheCode", r)
		  
		  r = new DatabaseRecord
		  r.Column("code") = TemplateCodeiOS
		  r.Column("importstatements") = TemplateImportsiOS
		  r.Column("target") = "iOS"
		  myDB.InsertRecord("TheCode", r)
		  
		  r = new DatabaseRecord
		  r.Column("code") = TemplateCodeHTML5Web
		  r.Column("importstatements") = TemplateImportsHTML5Web
		  r.Column("target") = "HTML5"
		  myDB.InsertRecord("TheCode", r)
		  
		  // Add in the outputs
		  r = new DatabaseRecord
		  r.Column("outname") = Out1Name
		  r.BooleanColumn("enabled") = Out1Enabled
		  myDB.InsertRecord("Outputs", r)
		  
		  r = new DatabaseRecord
		  r.Column("outname") = Out2Name
		  r.BooleanColumn("enabled") = Out2Enabled
		  myDB.InsertRecord("Outputs", r)
		  
		  
		  // Add in the variables
		  r = new DatabaseRecord
		  r.Column("description") = Var1Description
		  r.BooleanColumn("enabled") = Var1Enabled
		  r.Column("type") = Var1Type
		  myDB.InsertRecord("Vars", r)
		  
		  r = new DatabaseRecord
		  r.Column("description") = Var2Description
		  r.BooleanColumn("enabled") = Var2Enabled
		  r.Column("type") = Var2Type
		  myDB.InsertRecord("Vars", r)
		  
		  r = new DatabaseRecord
		  r.Column("description") = Var3Description
		  r.BooleanColumn("enabled") = Var3Enabled
		  r.Column("type") = Var3Type
		  myDB.InsertRecord("Vars", r)
		  
		  
		  myDB.Commit
		  myDB.Close
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BlockCategory As string
	#tag EndProperty

	#tag Property, Flags = &h0
		BlockDescription As string
	#tag EndProperty

	#tag Property, Flags = &h0
		BlockName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		InputName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		myDB As REALSQLDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		myDBFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Out1Enabled As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Out1Name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Out2Enabled As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Out2Name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateCodeAndroid As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateCodeFlexWeb As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateCodeHaikuDesktop As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateCodeHTML5Web As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateCodeiOS As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateCodePythonDesktop As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateCodePythonMaemo As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateImportsAndroid As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateImportsFlexWeb As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateImportsHTML5Web As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateImportsiOS As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateImportsPythonDesktop As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateImportsPythonMaemo As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Var1Description As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Var1Enabled As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Var1Type As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Var2Description As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Var2Enabled As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Var2Type As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Var3Description As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Var3Enabled As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Var3Type As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BGColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="color"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlockCategory"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlockDescription"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlockName"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="InputName"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="Out1Enabled"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Out1Name"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Out2Enabled"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Out2Name"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="TemplateCodeAndroid"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateCodeFlexWeb"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateCodeHaikuDesktop"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateCodeHTML5Web"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateCodeiOS"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateCodePythonDesktop"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateCodePythonMaemo"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateImportsAndroid"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateImportsFlexWeb"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateImportsHTML5Web"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateImportsiOS"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateImportsPythonDesktop"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TemplateImportsPythonMaemo"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="Var1Description"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Var1Enabled"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Var1Type"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Var2Description"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Var2Enabled"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Var2Type"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Var3Description"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Var3Enabled"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Var3Type"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
