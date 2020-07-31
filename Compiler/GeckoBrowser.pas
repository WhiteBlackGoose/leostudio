(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is GeckoComponents for Delphi.
 *
 * The Initial Developer of the Original Code is Takanori Ito.
 * Portions created by the Initial Developer are Copyright (C) 2003
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s): LAURENT DEFOER www.seoconsulting.lu
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** *)
unit GeckoBrowser;

{$IFDEF LCLCocoa}
  {$MODESWITCH ObjectiveC1}
{$ENDIF}

interface

uses
  {$IFNDEF LCL} Windows, Messages, {$ELSE} LclIntf, LMessages, LclType, LResources, {$ENDIF}
  SysUtils, Classes, Controls, nsConsts, nsXPCOM,
  nsGeckoStrings, CallbackInterfaces, nsTypes, nsXPCOMGlue, BrowserSupports,
  nsXPCOM_std19
  {$IFDEF LCLCarbon}, CarbonPrivate {$ENDIF}
  {$IFDEF LCLCocoa}, CocoaPrivate {$ENDIF};

resourcestring
  SGeckoBrowserInitError = 'Failed to initialize TGeckoBrowser.';
  SGeckoBrowserCannotGoBack = 'Failed to go back history.';
  SGeckoBrowserCannotGoForward = 'Failed to go forward history.';
  SGeckoBrowserLoadURIError = 'Failed to load URI ''%s.'' ';
  SGeckoBrowserCannotReload = 'Failed to reload page.';
  SGeckoBrowserCannotStopAll = 'Failed to stop network and content page.';
  SGeckoBrowserCannotStopNetwork = 'Failed to stop Network.';
  SGeckoBrowserCannotStopContent = 'Failed to stop content page.';

const
  LOAD_FLAGS_NONE = 0;
  LOAD_FLAGS_IS_REFRESH = 16;
  LOAD_FLAGS_IS_LINK = 32;
  LOAD_FLAGS_BYPASS_HISTORY = 64;
  LOAD_FLAGS_REPLACE_HISTORY = 128;
  LOAD_FLAGS_BYPASS_CACHE = 256;
  LOAD_FLAGS_BYPASS_PROXY = 512;
  LOAD_FLAGS_CHARSET_CHANGE = 1024;

{$IFDEF LCL}
const
  WM_GETDLGCODE = LM_GETDLGCODE;
  WM_NEXTDLGCTL = $0028;
  WM_ERASEBKGND = LM_ERASEBKGND;
  E_FAIL        = HRESULT($80004005);
type
  TMessage      = TLMessage;
  TWMGetDlgCode = TLMNoParams;
{$ENDIF}



type
  //TCtxMenuInfo = BrowserSupports.TCtxMenuInfo;
  //TCtxMenuFlags = BrowserSupports.TCtxMenuFlags;
  TGeckoDOMEventType = (
    etNone,
    etEvent,
    etCustomEvent,
    etUIEvent,
    etMouseEvent,
    etStorageEvent
  );

  TGeckoDOMEvent = record
    Name: String;
    EventType: TGeckoDOMEventType;
    event: nsIDOMEvent;
  end;

  TGeckoDOMEventRegister = record
    Name: String;
    eventType: TGeckoDOMEventType;
    propertyName: String;
  end;

  TGeckoDOMEventRegisterArray = array [0..99] of TGeckoDOMEventRegister;
  PGeckoDOMEventRegisterArray = ^TGeckoDOMEventRegisterArray;

  TCustomGeckoBrowser = class;
  TCustomGeckoBrowserChrome = class;
  TCustomGeckoBrowserListener = class;
  TGeckoBrowser = class;
  TGeckoBrowserChrome = class;
  TGeckoBrowserListener = class;
  TCtxMenuInfo = class;

  TDOMLinks = class;
  TDOMForms = class;

  EGeckoBrowserError = class(EGeckoError)
    end;

  EGeckoBrowserNavigationError = class(EGeckoBrowserError)
    end;

  TGeckoBrowserContextMenu      = procedure (Sender: TObject; aInfo: TCtxMenuInfo) of object;
  TGeckoBrowserStatusChange     = procedure (Sender: TObject; aMessage: WideString) of object;
  TGeckoBrowserNewWindow        = procedure (Sender: TObject; aChromeFlags: Longword; var newWindow: TCustomGeckoBrowser) of object;
  TGeckoBrowserProgressChange   = procedure (Sender: TObject; Progress: Integer; ProgressMax: Integer) of object;
  TGeckoBrowserStateChange      = procedure (Sender: TObject; URI: AnsiString; StateFlags: Integer; AStatus: Integer) of object;
  TGeckoBrowserTitleChange      = procedure (Sender: TObject; const Text: WideString) of object;
  TGeckoBrowserVisibleChange    = procedure (Sender: TObject; Vislble: Bool) of object;
  TGeckoBrowserDocumentComplete = procedure (Sender: TObject) of object;
  TGeckoBrowserDOMInputFocus    = procedure (Sender: TObject; Element: nsIDOMHTMLElement) of object;
  TGeckoBrowserDocumentBegin    = procedure (Sender: TObject; postSize: Cardinal; postData: AnsiString) of object;
  TGeckoBrowserLocationChange   = procedure (Sender: TObject; const uri: AnsiString) of object;
  TGeckoBrowserDOMEventHandler  = procedure (Sender: TObject; aEvent:TGeckoDOMEvent) of object;
  TGeckoBrowserHistoryMove      = procedure (Sender: TObject; aURI: nsIURI; out aContinue: LongBool; var Handled: Boolean) of object;
  TGeckoBrowserHistoryGoTo      = procedure (Sender: TObject; aIndex: Longint; aURI: nsIURI; out aContinue: LongBool; var Handled: Boolean) of object;
 
  TGeckoBrowserHisoty = record
    URI: AnsiString;
    Title: WideString;
    IsSubFrame: Boolean;
  end;

  TCustomGeckoBrowser = class(TCustomControl, IGeckoCreateWindowTarget)
  private
    FWebBrowser: nsIWebBrowser;
    FListeners: TCustomGeckoBrowserListener;
    FChrome: TCustomGeckoBrowserChrome;

    FDOMLinks: TDOMLinks;
    FDOMForms: TDOMForms;

    FOnStatusChange: TGeckoBrowserStatusChange;
    FOnProgressChange: TGeckoBrowserProgressChange;
    FOnStateChange: TGeckoBrowserStateChange;
    FOnDocumentComplete: TGeckoBrowserDocumentComplete;
    FOnDOMInputFocus: TGeckoBrowserDOMInputFocus;
    FOnDocumentBegin: TGeckoBrowserDocumentBegin;
    FOnLocationChange: TGeckoBrowserLocationChange;
    FOnTitleChange: TGeckoBrowserTitleChange;
    FOnVisibleChange: TGeckoBrowserVisibleChange;
    FOnContextMenu: TGeckoBrowserContextMenu;
    FOnGoBack: TGeckoBrowserHistoryMove;
    FOnGoForward: TGeckoBrowserHistoryMove;
    FOnGoToIndex: TGeckoBrowserHistoryGoTo;
    FOnNewWindow: TGeckoBrowserNewWindow;
    //FOnSecurityChange: TGeckoBrowserSecurityChange;

    procedure ShutdownWebBrowser;
    procedure InnerLoadURI(uri: WideString; Flags: PRUint32; referer: nsIURI; postData, headers: TStream);
    procedure SetChrome(aChrome: TCustomGeckoBrowserChrome);
    procedure SetListener(aListener: TCustomGeckoBrowserListener);
    procedure WMGetDlgCode(var Msg: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMEraseBkGnd(var Msg: TMessage); message WM_ERASEBKGND;

    function GetContentDocument: nsIDOMDocument;
    function GetContentWindow: nsIDOMWindow;
    function GetCanGoBack: Boolean;
    function GetCanGoForward: Boolean;
    function GetWebBrowserChrome: nsIWebBrowserChrome;
    function GetWebBrowserFind: nsIWebBrowserFind;
    function GetWebBrowserPrint: nsIWebBrowserPrint;
    function GetWebNavigation: nsIWebNavigation;

    //function GetMarkupDocumentViewer: nsIMarkupDocumentViewer;
    //function GetDocShell: nsIDocShell;
    //function GetDocumentCharsetInfo: nsIDocumentCharsetInfo;
  protected
    procedure Paint; override;
    function GetDOMLinks(): TDOMLinks;
    function GetDOMForms(): TDOMForms;
  published
    property PopupMenu;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure InitWebBrowser;  //FPC port: moved from private to public
    procedure LoadURI(const uri: WideString); overload;
    procedure LoadURI(const uri: WideString; const referer: UTF8String); overload;
    procedure LoadURI(const uri: WideString; const referer: WideString); overload;
    procedure LoadURI(const uri: WideString; referer: nsIURI); overload;
    procedure LoadURIWithFlags(const uri: WideString; Flags: PRUint32); overload;
    procedure LoadURIWithFlags(const uri: WideString; Flags: PRUint32; const referer: UTF8String); overload;
    procedure LoadURIWithFlags(const uri: WideString; Flags: PRUint32; const referer: WideString); overload;
    procedure LoadURIWithFlags(Const uri: WideString; Flags: PRUint32; referer: nsIURI); overload;
    procedure GoBack;
    procedure GoForward;
    procedure StopAll;
    procedure StopNetwork;
    procedure StopContent;
    procedure Reload;
    procedure ReloadWithFlags(AFlags: PRUint32);

    function ActiveElement(): nsiDOMElement;

    property Links: TDOMLinks read GetDOMLinks;
    property Forms: TDOMForms read GetDOMForms;
  protected
    function DoCreateChromeWindow(chromeFlags: Longword): nsIWebBrowserChrome; virtual; abstract;

    procedure Resize; override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;

  protected
    FLastFocused: nsIDOMElement;
    property Chrome:          TCustomGeckoBrowserChrome   read FChrome            write SetChrome;
    property Listener:        TCustomGeckoBrowserListener read FListeners         write SetListener;

    property WebBrowser:      nsIWebBrowser               read FWebBrowser;
    property WebBrowserFind:  nsIWebBrowserFind           read GetWebBrowserFind;
    property WebBrowserPrint: nsIWebBrowserPrint          read GetWebBrowserPrint;
    property WebNavigation:   nsIWebNavigation            read GetWebNavigation;

    property ContentWindow:   nsIDOMWindow      read GetContentWindow;
    property ContentDocument: nsIDOMDocument    read GetContentDocument;
    property CanGoBack:       Boolean           read GetCanGoBack;
    property CanGoForward:    Boolean           read GetCanGoForward;

    //property MarkupDocumentViewer: nsIMarkupDocumentViewer
    //    read GetMarkupDocumentViewer;
    //property DocShell: nsIDocShell
    //      read GetDocShell;
    //property DocumentCharsetInfo: nsIDocumentCharsetInfo
    //    read GetDocumentCharsetInfo; //end plus7

    property OnStatusChange: TGeckoBrowserStatusChange          read FOnStatusChange      write FOnStatusChange;
    property OnProgressChange: TGeckoBrowserProgressChange      read FOnProgressChange    write FOnProgressChange;
    property OnStateChange: TGeckoBrowserStateChange            read FOnStateChange       write FOnStateChange;
    property OnDocumentComplete: TGeckoBrowserDocumentComplete  read FOnDocumentComplete  write FOnDocumentComplete;
    property OnDOMInputFocus: TGeckoBrowserDOMInputFocus        read FOnDOMInputFocus     write FOnDOMInputFocus;
    property OnDocumentBegin: TGeckoBrowserDocumentBegin        read FonDocumentBegin     write FonDocumentBegin;
    property OnLocationChange: TGeckoBrowserLocationChange      read FOnLocationChange    write FOnLocationChange;
    property OnTitleChange: TGeckoBrowserTitleChange            read FOnTitleChange       write FOnTitleChange;
    property OnVisibleChange: TGeckoBrowserVisibleChange        read FOnVisibleChange     write FOnVisibleChange;
    property OnContextMenu: TGeckoBrowserContextMenu            read FOnContextMenu       write FOnContextMenu;
    property OnGoBack:TGeckoBrowserHistoryMove                  read FOnGoBack            write FOnGoBack;
    property OnGoForward:TGeckoBrowserHistoryMove               read FOnGoForward         write FOnGoForward;
    property OnGoToIndex:TGeckoBrowserHistoryGoTo               read FOnGoToIndex         write FOnGoToIndex;
    property OnNewWindow: TGeckoBrowserNewWindow                read FOnNewWindow         write FOnNewWindow;
  end;

  TCustomGeckoBrowserChrome = class(TInterfacedObject, nsIWebBrowserChrome, nsIWebBrowserChromeFocus, nsIEmbeddingSiteWindow, IGeckoBrowserChrome)
  public
    //constructor Create;
    //destructor Destroy;
  protected

    procedure SetStatus(statusType: PRUint32; const status: PWideChar); virtual; safecall; abstract;
    function GetWebBrowser(): nsIWebBrowser; virtual; safecall; abstract;
    procedure SetWebBrowser(aWebBrowser: nsIWebBrowser); virtual; safecall; abstract;
    function GetChromeFlags(): PRUint32; virtual; safecall; abstract;
    procedure SetChromeFlags(aChromeFlags: PRUint32); virtual; safecall; abstract;
    procedure DestroyBrowserWindow(); virtual; safecall; abstract;
    procedure SizeBrowserTo(aCX: PRInt32; aCY: PRInt32); virtual; safecall; abstract;
    procedure ShowAsModal(); virtual; safecall; abstract;
    function IsWindowModal(): PRBool; virtual; safecall; abstract;
    procedure ExitModalEventLoop(aStatus: nsresult); virtual; safecall; abstract;

    procedure FocusNextElement(); virtual; safecall; abstract;
    procedure FocusPrevElement(); virtual; safecall; abstract;

    procedure SetDimensions(flags: PRUint32; x: PRInt32; y: PRInt32; cx: PRInt32; cy: PRInt32); virtual; safecall; abstract;
    procedure GetDimensions(flags: PRUint32; out x: PRInt32; out y: PRInt32; out cx: PRInt32; out cy: PRInt32); virtual; safecall; abstract;
    procedure SetFocus(); virtual; safecall; abstract;

    function GetVisibility(): PRBool; virtual; safecall; abstract;
    procedure SetVisibility(aVisibility: PRBool); virtual; safecall; abstract;
    function GetTitle(): PWideChar; virtual; safecall; abstract;
    procedure SetTitle(const aTitle: PWideChar); virtual; safecall; abstract;
    function GetSiteWindow(): Pointer; virtual; safecall; abstract;
    function GetCreateWindowTarget: IGeckoCreateWindowTarget; virtual; abstract;
  public
    function SafeCallException(obj: TObject; addr: Pointer): HRESULT; override;

  end;

  TCustomGeckoBrowserListener = class(TSupportsWeakReference, nsIWebProgressListener, nsIDOMEventListener)
  private
    FBrowser: TCustomGeckoBrowser;
    FDOMEvents: PGeckoDOMEventRegisterArray;
  public
    constructor Create(ABrowser: TCustomGeckoBrowser);
    //destructor Destroy;
  protected
    procedure InitListener(browser: TCustomGeckoBrowser); virtual;
    procedure ShutdownListener(browser: TCustomGeckoBrowser); virtual;

    procedure AddWebBrowserListener(browser: nsIWebBrowser); safecall;
    procedure RemoveWebBrowserListener(browser: nsIWebBrowser); safecall;
    // nsIWebProgressListener
    procedure OnStateChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStateFlags: PRUint32; aStatus: nsresult); virtual; safecall; abstract;
    procedure OnProgressChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt32; aMaxSelfProgress: PRInt32; aCurTotalProgress: PRInt32; aMaxTotalProgress: PRInt32); virtual; safecall; abstract;
    procedure OnLocationChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; location: nsIURI); virtual; safecall; abstract;
    procedure OnStatusChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStatus: nsresult; const aMessage: PWideChar); virtual; safecall; abstract;
    procedure OnSecurityChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; state: PRUint32); virtual; safecall; abstract;
    // nsIDOMEventListener
    procedure HandleEvent(aEvent: nsIDOMEvent); safecall;
  public
    function SafeCallException(Obj: TObject; Addr: Pointer): HRESULT; override;
  end;

  TGeckoBrowser = class(TCustomGeckoBrowser)
  protected
    FBrowser: nsIWebBrowser;
    FTitle: WideString;
    // Tooltip
{$IFNDEF LCL}
    FHint: THintWindow;
{$ENDIF}
   //DOM EventHandler
    FOnDOMLoad: TGeckoBrowserDOMEventHandler;
    FOnSubmitForm: TGeckoBrowserDOMEventHandler;
    FOnDOMInputChanged: TGeckoBrowserDOMEventHandler;
    FOnDOMBlur: TGeckoBrowserDOMEventHandler;
    FOnPageShow: TGeckoBrowserDOMEventHandler;
    FOnScriptError: TGeckoBrowserDOMEventHandler;
    FOnDocumentUnload: TGeckoBrowserDOMEventHandler;
    FOnDOMClick: TGeckoBrowserDOMEventHandler;
    FOnDOMMouseUp: TGeckoBrowserDOMEventHandler;
    FOnDOMMouseDown: TGeckoBrowserDOMEventHandler;
    FOnDOMMouseMove: TGeckoBrowserDOMEventHandler;
    FOnDOMMouseScroll: TGeckoBrowserDOMEventHandler;
    FOnDOMKeyUp: TGeckoBrowserDOMEventHandler;
    FOnDOMKeyDown: TGeckoBrowserDOMEventHandler;
    FOnDOMKeyPress: TGeckoBrowserDOMEventHandler;
    FOnDOMLinkAdded: TGeckoBrowserDOMEventHandler;
    FOnDOMDragOver: TGeckoBrowserDOMEventHandler;
    FOnDOMDragGesture: TGeckoBrowserDOMEventHandler;
    FOnDOMDragDrop: TGeckoBrowserDOMEventHandler;
    FOnDOMDragExit: TGeckoBrowserDOMEventHandler;
    FOnDOMFocus: TGeckoBrowserDOMEventHandler;

    function DoCreateChromeWindow(chromeFlags: Longword): nsIWebBrowserChrome; override;
    function GetURIString(): UTF8String;

  public
    constructor Create(AOwner: TComponent); override;

    property Title: WideString read FTitle;
    property URIString: UTF8String read GetURIString;
  published
    property OnDOMLoad: TGeckoBrowserDOMEventHandler          read FOnDOMLoad         write FOnDOMLoad;
    property OnSubmitForm: TGeckoBrowserDOMEventHandler       read FOnSubmitForm      write FOnSubmitForm;
    property OnDOMInputChanged : TGeckoBrowserDOMEventHandler read FOnDOMInputChanged write FOnDOMInputChanged;
    property OnDOMBlur: TGeckoBrowserDOMEventHandler          read FOnDOMBlur         write FOnDOMBlur;
    property OnPageShow: TGeckoBrowserDOMEventHandler         read FOnPageShow        write FOnPageShow;
    property OnScriptError: TGeckoBrowserDOMEventHandler      read FOnScriptError     write FOnScriptError;
    property OnDocumentUnload: TGeckoBrowserDOMEventHandler   read FOnDocumentUnload  write FOnDocumentUnload;
    property OnDOMClick: TGeckoBrowserDOMEventHandler         read FOnDOMClick        write FOnDOMClick;
    property OnDOMMouseUp: TGeckoBrowserDOMEventHandler       read FOnDOMMouseUp      write FOnDOMMouseUp;
    property OnDOMMouseDown: TGeckoBrowserDOMEventHandler     read FOnDOMMouseDown    write FOnDOMMouseDown;
    property OnDOMMouseMove: TGeckoBrowserDOMEventHandler     read FOnDOMMouseMove    write FOnDOMMouseMove;
    property OnDOMKeyUp: TGeckoBrowserDOMEventHandler         read FOnDOMKeyUp        write FOnDOMKeyUp;
    property OnDOMKeyDown: TGeckoBrowserDOMEventHandler       read FOnDOMKeyDown      write FOnDOMKeyDown;
    property OnDOMKeyPress: TGeckoBrowserDOMEventHandler      read FOnDOMKeyPress     write FOnDOMKeyPress;
    property OnDOMMouseScroll: TGeckoBrowserDOMEventHandler   read FOnDOMMouseScroll  write FOnDOMMouseScroll;
    property OnDOMLinkAdded: TGeckoBrowserDOMEventHandler     read FOnDOMLinkAdded    write FOnDOMLinkAdded;
    property OnDOMDragOver: TGeckoBrowserDOMEventHandler      read FOnDOMDragOver     write FOnDOMDragOver;
    property OnDOMDragGesture: TGeckoBrowserDOMEventHandler   read FOnDOMDragGesture  write FOnDOMDragGesture;
    property OnDOMDragDrop: TGeckoBrowserDOMEventHandler      read FOnDOMDragDrop     write FOnDOMDragDrop;
    property OnDOMDragExit: TGeckoBrowserDOMEventHandler      read FOnDOMDragExit     write FOnDOMDragExit;
    property OnDOMFocus: TGeckoBrowserDOMEventHandler         read FOnDOMFocus        write FOnDOMFocus;

  published

    property Align;
    property TabOrder;
    property TabStop default True;
{$IFNDEF LCL}
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BevelWidth;
{$ENDIF}
    //property BorderWidth;

    property OnLocationChange;
    property OnProgressChange;
    property OnStateChange;
    property OnDocumentComplete;
    property OnDOMInputFocus;
    property OnDocumentBegin;
    property OnStatusChange;
    property OnTitleChange;
    property OnVisibleChange;
    property OnContextMenu;
    property OnNewWindow;

    property OnGoBack;
    property OnGoForward;
    property OnGoToIndex;
  public
    property ContentDocument;
    property ContentWindow;
    property CanGoBack;
    property CanGoForward;
  end;

  TGeckoBrowserChrome = class(TCustomGeckoBrowserChrome, nsIInterfaceRequestor_std19, nsIContextMenuListener2, nsITooltipListener)
  private
    FBrowser: TGeckoBrowser;
  protected
    constructor Create(Browser: TGeckoBrowser);
  public
    destructor Destroy; override;
  protected

    procedure SetStatus(statusType: PRUint32; const status: PWideChar); override;
    function GetWebBrowser(): nsIWebBrowser; override;
    procedure SetWebBrowser(aWebBrowser: nsIWebBrowser); override;
    function GetChromeFlags(): PRUint32; override; {$IFDEF FPC} safecall; {$ENDIF}
    procedure SetChromeFlags(aChromeFlags: PRUint32); override;
    procedure DestroyBrowserWindow(); override;
    procedure SizeBrowserTo(aCX: PRInt32; aCY: PRInt32); override;
    procedure ShowAsModal(); override;
    function IsWindowModal(): PRBool; override; {$IFDEF FPC} safecall; {$ENDIF}
    procedure ExitModalEventLoop(aStatus: nsresult); override;

    procedure FocusNextElement(); override;
    procedure FocusPrevElement(); override;

    procedure SetDimensions(flags: PRUint32; x: PRInt32; y: PRInt32; cx: PRInt32; cy: PRInt32); override;
    procedure GetDimensions(flags: PRUint32; out x: PRInt32; out y: PRInt32; out cx: PRInt32; out cy: PRInt32); override;
    procedure SetFocus(); override;
    function GetVisibility(): PRBool; override; {$IFDEF FPC} safecall; {$ENDIF}
    procedure SetVisibility(aVisibility: PRBool); override;
    function GetTitle(): PWideChar; override; {$IFDEF FPC} safecall; {$ENDIF}
    procedure SetTitle(const aTitle: PWideChar); override;
    function GetSiteWindow(): Pointer; override; {$IFDEF FPC} safecall; {$ENDIF}

    function NS_GetInterface(const uuid: TGUID; out _result): nsresult; stdcall;
    function nsIInterfaceRequestor_std19.GetInterface = NS_GetInterface;

    procedure OnShowContextMenu(aContextFlags: PRUint32; aUtils: nsIContextMenuInfo); safecall;
    procedure OnShowTooltip(aXCoords: PRInt32; aYCoords: PRInt32; const aTipText: PWideChar); safecall;
    procedure OnHideTooltip(); safecall;

    function GetCreateWindowTarget: IGeckoCreateWindowTarget; override;
  end;

  TGeckoBrowserListener = class(TCustomGeckoBrowserListener, nsIWebProgressListener, nsISHistoryListener, nsIDOMEventListener)
  protected
    constructor Create(browser: TGeckoBrowser);
    // nsIWebProgressListener
    procedure OnStateChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStateFlags: PRUint32; aStatus: nsresult); override;
    procedure OnProgressChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt32; aMaxSelfProgress: PRInt32; aCurTotalProgress: PRInt32; aMaxTotalProgress: PRInt32); override;
    procedure OnLocationChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; location: nsIURI); override;
    procedure OnStatusChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStatus: nsresult; const aMessage: PWideChar); override;
    procedure OnSecurityChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; state: PRUint32); override;
    // nsISHistoryListener
    procedure OnHistoryNewEntry(aNewURI: nsIURI); safecall;
    function OnHistoryGoBack(aBackURI: nsIURI): PRBool; safecall;
    function OnHistoryGoForward(aForwardURI: nsIURI): PRBool; safecall;
    function OnHistoryReload(aReloadURI: nsIURI; aReloadFlags: PRUint32): PRBool; safecall;
    function OnHistoryGotoIndex(aIndex: PRInt32; aGotoURI: nsIURI): PRBool; safecall;
    function OnHistoryPurge(aNumEntries: PRInt32): PRBool; safecall;

    // nsIDOMEventListener
    //procedure HandleEvent(aEvent: nsIDOMEvent); safecall;
  end;

  TCtxMenuFlags = set of (cmfLink, cmfImage, cmfDocument, cmfText, cmfInput, cmfBGImage);

  TCtxMenuInfo = class(TObject)
  private
    FInfo: nsIContextMenuInfo;
    FFlags: TCtxMenuFlags;

    function GetAssociatedLink:     WideString;
    function GetImageURL:           UTF8String;
    function GetBGImageURL:         UTF8String;
    function GetMouseEvent:         nsIDOMEvent;
    function GetTargetNode:         nsIDOMNode;
    function GetImageContainer:     imgIContainer;
    function GetImageSrc:           nsIURI;
    function GetBGImageContainer:   imgIContainer;
    function GetBGImageSrc:         nsIURI;

    // function GetMouseEvent: nsIDOMEvent;
    // function GetTargetNode: nsIDOMNode;
    // function GetImageContainer: imgContainer;
    // function GetImageSrc: nsIURI;
    // function GetBGImageContainer: imgIContainer;
    // function GetBGImageSrc: nsIURI;

  public
    constructor Create(flags: Longword; info: nsIContextMenuInfo);

    property Flags:             TCtxMenuFlags       read FFlags;
    property AssociatedLink:    WideString          read GetAssociatedLink;
    property ImageURL:          UTF8String          read GetImageURL;
    property BGImageURL:        UTF8String          read GetBGImageURL;
    property MouseEvent:        nsIDOMEvent         read GetMouseEvent;
    property TargetNode:        nsIDOMNode          read GetTargetNode;
    property ImageContainer:    imgIContainer       read GetImageContainer;
    property ImageSrc:          nsIURI              read GetImageSrc;
    property BGImageContainer:  imgIContainer       read GetBGImageContainer;
    property BGImageSrc:        nsIURI              read GetBGImageSrc;
    property ContextMenuInfo:   nsIContextMenuInfo  read FInfo;
  end;

  TDOMLinks = class
    private
       DOMBrowser: nsIWebBrowser;
       domWindow: nsIDOMWindow;
       domDoc: nsIDOMDocument;
       domHTMLDoc: nsIDOMHTMLDocument;
       function GetLinksCount: Integer;
       function GetHrefLinks(nIndex: Integer): AnsiString;
       function GetAnchorText(nIndex: Integer): String;
       function GetElement(nIndex: Integer): nsIDOMHTMLAnchorElement;
    protected

    public
      property Count: Integer read GetLinksCount;
      property Href[nIndex: Integer]:AnsiString read GetHrefLinks;
      property AnchorText[nIndex: Integer]:String read GetAnchorText;
      property Element[nIndex: Integer]: nsIDOMHTMLAnchorElement read GetElement;
  end;

  TDOMForms = class
    private
       DOMBrowser: nsIWebBrowser;
       domWindow: nsIDOMWindow;
       domDoc: nsIDOMDocument;
       domHTMLDoc: nsIDOMHTMLDocument;
       function GetFormsCount: Integer;
       function GetFormControlCount(nIndex: Integer): Integer;
       function GetValue(fIndex: Integer; nIndex: Integer): String;
       procedure SetValue(fIndex: Integer; nIndex: Integer; AValue: String);
       function GetName(fIndex: Integer; nIndex: Integer): String;
    protected

    public
      property Count: Integer read GetFormsCount;
      property FormControlCount[nIndex: Integer]: Integer read GetFormControlCount;
      property Values[fIndex: Integer; nIndex: Integer]: String read GetValue write SetValue;
      property Names[fIndex: Integer; nIndex: Integer]: String read GetName;
  end;



procedure Register;

{$IFNDEF LCL}
{$R *.dcr}
{$ENDIF}

implementation

uses
  nsError, nsStream, nsMemory, nsNetUtil, nsInit, GeckoInit,
  Forms, TypInfo, Variants;

procedure Register;
begin
  RegisterComponents('Gecko', [TGeckoBrowser]);
end;

function TCustomGeckoBrowserChrome.SafeCallException(obj: TObject; addr: Pointer): HRESULT;
begin
  Result := E_FAIL;
end;

constructor TCustomGeckoBrowserListener.Create(ABrowser: TCustomGeckoBrowser);
begin
  inherited Create;
  FBrowser := ABrowser;
end;


procedure TCustomGeckoBrowserListener.InitListener(browser: TCustomGeckoBrowser);
var
  I: Integer;
  domWin: nsIDOMWindow;
  target: nsIDOMEventTarget;
begin
  AddWebBrowserListener(browser.WebBrowser);

  if Assigned(FDOMEvents) then
  begin
    I := 0;
    domWin := browser.ContentWindow;
    target := (domWin as nsIDOMWindow2).WindowRoot;
    while FDOMEvents[I].eventType <> etNone do
    begin
      with FDOMEvents[I] do
      begin
        target.AddEventListener(NewString(Name).AString, Self, True);
      end;
      Inc(I);
    end;
  end;
end;

procedure TCustomGeckoBrowserListener.ShutdownListener(browser: TCustomGeckoBrowser);
var
  I: Integer;
  domWin: nsIDOMWindow;
  target: nsIDOMEventTarget;
begin
  RemoveWebBrowserListener(browser.WebBrowser);

  if Assigned(FDOMEvents) then
  begin
    I := 0;
    domWin := browser.ContentWindow;
    target := (domWin as nsIDOMWindow2).WindowRoot;
    while FDOMEvents[I].eventType <> etNone do
    begin
      with FDOMEvents[I] do
      begin
        target.AddEventListener(NewString(Name).AString, Self, True);
      end;
      Inc(I);
    end;
  end;
end;

procedure TCustomGeckoBrowserListener.AddWebBrowserListener(browser: nsIWebBrowser);
var
  weak: nsIWeakReference;
  table: PInterfaceTable;
  i: Integer;
begin
  weak := GetWeakReference;
  table := ClassType.GetInterfaceTable;
  if Assigned(table) then
    for i:=0 to table.EntryCount-1 do
{$IFNDEF FPC}
      browser.AddWebBrowserListener(weak, table.Entries[i].IID);
{$ELSE}
 {$IFOPT R+}{$DEFINE TURNED_RANGE_CHECK_OFF}{$R-}{$ENDIF}
      browser.AddWebBrowserListener(weak, table.Entries[i].IID^);  //FPC Entries is only array[0..0]!
 {$IFDEF TURNED_RANGE_CHECK_OFF}{$UNDEFINE TURNED_RANGE_CHECK_OFF}{$R+}{$ENDIF}
{$ENDIF}
end;

procedure TCustomGeckoBrowserListener.RemoveWebBrowserListener(browser: nsIWebBrowser);
var
  weak: nsIWeakReference;
  table: PInterfaceTable;
  i: Integer;
begin
  weak := GetWeakReference;
  table := ClassType.GetInterfaceTable;
  if Assigned(table) then
    for i:=0 to table.EntryCount-1 do
{$IFNDEF FPC}
      browser.RemoveWebBrowserListener(weak, table.Entries[i].IID);
{$ELSE}
 {$IFOPT R+}{$DEFINE TURNED_RANGE_CHECK_OFF}{$R-}{$ENDIF}
      browser.RemoveWebBrowserListener(weak, table.Entries[i].IID^);
 {$IFDEF TURNED_RANGE_CHECK_OFF}{$UNDEFINE TURNED_RANGE_CHECK_OFF}{$R+}{$ENDIF}
{$ENDIF}
end;

function TCustomGeckoBrowserListener.SafeCallException(
                Obj: TObject; Addr: Pointer): HResult;
begin
  Result := HRESULT(NS_ERROR_FAILURE);
end;

procedure TCustomGeckoBrowserListener.HandleEvent(aEvent: nsIDOMEvent);
var
  eventType: String;
  str: IInterfacedString;
  method: TMethod;
  domEvent: TGeckoDOMEvent;
  Tgt: nsIDOMEventTarget;
  Node: nsIDOMHTMLElement;
  mouseEvent: nsIDOMMouseEvent;
begin
  if Assigned(FDOMEvents) then
  begin

    str := NewString;
    aEvent.GetType(str.AString);
    eventType := str.ToString;

    domEvent.Name := eventType;
    domEvent.EventType := etNone;
    domEvent.event := aEvent;

    if ( (eventType = 'focus') and
         ((not Supports(aEvent.Target, nsIDOMHTMLInputElement)) or
          (not Supports(aEvent.Target, nsIDOMHTMLTextAreaElement))
         )
       ) then
         FBrowser.FLastFocused := nil;

    if ( (eventType = 'focus') and
         ((Supports(aEvent.Target, nsIDOMHTMLInputElement)) or
          (Supports(aEvent.Target, nsIDOMHTMLTextAreaElement))
         )
       ) then
      begin
        Tgt := aEvent.Target;
        Node := Tgt as nsIDOMHTMLElement;
        FBrowser.FLastFocused := Node;
        FBrowser.OnDOMInputFocus(FBrowser, Node);
      end;

    if (eventType = 'click') then
    begin
      mouseEvent := aEvent as nsIDOMMouseEvent;
      method := GetMethodProp(FBrowser, 'OnDOMClick');
      OutputDebugString(PAnsiChar(IntToStr(mouseEvent.ClientX)));
    end;


    if (eventType <> 'mousemove') then
      OutputDebugString(PAnsiChar(eventType));

    //eventHandler := TGeckoBrowserDOMEventHandler(method);
    //eventHandler(FBrowser, domEvent);


    {I := 0;
    while FDOMEvents[I].eventType <>etNone do
    begin
      if FDOMEvents[I].Name = eventType then
      begin
        method := GetMethodProp(FBrowser, FDOMEvents[I].propertyName);
        eventHandler := TGeckoBrowserDOMEventHandler(method);

        if Assigned(eventHandler) then
        begin
          domEvent.Name := FDOMEvents[I].Name;
          domEvent.EventType := FDOMEvents[I].eventType;
          domEvent.event := aEvent;
          eventHandler(FBrowser, domEvent);
        end;
        Exit;
      end;
      Inc(I);
    end; }
  end else
    OutputDebugString('rien');
end;

constructor TCustomGeckoBrowser.Create(AOwner: TComponent);
begin
  inherited;


  OutputDebugString('TGeckoBrowser.Create');

  if not (csDesigning in ComponentState) then
  begin
    GeckoComponentsStartup;
  end;
end;

destructor TCustomGeckoBrowser.Destroy;
begin

  OutputDebugString('TGeckoBrowser.Destroy');

  if not (csDesigning in ComponentState) then
  begin
    ShutdownWebBrowser;
    Chrome := nil;
    Listener := nil;
    FDOMLinks := nil;
    FDOMForms := nil;
    GeckoComponentsShutdown;
  end;

  inherited;
end;

// override methods from TControl
procedure TCustomGeckoBrowser.Resize;
var
  baseWin: nsIBaseWindow;
  rc: TRect;
begin
  inherited Resize;

  if not Assigned(FWebBrowser) then Exit;
  baseWin := FWebBrowser as nsIBaseWindow;
  rc := GetClientRect;
  baseWin.SetPositionAndSize(rc.Left, rc.Top, rc.Right - rc.Left, rc.Bottom - rc.Top, False);
end;

// TWinControl 継承
procedure TCustomGeckoBrowser.CreateWnd;
begin
  {$IFDEF DEBUG}
  OutputDebugString('TGeckoBrowser.CreateWnd');
  {$ENDIF}
  inherited CreateWnd;

  if not (csDesigning in ComponentState) then
  begin
    InitWebBrowser;
  end;
end;

procedure TCustomGeckoBrowser.DestroyWnd;
begin
  inherited DestroyWnd;
  {$IFDEF DEBUG}
  OutputDebugString('TGeckoBrowser.DestroyWnd');
  {$ENDIF}
end;

procedure TCustomGeckoBrowser.GoBack;
begin
  try
    (FWebBrowser as nsIWebNavigation).GoBack;
  except
    raise EGeckoBrowserNavigationError.CreateRes(
      PResStringRec(@SGeckoBrowserCannotGoBack));
  end;
end;

procedure TCustomGeckoBrowser.StopAll;
begin
  try
    (FWebBrowser as nsIWebNavigation).Stop(NS_IWEBNAVIGATION_STOP_ALL);
  except
    raise EGeckoBrowserNavigationError.CreateRes(
      PResStringRec(@SGeckoBrowserCannotStopAll));
  end;
end;

procedure TCustomGeckoBrowser.StopNetwork;
begin
  try
    (FWebBrowser as nsIWebNavigation).Stop(NS_IWEBNAVIGATION_STOP_NETWORK);
  except
    raise EGeckoBrowserNavigationError.CreateRes(
      PResStringRec(@SGeckoBrowserCannotStopNetwork));
  end;
end;

procedure TCustomGeckoBrowser.StopContent;
begin
  try
    (FWebBrowser as nsIWebNavigation).Stop(NS_IWEBNAVIGATION_STOP_CONTENT);
  except
    raise EGeckoBrowserNavigationError.CreateRes(
      PResStringRec(@SGeckoBrowserCannotStopContent));
  end;
end;

procedure TCustomGeckoBrowser.GoForward;
begin
  try
    (FWebBrowser as nsIWebNavigation).GoForward;
  except
    raise EGeckoBrowserNavigationError.CreateRes(
      PResStringRec(@SGeckoBrowserCannotGoForward));
  end;
end;

function TCustomGeckoBrowser.ActiveElement(): nsiDOMElement;
begin
  Result := FLastFocused;
end;

procedure TCustomGeckoBrowser.InitWebBrowser;
var
  baseWin: nsIBaseWindow;
  focus: nsIWebBrowserFocus;
  rc: TRect;
begin

  // Initialize WindowCreator
  if not InitWindowCreator then
    raise EGeckoBrowserError.CreateRes(PResStringRec(@SGeckoBrowserInitError));

  // Create Browser Object
  NS_CreateInstance(NS_WEBBROWSER_CID, nsIWebBrowser, FWebBrowser);

  try
    // Initialize Browser
    FWebBrowser.ContainerWindow := FChrome;
    baseWin := FWebBrowser as nsIBaseWindow;

    rc := ClientRect;
    baseWin.InitWindow({$IFDEF MSWINDOWS}Pointer(Handle),{$ENDIF}
                       {$IFDEF LCLCarbon}Pointer(TCarbonWindow(Handle).Window),{$ENDIF}
//                       {$IFDEF LCLCocoa}Pointer(TCocoaForm(Handle).MainWindowView.superview),{$ENDIF}
                       {$IFDEF LCLCocoa}Pointer(TCocoaWindow(Handle).contentView),{$ENDIF}
                       {$IFDEF LCLGtk}Pointer(Handle),{$ENDIF}  //Is Handle same as GTK Window?
                       {$IFDEF LCLGtk2}Pointer(Handle),{$ENDIF}  //Is Handle same as GTK Window?
                       nil,
                       rc.Left,
                       rc.Top,
                       rc.Right-rc.Left,
                       rc.Bottom-rc.Top);
    baseWin.Create();

    // Register Listeners
    FListeners.InitListener(Self);

    // Show Browser
    baseWin.SetVisibility(True);
    // Activate Focus
    focus := FWebBrowser as nsIWebBrowserFocus;
    focus.Activate;
  except
    raise EGeckoBrowserError.CreateRes(PResStringRec(@SGeckoBrowserInitError));
  end;
end;


procedure TCustomGeckoBrowser.InnerLoadURI(uri: WideString; Flags: PRUint32; referer: nsIURI; postData, headers: TStream);
var
  nav: nsIWebNavigation;
  post: nsIInputStream;
  head: nsIInputStream;
begin
  try
    nav := FWebBrowser as nsIWebNavigation;

    if Assigned(postData) then
      post := NS_NewInputStreamFromTStream(postData, True);

    if Assigned(headers) then
      head := NS_NewInputStreamFromTStream(headers, True);

    nav.LoadURI(PWideChar(uri), Flags, referer, post, head);
  except
    raise EGeckoBrowserNavigationError.CreateResFmt(
      PResStringRec(@SGeckoBrowserLoadURIError),
      [String(uri)]);
  end;
end;

procedure TCustomGeckoBrowser.LoadURI(const uri: WideString);
begin
  InnerLoadURI(uri, 0, nil, nil, nil);
end;

procedure TCustomGeckoBrowser.LoadURI(const uri: WideString; const referer: UTF8String);
var
  ref: nsIURI;
  refStr: IInterfacedUTF8String;
begin
  refStr := NewUTF8String(referer);
  ref := NS_NewURI(refStr.AUTF8String);
  InnerLoadURI(uri, 0, ref, nil, nil);
end;

procedure TCustomGeckoBrowser.LoadURI(const uri: WideString; const referer: WideString);
var
  ref: nsIURI;
  refStr: IInterfacedUTF8String;
begin
  refStr := NewUTF8String(UTF8String(referer));
  ref := NS_NewURI(refStr.AUTF8String);
  InnerLoadURI(uri, 0, ref, nil, nil);
end;

procedure TCustomGeckoBrowser.LoadURI(const uri: WideString; referer: nsIURI);
begin
  InnerLoadURI(uri, 0, referer, nil, nil);
end;

procedure TCustomGeckoBrowser.LoadURIWithFlags(const uri: WideString; Flags: PRUint32);
begin
  InnerLoadURI(uri, Flags, nil, nil, nil);
end;

procedure TCustomGeckoBrowser.LoadURIWithFlags(const uri: WideString; Flags: PRUint32; const referer: UTF8String);
var
  ref: nsIURI;
  refStr: IInterfacedUTF8String;
begin
  refStr := NewUTF8String(UTF8String(referer));
  ref := NS_NewURI(refStr.AUTF8String);
  InnerLoadURI(uri, Flags, ref, nil, nil);
end;

procedure TCustomGeckoBrowser.LoadURIWithFlags(const uri: WideString; Flags: Cardinal; const referer: WideString);
var
  ref: nsIURI;
  refStr: IInterfacedUTF8String;
begin
  refStr := NewUTF8String(UTF8String(referer));
  ref := NS_NewURI(refStr.AUTF8String);
  InnerLoadURI(uri, Flags, ref, nil, nil);
end;

procedure TCustomGeckoBrowser.LoadURIWithFlags(const uri: WideString; Flags: Cardinal; referer: nsIURI);
begin
  InnerLoadURI(uri, Flags, referer, nil, nil);
end;
procedure TCustomGeckoBrowser.Reload;
begin
  ReloadWithFlags(NS_IWEBNAVIGATION_LOAD_FLAGS_NONE);
end;
procedure TCustomGeckoBrowser.ReloadWithFlags(AFlags: PRUint32);
var
  nav: nsIWebNavigation;
begin
  try
    nav := FWebBrowser as nsIWebNavigation;
    nav.Reload(AFlags);
  except
    raise EGeckoBrowserNavigationError.CreateRes(
      PResStringRec(@SGeckoBrowserCannotReload));
  end;
end;
procedure TCustomGeckoBrowser.ShutdownWebBrowser;
begin
  if Assigned(FWebBrowser) then
  begin
    //FListeners.RemoveWebBrowserListener(FWebBrowser);
    FListeners.ShutdownListener(Self);
    FWebBrowser.SetContainerWindow(nil);
    FWebBrowser := nil;
  end;
end;
procedure TCustomGeckoBrowser.SetChrome(aChrome: TCustomGeckoBrowserChrome);
var
  old: TCustomGeckoBrowserChrome;
begin
  old := FChrome;
  FChrome := aChrome;
  if Assigned(FChrome) then
    FChrome._AddRef;
  if Assigned(old) then old._Release;
end;
procedure TCustomGeckoBrowser.SetListener(aListener: TCustomGeckoBrowserListener);
var
  old: TCustomGeckoBrowserListener;
begin
  old := FListeners;
  FListeners := aListener;
  if Assigned(FListeners) then
    FListeners._AddRef;
  if Assigned(old) then old._Release;
end;
procedure TCustomGeckoBrowser.WMGetDlgCode(var Msg: TWMGetDlgCode);
begin
  Msg.Result := Msg.Result or DLGC_WANTARROWS or DLGC_WANTTAB;
end;
constructor TGeckoBrowserChrome.Create(Browser: TGeckoBrowser);
begin
  inherited Create;
  FBrowser := Browser;
end;
destructor TGeckoBrowserChrome.Destroy;
begin
  FBrowser := nil;
  inherited Destroy;
end;

procedure TGeckoBrowserChrome.SetStatus(
                statusType: PRUint32;
                const status: PWideChar);
begin
  {$IFDEF DEBUG}
  {
  OutputDebugString(PChar(
    'GeckoBrowser.SetStatus('+status+')'
  ));
  }
  {$ENDIF}
  if Assigned(FBrowser.OnStatusChange) then
    FBrowser.OnStatusChange(FBrowser, status);
end;

function TGeckoBrowserChrome.GetWebBrowser
                : nsIWebBrowser;
begin
  Result := FBrowser.FWebBrowser;
end;

procedure TGeckoBrowserChrome.SetWebBrowser(
                aWebBrowser: nsIWebBrowser);
begin
  FBrowser.FWebBrowser := aWebBrowser;
end;

function TGeckoBrowserChrome.GetChromeFlags
                : PRUint32;
begin
  //TODO 2 -cTGeckoBrowserChrome: Chrome フラグの扱いをどうしようか
  Result := NS_IWEBBROWSERCHROME_CHROME_DEFAULT;
end;

procedure TGeckoBrowserChrome.SetChromeFlags(
                aChromeFlags: PRUint32);
begin
end;

procedure TGeckoBrowserChrome.DestroyBrowserWindow;
begin
  //TODO 2 -cTGeckoBrowserChrome: TGeckoBrowserChrome.OnDestroyBrowser イベントの追加
end;

procedure TGeckoBrowserChrome.SizeBrowserTo(
                aCX: PRInt32;
                aCY: PRInt32);
begin
  FBrowser.Width := aCX;
  FBrowser.Height:= aCY;
end;

procedure TGeckoBrowserChrome.ShowAsModal;
begin
end;

function TGeckoBrowserChrome.IsWindowModal
                : PRBool;
begin
  Result := False;
end;

procedure TGeckoBrowserChrome.ExitModalEventLoop(
                aStatus: nsresult);
begin
end;

procedure TGeckoBrowserChrome.SetDimensions(
                flags: PRUint32;
                x: PRInt32;
                y: PRInt32;
                cx: PRInt32;
                cy: PRInt32);
const
  FLAGS_POSITION   = ns_IEmbeddingSiteWindow_DIM_FLAGS_POSITION;
  FLAGS_SIZE_INNER = ns_IEmbeddingSiteWindow_DIM_FLAGS_SIZE_INNER;
  FLAGS_SIZE_OUTER = ns_IEmbeddingSiteWindow_DIM_FLAGS_SIZE_OUTER;
var
  bounds: TRect;
  clientrect: TRect;
  w, h: Integer;
begin
  bounds := FBrowser.BoundsRect;
  clientrect := FBrowser.ClientRect;
  w := bounds.Right - bounds.Left;
  h := bounds.Bottom - bounds.Top;
  if (flags and FLAGS_POSITION)<>0 then
  begin
    if (flags and FLAGS_SIZE_INNER)<>0 then
    begin
      SetRect(bounds, x, y, x+(w-clientrect.Right)+cx, y+(h-clientrect.Bottom)+cy);
    end else
    if (flags and FLAGS_SIZE_OUTER)<>0 then
    begin
      SetRect(bounds, x, y, x+cx, y+cy);
    end else
    begin
      SetRect(bounds, x, y, x+w, y+h);
    end;
  end else
  if (flags and FLAGS_SIZE_INNER)<>0 then
  begin
    bounds.Right := bounds.Left + x+(w-clientrect.Right)+cx;
    bounds.Bottom := bounds.Top + y+(h-clientrect.Bottom)+cy;
  end else
  if (flags and FLAGS_SIZE_OUTER)<>0 then
  begin
    bounds.Right := bounds.Left + cx;
    bounds.Bottom := bounds.Top + cy;
  end;
  FBrowser.BoundsRect := bounds;
end;

procedure TGeckoBrowserChrome.GetDimensions(
                flags: PRUint32;
                out x: PRInt32;
                out y: PRInt32;
                out cx: PRInt32;
                out cy: PRInt32);
const
  FLAGS_POSITION   = NS_IEMBEDDINGSITEWINDOW_DIM_FLAGS_POSITION;
  FLAGS_SIZE_INNER = NS_IEMBEDDINGSITEWINDOW_DIM_FLAGS_SIZE_INNER;
  FLAGS_SIZE_OUTER = NS_IEMBEDDINGSITEWINDOW_DIM_FLAGS_SIZE_OUTER;
begin
  if (flags and FLAGS_POSITION)<>0 then
  begin
    x := FBrowser.Left;
    y := FBrowser.Top;
  end;

  if (flags and FLAGS_SIZE_INNER)<>0 then
  begin
    cx := FBrowser.ClientWidth;
    cy := FBrowser.ClientHeight;
  end;
  if (flags and FLAGS_SIZE_OUTER)<>0 then
  begin
    cx := FBrowser.Width;
    cy := FBrowser.Height;
  end;
end;

procedure TGeckoBrowserChrome.SetFocus;
begin
  FBrowser.SetFocus;
end;

function TGeckoBrowserChrome.GetVisibility: PRBool;
begin
  // TODO 1 -cTGeckoBrowserChrome: TGeckoBrowserChrome.GetVisibility はどうすべきか
  Result := True;
end;

procedure TGeckoBrowserChrome.SetVisibility(
                aVisibility: PRBool);
begin
  //TODO 1 -cTGeckoBrowserChrome: TGeckoBrowserChrome.SetVisibility の実装
end;

function TGeckoBrowserChrome.GetTitle: PWideChar;
var
  pstr: PWideChar;
  title: WideString;
  len: Integer;
begin
  title := FBrowser.FTitle;
  len := Length(title);
  pstr := PWideChar(title);
  Result := nsMemory.Clone(pstr, (len+1)*2);
  if not Assigned(Result) then
    OutOfMemoryError;
end;

procedure TGeckoBrowserChrome.SetTitle(
                const aTitle: PWideChar);
begin
  FBrowser.FTitle := aTitle;
  if Assigned(FBrowser.OnTitleChange) then
    FBrowser.OnTitleChange(FBrowser, FBrowser.FTitle);
end;

function TGeckoBrowserChrome.GetSiteWindow: Pointer;
begin
  Result := Pointer(FBrowser.Handle);
end;


constructor TGeckoBrowserListener.Create(browser: TGeckoBrowser);
const
  events: array [0..22] of TGeckoDOMEventRegister = (
    (name:'load';             eventType:etEvent;            propertyName:'OnDOMLoad' ),
    (name:'click';            eventType:etMouseEvent;       propertyName:'OnDOMClick' ),
    (name:'dblclick';            eventType:etMouseEvent;    propertyName:'OnDOMClick' ),
    (name:'mouseup';          eventType:etMouseEvent;       propertyName:'OnDOMMouseUp' ),
    (name:'mousedown';        eventType:etMouseEvent;       propertyName:'OnDOMMouseDown' ),
    (name:'mousemove';        eventType:etMouseEvent;       propertyName:'OnDOMMouseMove' ),
    (name:'keyup';            eventType:etEvent;            propertyName:'OnDOMKeyUp' ),
    (name:'keydown';          eventType:etEvent;            propertyName:'OnDOMKeyDown'),
    (name:'keypress';         eventType:etEvent;            propertyName:'OnDOMKeyPress'),
    (name:'DOMMouseScroll';   eventType:etMouseEvent;       propertyName:'OnDOMMouseScroll'),
    (name:'DOMLinkAdded';     eventType:etEvent;            propertyName:'OnDOMLinkAdded'),
    (name:'dragover';         eventType:etEvent;            propertyName:'OnDOMDragOver'),
    (name:'draggesture';      eventType:etEvent;            propertyName:'OnDOMDragGesture'),
    (name:'dragdrop';         eventType:etEvent;            propertyName:'OnDOMDragDrop'),
    (name:'dragexit';         eventType:etEvent;            propertyName:'OnDOMDragExit'),
    (name:'focus';            eventType:etUIEvent;          propertyName:'OnDOMFocus'),
    (name:'blur';             eventType:etUIEvent;          propertyName:'OnDOMBlur'),
    (name:'change';           eventType:etEvent;            propertyName:'OnDOMInputChanged'),
    (name:'submit';           eventType:etUIEvent;          propertyName:'OnSubmitForm'),
    (name:'pageshow';         eventType:etEvent;            propertyName:'OnPageShow'),
    (name:'unload';           eventType:etEvent;            propertyName:'OnDocumentUnload'),
    (name:'error';            eventType:etEvent;            propertyName:'OnScriptError'),
    (name:'';                 eventType:etNone;             propertyName:'')
  );
begin
  inherited Create(browser);
  FDOMEvents := PGeckoDOMEventRegisterArray(@events);
end;

procedure TGeckoBrowserListener.OnStateChange(
                aWebProgress: nsIWebProgress;
                aRequest: nsIRequest;
                aStateFlags: PRUint32;
                aStatus: PRUint32);
//{$IFDEF DEBUG}
var
  uri: nsIURI;
  str, URLStr: IInterfacedCString;
  channel: nsIChannel;
  uploadChannel: nsIUploadChannel;
  PostStream: nsIInputStream;
  PostSize: Cardinal;
//{$ENDIF}
const
  STATE_IS_DOCUMENT = NS_IWEBPROGRESSLISTENER_STATE_IS_DOCUMENT;
  STATE_IS_NETWORK  = NS_IWEBPROGRESSLISTENER_STATE_IS_NETWORK;
  STATE_START       = NS_IWEBPROGRESSLISTENER_STATE_START;
  STATE_STOP        = NS_IWEBPROGRESSLISTENER_STATE_STOP;
  STATE_TRANSFERT   = NS_IWEBPROGRESSLISTENER_STATE_TRANSFERRING;
  STATE_NEGOCIATE   = NS_IWEBPROGRESSLISTENER_STATE_NEGOTIATING;
  STATE_IS_REQUEST  = NS_IWEBPROGRESSLISTENER_STATE_IS_REQUEST;
  STATE_IS_REDIRECT = NS_IWEBPROGRESSLISTENER_STATE_REDIRECTING;
  STATE_IS_WINDOW   = NS_IWEBPROGRESSLISTENER_STATE_IS_WINDOW;
  STATE_IS_SECUREHI = NS_IWEBPROGRESSLISTENER_STATE_SECURE_HIGH;
  STATE_IS_SECUREME = NS_IWEBPROGRESSLISTENER_STATE_SECURE_MED;
  STATE_IS_SECURELO = NS_IWEBPROGRESSLISTENER_STATE_SECURE_LOW;
  STATE_IS_SECURE   = NS_IWEBPROGRESSLISTENER_STATE_IS_SECURE;
begin
      PostSize := 0;
      if ( ((aStateFlags and STATE_IS_REQUEST) <> 0) and
           ((aStateFlags and STATE_IS_DOCUMENT) <> 0) and
           ((aStateFlags and STATE_START) <> 0) and
           ((aStateFlags and STATE_IS_NETWORK) <> 0) and
           ((aStateFlags and STATE_STOP) = 0)) then
        begin
          if Assigned(FBrowser.OnStateChange) then
              begin
              if (Supports(aRequest,nsIChannel))  then
              begin
                  URLStr := NewCString;
                  channel := aRequest as nsIChannel;
                  uri := channel.URI;
                  uri.GetSpec(URLStr.ACString);
              end;

              if (Supports(aRequest,nsIUploadChannel))  then
              begin
                str := NewCString;
                uploadChannel := aRequest as nsIUploadChannel;
                PostStream := uploadChannel.UploadStream;
                if (Assigned(PostStream)) Then
                  begin

                  PostSize := PostStream.Available;
                  //GetMem(PPostData, PostSize);
                  //postStream.Read(PpostData, PostSize);
                  end else PostSize := 0;
              end;
              FBrowser.OnStateChange(FBrowser, URLStr.ToString, aStateFlags, aStatus);
              end;
              FBrowser.OnDocumentBegin(FBrowser, PostSize, '');
        end;

      if ( ((aStateFlags and STATE_IS_WINDOW) <> 0) and
           ((aStateFlags and STATE_IS_REQUEST) = 0) and
           ((aStateFlags and STATE_IS_DOCUMENT) = 0) and
           ((aStateFlags and STATE_IS_NETWORK) <> 0) and
           ((aStateFlags and STATE_START) = 0) and
           ((aStateFlags and STATE_STOP) <> 0)) then
        begin
          if Assigned(FBrowser.OnStateChange) then
              begin
              str := NewCString;
              if (Supports(aRequest,nsIChannel))  then
              begin
                  channel := aRequest as nsIChannel;
                  uri := channel.URI;
                  uri.GetSpec(str.ACString);
              end;
              FBrowser.OnStateChange(FBrowser, str.ToString, aStateFlags, aStatus);
              end;
              FBrowser.OnDocumentComplete(FBrowser);
        end;

        if ( ((aStateFlags and STATE_IS_WINDOW) = 0) and
           ((aStateFlags and STATE_IS_REQUEST) <> 0) and
           ((aStateFlags and STATE_IS_DOCUMENT) <> 0) and
           ((aStateFlags and STATE_IS_NETWORK) = 0) and
           ((aStateFlags and STATE_NEGOCIATE) = 0) and
           ((aStateFlags and STATE_IS_SECURE) <> 0) and
           ((aStateFlags and STATE_START) = 0) and
           ((aStateFlags and STATE_STOP) = 0)) then
        begin
          if Assigned(FBrowser.OnStateChange) then
              begin
              str := NewCString;
              if (Supports(aRequest,nsIChannel))  then
              begin
                  channel := aRequest as nsIChannel;
                  uri := channel.URI;
                  uri.GetSpec(str.ACString);
              end;

              FBrowser.OnStateChange(FBrowser, str.ToString, aStateFlags, aStatus);
              end;
        end;

      {if Assigned(FBrowser.OnStateChange) then
        FBrowser.OnStateChange(FBrowser, IntToStr(STATE_IS_DOCUMENT) + ':'+
                                         IntToStr(STATE_IS_NETWORK) + ':'+
                                         IntToStr(STATE_START) + ':'+
                                         IntToStr(STATE_STOP) + ':'+
                                         IntToStr(STATE_TRANSFERT) + ':'+
                                         IntToStr(STATE_NEGOCIATE) + ':'+
                                         IntToStr(STATE_IS_REQUEST) + ':'+
                                         IntToStr(STATE_IS_REDIRECT) + ':'+
                                         IntToStr(STATE_IS_WINDOW) + ':'+
                                         IntToStr(STATE_IS_SECUREHI) + ':'+
                                         IntToStr(STATE_IS_SECUREHI) + ':'+
                                         IntToStr(STATE_IS_SECUREME) + ':'+
                                         IntToStr(STATE_IS_SECURELO) + ':'+
                                         IntToStr(STATE_IS_SECURE) + ':'
                                       , aStateFlags, aStatus);  }


end;


procedure TGeckoBrowserListener.OnProgressChange(
                aWebProgress: nsIWebProgress;
                aRequest: nsIRequest;
                aCurSelfProgress: PRInt32;
                aMaxSelfProgress: PRInt32;
                aCurTotalProgress: PRInt32;
                aMaxTotalProgress: PRInt32);
begin
  if Assigned(FBrowser.OnProgressChange) then
    FBrowser.OnProgressChange(FBrowser, aCurTotalProgress, aMaxTotalProgress);
end;


procedure TGeckoBrowserListener.OnLocationChange(
                aWebProgress: nsIWebProgress;
                aRequest: nsIRequest;
                location: nsIURI);
var
  str: IInterfacedCString;
begin
  str := NewCString;
  location.GetSpec(str.ACString);

  if Assigned(FBrowser.OnLocationChange) then
    FBrowser.OnLocationChange(FBrowser, str.ToString);
end;

procedure TGeckoBrowserListener.OnStatusChange(
                aWebProgress: nsIWebProgress;
                aRequest: nsIRequest;
                aStatus: PRUint32;
                const aMessage: PWideChar);
begin
{$IFDEF DEBUG}

  //OutputDebugStringW(aMessage);

{$ENDIF}
  if Assigned(FBrowser.OnStatusChange) then
    FBrowser.OnStatusChange(FBrowser, aMessage);
end;

procedure TGeckoBrowserListener.OnSecurityChange(
                aWebProgress: nsIWebProgress;
                aRequest: nsIRequest;
                state: PRUint32);
begin
  //TODO 1 -cTGeckoBrowserListner: TGeckoBrowserListener.OnSecurityChange の記述
end;

constructor TGeckoBrowser.Create(AOwner: TComponent);
begin
  inherited;
  Chrome := TGeckoBrowserChrome.Create(Self);
  Listener := TGeckoBrowserListener.Create(Self);
end;

function TGeckoBrowserChrome.NS_GetInterface(const uuid: TGUID; out _result): nsresult;
begin
  if IsEqualGUID(uuid, nsIDOMWindow) then
  begin
    // nsIDOMWindow を処理しないと nsIWindowCreator.CreateChromeWindow でエラーになる
    Result := FBrowser.FBrowser.ContainerWindow.QueryInterface(uuid, _result);
  end else
  begin
// FPC port: Result is PRUInt32, but QueryInterface returns Longint,
//  so cast to nsresult to prevent range check error.
//    Result := QueryInterface(uuid, _result);
    Result := nsresult(QueryInterface(uuid, _result));
  end;
end;

procedure TGeckoBrowserChrome.OnShowContextMenu(aContextFlags: PRUint32; aUtils: nsIContextMenuInfo);
const
  CONTEXT_NONE             = NS_ICONTEXTMENULISTENER2_CONTEXT_NONE;
  CONTEXT_LINK             = NS_ICONTEXTMENULISTENER2_CONTEXT_LINK;
  CONTEXT_IMAGE            = NS_ICONTEXTMENULISTENER2_CONTEXT_IMAGE;
  CONTEXT_DOCUMENT         = NS_ICONTEXTMENULISTENER2_CONTEXT_DOCUMENT;
  CONTEXT_TEXT             = NS_ICONTEXTMENULISTENER2_CONTEXT_TEXT;
  CONTEXT_INPUT            = NS_ICONTEXTMENULISTENER2_CONTEXT_INPUT;
  CONTEXT_BACKGROUND_IMAGE = NS_ICONTEXTMENULISTENER2_CONTEXT_BACKGROUND_IMAGE;

var
  cmenu: TCtxMenuInfo;
  mouseEvent: nsIDOMMouseEvent;
begin
    if Assigned(FBrowser.OnContextMenu) then
  begin
    cmenu := TCtxMenuInfo.Create(aContextFlags, aUtils);
    try
      FBrowser.OnContextMenu(FBrowser, cmenu);
    finally
      cmenu.Free;
    end;
  end;

  if ((Assigned(FBrowser.PopupMenu)) and (Supports(aUtils.MouseEvent, nsIDOMMouseEvent))) then
    begin
    mouseEvent := aUtils.MouseEvent as nsIDOMMouseEvent;
    FBrowser.PopupMenu.Popup(mouseEvent.ScreenX,mouseEvent.ScreenY);
    end;

end;

procedure TGeckoBrowserChrome.OnShowTooltip(aXCoords: PRInt32; aYCoords: PRInt32; const aTipText: PWideChar); safecall;
var
  r:TRect;
  p,ap:TPoint;
//  height:Integer;
begin
{$IFNDEF LCL}
  if FBrowser.FHint = nil then
  FBrowser.FHint := THintWindow.Create(FBrowser);
  r := FBrowser.FHint.CalcHintRect(400,aTipText,nil);
//  height := r.Bottom;
  ap.X := aXCoords;
  ap.Y := aYCoords;
  p := FBrowser.ClientToScreen(ap);
  r.Left:=p.x;
  r.Top:=p.y-r.Bottom;
  r.Right:=r.Right +p.x;
  r.Bottom:=p.y;
  FBrowser.FHint.ActivateHint(r,aTipText);
{$ENDIF}
end;

procedure TGeckoBrowserChrome.OnHideTooltip(); safecall;
begin
{$IFNDEF LCL}
  FBrowser.FHint.ReleaseHandle;
{$ENDIF}
end;

function TGeckoBrowser.DoCreateChromeWindow(
  chromeFlags: Longword): nsIWebBrowserChrome;
var
  newWin: TCustomGeckoBrowser;
begin
  if Assigned(OnNewWindow) then
  begin
    newWin := nil;
    OnNewWindow(Self, chromeFlags, newWin);
    if Assigned(newWin) then
      Result := newWin.FChrome;
  end;
end;

function TCustomGeckoBrowser.GetWebBrowserChrome: nsIWebBrowserChrome;
begin
  Result := FChrome;
end;

function TCustomGeckoBrowser.GetContentDocument: nsIDOMDocument;
begin
  Result := FWebBrowser.ContentDOMWindow.Document;
end;

function TCustomGeckoBrowser.GetContentWindow: nsIDOMWindow;
begin
  Result := FWebBrowser.ContentDOMWindow;
end;

procedure TCustomGeckoBrowser.WMEraseBkGnd(var Msg: TMessage);
begin
  // ちらつき防止
  Msg.Result := 0;
end;

procedure TCustomGeckoBrowser.Paint;
var
  rc: TRect;
  baseWin: nsIBaseWindow;
  nav: nsIWebNavigation;
begin
  if csDesigning in ComponentState then
  begin
    rc := ClientRect;
    Canvas.FillRect(rc);
  end else
  begin

    if (Assigned(FWebBrowser)) then
    begin
      baseWin := FWebBrowser as nsIBaseWindow;
      nav := FWebBrowser as nsIWebNavigation;

      if (nav.CurrentURI = nil) then
        nav.LoadURI('about:blank',0,nil,nil,nil);

     baseWin.Repaint(True);
    end;
  end;
  inherited;
end;

function TCustomGeckoBrowser.GetCanGoBack: Boolean;
var
  nav: nsIWebNavigation;
  history: nsISHistory;
  index: PRInt32;
begin
  nav := FWebBrowser as nsIWebNavigation;
  history := nav.SessionHistory;
  index := history.Index;
  Result := (index > 0);
end;

function TCustomGeckoBrowser.GetCanGoForward: Boolean;
var
  nav: nsIWebNavigation;
  history: nsISHistory;
  count, index: PRInt32;
begin
  nav := FWebBrowser as nsIWebNavigation;
  history := nav.SessionHistory;
  count := history.Count;
  index := history.Index;

  Result := (index+1<count);
end;

function TCustomGeckoBrowser.GetWebBrowserFind: nsIWebBrowserFind;
begin
  Result := FWebBrowser as nsIWebBrowserFind;
end;
function TCustomGeckoBrowser.GetWebBrowserPrint: nsIWebBrowserPrint;
var
  ir:nsIInterfaceRequestor;
  wbp:nsIWebBrowserPrint;
begin
  ContentWindow.QueryInterface(nsIInterfaceRequestor,ir);
  ir.GetInterface(nsIWebBrowserPrint, wbp);
  Result := wbp;
end;
function TCustomGeckoBrowser.GetWebNavigation: nsIWebNavigation;
begin
  Result := FWebBrowser as nsIWebNavigation;
end;


function TDOMLinks.GetElement(nIndex: Integer): nsIDOMHTMLAnchorElement;
var
  Node: nsIDOMNode;
begin
    domWindow := DOMBrowser.ContentDOMWindow;
    domDoc  := domWindow.Document;
    domHTMLDoc := domDoc as nsIDOMHTMLDocument;

    Node := domHTMLDoc.Links.Item(nIndex);
    if (Supports(Node, nsIDOMHTMLAnchorElement)) then
      Result := Node as nsIDOMHTMLAnchorElement;

end;

function TDOMLinks.GetHrefLinks(nIndex: Integer): AnsiString;
var
  ALink: nsIDOMHTMLAnchorElement;
  Node: nsIDOMNode;
  HrefText: IInterfacedString;
begin
    domWindow := DOMBrowser.ContentDOMWindow;
    domDoc  := domWindow.Document;
    domHTMLDoc := domDoc as nsIDOMHTMLDocument;

      Node := domHTMLDoc.Links.Item(nIndex);
      HrefText := NewString;
      if (Supports(Node, nsIDOMHTMLAnchorElement)) then
      begin
        ALink := Node as nsIDOMHTMLAnchorElement;
        ALink.GetHref(HrefText.AString);
        Result := AnsiString(HrefText.ToString);
      end;
end;

function TDOMLinks.GetAnchorText(nIndex: Integer): String;
var
  Node,ChildNode: nsIDOMNode;
  i, a: Integer;
  AnchorText, TagName,TagType, TagValue, tmpName, tmpValue: IInterfacedString;
  AText, sTagValue: String;
begin
    domWindow := DOMBrowser.ContentDOMWindow;
    domDoc  := domWindow.Document;
    domHTMLDoc := domDoc as nsIDOMHTMLDocument;

    Node := domHTMLDoc.Links.Item(nIndex);
    AnchorText := NewString;
    AText := '';

    for i := 0 to Node.ChildNodes.Length - 1 do
    begin
      ChildNode := Node.ChildNodes.Item(i);

      TagName := NewString;
      TagValue := NewString;
      TagType := NewString;

      ChildNode.GetNodeName(TagName.AString);
      ChildNode.GetNodeValue(TagValue.AString);
      sTagValue := TagValue.ToString;

      sTagValue := StringReplace(sTagValue, Chr(13), '', [rfReplaceAll]);
      sTagValue := StringReplace(sTagValue, Chr(10), '', [rfReplaceAll]);
      sTagValue := StringReplace(sTagValue, Chr(9), '', [rfReplaceAll]);

      if (TagName.ToString = '#text') then
        AText := AText + '' + sTagValue + ''
      else
        begin
        AText := AText + '<' + TagName.ToString + '';

        for a := 0 to ChildNode.Attributes.Length - 1 do
        begin
          tmpName := NewString;
          tmpValue := NewString;
          ChildNode.Attributes.Item(a).GetNodeName(tmpName.AString);
          ChildNode.Attributes.Item(a).GetNodeValue(tmpValue.AString);
          AText := AText+ ' ' + tmpName.ToString + '="'+tmpValue.ToString+'"';
        end;

      AText := AText + '>'+ sTagValue + '';;
      end;

    end;
    Result := AText;
end;

function TDOMForms.GetName(fIndex: Integer; nIndex: Integer): String;
var
  Node: nsIDOMNode;
  ICount: Integer;
  IString: String;
  function Recursive(Node: nsIDOMNode; nIndex: Integer): String;
  var
    i: Integer;
    aNodeName, aNodeValue: IInterfacedString;
    HTMLInput: nsIDOMHTMLInputElement;
  begin
    for i := 0 to Node.ChildNodes.Length - 1 do
    begin
      aNodeName := NewString;
      aNodeValue := NewString;
      Recursive(Node.ChildNodes.Item(i), nIndex);
      Node.ChildNodes.Item(i).GetNodeName(aNodeName.AString);
      if ((aNodeName.ToString = 'INPUT') or
          (aNodeName.ToString = 'SELECT') or
          (aNodeName.ToString = 'TEXTAREA'))
          Then
            begin

            if (ICount = nIndex) then
              begin

                if (Supports(Node.ChildNodes.Item(i), nsIDOMHTMLInputElement)) then
                begin
                  HTMLInput := Node.ChildNodes.Item(i) as nsIDOMHTMLInputElement;
                  HTMLInput.GetName(aNodeValue.AString);
                end;

              IString := aNodeValue.ToString;
              end;
              Inc(ICount);
            end;
    end;
      Result := IString;
  end;
begin
  ICount := 0;
  domWindow := DOMBrowser.ContentDOMWindow;
  domDoc  := domWindow.Document;

  if (Supports(domDoc, nsIDOMHTMLDocument)) then
  begin
    domHTMLDoc := domDoc as nsIDOMHTMLDocument;
    Node := domHTMLDoc.Forms.Item(fIndex);
    Result := Recursive(Node, nIndex);

  end else
    Result := '';
end;

function TDOMForms.GetValue(fIndex: Integer; nIndex: Integer): String;
var
  Node: nsIDOMNode;
  ICount: Integer;
  IString: String;
  function Recursive(Node: nsIDOMNode; nIndex: Integer): String;
  var
    i: Integer;
    aNodeName, aNodeValue: IInterfacedString;
    HTMLInput: nsIDOMHTMLInputElement;
  begin
    for i := 0 to Node.ChildNodes.Length - 1 do
    begin
      aNodeName := NewString;
      aNodeValue := NewString;
      Recursive(Node.ChildNodes.Item(i), nIndex);
      Node.ChildNodes.Item(i).GetNodeName(aNodeName.AString);
      if ((aNodeName.ToString = 'INPUT') or
          (aNodeName.ToString = 'SELECT') or
          (aNodeName.ToString = 'TEXTAREA'))
          Then
            begin

            if (ICount = nIndex) then
              begin

                if (Supports(Node.ChildNodes.Item(i), nsIDOMHTMLInputElement)) then
                begin
                  HTMLInput := Node.ChildNodes.Item(i) as nsIDOMHTMLInputElement;
                  HTMLInput.GetValue(aNodeValue.AString);
                end;

              IString := aNodeValue.ToString;
              end;
              Inc(ICount);
            end;
    end;
      Result := IString;

  end;
begin
  ICount := 0;
  domWindow := DOMBrowser.ContentDOMWindow;
  domDoc  := domWindow.Document;

  if (Supports(domDoc, nsIDOMHTMLDocument)) then
  begin
    domHTMLDoc := domDoc as nsIDOMHTMLDocument;
    Node := domHTMLDoc.Forms.Item(fIndex);
    Result := Recursive(Node, nIndex);

  end else
    Result := '';

end;

procedure TDOMForms.SetValue(fIndex: Integer; nIndex: Integer; AValue: String);
var
  Node: nsIDOMNode;
  ICount: Integer;
  IString: String;
  procedure Recursive(Node: nsIDOMNode; nIndex: Integer; aValue: String);
  var
    i: Integer;
    aNodeName, aNodeValue: IInterfacedString;
    HTMLInput: nsIDOMHTMLInputElement;
  begin
    for i := 0 to Node.ChildNodes.Length - 1 do
    begin
      aNodeName := NewString;
      aNodeValue := NewString;
      Recursive(Node.ChildNodes.Item(i), nIndex, aValue);
      Node.ChildNodes.Item(i).GetNodeName(aNodeName.AString);
      if ((aNodeName.ToString = 'INPUT') or
          (aNodeName.ToString = 'SELECT') or
          (aNodeName.ToString = 'TEXTAREA'))
          Then
            begin

            if (ICount = nIndex) then
              begin

                if (Supports(Node.ChildNodes.Item(i), nsIDOMHTMLInputElement)) then
                begin
                  HTMLInput := Node.ChildNodes.Item(i) as nsIDOMHTMLInputElement;
                  HTMLInput.SetValue(NewString(aValue).AString);
                end;

              IString := aNodeValue.ToString;
              end;
              Inc(ICount);
            end;
    end;

  end;
begin
  ICount := 0;
  domWindow := DOMBrowser.ContentDOMWindow;
  domDoc  := domWindow.Document;

  if (Supports(domDoc, nsIDOMHTMLDocument)) then
  begin
    domHTMLDoc := domDoc as nsIDOMHTMLDocument;
    Node := domHTMLDoc.Forms.Item(fIndex);
    Recursive(Node, nIndex, aValue);
  end;
end;

function TDOMForms.GetFormControlCount(nIndex: Integer): Integer;
var

  Node: nsIDOMNode;
  ICount: Integer;
  function Recursive(Node: nsIDOMNode): Integer;
  var
    i: Integer;
    aNodeName: IInterfacedString;
  begin
    for i := 0 to Node.ChildNodes.Length - 1 do
    begin
      aNodeName := NewString;
      Recursive(Node.ChildNodes.Item(i));
      Node.ChildNodes.Item(i).GetNodeName(aNodeName.AString);
      if ((aNodeName.ToString = 'INPUT') or
          (aNodeName.ToString = 'SELECT') or
          (aNodeName.ToString = 'TEXTAREA'))
          Then
            Inc(ICount);
    end;
      Result := ICount;
  end;
begin
  ICount := 0;
  domWindow := DOMBrowser.ContentDOMWindow;
  domDoc  := domWindow.Document;

  if (Supports(domDoc, nsIDOMHTMLDocument)) then
  begin
    domHTMLDoc := domDoc as nsIDOMHTMLDocument;
    Node := domHTMLDoc.Forms.Item(nIndex);
    Result := Recursive(Node);

  end else
    Result := 0;

end;

function TDOMForms.GetFormsCount;
begin
  domWindow := DOMBrowser.ContentDOMWindow;
  domDoc  := domWindow.Document;
  if (Supports(domDoc, nsIDOMHTMLDocument)) then
  begin
    domHTMLDoc := domDoc as nsIDOMHTMLDocument;
    Result := domHTMLDoc.Forms.Length;
  end else
    Result := 0;
end;

function TDOMLinks.GetLinksCount;
begin
  domWindow := DOMBrowser.ContentDOMWindow;
  domDoc  := domWindow.Document;
  if (Supports(domDoc, nsIDOMHTMLDocument)) then
  begin
    domHTMLDoc := domDoc as nsIDOMHTMLDocument;
    Result := domHTMLDoc.Links.Length;
  end else
    Result := 0;
end;

function TCustomGeckoBrowser.GetDOMLinks: TDOMLinks;
begin
  if (not Assigned(FDOMLinks)) then
    begin
    FDOMLinks := TDOMLinks.Create;
    FDOMLinks.DOMBrowser := FWebBrowser;
    end;
    Result := FDOMLinks;
end;

function TCustomGeckoBrowser.GetDOMForms: TDOMForms;
begin
  if (not Assigned(FDOMForms)) then
    begin
      FDOMForms := TDOMForms.Create;
      FDOMForms.DOMBrowser := FWebBrowser;
    end;
    Result := FDOMForms;
end;


function TGeckoBrowser.GetURIString: UTF8String;
var
  str: IInterfacedUTF8String;
begin
  Result:='';
  str :=NewUTF8String;
//URI
  if Self.WebNavigation <> nil then
    Self.WebNavigation.CurrentURI.GetSpec(str.AUTF8String);
  Result := str.ToString;
end;

procedure TGeckoBrowserChrome.FocusPrevElement();
var
  Ancestor: TWinControl;
begin
  Ancestor := FBrowser.Parent;
  while Assigned(Ancestor) and (not(Ancestor is TForm)) do
    Ancestor := Ancestor.Parent;
  if Assigned(Ancestor) then
    PostMessage(Ancestor.Handle, WM_NEXTDLGCTL, 1, 0);
end;

procedure TGeckoBrowserChrome.FocusNextElement();
var
  Ancestor: TWinControl;
begin
  Ancestor := FBrowser.Parent;
  while Assigned(Ancestor) and (not(Ancestor is TForm)) do
    Ancestor := Ancestor.Parent;
  if Ancestor <> nil then
    PostMessage(Ancestor.Handle, WM_NEXTDLGCTL, 0, 0);
end;

function TGeckoBrowserChrome.GetCreateWindowTarget: IGeckoCreateWindowTarget;
begin
  Supports(FBrowser, IGeckoCreateWindowTarget, Result);
end;

procedure TGeckoBrowserListener.OnHistoryNewEntry(aNewURI: nsIURI);
begin
end;

function TGeckoBrowserListener.OnHistoryGoBack(aBackURI: nsIURI): PRBool;
var
  Handled:Boolean;
  aContinue:PRBool;
begin
  if Assigned(FBrowser.FOnGoBack) then
    FBrowser.FOnGoBack(Self,aBackURI,aContinue,Handled);
  if Handled then begin
    Result := aContinue;
  end
  else {if not Handled then }begin
    {if (HistoryPosition>0) then
      Result := True
    else
      Result := False;}
    Result := True;
  end;
end;

function TGeckoBrowserListener.OnHistoryGoForward(aForwardURI: nsIURI): PRBool;
var
  Handled:Boolean;
  aContinue:PRBool;
begin
  if Assigned(FBrowser.FOnGoForward) then
    FBrowser.FOnGoForward(Self,aForwardURI,aContinue,Handled);
  if Handled then begin
    Result := aContinue;
  end
  else {if not Handled then} begin
    {if (HistoryPosition+1)<HistoryCount then
      Result := True
    else
      Result := False;}
    Result := True;
  end;
end;

function TGeckoBrowserListener.OnHistoryReload(aReloadURI: nsIURI; aReloadFlags: PRUint32): PRBool;
begin
  Result := True;
end;

function TGeckoBrowserListener.OnHistoryGotoIndex(aIndex: PRInt32; aGotoURI: nsIURI): PRBool;
var
  Handled:Boolean;
  aContinue:PRBool;
begin
  if Assigned(FBrowser.FOnGoToIndex) then
    FBrowser.FOnGoToIndex(Self,aIndex,aGotoURI,aContinue,Handled);

  if Handled then begin
    Result := aContinue;
  end
  else begin
    {if aIndex in [0..HistoryCount-1] then
      Result := True
    else
      Result := False;}
    Result := True;
  end;
end;

function TGeckoBrowserListener.OnHistoryPurge(aNumEntries: PRInt32): PRBool;
begin
  Result := True;
end;

constructor TCtxMenuInfo.Create(flags: Longword; info: nsIContextMenuInfo);
begin
  inherited Create;

  FInfo := info;
  FFlags := [];

  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_LINK) then
    FFlags := FFlags + [cmfLink];
  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_IMAGE) then
    FFlags := FFlags + [cmfImage];
  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_DOCUMENT) then
    FFlags := FFlags + [cmfDocument];
  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_TEXT) then
    FFlags := FFlags + [cmfText];
  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_INPUT) then
    FFlags := FFlags + [cmfInput];
  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_BACKGROUND_IMAGE) then
    FFlags := FFlags + [cmfBGImage];
end;

function TCtxMenuInfo.GetAssociatedLink: WideString;
var
  str: IInterfacedString;
begin
  try
    str := NewString;
    FInfo.GetAssociatedLink(str.AString);
    Result := str.ToString;
  except
  end;
end;

function TCtxMenuInfo.GetImageURL: UTF8String;
var
  str: IInterfacedUTF8String;
  uri: nsIURI;
begin
  try
    str := NewUTF8String;
    uri := FInfo.GetImageSrc();
    uri.GetSpec(str.AUTF8String);
    Result := str.ToString;
  except
  end;
end;

function TCtxMenuInfo.GetBGImageURL: UTF8String;
var
  str: IInterfacedUTF8String;
  uri: nsIURI;
begin
  try
    str := NewUTF8String;
    uri := FInfo.GetBackgroundImageSrc();
    uri.GetSpec(str.AUTF8String);
    Result := str.ToString;
  except
  end;
end;

function TCtxMenuInfo.GetMouseEvent: nsIDOMEvent;
begin
  Result := FInfo.MouseEvent;
end;

function TCtxMenuInfo.GetTargetNode: nsIDOMNode;
begin
  Result := FInfo.TargetNode;
end;

function TCtxMenuInfo.GetImageContainer: imgIContainer;
begin
  Result := FInfo.ImageContainer;
end;

function TCtxMenuInfo.GetImageSrc: nsIURI;
begin
  Result := FInfo.ImageSrc;
end;

function TCtxMenuInfo.GetBGImageContainer: imgIContainer;
begin
  Result := FInfo.BackgroundImageContainer;
end;

function TCtxMenuInfo.GetBGImageSrc: nsIURI;
begin
  Result := FInfo.BackgroundImageSrc;
end;

{$IFDEF LCL}
initialization
{$I GeckoBrowser.lrs}
{$ENDIF}

end.

