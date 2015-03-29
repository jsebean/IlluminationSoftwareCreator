#tag Class
Protected Class ilObjectApp
Inherits ilObjectBase
	#tag Event
		Sub GenerateAndroidCode(theOrigin as string)
		  me.UniqueID = "1"
		  
		  dim s as string
		  dim i as integer
		  dim dictDefaults as string
		  dim dictLoop as integer
		  
		  
		  s = "package " + modVariables.GetAndroidPackage + ";" + EndOfLine
		  s = s + "import android.app.Activity;" + EndOfLine
		  s = s + "import android.os.Handler;" + EndOfLine
		  s = s + "import android.app.AlertDialog;" + EndOfLine
		  s = s + "import android.content.DialogInterface;" + EndOfLine
		  s = s + "import android.graphics.Color;" + EndOfLine
		  s = s + "import android.os.Bundle;" + EndOfLine
		  s = s + "import android.widget.Toast;" + EndOfLine
		  s = s + "import android.widget.Button;" + EndOfLine
		  s = s + "import android.widget.CheckBox;" + EndOfLine
		  s = s + "import android.widget.ListView;" + EndOfLine
		  s = s + "import android.widget.ArrayAdapter;" + EndOfLine
		  s = s + "import java.util.Hashtable;" + EndOfLine
		  s = s + "import android.widget.AdapterView;" + EndOfLine
		  s = s + "import android.view.View;" + EndOfLine
		  s = s + "import android.view.View.OnClickListener;" + EndOfLine
		  s = s + "import android.widget.AdapterView.OnItemClickListener;" + EndOfLine
		  s = s + "import android.widget.EditText;" + EndOfLine
		  s = s + "import android.view.View.OnKeyListener;" + EndOfLine
		  s = s + "import android.view.KeyEvent;" + EndOfLine
		  s = s + "import android.widget.ProgressBar;" + EndOfLine
		  s = s + "import java.util.Random;" + EndOfLine
		  s = s + "import android.widget.TextView;" + EndOfLine
		  s = s + "import java.io.OutputStream;" + EndOfLine
		  s = s + "import java.io.OutputStreamWriter;" + EndOfLine
		  s = s + "import java.io.InputStream;" + EndOfLine
		  s = s + "import java.io.InputStreamReader;" + EndOfLine
		  s = s + "import java.io.BufferedReader;" + EndOfLine
		  s = s + "import android.webkit.WebView;" + EndOfLine
		  s = s + "import android.webkit.WebViewClient;" + EndOfLine
		  s = s + "import android.widget.ImageView;" + EndOfLine
		  s = s + "import java.util.ArrayList;" + EndOfLine
		  s = s + "import java.util.Arrays;" + EndOfLine
		  s = s + "//EndImports" + EndOfLine
		  s= s + EndOfLine
		  
		  
		  's = s + "public class " + modVariables.GetSpaceFreeAppName + " extends Application {" + EndOfLine
		  's = s + EndOfLine
		  's = s + "public " + modVariables.GetSpaceFreeAppName + " ()" + EndOfLine
		  's = s + "{" + EndOfLine
		  's = s + "super();" + EndOfLine
		  ''s = s + "}" + EndOfLine
		  's = s + "}" + EndOfLine + EndOfLine
		  
		  
		  s = s + "public class " + modVariables.GetSpaceFreeAppName + " extends Activity {" + EndOfLine
		  
		  
		  // Variable creation goes here
		  'public Bitmap b = null;
		  // Init all the global variables
		  dim d as new Dictionary
		  
		  if modVariables.projectVariables.Ubound >= 0 then
		    for i = 0 to modVariables.projectVariables.Ubound
		      if modVariables.projectVariables(i).Type = "Number" then
		        s = s + "public int " + modVariables.projectVariables(i).ISCClassLocalAndroidName + " = " + PythonEscapeString(modVariables.projectVariables(i).DefaultVal)  + ";" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Text" then
		        s = s + "public String " + modVariables.projectVariables(i).ISCClassLocalAndroidName + " = """ + PythonEscapeString(modVariables.projectVariables(i).DefaultVal)  + """;" + EndOfLine
		      end if
		      
		      if modVariables.projectVariables(i).Type = "Dictionary" then
		        s = s + "public Hashtable<String, String> " + modVariables.projectVariables(i).ISCClassLocalAndroidName + " = new Hashtable();" + EndOfLine
		        
		        // Set dictionary default values
		        
		        d = GetDictFromString(modVariables.projectVariables(i).DefaultVal)
		        
		        if d.Count > 0 then
		          for dictLoop = 0 to d.Count - 1
		            
		            dictDefaults = dictDefaults + modVariables.projectVariables(i).ISCClassLocalAndroidName + ".put(""" + _
		            d.Key(dictLoop).StringValue + """, """ + d.Value(d.Key(dictLoop)).StringValue + """);" + EndOfLine
		            
		            
		          next
		        end if
		        
		      end if
		      
		      
		      if modVariables.projectVariables(i).Type = "Text File" then
		        s = s + "public String " + modVariables.projectVariables(i).ISCClassLocalAndroidName + " = """ + PythonEscapeString(modVariables.projectVariables(i).DefaultVal)  + """;" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Picture" then
		        's = s + " " + modVariables.projectVariables(i).ISCClassLocalPythonName + " = gtk.create_pixmap(None," +  str(modVariables.projectVariables(i).Picturewidth) + ", " + str(modVariables.projectVariables(i).PictureHeight) + ", 24)" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Color" then
		        'dim tempColor as Color
		        'tempColor = modVariables.StringToColor(modVariables.projectVariables(i).DefaultVal)
		        's = s + " " + modVariables.projectVariables(i).ISCClassLocalPythonName + " = gtk.gdk.Color(" +  str(tempColor.Red * 257) + ", " + str(tempColor.Green * 257) + ", " + str(tempColor.Blue * 257) + ")" + EndOfLine
		      end if
		    next
		  end if
		  
		  s = s + "//EndOfGlobalVariables" + EndOfLine + EndOfLine
		  
		  
		  
		  
		  s= s + EndOfLine
		  s = s + "@Override" + EndOfLine
		  s = s + "public void onCreate(Bundle savedInstanceState) {" + EndOfLine
		  s = s + "super.onCreate(savedInstanceState);" + EndOfLine
		  //setContentView(R.layout.main);
		  s = s + dictDefaults
		  s = s + "//" + GetCodeName + "Launched" + EndOfLine
		  //s = s + "}" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  
		  s = s + "private class ISCWebViewClient extends WebViewClient {" + EndOfLine
		  s = s + "@Override" + EndOfLine
		  s = s + "public boolean shouldOverrideUrlLoading(WebView view, String url) {" + EndOfLine
		  s = s + "view.loadUrl(url);" + EndOfLine
		  s = s + "return true;" + EndOfLine
		  s = s + "}" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  s = s + "//EndOfFunctions" + EndOfLine + EndOfLine
		  
		  s = s + "}" + EndOfLine
		  
		  // Write the listboxrow.xml to file
		  dim t as TextOutputStream
		  dim f2 as FolderItem
		  dim slist as string
		  slist = "<TextView xmlns:android=""http://schemas.android.com/apk/res/android""" + EndOfLine
		  slist = slist + "android:id=""@+id/listboxrow""" + EndOfLine
		  slist = slist + "android:layout_width=""fill_parent""" + EndOfLine
		  slist = slist + "android:layout_height=""wrap_content""" + EndOfLine
		  slist = slist + "android:padding=""10dp""" + EndOfLine
		  slist = slist + "android:textSize=""16sp"" >" + EndOfLine
		  slist = slist + "</TextView>" + EndOfLine
		  f2 = modCodeGenerator.AndroidLayoutFolder.child("listboxrow.xml")
		  If f2 <> Nil then
		    t=TextOutputStream.Create(f2)
		    t.Write(slist)
		    t.Close
		  End if
		  
		  modCodeGenerator.AndroidMainJavaCode = modCodeGenerator.AndroidMainJavaCode + s
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateFlexWebCode(theOrigin as string)
		  // Generate the function and class definitions, along with any supporting code for the block.
		  
		  me.UniqueID = "1"
		  
		  dim s as string
		  
		  // The Header of the mxml
		  s = "<?xml version=""1.0"" encoding=""utf-8""?>" + EndOfLine + _
		  "<mx:Application xmlns:mx=""http://www.adobe.com/2006/mxml"" xmlns:me=""components.*"" xmlns:s=""library://ns.adobe.com/flex/spark"" layout=""absolute"" initialize=""" + _
		   GetCodeName + "Launched" + "()"" >" + EndOfLine + EndOfLine
		  // xmlns:me="components.*">
		  
		  
		  // The Script block
		  s = s + "<mx:Script><![CDATA[" + EndOfLine + EndOfLine
		  
		  // Import everything we'll need
		  s = s + "import mx.controls.Alert;" + EndOfLine
		  s = s + "import mx.events.CloseEvent;" + EndOfLine
		  s = s + "import flash.display.BitmapData;" + EndOfLine
		  s = s + "//EndImports" + EndOfLine
		  s = s + EndOfLine
		  
		  // Init all the global variables within the script block
		  dim i as integer
		  dim d as new Dictionary
		  dim dictDefaults as string
		  dim dictLoop as integer
		  
		  if modVariables.projectVariables.Ubound >= 0 then
		    for i = 0 to modVariables.projectVariables.Ubound
		      if modVariables.projectVariables(i).Type = "Number" then
		        s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + ":int = " + modVariables.projectVariables(i).DefaultVal + ";" + EndOfLine
		      end if
		      
		      if modVariables.projectVariables(i).Type = "Dictionary" then
		        s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + ":Object = new Object();" + EndOfLine
		        
		        // Set dictionary default values
		        
		        d = GetDictFromString(modVariables.projectVariables(i).DefaultVal)
		        
		        if d.Count > 0 then
		          for dictLoop = 0 to d.Count - 1
		            
		            dictDefaults = dictDefaults + modVariables.projectVariables(i).ISCClassLocalFlexName + "[" + _
		            d.Key(dictLoop).StringValue + "] = " + d.Value(d.Key(dictLoop)).StringValue + ";" + EndOfLine
		            
		          next
		        end if
		        
		      end if
		      
		      if modVariables.projectVariables(i).Type = "Text" then
		        s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + ":String = """ + modVariables.projectVariables(i).DefaultVal + """;" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Text File" then
		        s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + ":String = """ + modVariables.projectVariables(i).DefaultVal + """;" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Picture" then
		        s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + ":BitmapData = new BitmapData(" + str(modVariables.projectVariables(i).PictureWidth) + ", " + str(modVariables.projectVariables(i).PictureHeight) + ");" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Color" then
		        dim tempColor as Color
		        tempColor = modVariables.StringToColor(modVariables.projectVariables(i).DefaultVal)
		        s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + ":String = """ + modVariables.HexFromColor(tempColor) + """;" + EndOfLine
		      end if
		    next
		  end if
		  
		  s = s + EndOfLine
		  
		  // Load the images
		  if modVariables.projectImages.Ubound >= 0 then
		    for i = 0 to modVariables.projectImages.Ubound
		      s = s + "[Bindable]" + EndOfLine
		      s = s + "[Embed(source=""ISCimages/" + modVariables.projectImages(i).ActualFileName + """)]" + EndOfLine
		      s = s + "public var " + modVariables.projectImages(i).FlexEmbedName + ":Class;" + EndOfLine
		    next
		  end if
		  
		  s = s + EndOfLine
		  
		  s = s + "//EndOfGlobalVariables" + EndOfLine + EndOfLine
		  
		  s = s + "private function " + GetCodeName + "Launched():void" + EndOfLine
		  s = s + "{" + EndOfLine
		  s = s + dictDefaults + EndOfLine
		  s = s + "//" + GetCodeName + "Launched" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  
		  s = s + "//EndOfFunctions" + EndOfLine + EndOfLine
		  
		  // End the script block
		  s = s + "]]></mx:Script>" + EndOfLine + EndOfLine
		  
		  
		  
		  s = s + "<!--EndOfMXML-->" + EndOfLine + EndOfLine 
		  
		  s = s + "</mx:Application>" + EndOfLine
		  
		  modCodeGenerator.FlexWebCode = modCodeGenerator.FlexWebCode + s
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateiOSCode(theOrigin as string)
		  me.UniqueID = "1"
		  
		  dim s as string
		  dim i as integer
		  
		  dim DictIniter as string
		  dim d as new Dictionary
		  dim dictDefaults as string
		  dim dictLoop as integer
		  
		  iOSCreatePList
		  iOSCreatePBXProj
		  iOSCreatePrefix
		  
		  // Generate the main.m code
		  
		  s = "//  main.m" + EndOfLine
		  s = s + "//  Generated by Illumination Software Creator" + EndOfLine + EndOfLine
		  
		  s = s + "#import <UIKit/UIKit.h>" + EndOfLine
		  s = s + "//EndImports" + EndOfLine
		  
		  s = s + "int main(int argc, char *argv[]) {" + EndOfLine
		  s = s + "NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];" + EndOfLine
		  s = s + "int retVal = UIApplicationMain(argc, argv, nil, @""" + modVariables.GetiOSDelegateName + """);" + EndOfLine
		  s = s + "[pool release];" + EndOfLine
		  s = s + "return retVal;" + EndOfLine
		  s = s + "}" + EndOfLine
		  
		  iosMainCode = s
		  
		  
		  
		  // Generate the app delegate Header code
		  
		  s = "//  Application Delegate Header" + EndOfLine
		  s = s + "//  Generated by Illumination Software Creator" + EndOfLine + EndOfLine
		  s = s + "#import <UIKit/UIKit.h>" + EndOfLine + EndOfLine
		  s = s + "@interface " + modVariables.GetiOSDelegateName  + " : NSObject <UIApplicationDelegate> {" + EndOfLine
		  s = s + "UIWindow *window;" + EndOfLine
		  //UILabel *label;
		  s = s + "//EndUIVariables" + EndOfLine + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  s = s + "@property (nonatomic, retain) IBOutlet UIWindow *window;" + EndOfLine + EndOfLine
		  
		  if modVariables.projectVariables.Ubound >= 0 then
		    for i = 0 to modVariables.projectVariables.Ubound
		      if modVariables.projectVariables(i).Type = "Number" then
		        s = s + "extern int " + modVariables.projectVariables(i).ISCiOSName + ";" + EndOfLine
		      end if
		      
		      if modVariables.projectVariables(i).Type = "Dictionary" then
		        s = s + "extern NSMutableDictionary *" + modVariables.projectVariables(i).ISCiOSName + ";" + EndOfLine
		      end if
		      
		      
		      if modVariables.projectVariables(i).Type = "Text" then
		        s = s + "extern NSMutableString *" + modVariables.projectVariables(i).ISCiOSName + ";" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Text File" then
		        s = s + "extern NSMutableString *" + modVariables.projectVariables(i).ISCiOSName + ";" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Picture" then
		      end if
		      if modVariables.projectVariables(i).Type = "Color" then
		      end if
		    next
		  end if
		  
		  s = s + EndOfLine
		  s = s + "@end" + EndOfLine
		  
		  iosAppDelegateHCode = s
		  
		  
		  
		  // Generate the app delegate m code
		  
		  
		  s = "//  Application Delegate" + EndOfLine
		  s = s + "//  Generated by Illumination Software Creator" + EndOfLine + EndOfLine
		  
		  s = s + "#import """ + modVariables.GetiOSDelegateName + ".h""" + EndOfLine + EndOfLine
		  
		  s = s + "@implementation " + modVariables.GetiOSDelegateName + EndOfLine + EndOfLine
		  
		  s = s + "@synthesize window;" + EndOfLine + EndOfLine
		  
		  if modVariables.projectVariables.Ubound >= 0 then
		    for i = 0 to modVariables.projectVariables.Ubound
		      if modVariables.projectVariables(i).Type = "Number" then
		        s = s + "int " + modVariables.projectVariables(i).ISCiOSName + " = " + PythonEscapeString(modVariables.projectVariables(i).DefaultVal) + ";" +EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Text" then
		        s = s + "NSMutableString *" + modVariables.projectVariables(i).ISCiOSName + " = @""" + PythonEscapeString(modVariables.projectVariables(i).DefaultVal) + """;" +EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Dictionary" then
		        s = s + "NSMutableDictionary *" + modVariables.projectVariables(i).ISCiOSName + ";" +EndOfLine
		        DictIniter = DictIniter + modVariables.projectVariables(i).ISCiOSName + " = [[NSMutableDictionary alloc] init];" +EndOfLine
		        
		        
		        // Set dictionary default values
		        
		        d = GetDictFromString(modVariables.projectVariables(i).DefaultVal)
		        
		        if d.Count > 0 then
		          for dictLoop = 0 to d.Count - 1
		            
		            dictDefaults = dictDefaults + modVariables.projectVariables(i).ISCiOSName + " setObject:" + _
		            d.Value(d.Key(dictLoop)).StringValue + " forKey:" + d.Key(dictLoop).StringValue + "];" + EndOfLine
		            
		          next
		        end if
		        
		        
		      end if
		      if modVariables.projectVariables(i).Type = "Text File" then
		        s = s + "NSMutableString *" + modVariables.projectVariables(i).ISCiOSName + " = @""" + PythonEscapeString(modVariables.projectVariables(i).DefaultVal) + """;" +EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Picture" then
		      end if
		      if modVariables.projectVariables(i).Type = "Color" then
		      end if
		    next
		  end if
		  
		  s = s + "//EndOfGlobalVariables" + EndOfLine + EndOfLine
		  
		  s = s + "- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {" + EndOfLine
		  s = s + DictIniter + EndOfLine
		  s = s + dictDefaults + EndOfLine
		  s = s + "//" + GetCodeName + "Launched" + EndOfLine
		  s = s + "return YES;" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  
		  s = s + "//EndOfFunctions" + EndOfLine + EndOfLine
		  
		  s = s + "- (BOOL) textFieldShouldReturn:(UITextField*) textField {" + EndOfLine
		  s = s + "[textField resignFirstResponder];" + EndOfLine
		  s = s + "return YES;" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  s = s + "- (void)alertView:(UIAlertView *)theAlert clickedButtonAtIndex:(NSInteger)buttonIndex {" + EndOfLine
		  s = s + "//EndOfAlert" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  s = s + "- (void)dealloc {" + EndOfLine
		  s = s + "[super dealloc];" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  s = s + "@end" + EndOfLine
		  
		  
		  
		  iosAppDelegateMCode = s
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateJavaScriptWebCode(theOrigin as string)
		  // Generate the base HTML, helper functions, global variables
		  
		  me.UniqueID = "1"
		  
		  dim s as string
		  
		  // The Header of the HTML file
		  
		  s = "<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Strict//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"">" + EndOfLine + _
		  "<html xmlns=""http://www.w3.org/1999/xhtml"" lang=""en"">" + EndOfLine + _
		  "<head>" + EndOfLine + _
		  "<meta http-equiv=""content-type"" content=""text/html;charset=utf-8"" />" + EndOfLine + _
		  "<title>" + modVariables.ProjectApplicationName + "</title>" + EndOfLine + EndOfLine
		  
		  s = s + "<script src=""javascript/prototype.js"" type=""text/javascript""></script>" + EndOfLine
		  s = s + "<script src=""javascript/scriptaculous.js"" type=""text/javascript""></script>" + EndOfLine + EndOfLine
		  
		  // The CSS
		  
		  s = s + "<style type=""text/css"">" + EndOfLine
		  s = s + "body {" + EndOfLine
		  s = s + "background: url('img/pagebg.jpg') repeat-x;" + EndOfLine
		  s = s + "background-color: #FFFFFF;" + EndOfLine
		  s = s + "font-family: arial, verdana, sans-serif;" + EndOfLine
		  s = s + "font-size: 12px;" + EndOfLine
		  s = s + "}" + EndOfLine
		  
		  s = s + "a {" + EndOfLine
		  s = s + "color: #cde2ff;" + EndOfLine
		  s = s + "font-weight: bold;" + EndOfLine
		  s = s + "font-size: 11px;" + EndOfLine
		  s = s + "}" + EndOfLine
		  
		  s = s + ".window {" + EndOfLine
		  s = s + "//WindowColor" + EndOfLine
		  //s = s + "background: #E0E0E0;" + EndOfLine
		  s = s + "position: absolute;" + EndOfLine
		  s = s + "padding: 1px;" + EndOfLine
		  s = s + "border: 1px solid #424242;" + EndOfLine
		  s = s + "}" + EndOfLine
		  
		  s = s + ".window p {" + EndOfLine
		  s = s + "margin: 3px;" + EndOfLine
		  s = s + "}" + EndOfLine
		  
		  s = s + ".windowinner {" + EndOfLine
		  s = s + "padding: 7px;" + EndOfLine
		  s = s + "}" + EndOfLine
		  
		  s = s + ".windowinner input {" + EndOfLine
		  s = s + "margin-top: 20px;" + EndOfLine
		  s = s + "}" + EndOfLine
		  
		  s = s + ".window h1" + EndOfLine
		  s = s + "{" + EndOfLine
		  s = s + "padding: 6px;" + EndOfLine
		  s = s + "display: block;" + EndOfLine
		  s = s + "background-color: #A6A6A6;" + EndOfLine
		  s = s + "font-size: 13px;" + EndOfLine
		  s = s + "margin: 0px;" + EndOfLine
		  s = s + "color: #424242;" + EndOfLine
		  s = s + "}" + EndOfLine
		  
		  s = s + "</style>" + EndOfLine + EndOfLine
		  
		  
		  
		  // The Script section
		  
		  s = s + "<script type=""text/javascript"">" + EndOfLine + EndOfLine
		  
		  
		  // Init all the global variables within the script block
		  dim i as integer
		  dim d as new Dictionary
		  dim dictDefaults as string
		  dim dictLoop as integer
		  
		  if modVariables.projectVariables.Ubound >= 0 then
		    for i = 0 to modVariables.projectVariables.Ubound
		      if modVariables.projectVariables(i).Type = "Number" then
		        s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + " = " + modVariables.projectVariables(i).DefaultVal + ";" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Dictionary" then
		        s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + " = {};" + EndOfLine
		        
		        
		        // Set dictionary default values
		        
		        d = GetDictFromString(modVariables.projectVariables(i).DefaultVal)
		        
		        if d.Count > 0 then
		          for dictLoop = 0 to d.Count - 1
		            
		            dictDefaults = dictDefaults + modVariables.projectVariables(i).ISCClassLocalFlexName + "[""" + _
		            d.Key(dictLoop).StringValue + """] = """ + d.Value(d.Key(dictLoop)).StringValue + """;" + EndOfLine
		            
		          next
		        end if
		        
		        
		      end if
		      if modVariables.projectVariables(i).Type = "Text" then
		        s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + " = """ + modVariables.projectVariables(i).DefaultVal + """;" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Text File" then
		        //s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + ":String = """ + modVariables.projectVariables(i).DefaultVal + """;" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Picture" then
		        //s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + ":BitmapData = new BitmapData(" + str(modVariables.projectVariables(i).PictureWidth) + ", " + str(modVariables.projectVariables(i).PictureHeight) + ");" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Color" then
		        //dim tempColor as Color
		        //tempColor = modVariables.StringToColor(modVariables.projectVariables(i).DefaultVal)
		        //s = s + "var " + modVariables.projectVariables(i).ISCClassLocalFlexName + ":String = """ + modVariables.HexFromColor(tempColor) + """;" + EndOfLine
		      end if
		    next
		  end if
		  
		  s = s + "//EndOfGlobalVariables" + EndOfLine + EndOfLine
		  
		  s = s + "function init()" + EndOfLine
		  s = s + "{" + EndOfLine + EndOfLine
		  s = s + dictDefaults + EndOfLine
		  s = s + "//" + GetCodeName + "Launched" + EndOfLine
		  s = s + "}" + EndOfLine + EndOfLine
		  s = s + "Event.observe(window, 'load', init, false);" + EndOfLine + EndOfLine
		  //s = s + "init();" + EndOfLine + EndOfLine
		  
		  s = s + "//EndOfFunctions" + EndOfLine + EndOfLine
		  
		  // End the script block
		  s = s + "</script>" + EndOfLine
		  s = s + "</head>" + EndOfLine
		  
		  
		  s = s + "<body>" + EndOfLine
		  
		  s = s + "<!-- EndOfHTML -->" + EndOfLine + EndOfLine
		  
		  s = s + "</body>" + EndOfLine
		  s = s + "</html>" + EndOfLine
		  
		  modCodeGenerator.WebJavaScriptCode = modCodeGenerator.WebJavaScriptCode + s
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GeneratePythonDesktopCode(theOrigin as string)
		  'modCodeGenerator.PythonDesktopCode
		  // Generate the function and class definitions, along with any supporting code for the block.
		  
		  me.UniqueID = "1"
		  
		  dim s as string
		  
		  s = "#!/usr/bin/env python" + EndOfLine + _
		  "# -*- coding: utf-8 -*-" + EndOfLine + EndOfLine + _
		  "import pygtk" + EndOfLine + _
		  "pygtk.require('2.0')" + EndOfLine + _
		  "import gobject" + EndOfLine + _
		  "import random" + EndOfLine + _
		  "import os" + EndOfLine + _
		  "import sys" + EndOfLine + _
		  "import gtk" + EndOfLine + _
		  "#EndImports" + EndOfLine + EndOfLine
		  
		  
		  s = s + "class " + GetClassNameDefinition + ":" + EndOfLine
		  
		  // Init all the global variables
		  dim i as integer
		  dim d as new Dictionary
		  dim dictDefaults as string
		  dim dictLoop as integer
		  
		  if modVariables.projectVariables.Ubound >= 0 then
		    for i = 0 to modVariables.projectVariables.Ubound
		      if modVariables.projectVariables(i).Type = "Number" then
		        s = s + " " + modVariables.projectVariables(i).ISCClassLocalPythonName + " = " +  modVariables.projectVariables(i).DefaultVal + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Dictionary" then
		        s = s + " " + modVariables.projectVariables(i).ISCClassLocalPythonName + " = {}" + EndOfLine
		        
		        // Set dictionary default values
		        
		        d = GetDictFromString(modVariables.projectVariables(i).DefaultVal)
		        
		        if d.Count > 0 then
		          for dictLoop = 0 to d.Count - 1
		            
		            dictDefaults = dictDefaults + "  " + modVariables.projectVariables(i).ISCClassLocalPythonName + "[" + _
		            d.Key(dictLoop).StringValue + "] = " + d.Value(d.Key(dictLoop)).StringValue + EndOfLine
		            
		          next
		        end if
		        
		      end if
		      if modVariables.projectVariables(i).Type = "Text" then
		        s = s + " " + modVariables.projectVariables(i).ISCClassLocalPythonName + " = """ + PythonEscapeString(modVariables.projectVariables(i).DefaultVal) + """" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Text File" then
		        s = s + " " + modVariables.projectVariables(i).ISCClassLocalPythonName + " = """ + PythonEscapeString(modVariables.projectVariables(i).DefaultVal) + """" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Picture" then
		        s = s + " " + modVariables.projectVariables(i).ISCClassLocalPythonName + " = gtk.create_pixmap(None," +  str(modVariables.projectVariables(i).Picturewidth) + ", " + str(modVariables.projectVariables(i).PictureHeight) + ", 24)" + EndOfLine
		      end if
		      if modVariables.projectVariables(i).Type = "Color" then
		        dim tempColor as Color
		        tempColor = modVariables.StringToColor(modVariables.projectVariables(i).DefaultVal)
		        s = s + " " + modVariables.projectVariables(i).ISCClassLocalPythonName + " = gtk.gdk.Color(" +  str(tempColor.Red * 257) + ", " + str(tempColor.Green * 257) + ", " + str(tempColor.Blue * 257) + ")" + EndOfLine
		      end if
		    next
		  end if
		  
		  s = s + " #EndOfGlobalVariables" + EndOfLine + EndOfLine
		  
		  s = s + " def main(self):" + EndOfLine + _
		  "  gtk.main()" + EndOfLine + EndOfLine
		  
		  
		  s = s + " def destroy(self, widget, data=None):" + EndOfLine + _
		  "  gtk.main_quit()" + EndOfLine + EndOfLine
		  
		  s = s + dictDefaults + EndOfLine + EndOfLine
		  
		  s = s + "#EndOfClass" + EndOfLine + EndOfLine + _
		  "#EndOfFunctions" + EndOfLine + EndOfLine
		  
		  s = s + GetClassNameVariable + " = " + GetClassNameDefinition + "()" + EndOfLine + EndOfLine
		  
		  s = s + "#" + GetCodeName + "Launched" + EndOfLine + _
		  "#EndOfStatements" + EndOfLine + EndOfLine + _
		  GetClassNameVariable + ".main()"
		  
		  modCodeGenerator.PythonDesktopCode = modCodeGenerator.PythonDesktopCode + s
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GeneratePythonDesktopCodePhase2(theSourceObject as contentObject, theDestinationObject as contentObject)
		  'dim sCommentTag as string
		  'dim sReplacementCode as string
		  '
		  'sCommentTag = "#" + ilObjectBase(theSourceObject.parent.tag).GetCodeName + TextObject(theSourceObject).text
		  '
		  'sReplacementCode = theDestinationObject.CodeToCallThisObject
		  '
		  'PythonReplaceCodeAtMarker(sReplacementCode,sCommentTag)
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function Untitled() As Boolean Handles Untitled.Action
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  me.CodeNameBase = "iscApp"
		  me.BGColor = rgb(0,38,255)
		  me.DisplayName = "Application"
		  me.DisplayCategory = "Application"
		  me.Title = "Application"
		  me.Width = 90
		  
		  
		  me.ObjectItems.Append "Launched"
		  me.ObjectShowOutput.Append true
		  me.ObjectShowInput.Append false
		  
		  me.UniqueID = "1"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub iOSCreatePBXProj()
		  dim s as string
		  dim i as integer
		  
		  dim key1 as string
		  dim key2 as string
		  
		  
		  
		  s = "// !$*UTF8*$!" + EndOfLine
		  s = s + "{" + EndOfLine
		  s = s + "archiveVersion = 1;" + EndOfLine
		  s = s + "classes = {" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "objectVersion = 45;" + EndOfLine
		  s = s + "objects = {" + EndOfLine + EndOfLine
		  
		  s = s + "/* Begin PBXBuildFile section */" + EndOfLine
		  s = s + "1D3623260D0F684500981E51 /* " + modVariables.GetiOSDelegateName + ".m in Sources */ = {isa = PBXBuildFile; fileRef = 1D3623250D0F684500981E51 /* " + modVariables.GetiOSDelegateName + ".m */; };" + EndOfLine
		  s = s + "1D60589B0D05DD56006BFB54 /* main.m in Sources */ = {isa = PBXBuildFile; fileRef = 29B97316FDCFA39411CA2CEA /* main.m */; };" + EndOfLine
		  s = s + "1D60589F0D05DD5A006BFB54 /* Foundation.framework in Frameworks */ = {isa = PBXBuildFile; fileRef = 1D30AB110D05D00D00671497 /* Foundation.framework */; };" + EndOfLine
		  s = s + "1DF5F4E00D08C38300B7A737 /* UIKit.framework in Frameworks */ = {isa = PBXBuildFile; fileRef = 1DF5F4DF0D08C38300B7A737 /* UIKit.framework */; };" + EndOfLine
		  s = s + "288765A50DF7441C002DB57D /* CoreGraphics.framework in Frameworks */ = {isa = PBXBuildFile; fileRef = 288765A40DF7441C002DB57D /* CoreGraphics.framework */; };" + EndOfLine
		  // Add in Images
		  if modVariables.projectImages.Ubound > -1 then
		    for i = 0 to modVariables.projectImages.Ubound
		      s = s + "100" + str(i) + " /* " + modVariables.projectImages(i).ActualFileName + _
		      " in Resources */ = {isa = PBXBuildFile; fileRef = " + "200" + str(i) + " /* " + modVariables.projectImages(i).ActualFileName + " */; };" + EndOfLine
		    next
		  end if
		  s = s + "/* End PBXBuildFile section */" + EndOfLine + EndOfLine
		  
		  s = s + "/* Begin PBXFileReference section */" + EndOfLine
		  s = s + "1D30AB110D05D00D00671497 /* Foundation.framework */ = {isa = PBXFileReference; lastKnownFileType = wrapper.framework; name = Foundation.framework; path = System/Library/Frameworks/Foundation.framework; sourceTree = SDKROOT; };" + EndOfLine
		  s = s + "1D3623240D0F684500981E51 /* " + modVariables.GetiOSDelegateName + ".h */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; path = " + modVariables.GetiOSDelegateName + ".h; sourceTree = ""<group>""; };" + EndOfLine
		  s = s + "1D3623250D0F684500981E51 /* " + modVariables.GetiOSDelegateName + ".m */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.objc; path = " + modVariables.GetiOSDelegateName + ".m; sourceTree = ""<group>""; };" + EndOfLine
		  s = s + "1D6058910D05DD3D006BFB54 /* " + modVariables.GetSpaceFreeAppName + ".app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = " + modVariables.GetSpaceFreeAppName + ".app; sourceTree = BUILT_PRODUCTS_DIR; };" + EndOfLine
		  s = s + "1DF5F4DF0D08C38300B7A737 /* UIKit.framework */ = {isa = PBXFileReference; lastKnownFileType = wrapper.framework; name = UIKit.framework; path = System/Library/Frameworks/UIKit.framework; sourceTree = SDKROOT; };" + EndOfLine
		  s = s + "288765A40DF7441C002DB57D /* CoreGraphics.framework */ = {isa = PBXFileReference; lastKnownFileType = wrapper.framework; name = CoreGraphics.framework; path = System/Library/Frameworks/CoreGraphics.framework; sourceTree = SDKROOT; };" + EndOfLine
		  s = s + "29B97316FDCFA39411CA2CEA /* main.m */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.objc; path = main.m; sourceTree = ""<group>""; };" + EndOfLine
		  s = s + "32CA4F630368D1EE00C91783 /* " + modVariables.GetSpaceFreeAppName + "_Prefix.pch */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; path = " + modVariables.GetSpaceFreeAppName + "_Prefix.pch; sourceTree = ""<group>""; };" + EndOfLine
		  s = s + "8D1107310486CEB800E47090 /* " + modVariables.GetSpaceFreeAppName + "-Info.plist */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.plist.xml; path = """ + modVariables.GetSpaceFreeAppName + "-Info.plist""; plistStructureDefinitionIdentifier = ""com.apple.xcode.plist.structure-definition.iphone.info-plist""; sourceTree = ""<group>""; };" + EndOfLine
		  // Add in Images
		  if modVariables.projectImages.Ubound > -1 then
		    for i = 0 to modVariables.projectImages.Ubound
		      s = s + "200" + str(i) + " /* " + modVariables.projectImages(i).ActualFileName + _
		      " in Resources */ = {isa = PBXFileReference; lastKnownFileType = image.jpeg; path = """ + _
		      modVariables.projectImages(i).ActualFileName + """; sourceTree =""<group>"";};" + EndOfLine
		    next
		  end if
		  s = s + "/* End PBXFileReference section */" + EndOfLine + EndOfLine
		  
		  s = s + "/* Begin PBXFrameworksBuildPhase section */" + EndOfLine
		  s = s + "1D60588F0D05DD3D006BFB54 /* Frameworks */ = {" + EndOfLine
		  s = s + "isa = PBXFrameworksBuildPhase;" + EndOfLine
		  s = s + "buildActionMask = 2147483647;" + EndOfLine
		  s = s + "files = (" + EndOfLine
		  s = s + "1D60589F0D05DD5A006BFB54 /* Foundation.framework in Frameworks */," + EndOfLine
		  s = s + "1DF5F4E00D08C38300B7A737 /* UIKit.framework in Frameworks */," + EndOfLine
		  s = s + "288765A50DF7441C002DB57D /* CoreGraphics.framework in Frameworks */," + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "runOnlyForDeploymentPostprocessing = 0;" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "/* End PBXFrameworksBuildPhase section */" + EndOfLine + EndOfLine
		  
		  s = s + "/* Begin PBXGroup section */" + EndOfLine
		  s = s + "080E96DDFE201D6D7F000001 /* Classes */ = {" + EndOfLine
		  s = s + "isa = PBXGroup;" + EndOfLine
		  s = s + "children = (" + EndOfLine
		  s = s + "1D3623240D0F684500981E51 /* " + modVariables.GetiOSDelegateName + ".h */," + EndOfLine
		  s = s + "1D3623250D0F684500981E51 /* " + modVariables.GetiOSDelegateName + ".m */," + EndOfLine
		  if modVariables.projectImages.Ubound > -1 then
		    for i = 0 to modVariables.projectImages.Ubound
		      s = s + "200" + str(i) + " /* " + modVariables.projectImages(i).ActualFileName + _
		      " in Resources */," + EndOfLine
		    next
		  end if
		  
		  s = s + ");" + EndOfLine
		  s = s + "path = Classes;" + EndOfLine
		  s = s + "sourceTree = ""<group>"";" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "19C28FACFE9D520D11CA2CBB /* Products */ = {" + EndOfLine
		  s = s + "isa = PBXGroup;" + EndOfLine
		  s = s + "children = (" + EndOfLine
		  s = s + "1D6058910D05DD3D006BFB54 /* " + modVariables.GetSpaceFreeAppName + ".app */," + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "name = Products;" + EndOfLine
		  s = s + "sourceTree = ""<group>"";" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "29B97314FDCFA39411CA2CEA /* CustomTemplate */ = {" + EndOfLine
		  s = s + "isa = PBXGroup;" + EndOfLine
		  s = s + "children = (" + EndOfLine
		  s = s + "080E96DDFE201D6D7F000001 /* Classes */," + EndOfLine
		  s = s + "29B97315FDCFA39411CA2CEA /* Other Sources */," + EndOfLine
		  s = s + "29B97317FDCFA39411CA2CEA /* Resources */," + EndOfLine
		  s = s + "29B97323FDCFA39411CA2CEA /* Frameworks */," + EndOfLine
		  s = s + "19C28FACFE9D520D11CA2CBB /* Products */," + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "name = CustomTemplate;" + EndOfLine
		  s = s + "sourceTree = ""<group>"";" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "29B97315FDCFA39411CA2CEA /* Other Sources */ = {" + EndOfLine
		  s = s + "isa = PBXGroup;" + EndOfLine
		  s = s + "children = (" + EndOfLine
		  s = s + "32CA4F630368D1EE00C91783 /* tester_Prefix.pch */," + EndOfLine
		  s = s + "29B97316FDCFA39411CA2CEA /* main.m */," + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "name = ""Other Sources"";" + EndOfLine
		  s = s + "sourceTree = ""<group>"";" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "29B97317FDCFA39411CA2CEA /* Resources */ = {" + EndOfLine
		  s = s + "isa = PBXGroup;" + EndOfLine
		  s = s + "children = (" + EndOfLine
		  s = s + "8D1107310486CEB800E47090 /* " + modVariables.GetSpaceFreeAppName + "-Info.plist */," + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "name = Resources;" + EndOfLine
		  s = s + "sourceTree = ""<group>"";" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "29B97323FDCFA39411CA2CEA /* Frameworks */ = {" + EndOfLine
		  s = s + "isa = PBXGroup;" + EndOfLine
		  s = s + "children = (" + EndOfLine
		  s = s + "1DF5F4DF0D08C38300B7A737 /* UIKit.framework */," + EndOfLine
		  s = s + "1D30AB110D05D00D00671497 /* Foundation.framework */," + EndOfLine
		  s = s + "288765A40DF7441C002DB57D /* CoreGraphics.framework */," + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "name = Frameworks;" + EndOfLine
		  s = s + "sourceTree = ""<group>"";" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "/* End PBXGroup section */" + EndOfLine + EndOfLine
		  
		  s = s + "/* Begin PBXNativeTarget section */" + EndOfLine
		  s = s + "1D6058900D05DD3D006BFB54 /* " + modVariables.GetSpaceFreeAppName + " */ = {" + EndOfLine
		  s = s + "isa = PBXNativeTarget;" + EndOfLine
		  s = s + "buildConfigurationList = 1D6058960D05DD3E006BFB54 /* Build configuration list for PBXNativeTarget """ + modVariables.GetSpaceFreeAppName + """ */;" + EndOfLine
		  s = s + "buildPhases = (" + EndOfLine
		  s = s + "1D60588D0D05DD3D006BFB54 /* Resources */," + EndOfLine
		  s = s + "1D60588E0D05DD3D006BFB54 /* Sources */," + EndOfLine
		  s = s + "1D60588F0D05DD3D006BFB54 /* Frameworks */," + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "buildRules = (" + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "dependencies = (" + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "name = " + modVariables.GetSpaceFreeAppName + ";" + EndOfLine
		  s = s + "productName = tester;" + EndOfLine
		  s = s + "productReference = 1D6058910D05DD3D006BFB54 /* " + modVariables.GetSpaceFreeAppName + ".app */;" + EndOfLine
		  s = s + "productType = ""com.apple.product-type.application"";" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "/* End PBXNativeTarget section */" + EndOfLine + EndOfLine
		  
		  s = s + "/* Begin PBXProject section */" + EndOfLine
		  s = s + "29B97313FDCFA39411CA2CEA /* Project object */ = {" + EndOfLine
		  s = s + "isa = PBXProject;" + EndOfLine
		  s = s + "buildConfigurationList = C01FCF4E08A954540054247B /* Build configuration list for PBXProject """ + modVariables.GetSpaceFreeAppName + """ */;" + EndOfLine
		  s = s + "compatibilityVersion = ""Xcode 3.1"";" + EndOfLine
		  s = s + "hasScannedForEncodings = 1;" + EndOfLine
		  s = s + "mainGroup = 29B97314FDCFA39411CA2CEA /* CustomTemplate */;" + EndOfLine
		  s = s + "projectDirPath = """";" + EndOfLine
		  s = s + "projectRoot = """";" + EndOfLine
		  s = s + "targets = (" + EndOfLine
		  s = s + "1D6058900D05DD3D006BFB54 /* tester */," + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "/* End PBXProject section */" + EndOfLine
		  
		  s = s + "/* Begin PBXResourcesBuildPhase section */" + EndOfLine
		  s = s + "1D60588D0D05DD3D006BFB54 /* Resources */ = {" + EndOfLine
		  s = s + "isa = PBXResourcesBuildPhase;" + EndOfLine
		  s = s + "buildActionMask = 2147483647;" + EndOfLine
		  s = s + "files = (" + EndOfLine
		  s = s + "28AD733F0D9D9553002E5188 /* MainWindow.xib in Resources */," + EndOfLine
		  s = s + "2899E5220DE3E06400AC0155 /* testerViewController.xib in Resources */," + EndOfLine
		  // Add in Images
		  if modVariables.projectImages.Ubound > -1 then
		    for i = 0 to modVariables.projectImages.Ubound
		      s = s + "100" + str(i) + " /* " + modVariables.projectImages(i).ActualFileName + _
		      " in Resources */," + EndOfLine
		    next
		  end if
		  s = s + ");" + EndOfLine
		  s = s + "runOnlyForDeploymentPostprocessing = 0;" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "/* End PBXResourcesBuildPhase section */" + EndOfLine
		  
		  s = s + "/* Begin PBXSourcesBuildPhase section */" + EndOfLine
		  s = s + "1D60588E0D05DD3D006BFB54 /* Sources */ = {" + EndOfLine
		  s = s + "isa = PBXSourcesBuildPhase;" + EndOfLine
		  s = s + "buildActionMask = 2147483647;" + EndOfLine
		  s = s + "files = (" + EndOfLine
		  s = s + "1D60589B0D05DD56006BFB54 /* main.m in Sources */," + EndOfLine
		  s = s + "1D3623260D0F684500981E51 /* " + modVariables.GetiOSDelegateName + ".m in Sources */," + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "runOnlyForDeploymentPostprocessing = 0;" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "/* End PBXSourcesBuildPhase section */" + EndOfLine
		  
		  s = s + "/* Begin XCBuildConfiguration section */" + EndOfLine
		  s = s + "1D6058940D05DD3E006BFB54 /* Debug */ = {" + EndOfLine
		  s = s + "isa = XCBuildConfiguration;" + EndOfLine
		  s = s + "buildSettings = {" + EndOfLine
		  s = s + "ALWAYS_SEARCH_USER_PATHS = NO;" + EndOfLine
		  s = s + "COPY_PHASE_STRIP = NO;" + EndOfLine
		  s = s + "GCC_DYNAMIC_NO_PIC = NO;" + EndOfLine
		  s = s + "GCC_OPTIMIZATION_LEVEL = 0;" + EndOfLine
		  s = s + "GCC_PRECOMPILE_PREFIX_HEADER = YES;" + EndOfLine
		  s = s + "GCC_PREFIX_HEADER = " + modVariables.GetSpaceFreeAppName + "_Prefix.pch;" + EndOfLine
		  s = s + "INFOPLIST_FILE = """ + modVariables.GetSpaceFreeAppName + "-Info.plist"";" + EndOfLine
		  s = s + "PRODUCT_NAME = " + modVariables.GetSpaceFreeAppName + ";" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "name = Debug;" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "1D6058950D05DD3E006BFB54 /* Release */ = {" + EndOfLine
		  s = s + "isa = XCBuildConfiguration;" + EndOfLine
		  s = s + "buildSettings = {" + EndOfLine
		  s = s + "ALWAYS_SEARCH_USER_PATHS = NO;" + EndOfLine
		  s = s + "COPY_PHASE_STRIP = YES;" + EndOfLine
		  s = s + "GCC_PRECOMPILE_PREFIX_HEADER = YES;" + EndOfLine
		  s = s + "GCC_PREFIX_HEADER = " + modVariables.GetSpaceFreeAppName + "_Prefix.pch;" + EndOfLine
		  s = s + "INFOPLIST_FILE = """ + modVariables.GetSpaceFreeAppName + "-Info.plist"";" + EndOfLine
		  s = s + "PRODUCT_NAME = " + modVariables.GetSpaceFreeAppName + ";" + EndOfLine
		  s = s + "VALIDATE_PRODUCT = YES;" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "name = Release;" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "C01FCF4F08A954540054247B /* Debug */ = {" + EndOfLine
		  s = s + "isa = XCBuildConfiguration;" + EndOfLine
		  s = s + "buildSettings = {" + EndOfLine
		  s = s + "ARCHS = ""$(ARCHS_STANDARD_32_BIT)"";" + EndOfLine
		  s = s + """CODE_SIGN_IDENTITY[sdk=iphoneos*]"" = ""iPhone Developer"";" + EndOfLine
		  s = s + "GCC_C_LANGUAGE_STANDARD = c99;" + EndOfLine
		  s = s + "GCC_WARN_ABOUT_RETURN_TYPE = YES;" + EndOfLine
		  s = s + "GCC_WARN_UNUSED_VARIABLE = YES;" + EndOfLine
		  s = s + "PREBINDING = NO;" + EndOfLine
		  s = s + "SDKROOT = iphoneos;" + EndOfLine
		  if modCodeGenerator.BuildingForiPad = true then
		    s = s + "TARGETED_DEVICE_FAMILY = 2;" + EndOfLine
		  end if
		  s = s + "};" + EndOfLine
		  s = s + "name = Debug;" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "C01FCF5008A954540054247B /* Release */ = {" + EndOfLine
		  s = s + "isa = XCBuildConfiguration;" + EndOfLine
		  s = s + "buildSettings = {" + EndOfLine
		  s = s + "ARCHS = ""$(ARCHS_STANDARD_32_BIT)"";" + EndOfLine
		  s = s + """CODE_SIGN_IDENTITY[sdk=iphoneos*]"" = ""iPhone Developer"";" + EndOfLine
		  s = s + "GCC_C_LANGUAGE_STANDARD = c99;" + EndOfLine
		  s = s + "GCC_WARN_ABOUT_RETURN_TYPE = YES;" + EndOfLine
		  s = s + "GCC_WARN_UNUSED_VARIABLE = YES;" + EndOfLine
		  s = s + "OTHER_CFLAGS = ""-DNS_BLOCK_ASSERTIONS=1"";" + EndOfLine
		  s = s + "PREBINDING = NO;" + EndOfLine
		  s = s + "SDKROOT = iphoneos;" + EndOfLine
		  if modCodeGenerator.BuildingForiPad = true then
		    s = s + "TARGETED_DEVICE_FAMILY = 2;" + EndOfLine
		  end if
		  s = s + "};" + EndOfLine
		  s = s + "name = Release;" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "/* End XCBuildConfiguration section */" + EndOfLine + EndOfLine
		  
		  s = s + "/* Begin XCConfigurationList section */" + EndOfLine
		  s = s + "1D6058960D05DD3E006BFB54 /* Build configuration list for PBXNativeTarget """ + modVariables.GetSpaceFreeAppName + """ */ = {" + EndOfLine
		  s = s + "isa = XCConfigurationList;" + EndOfLine
		  s = s + "buildConfigurations = (" + EndOfLine
		  s = s + "1D6058940D05DD3E006BFB54 /* Debug */," + EndOfLine
		  s = s + "1D6058950D05DD3E006BFB54 /* Release */," + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "defaultConfigurationIsVisible = 0;" + EndOfLine
		  s = s + "defaultConfigurationName = Release;" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "C01FCF4E08A954540054247B /* Build configuration list for PBXProject """ + modVariables.GetSpaceFreeAppName + """ */ = {" + EndOfLine
		  s = s + "isa = XCConfigurationList;" + EndOfLine
		  s = s + "buildConfigurations = (" + EndOfLine
		  s = s + "C01FCF4F08A954540054247B /* Debug */," + EndOfLine
		  s = s + "C01FCF5008A954540054247B /* Release */," + EndOfLine
		  s = s + ");" + EndOfLine
		  s = s + "defaultConfigurationIsVisible = 0;" + EndOfLine
		  s = s + "defaultConfigurationName = Release;" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "/* End XCConfigurationList section */" + EndOfLine
		  s = s + "};" + EndOfLine
		  s = s + "rootObject = 29B97313FDCFA39411CA2CEA /* Project object */;" + EndOfLine
		  s = s + "}" + EndOfLine
		  
		  
		  iosPBXProj = s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub iOSCreatePList()
		  dim s as string
		  
		  s = "<?xml version=""1.0"" encoding=""UTF-8""?>" + EndOfLine
		  s = s + "<!DOCTYPE plist PUBLIC ""-//Apple//DTD PLIST 1.0//EN"" ""http://www.apple.com/DTDs/PropertyList-1.0.dtd"">" + EndOfLine
		  s = s + "<plist version=""1.0"">" + EndOfLine
		  s = s + "<dict>" + EndOfLine
		  s = s + "<key>CFBundleDevelopmentRegion</key>" + EndOfLine
		  s = s + "<string>English</string>" + EndOfLine
		  s = s + "<key>CFBundleDisplayName</key>" + EndOfLine
		  s = s + "<string>" + modVariables.GetSpaceFreeAppName + "</string>" + EndOfLine
		  s = s + "<key>CFBundleExecutable</key>" + EndOfLine
		  s = s + "<string>${EXECUTABLE_NAME}</string>" + EndOfLine
		  s = s + "<key>CFBundleIconFile</key>" + EndOfLine
		  s = s + "<string></string>" + EndOfLine
		  s = s + "<key>CFBundleIdentifier</key>" + EndOfLine
		  s = s + "<string>com.isc." + modVariables.GetSpaceFreeAppName + "</string>" + EndOfLine
		  s = s + "<key>CFBundleInfoDictionaryVersion</key>" + EndOfLine
		  s = s + "<string>6.0</string>" + EndOfLine
		  s = s + "<key>CFBundleName</key>" + EndOfLine
		  s = s + "<string>" + modVariables.GetSpaceFreeAppName + "</string>" + EndOfLine
		  s = s + "<key>CFBundlePackageType</key>" + EndOfLine
		  s = s + "<string>APPL</string>" + EndOfLine
		  s = s + "<key>CFBundleSignature</key>" + EndOfLine
		  s = s + "<string>????</string>" + EndOfLine
		  s = s + "<key>CFBundleVersion</key>" + EndOfLine
		  s = s + "<string>" + modVariables.ProjectVersion + "</string>" + EndOfLine
		  s = s + "<key>LSRequiresIPhoneOS</key>" + EndOfLine
		  s = s + "<true/>" + EndOfLine
		  s = s + "</dict>" + EndOfLine
		  s = s + "</plist>" + EndOfLine
		  
		  iosPList = s
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub iOSCreatePrefix()
		  dim s as string
		  
		  s = "#ifdef __OBJC__" + EndOfLine
		  s = s + "#import <Foundation/Foundation.h>" + EndOfLine
		  s = s + "#import <UIKit/UIKit.h>" + EndOfLine
		  s = s + "#endif" + EndOfLine + EndOfLine
		  
		  iosPrefix = s
		  
		  
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
