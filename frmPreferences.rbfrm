#tag Window
Begin Window frmPreferences
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   197
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Preferences"
   Visible         =   True
   Width           =   428
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Flex SDK Location"
      Enabled         =   True
      Height          =   123
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   388
      Begin PushButton btnLocateFlexSDK
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Locate Flex SDK"
         Default         =   ""
         Enabled         =   True
         Height          =   29
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   33
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   38
         Underline       =   ""
         Visible         =   True
         Width           =   148
      End
      Begin Label lblFlexSDK
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   49
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   33
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Choose the folder where the Flex SDK is located.  Example: ""flex_sdk_4.0.0""."
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   79
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   362
      End
      Begin PushButton PushButton1
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Download Flex SDK"
         Default         =   ""
         Enabled         =   True
         Height          =   28
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   236
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   39
         Underline       =   ""
         Visible         =   True
         Width           =   159
      End
   End
   Begin PushButton btnOK
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   328
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   157
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  if prefFlexSDKLocation = nil then
		    'lblFlexSDK.Text = 
		  else
		    if prefFlexSDKLocation.Exists = false then
		    else
		      //It exists!
		      lblFlexSDK.Text = prefFlexSDKLocation.ShellPath
		    end if
		  end if
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events btnLocateFlexSDK
	#tag Event
		Sub Action()
		  Dim dlg as New SelectFolderDialog
		  Dim f as FolderItem
		  dlg.ActionButtonCaption="Select"
		  dlg.Title="Select Flex SDK"
		  dlg.PromptText="Select the folder where your Flex SDK is located"
		  
		  f=dlg.ShowModal()
		  If f <> Nil then
		    
		    if modPrefs.IsFlexSDKFolderGood(f) = true then
		      modPrefs.prefFlexSDKLocation = f
		      lblFlexSDK.Text = modPrefs.prefFlexSDKLocation.ShellPath
		      modPrefs.WriteAllPrefs
		    else
		      MsgBox "You must choose the folder where your Flex SDK is located."
		    end if
		    
		  else
		    //user cancelled
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  ShowURL "http://opensource.adobe.com/wiki/display/flexsdk/Flex+SDK"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnOK
	#tag Event
		Sub Action()
		  frmPreferences.Close
		End Sub
	#tag EndEvent
#tag EndEvents
