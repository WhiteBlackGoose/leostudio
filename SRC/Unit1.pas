unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, ComCtrls, ActnList, Menus, Unit2, ShellAPI,
   Buttons, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP,  MSHTML, OleCtrls, SHDocVw, Urlmon, HyperLinksDecorator, RegExpr, hookcomb,
  cefvcl, cefgui, ceflib, MOZILLACONTROLLib_TLB, clipbrd, acImage, mc_utils,
  sSkinManager, sPanel, sSpeedButton, sRichEdit, sPageControl, sEdit,
  sLabel, ImgList, sTreeView, sTabControl, sDialogs, UQPixels, sComboBoxes, synedit, SynHighlighterJScript,
  SynEditTypes,
  SynEditHighlighter,
  SynUnicode,
  SynHighLighterSample,
  inifiles, sCheckBox, sScrollBar, sUpDown, sSplitter, XPMan, SynEditAutoComplete,
  acAlphaHints, SynCompletionProposal, acTitleBar, acMagn, ToolWin,
  sToolBar, sStatusBar, acHeaderControl, acSlider, acAlphaImageList,
  sGroupBox, acPNG, sComboBox;
const
  Version = '1.3';
  Project_name = 'MJS Studio'; //Moneycrafter advanced javascript rapid application development integrated development enviroment studio
  Short_Project_Name = 'MJS Studio';    
  User_Prj_ext = 'jssprj';
type
  TLanguage = (plRu, plEn, plIt, plFr);
  TProgLanguage = (llJs, llPy);
var
  Program_Language_local_ME: TLanguage;
  ProjectCreated: boolean = false;
function tr(En, Ru, It, Fr: string): string;
var
  COLOR_1: integer = $2a2aa5;
  COLOR_2: integer = $a52a2a;
  COLOR_3: integer = $2aa52a;
type
  TUTF8Char = Char;
  TTyp = (ttnormal, ttwarning, tterror);
  THTMLLevEditor = class(TForm)
    mm1: TMainMenu;
    file1: TMenuItem;
    new1: TMenuItem;
    dlgOpen1: TOpenDialog;
    Save1: TMenuItem;
    Open1: TMenuItem;
    Save2: TMenuItem;
    open: TOpenDialog;
    savedialog: TSaveDialog;
    Timer2: TTimer;
    idhtp1: TIdHTTP;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    Run1: TMenuItem;
    About1: TMenuItem;
    Aboutprojects1: TMenuItem;
    ew1: TSaveDialog;
    Timer7: TTimer;
    d1: TOpenDialog;
    Help1: TMenuItem;
    sknmngr1: TsSkinManager;
    tmr1: TTimer;
    pm1: TPopupMenu;
    il1: TImageList;
    C2: TMenuItem;
    dlg1: TsSaveDialog;
    dlg2: TsSaveDialog;
    T2: TMenuItem;
    C1: TMenuItem;
    dlg3: TsColorDialog;
    dlg4: TsOpenDialog;
    pm2: TPopupMenu;
    T3: TMenuItem;
    dlg5: TsOpenDialog;
    spnl32: TsPanel;
spnl46: TsPanel;
    btn4: TsSpeedButton;
    btn5: TsSpeedButton;
    btn7: TsSpeedButton;
    btn3: TsSpeedButton;
    btn8: TsSpeedButton;
    btn2: TsSpeedButton;
    btn6: TsSpeedButton;
    btn10: TsSpeedButton;
    btn35: TsSpeedButton;
    btn36: TsSpeedButton;
    btn37: TsSpeedButton;
    btn38: TsSpeedButton;
    btn39: TsSpeedButton;
btn16: TsSpeedButton;
    btn17: TsSpeedButton;
btn47: TsSpeedButton;
    B1: TMenuItem;
    L1: TMenuItem;
    E1: TMenuItem;
    R4: TMenuItem;
    O1: TMenuItem;
    B2: TMenuItem;
    S1: TMenuItem;
    S3: TMenuItem;
    il2: TImageList;
    I1: TMenuItem;
    pm3: TPopupMenu;
    f2: TMenuItem;
    i2: TMenuItem;
    l2: TMenuItem;
    j1: TMenuItem;
    pm4: TPopupMenu;
    S2: TMenuItem;
    B3: TMenuItem;
    R1: TMenuItem;
    D2: TMenuItem;
    R2: TMenuItem;
    P1: TMenuItem;
    H1: TMenuItem;
    f1: TMenuItem;
    i3: TMenuItem;
    l3: TMenuItem;
    j2: TMenuItem;
    H2: TMenuItem;
    J3: TMenuItem;
    S4: TMenuItem;
    W1: TMenuItem;
    F3: TMenuItem;
    M2: TMenuItem;
    C4: TMenuItem;
    D3: TMenuItem;
    F4: TMenuItem;
    R3: TMenuItem;
    T1: TMenuItem;
    C5: TMenuItem;
    O2: TMenuItem;
    L4: TMenuItem;
    S5: TMenuItem;
    S6: TMenuItem;
    D4: TMenuItem;
    J4: TMenuItem;
    dlg6: TsOpenDialog;
    dlg7: TsOpenDialog;
    F5: TMenuItem;
    Z1: TMenuItem;
    Fontsizeup1: TMenuItem;
    M3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    A1: TMenuItem;
    R5: TMenuItem;
    O3: TMenuItem;
    slphnts1: TsAlphaHints;
    F6: TMenuItem;
    C3: TMenuItem;
    R6: TMenuItem;

    spnl41: TsPanel;
    btn92: TsSpeedButton;
    btn93: TsSpeedButton;
    E2: TMenuItem;


    stat1: TsStatusBar;
    spltr1: TsSplitter;

    btn97: TsSpeedButton;
    btn94: TsSpeedButton;
    btn95: TsSpeedButton;
    F7: TMenuItem;
    I4: TMenuItem;
    il3: TsAlphaImageList;
    il4: TsAlphaImageList;
    spnl38: TsPanel;
    lbl35: TsLabel;
    lbl36: TsWebLabel;
    spnl60: TsPanel;
    spnl4: TsPanel;
    spnl5: TsPanel;
    pgcspgcntrl2: TsPageControl;
    stbsht3: TsTabSheet;
    spnl18: TsPanel;
    spnl16: TsPanel;
    lbl11: TsLabel;
    edt12: TsEdit;
    spnl15: TsPanel;
    lbl10: TsLabel;
    edt11: TsEdit;
    spnl14: TsPanel;
    lbl9: TsLabel;
    edt10: TsEdit;
    spnl13: TsPanel;
    lbl8: TsLabel;
    edt9: TsEdit;
    spnl12: TsPanel;
    lbl7: TsLabel;
    edt8: TsEdit;
    spnl11: TsPanel;
    lbl6: TsLabel;
    edt7: TsEdit;
    spnl10: TsPanel;
    lbl5: TsLabel;
    edt6: TsEdit;
    spnl6: TsPanel;
    lbl1: TsLabel;
    edt2: TsEdit;
    spnl7: TsPanel;
    lbl2: TsLabel;
    edt3: TsEdit;
    spnl8: TsPanel;
    lbl3: TsLabel;
    edt4: TsEdit;
    spnl9: TsPanel;
    lbl4: TsLabel;
    edt5: TsEdit;
    spnl21: TsPanel;
    lbl12: TsLabel;
    edt13: TsEdit;
    spnl39: TsPanel;
    lbl14: TsLabel;
    edt15: TsEdit;
    spnl44: TsPanel;
    lbl22: TsLabel;
    edt23: TsEdit;
    spnl45: TsPanel;
    lbl23: TsLabel;
    edt24: TsEdit;
    spnl24: TsPanel;
    lbl27: TsLabel;
    edt27: TsEdit;
    stbsht4: TsTabSheet;
    spnl23: TsPanel;
    spnl22: TsPanel;
    lbl13: TsLabel;
    edt14: TsEdit;
    spnl25: TsPanel;
    lbl15: TsLabel;
    edt16: TsEdit;
    spnl26: TsPanel;
    lbl16: TsLabel;
    edt17: TsEdit;
    spnl27: TsPanel;
    lbl17: TsLabel;
    edt18: TsEdit;
    spnl28: TsPanel;
    lbl18: TsLabel;
    edt19: TsEdit;
    spnl29: TsPanel;
    lbl19: TsLabel;
    edt20: TsEdit;
    spnl30: TsPanel;
    lbl20: TsLabel;
    edt21: TsEdit;
    spnl31: TsPanel;
    lbl21: TsLabel;
    edt22: TsEdit;
    stbsht7: TsTabSheet;
    btn18: TsSpeedButton;
    btn19: TsSpeedButton;
    btn23: TsSpeedButton;
    btn40: TsSpeedButton;
    btn41: TsSpeedButton;
    btn42: TsSpeedButton;
    btn43: TsSpeedButton;
    btn44: TsSpeedButton;
    btn46: TsSpeedButton;
    btn45: TsSpeedButton;
    spltr5: TsSplitter;
    spnl1: TsPanel;
    pgc3: TsPageControl;
    stbsht13: TsTabSheet;
    spnl61: TsPanel;
    tv1: TsTreeView;
    stbsht14: TsTabSheet;
    tv5: TsTreeView;
    spnl2: TsPanel;
    spnl47: TsPanel;
    m1: TsRichEdit;
    spnl20: TsPanel;
    btn29: TsSpeedButton;
    spnl49: TsPanel;
    pgc2: TsPageControl;
    stbsht5: TsTabSheet;
    stbsht6: TsTabSheet;
    spltr3: TsSplitter;
    spnl43: TsPanel;
    lbl24: TsLabel;
    btn48: TsSpeedButton;
    btn20: TsSpeedButton;
    edt25: TsEdit;
    spnl50: TsPanel;
    lbl25: TsLabel;
    btn58: TsSpeedButton;
    lbl26: TsLabel;
    btn59: TsSpeedButton;
    btn12: TsSpeedButton;
    edt1: TsEdit;
    edt26: TsEdit;
    chk1: TsCheckBox;
    spnl51: TsPanel;
    spnl52: TsPanel;
    btn64: TsSpeedButton;
    tv3: TsTreeView;
    spnl53: TsPanel;
    spltr4: TsSplitter;
    spnl42: TsPanel;
    btn11: TsSpeedButton;
    btn49: TsSpeedButton;
    btn50: TsSpeedButton;
    btn51: TsSpeedButton;
    btn52: TsSpeedButton;
    btn53: TsSpeedButton;
    btn54: TsSpeedButton;
    btn55: TsSpeedButton;
    btn56: TsSpeedButton;
    btn57: TsSpeedButton;
    btn60: TsSpeedButton;
    btn61: TsSpeedButton;
    btn62: TsSpeedButton;
    btn63: TsSpeedButton;
    btn67: TsSpeedButton;
    btn75: TsSpeedButton;
    btn77: TsSpeedButton;
    btn78: TsSpeedButton;
    btn79: TsSpeedButton;
    btn80: TsSpeedButton;
    btn81: TsSpeedButton;
    btn82: TsSpeedButton;
    btn83: TsSpeedButton;
    btn84: TsSpeedButton;
    spnl55: TsPanel;
    spnl58: TsPanel;
    btn96: TsSpeedButton;
    btn98: TsSpeedButton;
    tv4: TsTreeView;
    stbcntrl1: TsTabControl;
    spnl37: TsPanel;
    pgc4: TsPageControl;
    stbsht15: TsTabSheet;
    spnl48: TsPanel;
    lbl37: TsWebLabel;
    grp1: TsGroupBox;
    lbl28: TsWebLabel;
    lbl29: TsWebLabel;
    lbl30: TsWebLabel;
    lbl31: TsWebLabel;
    lbl34: TsWebLabel;
    cbb1: TsComboBoxEx;
    grp2: TsGroupBox;
    lbl32: TsWebLabel;
    lbl33: TsWebLabel;
    stbsht16: TsTabSheet;
    chrm1: TChromium;
    spnl59: TsPanel;
    lbl38: TsLabelFX;
    spltr2: TsSplitter;
    spnl3: TsPanel;
    pgcspgcntrl1: TsPageControl;
    stbsht1: TsTabSheet;
    spnl63: TsPanel;
    spnl62: TsPanel;
    spnl56: TsPanel;
    pgc1: TsPageControl;
    stbsht8: TsTabSheet;
    spnl19: TsPanel;
    btn24: TsSpeedButton;
    btn25: TsSpeedButton;
    btn30: TsSpeedButton;
    btn31: TsSpeedButton;
    btn32: TsSpeedButton;
    btn33: TsSpeedButton;
    btn9: TsSpeedButton;
    btn34: TsSpeedButton;
    stbsht9: TsTabSheet;
    spnl54: TsPanel;
    btn65: TsSpeedButton;
    btn66: TsSpeedButton;
    btn68: TsSpeedButton;
    btn69: TsSpeedButton;
    btn70: TsSpeedButton;
    btn71: TsSpeedButton;
    stbsht10: TsTabSheet;
    spnl57: TsPanel;
    btn72: TsSpeedButton;
    btn73: TsSpeedButton;
    btn74: TsSpeedButton;
    btn76: TsSpeedButton;
    stbsht11: TsTabSheet;
    spnl35: TsPanel;
    btn13: TsSpeedButton;
    btn14: TsSpeedButton;
    btn15: TsSpeedButton;
    stbsht12: TsTabSheet;
    spnl40: TsPanel;
    btn21: TsSpeedButton;
    btn22: TsSpeedButton;
    spnl17: TsPanel;
    btn28: TsSpeedButton;
    spnl33: TsPanel;
    spnl34: TsPanel;
    btn1: TsSpeedButton;
    tv2: TsTreeView;
    spnl36: TsPanel;
    btn85: TsSpeedButton;
    btn86: TsSpeedButton;
    btn87: TsSpeedButton;
    btn88: TsSpeedButton;
    btn89: TsSpeedButton;
    btn90: TsSpeedButton;
    btn91: TsSpeedButton;
    stbsht2: TsTabSheet;
    medt1: TsRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure new1Click(Sender: TObject);
    procedure close2Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure rrr(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure Startfile1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mmofgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmofgKeyPress(Sender: TObject; var Key: Char);
    procedure Timer2Timer(Sender: TObject);

  
    procedure insert(s: string; extra: string = '');
    procedure insertBlock(s1, s2: string; main: string = '');
    function  Addspace(o: integer = 1): string;

    function GetCode(url: string): string;
    procedure ins(const s: string; num: integer);
    procedure mmofgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mmofgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DrawTheme(cl: Tcolor);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Aboutprojects1Click(Sender: TObject);
    procedure mmclick(sender: TObject);
    procedure tv1DblClick(Sender: TObject);
    procedure tv1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer7Timer(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn24Click(Sender: TObject);
    procedure spnl3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure edt2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt14DblClick(Sender: TObject);
    procedure edt14MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edt14MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Open1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure Fff(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure spnl3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure spnl3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tv2DblClick(Sender: TObject);
    procedure Asasd(Sender: TObject);
    procedure edt15DblClick(Sender: TObject);
    procedure edt23DblClick(Sender: TObject);
    procedure mmofgChange(Sender: TObject);
    procedure btn39Click(Sender: TObject);
    procedure btn37Click(Sender: TObject);
    procedure btn38Click(Sender: TObject);
    procedure btn18Click(Sender: TObject);
    procedure Aaaa(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure R4Click(Sender: TObject);
    procedure btn48Click(Sender: TObject);
    procedure btn49Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure stbcntrl1Change(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure S3Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure f2Click(Sender: TObject);
    procedure i2Click(Sender: TObject);
    procedure l2Click(Sender: TObject);
    procedure j1Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure Aaaaa(Sender: TObject);
    procedure btn58Click(Sender: TObject);
    procedure btn59Click(Sender: TObject);
    procedure btn60Click(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure btn62Click(Sender: TObject);
    procedure btn63Click(Sender: TObject);
    procedure btn64Click(Sender: TObject);
    procedure J3Click(Sender: TObject);
    procedure S4Click(Sender: TObject);
    procedure tv3Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn20Click(Sender: TObject);
    procedure btn28Click(Sender: TObject);
    procedure B3Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure F4Click(Sender: TObject);
    procedure btn29Click(Sender: TObject);
    procedure C5Click(Sender: TObject);
    procedure L4Click(Sender: TObject);
    procedure S5Click(Sender: TObject);
    procedure S6Click(Sender: TObject);
    procedure D4Click(Sender: TObject);
    procedure J4Click(Sender: TObject);
    procedure D3Click(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure F3Click(Sender: TObject);
    procedure btn75Click(Sender: TObject);
    procedure btn77Click(Sender: TObject);
    procedure btn79Click(Sender: TObject);
    procedure btn78Click(Sender: TObject);
    procedure Z1Click(Sender: TObject);
    procedure Fontsizeup1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure xfgfs(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure R5Click(Sender: TObject);
    procedure O3Click(Sender: TObject);
    procedure spnl3DblClick(Sender: TObject);
    procedure Dfhdfsh(Sender: TObject);
    procedure btn82Click(Sender: TObject);
    procedure btn81Click(Sender: TObject);
    procedure btn83Click(Sender: TObject);
    procedure btn84Click(Sender: TObject);
    procedure btn86Click(Sender: TObject);
    procedure btn85Click(Sender: TObject);
    procedure R6Click(Sender: TObject);
    procedure btn90Click(Sender: TObject);
    procedure btn91Click(Sender: TObject);
    procedure F6Click(Sender: TObject);
    procedure btn95Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure tv4Click(Sender: TObject);
    procedure btn96Click(Sender: TObject);
    procedure btn98Click(Sender: TObject);
    procedure H2Click(Sender: TObject);
    procedure F7Click(Sender: TObject);
    procedure I4Click(Sender: TObject);
    procedure tv5Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure lbl31Click(Sender: TObject);
    procedure lbl33Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
  public
    mmofg: TSynEdit;
    function betweenpoints(len: integer; chr: char): boolean;
    procedure playfile(i: integer);
    procedure addtolist(s1: string);
    procedure log(s: string; typ: TTyp = ttnormal);
    function ask_for_save: integer;
    procedure OpenProject(path: string);
    procedure UserFormOnCloseAttemp(Sender: TObject; var Action: TCloseAction);
    procedure OnTryToResizeUserFormAction(Sender: TObject; var NewWidth, NewHeight: integer; var resize: boolean);
    procedure TranslateAll(Language: TLanguage);
    procedure NextFind(a: string = '');
    procedure mmofggutterclick(Sender: TObject; Button: TMouseButton;
    X, Y, Line: Integer; Mark: TSynEditMark);
    procedure bcOnCOdeCompl(Sender: TObject; var Value: UnicodeString;
    Shift: TShiftState; Index: Integer; EndToken: WideChar);
  end;
  TTabSheet = class(ComCtrls.TTabSheet)
  private 
    FColor: TColor;
    procedure SetColor(Value: TColor); 
    procedure WMEraseBkGnd(var Msg: TWMEraseBkGnd); 
      message WM_ERASEBKGND; 
  public
    constructor Create(aOwner: TComponent); override; 
    property Color: TColor read FColor write SetColor;
  end;

function CountSym(num: integer): integer;
procedure start(s: string; i: integer);
procedure CheckForFileExist;
function ANSI2KOI8R(S: string): string;
Procedure InitNewObj(tag: string;{Percents} Px, Py: extended; {Percents} Pwidth, Pheight: extended);
Procedure RecreateVis(num: integer = -1; redrawrectall: boolean = true);
procedure ActiveObjInsp;
function CompileDigFormatToHtml(Num: integer = -1): string;
function GetHighestId(): integer;
function NewWindow(name: string = 'NewWindow'): integer;
procedure RelistTo(num: integer);
procedure ClearProject;
const
  //QUATIENT_MOVE_X = 20;
  //QUATIENT_MOVE_Y = 20;
  QUATIENT_MOVE_X = 1;
  QUATIENT_MOVE_Y = 1;
  COMPONENT_POS_X = 50;
  COMPONENT_POS_Y = 20;
  COMPONENT_WIDTH = 80;
  COMPONENT_HEIGHT = 32;
  CURRENT_PROJECT_DEFAULT_CELL_WIDTH = 7;
var
  HTMLLevEditor: THTMLLevEditor;
  count: Integer;
  s: Integer;
  adres:string = '';
  HintMode: boolean = false;
  WasSelected: boolean = false;
  Canredrawall: boolean = false;
  down: boolean = false;
  tabs: array [1..30] of TTabSheet;
  Enable_to_promote_to_other_pattenrs: boolean = false;
  mode_pattern: integer = 1;
  the_last_browser_used: integer = 1;
  FilePath: string;
  start_parametrs: string = '';
  w: TChromium;                                        
  Return_adresses: array of string;
  down_tag_edit: boolean = false;
  CURRENT_PROJECT: record
                     HConstructor: array of
                     record
                       name: string;
                       tag: string;
                       Objects: array of record
                                           NotDestroyed: boolean;
                                           Properties: Dict;
                                         end;

                       HtmlPaste, BodyPaste, HeadPaste: string;
                       Code: string;
                       Width, Height: integer;
                       left, top, pgc2activenum: integer;
                     end;
                     CellWidth: integer;
                     ExeName: string;
                     Icon: string;
                     Language: TProgLanguage;
                   end;

  VisS_S: array of array of TChromium;
  ACTIVE_ELEMENT: integer = -1;
  ACTIVE_ELEMENT_IS: (aeNo, aeMoving, aeChWidth, aeChHeight) = aeNo;
  ACTIVE_ELEMENT_POS: TPoint;
  ACTIVE_PAGE: integer = -1;
  ObjInspBlocked: boolean;
  UserForm: TForm = nil;
  UserPanel: TPanel;
  UserImageBack: TImage;
  Inited: boolean = false;
  qpMainUserImageFront: TQuickPixels;
  ExToolWindows: record
                   ListOfTask: boolean;     //It's not value
                   ListOfObjects: boolean;
                   ObjectInspector: boolean;
                   StructureView: boolean;
                   ListObjects,
                   ListLayout,
                   ListLinks,
                   ListUnvisualObjects,
                   ListHeaders: boolean;
                   SourceList: boolean;
                 end;
  PChanged: boolean = true;
  Buffer: integer = -1;
  SizeBlocked: boolean = false;
  CurrentWordToFindInText: string = '';
  DefProps: record
              DefaultPropsW: dict;
              DefaultPropsH: dict;
            end;
  UsedBookMarks: integer;
  procedure Compile(adres: string; iconadres: string = '');
  function ObjToDigFormat: string;
  function ConfessToWdFormat: string;
  procedure SaveProject(adres: string);
  function GetUA: string;
implementation
uses
  cls, util, abt, ptrns, setcol, winc, cssedt, inchass, smAll, hall,
  hlp, dolphin_changer_ico, Icc, ER, Io, SHOWA, lD_A, npr, sr, st, Ko,
  JSHELP, cslcl, lbc;
{$R *.dfm}

procedure ClearCache;
var
  a: TStringList;
  i: integer;
begin
  A := TStringList.create;
  a.text := GetFilesFrom(GetTempUserPath);
  for i := 0 to a.Count - 1 do
    if fileexists(a[i]) then
      deletefile(a[i]);
  a.Free;
end;

procedure DropLitter;
var
  x, y, z: integer;
begin
  for x := 0 to high(CURRENT_PROJECT.HConstructor) do
    for y := 0 to high(CURRENT_PROJECT.hConstructor[x].objects) do
    begin
      CURRENT_PROJECT.hConstructor[x].objects[y].Properties.resetlenebilir;
      for z := 1 to CURRENT_PROJECT.hConstructor[x].objects[y].Properties.count do
      begin
        if copy(CURRENT_PROJECT.hConstructor[x].objects[y].Properties.activeelement.key, 1, 2) = 'On' then
          if CURRENT_PROJECT.hConstructor[x].objects[y].Properties.activeelement.value <> '' then
            if pos(CURRENT_PROJECT.hConstructor[x].objects[y].Properties.activeelement.value, CURRENT_PROJECT.hConstructor[x].Code) = 0 then
              CURRENT_PROJECT.hConstructor[x].objects[y].Properties[CURRENT_PROJECT.hConstructor[x].objects[y].Properties.activeelement.key] := '';
        CURRENT_PROJECT.hConstructor[x].objects[y].Properties.go();
      end;
    end;
  clearcache
end;

function GetUA: string;
begin
  result := ExtractFilePath(stdDelimiter(adres))
end;

procedure RelistTo(num: integer);
var
  i, j: integer;
begin
  ACTIVE_ELEMENT := -1;
  ActiveObjInsp;
  if ACTIVE_PAGE <> -1 then
  begin
    SizeBlocked := true;
    CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].left := userform.Left;
    CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].top := userform.top;
    CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Code := htmlleveditor.mmofg.text;
    CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Width := userform.Width;
    CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].height := userform.height;
    CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].pgc2activenum := htmlleveditor.pgc2.ActivePageIndex;
    SizeBlocked := false;
  end;
  ACTIVE_PAGE := num;
  if ACTIVE_PAGE <> -1 then
  begin
    SizeBlocked := true;
    userform.Left := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].left;
    userform.top := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].top;
    userform.Width := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Width;
    userform.height := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].height;
    htmlleveditor.mmofg.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Code;
    if (CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].pgc2activenum = 1) or (CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].pgc2activenum = 0) then
      htmlleveditor.pgc2.ActivePageIndex := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].pgc2activenum;
    SizeBlocked := false;
  end;
  for i := 0 to high(VisS_S) do
    for j := 0 to high(VisS_S[i]) do
    begin
      VisS_S[i][j].Free;
      VisS_S[i][j] := nil
    end;
  recreatevis;
  htmlleveditor.stbcntrl1.TabIndex := num + 1;
end;

function tr(En, Ru, It, Fr: string): string;
begin
  if Program_Language_local_ME = plRu then
    result := Ru;
  if Program_Language_local_ME = plEn then
    result := En;
  if Program_Language_local_ME = plIt then
    result := It;
  if Program_Language_local_ME = plFr then
    result := Fr
end;

procedure RaiseError(code: string);
var
  i: integer;
begin
  textsave(textopen(getpath + 'error.log') + '[' + datetimetostr(now) + '] ' + code, getpath + 'error.log');
  if form13.ask(code) then
    shellexecute(0, 'open', PAnsiChar(getpath + 'Repair.exe'), '', nil, SW_NORMAL);
  die(true);
  die()
end;

function GetValPx(a: string): integer;
begin
  result := strtoint(copy(a, 1, length(a) - 2))
end;

procedure Paste;
begin
  if Buffer = -1 then
    exit;
  if high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects) < Buffer then
    exit;
  if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[Buffer].Properties = nil then
    exit;

  setlength(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects, length(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects) + 1);
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects)].Properties := dict.glue(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[Buffer].Properties);
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects)].Properties['Left'] := inttostr((CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects)].Properties['Left']) - 20);
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects)].Properties['Top'] := inttostr((CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects)].Properties['Top']) - 20);
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects)].Properties['Id'] := inttostr(GetHighestId + 1);
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects)].NotDestroyed := true;
  setlength(VisS_S[ACTIVE_PAGE], length(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects));
  recreatevis(high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects));
  ACTIVE_ELEMENT := high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects);
  ActiveObjInsp
end;

function GenCaption: string;
begin
  result := Project_name + ' v' + version
end;

procedure DoThePointNetOnTheUserImageBackPictureCanvasBitmap;
var
  x, y: integer;
begin
  if ACTIVE_PAGE = -1 then
    exit;
  if high(CURRENT_PROJECT.HConstructor) < ACTIVE_PAGE then
    exit;
  Canvas_clear(UserImageBack.Picture.Bitmap.Canvas, UserImageBack.Width, UserImageBack.Height);
  if CURRENT_PROJECT.CellWidth = 1 then
    exit;
  for x := 1 to UserImageBack.Picture.Bitmap.width div CURRENT_PROJECT.CellWidth - 0 do
    for y := 1 to UserImageBack.Picture.Bitmap.height div CURRENT_PROJECT.CellWidth - 0 do
      qpMainUserImageFront.Pixels[x * CURRENT_PROJECT.CellWidth - 3, y * CURRENT_PROJECT.CellWidth - 3] := clgray
end;

procedure RectAllProjectItmesOnField(num: integer = -1; MarkSelected: boolean = true);
const
  needsrect = false;
var
  n: integer;
begin
  if UserImageBack <> nil then
    with UserImageBack.Picture.Bitmap.Canvas do
    begin
      DoThePointNetOnTheUserImageBackPictureCanvasBitmap;
      pen.Color := clblack;
      pen.Width := 1;
      pen.Style := psDot;
      if num = -1 then
      begin
        if needsrect then
          for n := 0 to high(VisS_S[ACTIVE_PAGE]) do
            if VisS_S[ACTIVE_PAGE][n] <> nil then
              rectangle(VisS_S[ACTIVE_PAGE][n].left - 2, VisS_S[ACTIVE_PAGE][n].top - 2, NoMore(VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width, UserForm.width - 1, VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width), NoMore(VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height, userform.Height, VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height));
      end
      else
        if VisS_S[num] <> nil then
        begin
          n := num;
          if needsrect then
            rectangle(VisS_S[ACTIVE_PAGE][n].left - 2, VisS_S[ACTIVE_PAGE][n].top - 2, NoMore(VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width, UserForm.width - 1, VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width), NoMore(VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height, userform.Height, VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height));
        end;
      if MarkSelected then
        if num = -1 then
        begin
          n := ACTIVE_ELEMENT;
          if n <> -1 then
          begin
            //if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[GetNumberById(n)].NotDestroyed then
            begin
              pen.color := clred;
              pen.width := 2;
              rectangle(VisS_S[ACTIVE_PAGE][n].left - 2, VisS_S[ACTIVE_PAGE][n].top - 2, NoMore(VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width + 1, UserForm.width - 1, VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width), NoMore(VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height + 1, userform.Height, VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height));
              brush.color := clwhite;
              rectangle(VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width div 2 - 15, VisS_S[ACTIVE_PAGE][n].top - 17, VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width div 2 + 15, VisS_S[ACTIVE_PAGE][n].top + 10);
              brush.color := clwhite;
              pen.color := clgray;
              textout(VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width div 2 - 10, visS_S[ACTIVE_PAGE][n].top - 14, '#' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Id']);
              pen.color := clred;
              brush.color := clred;
              rectangle(VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width div 2 - 3, VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height, VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width div 2 + 3, VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height + 6);
              rectangle(VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width, VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height div 2 - 3, VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width + 6, VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height div 2 + 3);
              brush.color := clwhite;
              pen.width := 1;
              pen.color := clblack;
            end;
          end;
        end
        else
          if num = ACTIVE_ELEMENT then
          begin
            n := ACTIVE_ELEMENT;
            if n <> -1 then
            begin
              pen.color := clred;
              pen.width := 2;
              rectangle(VisS_S[ACTIVE_PAGE][n].left - 2, VisS_S[ACTIVE_PAGE][n].top - 2, NoMore(VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width + 1, UserForm.width - 1, VisS_S[ACTIVE_PAGE][n].left + VisS_S[ACTIVE_PAGE][n].width), NoMore(VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height + 1, userform.Height, VisS_S[ACTIVE_PAGE][n].top + VisS_S[ACTIVE_PAGE][n].height));
              pen.Width := 1;
              pen.color := clblack;
            end;
          end;
    end;
end;

procedure ClearProject;
var
  i, j: integer;
begin
  form15.stbcntrl1.Tabs.text := '';
  for j := 0 to high(CURRENT_PROJECT.HConstructor) do
  begin
    for i := 0 to high(CURRENT_PROJECT.HConstructor[j].objects) do
      CURRENT_PROJECT.HConstructor[j].objects[i].Properties.Free;
    setlength(CURRENT_PROJECT.HConstructor[j].objects, 0);
  end;

  for i := 0 to high(VisS_S) do
  begin
    for j := 0 to high(VisS_S[i]) do
    begin
      VisS_S[i][j].free;
      VisS_S[i][j] := nil
    end;
    setlength(VisS_S[i], 0);
  end;
  setlength(VisS_S, 0);
  setlength(CURRENT_PROJECT.HConstructor, 0);
  HTMLLEVEDITOR.stbcntrl1.Tabs.text := tr('Start page', 'Начальная страница', 'Pagina iniziale', 'Page de demarrage');
  HTMLLEVEDITOR.mmofg.text := '';
  //center(userform
  SizeBlocked := true;
  userform.width := HTMLLEVEDITOR.spnl63.width div 2;
  userform.height := round(HTMLLEVEDITOR.spnl63.height / 1.5);
  center(userform, HTMLLEVEDITOR.spnl63, [pHoriz, pVert]); 
  DoThePointNetOnTheUserImageBackPictureCanvasBitmap;
  SizeBlocked := false
end;

procedure PreCompile;
begin
  if adres <> '' then
  begin
    Compile(EXtractFilePath(adres) + ExtractFileCaption(EXtractFileName(adres)) + '.exe');
    //Compile(EXtractFilePath(adres) + ExtractFileCaption(EXtractFileName(adres)) + '.apk');
  end
  else
  begin
    HTMLLEVEDITOR.btn5.click;
    Compile(EXtractFilePath(adres) + ExtractFileCaption(EXtractFileName(adres)) + '.exe');
    //Compile(EXtractFilePath(adres) + ExtractFileCaption(EXtractFileName(adres)) + '.apk');
  end;
end;

function GetNumberById(id: integer): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects) do
    if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].NotDestroyed then
      if AsInteger(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].Properties['Id']) = id then
      begin
        result := i;
        exit;
      end;
end;

function GetHighestId(): integer;
var
  i, max: integer;
begin
  max := 0;
  for i := 0 to high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects) do
    if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].notdestroyed then
      if AsInteger(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].Properties['Id']) > max then
        max := AsInteger(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].Properties['Id']);
  result := max
end;

procedure DeleteObject(num: integer);
begin
  num := GetNumberById(num);
  if num = -1 then
  begin
    RaiseError(tr('Incorrect id.', 'Некорректный id.', 'id non corretto.', 'Identifiant incorrect.'));
    exit;
  end;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[num].notDestroyed := false;
  VisS_S[ACTIVE_PAGE][num].free;
  VisS_S[ACTIVE_PAGE][num] := nil
end;

Procedure InitNewObj(tag: string;{Percents} Px, Py: extended; {Percents} Pwidth, Pheight: extended);
var
  i: integer;
begin
  setlength(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects, length(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects) + 1);
  with CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects)] do
  begin
    NotDestroyed := true;
    Properties := dict.setArray;
    for i := 1 to ALL_TAGS do
      Properties[Tags[i, 1]] := Tags[i, 2];
    Properties['Tag'] := tag;
    Properties['Left'] := inttostr(round(Px));
    Properties['Top'] := inttostr(round(Py));
    Properties['Id'] := inttostr(GetHighestId + 1 )
  end;
end;

Procedure RecreateVis(num: integer = -1; redrawrectall: boolean = true);
var
  i, j: integer;
  styletext: string;
  procedure Redraw(n: integer);
  var
    doc: string;
    tag_: string;
    PercX, PercY, i: integer;
    m: TTreeNode;
  begin
    VisS_S[ACTIVE_PAGE][n] := TChromium.Create(UserForm);
    with VisS_S[ACTIVE_PAGE][n] do
    begin
      //VisS_S[ACTIVE_PAGE][n]
      parent := UserForm;
      if AsString(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Width'])[length(AsString(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Width']))] = 'x' then
      begin
        PercX := StrToInt(copy(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Width'], 1, length(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Width']) - 2));
        PercY := StrtoInt(copy(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Height'], 1, length(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Height']) - 2));
      end
      else
      begin
        PercX := StrToInt(copy(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Width'], 1, length(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Width'])));
        PercY := StrtoInt(copy(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Height'], 1, length(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Height'])));
      end;
      //ShowMessage('Tag: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Tag'] + #13#10 + 'Width: ' + inttostr(PercX) + #13#10 + 'Height: ' + inttostr(percY));
      width := PercX + QUATIENT_MOVE_X;
      height := PercY + QUATIENT_MOVE_Y;
      left := strtoint(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Left']);
      top := strtoint(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Top']);
      VisS_S[ACTIVE_PAGE][n].Visible := true;
      doc := doc + HTML_DICT_TO_TAG(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties);
      tag_ := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Tag'];
      if EndTag(tag_) then
        doc := doc + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Caption'] + '</' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Tag'] + '>';
      HTMLLevEditor.medt1.text := HTMLLevEditor.medt1.text + doc;

      TextSave('<html><body><style type="text/css">body {    overflow:hidden;}' + #13#10 + styletext + '</style>' + doc + '</body></html>', GetTempUserPath + '/~' + inttostr(ACTIVE_PAGE) + '_' + inttostr(n) + '.html');
      Load(GetTempUserPath + '/~' + inttostr(ACTIVE_PAGE) + '_' + inttostr(n) + '.html');
      BringToFront;
      enabled := false;
      tag := n;
      //htmlleveditor.tv2.Items.AddChild(htmlleveditor.tv2.Items[1], CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Tag'] + ' #' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[n].Properties['Id']).ImageIndex := 2
    end;
  end;
var
  ggg: TTreeNode;
  x, y, lst: integer;
  txt, name: string;
  pos_: integer;
begin
  styletext := textopen(GetUA + 'classes.css');
  if num = -1 then
  begin
    htmlleveditor.tv3.Items.clear;
    txt := LowerCase(htmlleveditor.mmofg.text);
    while pos('function', txt) <> 0 do
    begin
      pos_ := pos('function', txt);
      name := copy(txt, pos_ + 9, pos('{', txt) - pos_ - 9);
      if name <> '' then
        htmlleveditor.tv3.Items.Add(nil, name);
      txt := copy(txt, pos_ + length(name), length(txt))
    end;

    try
      for i := 1 to htmlleveditor.tv2.Items.Count - 1 do
        htmlleveditor.tv2.Items.Delete(htmlleveditor.tv2.Items[1]);
    except
      on e: exception do
        htmlleveditor.log(tr('Unknown error: ', 'Неизвестная ошибка: ', 'Errore sconosciuto: ', 'Erreur inconnue: ') + e.Message, tterror)
    end;
    for j := 0 to high(CURRENT_PROJECT.HConstructor) do
    begin
      ggg := htmlleveditor.tv2.Items.AddChild(htmlleveditor.tv2.Items[0], CURRENT_PROJECT.HConstructor[j].name);
      ggg.ImageIndex := 3;
      lst := ggg.AbsoluteIndex;
      for i := 0 to high(CURRENT_PROJECT.HConstructor[j].objects) do
        if CURRENT_PROJECT.HConstructor[j].objects[i].NotDestroyed then
        begin
          ggg := htmlleveditor.tv2.Items.AddChild(htmlleveditor.tv2.Items[lst], CURRENT_PROJECT.HConstructor[j].objects[i].Properties['Tag'] + ' #' + CURRENT_PROJECT.HConstructor[j].objects[i].Properties['Id']);
          ggg.ImageIndex := 2;
        end;
    end
  end;
  if ACTIVE_PAGE = -1 then
    exit;
  if UserImageBack <> nil then
  begin
    DoThePointNetOnTheUserImageBackPictureCanvasBitmap;
  end;

  ClearCache;
  HTMLLevEditor.medt1.text := '<html>' + #13#10;

  if num <> -1 then
  begin
    if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[num].NotDestroyed then
    begin
      if num > high(VisS_S[ACTIVE_PAGE]) then
      begin
        setlength(VisS_S[ACTIVE_PAGE], num + 1);
        VisS_S[ACTIVE_PAGE][num] := nil
      end;
      if VisS_S[ACTIVE_PAGE][num] <> nil then
      begin
        VisS_S[ACTIVE_PAGE][num].Free;
        VisS_S[ACTIVE_PAGE][num] := nil
      end;
      redraw(num)
    end;
  end
  else
  begin
    for i := 0 to high(VisS_S[ACTIVE_PAGE]) do
      if VisS_S[ACTIVE_PAGE][i] <> nil then
      begin
        VisS_S[ACTIVE_PAGE][i].Free;
        VisS_S[ACTIVE_PAGE][i] := nil
      end;
    Setlength(visS_s[ACTIVE_PAGE], length(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects));
    for i := 0 to high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects) do
    begin
      //if htmlleveditor.tv2.Items.Count > i + 2 then
        //  htmlleveditor.tv2.Items.Delete(htmlleveditor.tv2.Items[i + 2]);
      if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].NotDestroyed then
      begin
        redraw(i);
        HTMLLevEditor.medt1.text := HTMLLevEditor.medt1.text + #13#10
      end;
    end;
  end;
  if redrawrectall then
    RectAllProjectItmesOnField;
  HTMLLevEditor.medt1.text := HTMLLevEditor.medt1.text + #13#10 + '</html>';
end;

procedure THTMLLEVEDITOR.addtolist(s1: string);
var
  s: TTreenode;
  i: integer;
begin
  exit;
  for i := 0 to tv1.Items.Count - 2 do
    if s1 = tv1.Items[i].Text then exit;
  
  s := TTreenode.Create(tv1.Items);
  s.Text := ExtractFileTitle(s1);
  tv1.Items.AddFirst(s, (s1)).ImageIndex := 0;
end;

constructor TTabSheet.Create(aOwner: TComponent);
begin
  inherited;
  FColor := clBtnFace;
end;

procedure TTabSheet.SetColor(Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Invalidate;
  end;
end; 

procedure TTabSheet.WMEraseBkGnd(var Msg: TWMEraseBkGnd); 
begin 
  if FColor = clBtnFace then 
    inherited 
  else  
  begin
    Brush.Color := FColor;
    Windows.FillRect(Msg.dc, ClientRect, Brush.Handle);
    Msg.Result := 1;
  end;
end;


procedure CheckForFileExist;
var
  i: integer;
begin
  //for i := 0 to HTMLLevEditor.tv1.Items.Count-2 do
  i := 0;
  while i <= HTMLLevEditor.tv1.Items.Count - 2 do
    if not fileexists(HTMLLevEditor.tv1.Items[i].Text) then
      HTMLLevEditor.tv1.Items[i].Delete
    else
      inc(i)
end;

function ObjInspIsActive: boolean;
begin
  result := false
end;

procedure THTMLLevEditor.FormCreate(Sender: TObject);
var
  p: TPoint;
  i, j: integer;
  se: array of integer;
  //QSynHighlighterJScript: THighlighterJScript;
  //a: TSynAnySyn;
  //b: QSynHighlighterJScript
  //TSynJScript
  b_: TSynJScriptSyn;
  c_: TSynSampleSyn;
  ac: TSynAutoComplete;
  bc: TSynCompletionProposal;
begin
  SetTempUserPath();
  UsedBookMarks := 0;
  b_ := TSynJScriptSyn.Create(nil);
  ac := TSynAutoComplete.Create(nil);

  //c_.LanguageName
  b_.CommentAttri.Foreground := clgreen;
  b_.IdentifierAttri.Foreground := clblack;
  b_.IdentifierAttri.Background := blendcolor(clred, clwhite, 10);
  b_.SpaceAttri.Foreground := cllime;
  //b_.IdentifierAttri.Background := blendcolor(clwhite, clblue, 250);
  b_.NonReservedKeyAttri.Foreground := clblack;
  b_.NumberAttri.Foreground := clblue;
  b_.KeyAttri.Foreground := clnavy;
  b_.StringAttri.Foreground := clblue;
  Mmofg := TSynEdit.Create(spnl53);
  //ac.CaseSensitive := true;
  bc := TSynCompletionProposal.Create(mmofg);
  bc.AddEditor(mmofg);
  bc.AddItem('\l', 'location');
  bc.OnCodeCompletion := bcOnCOdeCompl;

  //mmofg.OnGutterClick := self.mmofggutterclick;
  //mmofg.OnGutterClick(
  //mmofg.SetBookMark(0, 10, 10);
  mmofg.ActiveLineColor := blendcolor(clwhite, clyellow, 220);
  mmofg.PopupMenu := pm4;
  mmofg.OnChange := self.mmofgChange;
  mmofg.OnKeyDown := self.mmofgKeyDown;
  mmofg.Highlighter := b_;
  mmofg.Parent := spnl53;
  mmofg.Align := alclient;
  mmofg.Gutter.Visible := true;
  mmofg.Gutter.ShowLineNumbers := true;
  mmofg.BorderStyle := bsNone;
  //CURRENT_PROJECT.CellWidth := 8;
  caption := GenCaption;
  stat1.Panels[0].Text := 'Angourisoft. 2014-2017. v' + Version;
  css_init;
  pgc2.ActivePageIndex := 0;

  
  //w.Load('http://boltushca.ru');
  (*
  if fileexists(ExtractFilePath(application.ExeName) + 'set.opt') then
  begin
    tv1.LoadFromFile(ExtractFilePath(application.ExeName) + 'set.opt');
    //for i := 0 to tv1.items.count - 1 do
      //tv1.items.Item[i].ImageIndex := 0
  end;*)
  checkForFileExist;
  for i := 0 to tv1.Items.Count-2 do
    for j := 0 to tv1.Items.Count-2 do
      if i <> j then
        if tv1.Items[i] = tv1.Items[j] then
        begin
          setlength(se, high(se)+2);
          se[high(se)] := i;
        end;
  for i := 0 to high(se) do
    tv1.Items[se[i]].Delete;
  filepath := extractfilepath(application.ExeName);
  count := 0;
  DoubleBuffered := true;
  p.y := 1;
  p.x := length(mmofg.Lines[p.y]);

  mmofg.CaretX := p.x;
  mmofg.CaretY := p.y;


  log(tr('Ready', 'Готово', 'Pronto', 'Pret'))
end;
                
procedure THTMLLevEditor.new1Click(Sender: TObject);
var
  p: TPOint;
  Enter: string;
  i: integer;
begin
  ACTIVE_ELEMENT := -1;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag := '';
  if Form18.CreateNewProject then
  begin
    CURRENT_PROJECT.ExeName := ExtractFileTitle(adres);
    ActiveObjInsp
  end
end;

procedure THTMLLevEditor.close2Click(Sender: TObject);
begin
  Close;
end;                                                                          


procedure THTMLLevEditor.insert(s: string; extra: string = '');
var
  cText: string;
  CurPoint: TPoint;
begin
  CurPoint.x := mmofg.Caretx;
  curpoint.y := mmofg.Carety;
  cText := mmofg.Lines[CurPoint.y - 1];
  cText := Copy(cText,0,CurPoint.x) + s + Copy(cText,CurPoint.x+1,Length(cText));
  mmofg.Lines[CurPoint.y - 1] := cText;
  mmofg.SetFocus
  //RedrawAll;
end;

procedure THTMLLevEditor.insertBlock(s1, s2: string; main: string = '');
var
  cText: string;
  CurPoint: TPoint;
  g: integer;
  s, s3: string;
  str, len: integer;
  txt: string;
  word: string;
  enter: String;
  ch: TString;
  asl: TStringList;
  i: integer;
begin
  //s3 := AddSpace(1) + '';
  s3 := '  ';
  if mmofg.SelLength = 0 then
  begin
    s := #13#10 + s3 + s1 + #13#10 + s3 + main + #13#10 + s3 + s2 + #13#10 + s3;
    asl := TStringList.create;
    asl.text := s;
    for i := 0 to asl.Count - 1 do
      mmofg.Lines.Insert(mmofg.Carety + i, asl[i]);
    asl.free;

    (*
    CurPoint.x := mmofg.CaretX;
    CurPoint.y := mmofg.Carety;
    ch := TString.Create(s);
    if ch.count_char(#13) + CurPoint.y + 1 > mmofg.Lines.Count then
      mmofg.text := mmofg.text + AddSym(3, #13);
    cText := mmofg.Lines[CurPoint.y];
    g := CurPoint.y;
    cText := Copy(cText, 0, CurPoint.x) + s + Copy(cText,CurPoint.x + 1, Length(cText));
    mmofg.Lines[CurPoint.y] := cText;
    mmofg.Lines[g + 2] := s3 + main;
    mmofg.SelLength := 0;
    mmofg.setFocus;
    mmofg.SelLength := 0;
    CurPoint.y := g + 2;
    curPoint.x := length(s3 + main);
    mmofg.Caretx := CurPoint.x;
    mmofg.Carety := CurPoint.y;*)
  end
  else
  begin
    str := mmofg.SelStart;
    word := copy(mmofg.Text, mmofg.SelStart+1, mmofg.SelLength+1);
    txt := copy(mmofg.Text, 1, mmofg.SelStart) + copy(mmofg.Text, mmofg.SelStart + 1 + mmofg.Sellength, length(mmofg.text));
    mmofg.Text := txt;
    enter := #13#10;
    ins(s3 + s1 + enter +
        s3 + word + enter +
        s3 + s2 + enter, str);
    mmofg.SelStart := str;
    mmofg.sellength := len;
  end;

end;



procedure THTMLLevEditor.Save1Click(Sender: TObject);
var
  saveDialog : TSaveDialog;    // Save dialog variable
begin

  // Create the save dialog object - assign to our save dialog variable
  saveDialog := TSaveDialog.Create(self);

  // Give the dialog a title
  saveDialog.Title := tr('Save your project', 'Сохраните проект', 'Salvare il progetto', 'Enregistrez votre projet');

  // Set up the starting directory to be the current one
  saveDialog.InitialDir := GetCurrentDir;

  // Allow only .txt and .doc file types to be saved
  saveDialog.Filter := tr('App Studio Project|' + '*.' + User_Prj_ext, 'Проект App Studio|' + '*.' + User_Prj_ext, 'App Studio Progetto|' + '*.' + User_Prj_ext, 'App Studio Projet|' + '*.' + User_Prj_ext);
  saveDialog.FileName := tr('Project1', 'Проект1', 'Progetto1', 'Projet1');
  // Set the default extension
  saveDialog.DefaultExt := User_Prj_ext;

  // Select text files as the starting filter type
  saveDialog.FilterIndex := 1;

  // Display the open file dialog
  if saveDialog.Execute
  then
  begin
    //mmofg.lines.SaveToFile(saveDialog.FileName);
    adres := saveDialog.FileName;
    createfile(adres);
    save2.click;
    addtolist(adres);
    log(tr('Saved to ', 'Сохранено в ', 'Salvato', 'Enregistre а') + adres);
  end;

  // Free up the dialog
  saveDialog.Free;
end;


procedure THTMLLevEditor.N2Click(Sender: TObject);
begin
  Form2.ShowModal
end;

procedure THTMLLevEditor.rrr(Sender: TObject);
begin
  //s:=s+1;
  //IntToStr(s);
  insert('<br>');
end;

procedure THTMLLevEditor.Save2Click(Sender: TObject);
var
  s: string;
  procedure savetofile(text, path: string);
  var
    s: Tstringlist;
  begin
    s := TStringlist.Create;
    s.text := text;
    s.SaveToFile(path);
    s.Free
  end;
  function StrAnsiToOem(const aStr : String) : String;
  begin
    Result := '';
    if aStr = '' then Exit;
    SetLength(Result, Length(aStr));
    CharToOem(PChar(aStr), PChar(Result));
  end;
 
  //??????? ????? ?????? ? OEM ????????? CP866 (DOS)
  //? ?????????? ?? ??????? ? ANSI ????????? CP1251 (Windows) ? ???? ????????? ??????.
  function StrOemToAnsi(const aStr : String) : String;
  begin
    Result := '';
    if aStr = '' then Exit;
    SetLength(Result, Length(aStr));
    OemToChar(PChar(aStr), PChar(Result));
  end;

  function chg(s: string): string;
  var
    i, k: integer;
  begin
    result := s;
    k := strtoint(form3.showdialog(''));
    for i := 1 to length(s) do
      result[i] := chr(ord(s[i]) + k);
  end;
begin
  if fileexists(adres) then
  begin
    SaveProject(adres);
    log(tr('Saved to ', 'Сохранено в ', 'Salvato', 'Enregistre а') + adres)
  end
  else
    save1.Click;
  PChanged := false;
end;


function ANSI2KOI8R(S: string): string;
var
  Ansi_CODE, KOI8_CODE: string;
  i: integer;
begin
  KOI8_CODE := '?????·?§?¤???¶???©???«?¬?*?®???°???????µ?¦???????»???????????*?±???‚?—?‡?„?…?–???‰???‹???????????’?“?”?•?†?Ђ?????›?????™???????‘—??';
  ANSI_CODE := '?????‚???„?…?†?‡?Ђ?‰???‹???????????‘?’?“?”?•?–?—???™???›?????????*???????¤???¦?§???©???«?¬?*?®???°?±???????µ?¶?·???????»????????????';
  Result := S;
  for i := 1 to Length(Result) do
    if Pos(Result[i], KOI8_CODE) > 0 then
      Result[i] := ANSI_CODE[Pos(Result[i], KOI8_CODE)];
end;



function THTMLLevEditor.betweenpoints(len: integer; chr: char): boolean;
var
  i, y: integer;
  txt: string;
begin
  txt := mmofg.text;
  y := 0;
  for i := 1 to len do
    if txt[i] = chr then inc(y);
  if y mod 2 = 0 then result := false else result := true;
end;


function CountSym(num: integer): integer;
var
  I, Syms: integer;
begin
  Syms:=0;

  for i:=0 to Num-1 do
  begin
    Syms:=Syms+length(HTMLLevEditor.mmofg.lines[i])+2;
  end;
  result := syms;
end;

function THTMLLevEditor.Addspace(o: integer = 1): string;
var
  s, s1: string;
  i: integer;
begin
  i := 1;
  s := '';
  s1 := (mmofg.Lines[mmofg.Carety-o]);
  while ((i-1 < length(s1)) and (s1[i] = ' ')) do
  begin
    s := s + ' ';
    Inc(i);
  end;
  result := s;
end;


procedure THTMLLevEditor.FormShow(Sender: TObject);
  function OpenWith: string;
  var
    params: string;
    i: Integer;
  begin
    params:='';
    if ParamCount>0 then
    for i := 1 to ParamCount do
    begin
      params := params + ParamStr(i);
      if i<>ParamCount then params := params + ' ';
    end;
    result:=params;
  end;

begin
  //mmofg.SetFocus;
  start_parametrs := openwith;
  if fileexists(start_parametrs) then
  begin
    //mmofg.Lines.LoadFromFile(start_parametrs);
    adres := start_parametrs;
    addtolist(adres)
  end;
end;


procedure THTMLLevEditor.NextFind(a: string = '');
var
  txt: string;
  Q_E: integer;
begin
  txt := mmofg.text;
  //if CurrentWordToFindInText = '' then
  if a <> '' then
    CurrentWordToFindInText := a
  else
  begin
    if mmofg.SelLength <> 0 then
      CurrentWordToFindInText := copy(txt, mmofg.SelStart + 1, mmofg.SelLength);
  end;
  if CurrentWordToFindInText <> '' then
  begin
    Q_E := mmofg.SelStart + mmofg.SelLength + 1;
    txt := copy(txt, mmofg.SelStart + mmofg.SelLength + 1, length(txt));
    if pos(CurrentWordToFindInText, txt) <> 0 then
    begin
      mmofg.SelStart := pos(CurrentWordToFindInText, txt) + Q_E - 2;
      mmofg.Sellength := length(CurrentWordToFindInText)
    end
    else
    begin
      Q_E := 0;
      txt := mmofg.text;
      if pos(CurrentWordToFindInText, txt) <> 0 then
      begin
        mmofg.SelStart := pos(CurrentWordToFindInText, txt) - 1;
        mmofg.Sellength := length(CurrentWordToFindInText)
      end
    end;
  end;
end;

procedure THTMLLevEditor.mmofgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i, k, s, l, Q_E: integer;
  p: TPoint;
  function AbsoluteCoordCursorFromMemo(memo: TSynEdit): TPoint;
  var
    Row: Integer;
    S: String;
    TxtWidth, TxtHeight:Integer;
  begin
    //Row := Memo.Perform(EM_LINEFROMCHAR, {-1}Memo.SelStart, 0);
    row := memo.CaretY;
    S := Memo.Lines.Strings[Row];

    TxtWidth := memo.Canvas.TextWidth(S);
    TxtHeight := memo.Canvas.TextHeight(S);

    result.x := txtwidth;
    result.y := txtheight * (row + 1)
  end;
begin

  //ShowMessage(AsString(mmofg.SelStart));

  if key = 123 then
    pgc2.ActivePageIndex := 1 - pgc2.ActivePageIndex;
  if key = 120 then
    btn6.Click;
  if key = 17 then
    HintMode := false;
  if (key = 16) and (mmofg.SelLength > 0) then
  begin
    key := 0;
    s := mmofg.SelStart;
    l := mmofg.SelLength;

    key := 0;
    k := mmofg.SelLength;
    for i := mmofg.Carety downto 0 do
    begin
      k := k - length(mmofg.Lines[i]);
      if k <= 0 then exit;
      mmofg.Lines[i] := '  ' + mmofg.Lines[i];
    end;

    mmofg.SelStart := s;
    mmofg.SelLength := l;
  end;
  if key = 114 then
    NextFind;
end;
procedure THTMLLevEditor.ins(const s: string; num: integer);
var
  s1, s2: string;
begin
  s1 := copy(mmofg.Text, 1, num+2);
  s2 := copy(mmofg.Text, num+3, length(mmofg.text));
  mmofg.text := s1 + s + s2;
end;

procedure THTMLLevEditor.mmofgKeyPress(Sender: TObject; var Key: Char);

  function pos: string;
  var
    I: integer;
    h: string;
  begin
    h := '';
    for i := 0 to mmofg.CaretY-1 do
      h := h + mmofg.Lines[i];
    h := h + copy(mmofg.Lines[mmofg.CaretY], 1, mmofg.CaretX);
    result := h
  end;

  function associate(const beg: string): string;
  const
    MAX = 9;
    KEYS: array [1..MAX] of String = ('html', 'body', 'head', 'script', 'table', 'td', 'tr', 'br', 'link');
  var
    i: integer;
  begin
    if beg = '' then
    begin
      ShowMessage('Ничего не написано (associate error 821)');
      exit;
    end;
    for i := 1 to MAX do
      if LowerCase(copy(keys[i], 1, length(beg))) = LowerCase(beg) then
      begin
        result := keys[i];
        exit;
      end;

    result := '';
  end;
  Function ExtractLastWord(k: char): String;
  var
    I: integer;
    s: string;
  begin
    s := mmofg.Lines[mmofg.carety];
    s := copy(s, 1, mmofg.caretx) + k;

    for i := length(s) downto 1 do
      if s[i] = '<' then
      begin
        result := copy(s, i+1, mmofg.caretx);
        exit;
      end;

    result := '';
  end;
  Function isSymbol(K: char): boolean;
  const
    RUS: array [1..33] of Char = ('а', 'б', 'в', 'г', 'д', 'е', 'ё',
                                  'ж', 'з', 'и', 'й', 'к', 'л', 'м',
                                  'н', 'о', 'п', 'р', 'с', 'т', 'у',
                                  'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ',
                                  'ы', 'ь', 'э', 'ю', 'я');

    ENG: array [1..26] of Char = ('a', 'b', 'c', 'd', 'e', 'f', 'g',
                                  'h', 'i', 'j', 'k', 'l', 'm', 'n',
                                  'o', 'p', 'q', 'r', 's', 't', 'u',
                                  'v', 'w', 'x', 'y', 'z');
  var
    i: integer;
  begin
    for i := 1 to 33 do
      if (LowerCase(k) = RUS[i]) then
      begin
        result := true;
        exit;
      end;
    for i := 1 to 26 do
      if LowerCase(k) = ENG[i] then
      begin
        result := true;
        exit;
      end;
    result := false;
  end;
  var
    f: boolean;
    df, p, gf: string;
    P1: TPoint;
begin

  if (isSymbol(key)) and (not comb([VK_CONTROL, VK_Z])) then
  begin
    setlength(return_adresses, high(return_adresses) + 1 + 1);
    return_adresses[high(return_adresses)] := mmofg.Text;
  end;
  f := HintMode;
  if key = '<' then
  begin
    //if Hint_pasted then key := #0;
  end;
  if (key = ' ') or (key = '>') or (key = #13#10) then
    HintMode := false;
  if f <> HintMode then exit;

  if not isSymbol(key) then
  begin
    HintMode := false;
    exit;
  end;
    (*
  If HintMode then
  begin
    gf := ExtractLastWord(key);
    df := associate(gf);
    if df = '' then exit;
    p := pos;
    ins(df, length(p));
    //ShowMessage(mmofg.Text);
    mmofg.SelStart := length(p) + 2 + length(gf);
    mmofg.SelLength := length(df);
    key := #0;
  end;       *)
end;

procedure THTMLLevEditor.Timer2Timer(Sender: TObject);
var
  I, x1, x2, k: integer;
  s: string;
begin
  if (mmofg.SelLength <> 0) and (comb([VK_CONTROL, 113])) then
  begin
    x1 := mmofg.SelStart;
    x2 := mmofg.SelLength;
    s := copy(mmofg.Text, x1 + 1, x2);
    if (not (trystrtoint('$' + s, k) and (length(s) = 6))) then
    begin
      wasselected := true;
      mmofg.SelStart := x1;
      mmofg.Sellength := x2;
    end
    else
    begin
      mmofg.Text := copy(mmofg.text, 1, x1) + getcolor(s) + copy(mmofg.text, x1+x2, length(mmofg.Text));
      mmofg.SelStart := 0;
      mmofg.Sellength := 0;
    end;
  end;

end;

function THTMLLevEditor.GetCode(url: string): string;
var
  mmo: TMemo;
begin
  Mmo := tmemo.Create(mmo);
  result := IdHTP1.Post(url, mmo.Lines);
end;

procedure THTMLLevEditor.mmofgMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Down := true;
  Canredrawall := false;
end;

procedure THTMLLevEditor.mmofgMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if down then
    if mmofg.SelLength <> 0 then Canredrawall := true;
end;



procedure THTMLLevEditor.DrawTheme(cl: Tcolor);
var
  i: integer;
begin
  self.color := cl;
  //pnl1.Color := cl;
  //pnl2.Color := cl;
  //pnl4.Color := cl;



  mmofg.Color := cl;


  pgc2.OwnerDraw := true;

  pgc2.Repaint;
end;

procedure THTMLLevEditor.Timer3Timer(Sender: TObject);
begin
  stat1.Panels.items[1].Text := tr('Line: ', 'Строка: ', 'Linea: ', 'Ligne: ') + IntToStr(mmofg.carety) + tr(' Pos: ', ' Позиция: ', ' Posizione: ', ' Position: ') + IntToStr(mmofg.caretx);
end;

procedure THTMLLevEditor.Timer4Timer(Sender: TObject);
const
  ENT = #13#10;
  function checkFortag: boolean;
  var
    i: integer;
  begin
    for i := 1 to ALL_TAGS do
      if tag_elem[i].edt.Focused then
      begin
        result := false;
        exit;
      end;
    result := true;
  end;
var
  i: integer;
  t: boolean;
begin
  if comb([120]) and active and (not comb([120, VK_SHIFT])) then
    btn6.Click;
  if comb([120, VK_SHIFT]) then
    B1.click;
  if comb([112]) and active then
    help;

  //if comb([9]) and active then if pgc2.ActivePage = ts5 then pgc2.ActivePage := ts1 else pgc2.ActivePage := ts5;
//  if (comb([38]) or comb([40])) and (active) and (pgc2.ActivePage = ts1) and checkFortag then
  //  tag_elem[1].edt.setfocus;
  if comb([VK_CONTROL, VK_S]) and (active) and (not comb([VK_CONTROL, VK_SHIFT, VK_S])) then
    save2.Click;
  if (comb([VK_CONTROL, VK_Z])) and (high(return_adresses) > -1) then
  begin
    mmofg.text := return_adresses[high(return_adresses)];
    setlength(return_adresses, high(return_adresses)-1 + 1);
  end;

end;

procedure THTMLLevEditor.Timer5Timer(Sender: TObject);
begin
  Enable_to_promote_to_other_pattenrs := false;
  timer5.Enabled := false;
  mode_pattern := 1;
end;




procedure start(s: string; i: integer);
var
  f: file;
begin
  if i = 1 then
  begin
    //w.load(s);
    //HTMLLevEditor.wb2.navigate(s);
    ShellExecute(0, 'open', PAnsiChar(GetPath + 'Execute.exe'), PAnsiChar('|' + s + '|' + inttostr(userform.Width) + '|' + inttostr(userform.height)), nil, SW_NORMAL);
    //ShellExecute(0, 'open', PAnsiChar(GetPath + 'Execute.exe'), PAnsiChar(s), nil, SW_NORMAL);
    //HTMLLevEditor.pgc2.ActivePageIndex := 3;
  end
  else if i = 2 then
    ShellExecute(0, 'open', 'chrome', PAnsiChar('"'+s+'"'), '', SW_SHOWNORMAL)
  else if i = 3 then
    ShellExecute(0, 'open', 'firefox', PAnsiChar('"'+s+'"'), '', SW_SHOWNORMAL)
  else if i = 4 then
    ShellExecute(0, 'open', 'IExplore', PAnsiChar('"'+s+'"'), '', SW_SHOWNORMAL)
end;

procedure THTMLLevEditor.Startfile1Click(Sender: TObject);
begin
  playfile(the_last_browser_used)
end;

procedure THTMLLevEditor.playfile(i: integer);
var
  pth: string;
  f: file;
begin
  the_last_browser_used := i;
  begin
    pth := ExtractFilePath(application.ExeName) + '~.html';

    if not fileExists(pth) then
    begin
      AssignFile(f, pth);
      Rewrite(f);
      closeFile(f);
    end;
    //mmofg.Lines.SaveToFile(pth);
    textsave(CompileDigFormatToHtml, pth);
    if i <> 1 then
      start(pth, the_last_browser_used)
    else
    begin
      PreCompile;
      TextSave(User_prj_ext + ConfessToWdFormat, GetPath + '__.jssprje');
      start(GetPath + '__.jssprje', the_last_browser_used)
    end;
  end;
end;



procedure THTMLLevEditor.Aboutprojects1Click(Sender: TObject);
begin
  form4.showmodal;
end;

procedure THTMLLevEditor.mmclick(sender: TObject);
begin
  insert(stringreplace((sender as TMenuItem).caption, '&', '', []));
end;

procedure THTMLLevEditor.tv1DblClick(Sender: TObject);
var
  f: integer;
  s: string;
begin
  if tv1.Selected = nil then
    exit;
  if tv1.Selected.Level = 0 then
    exit;
  if fileexists(adres) and ((text_from_file(adres)) <> (mmofg.text)) and Pchanged then
  begin
    f := ask_for_save;
    if f = 3 then
      exit;
  end;
  if fileexists('C:\users\' + getuser + '\documents\projects\' + tv1.Selected.Parent.Text + '\' + tv1.Selected.text) then
  begin
    adres := 'C:\users\' + getuser + '\documents\projects\' + tv1.Selected.Parent.Text + '\' + tv1.Selected.text;
    OpenProject(adres);
    center(userform, spnl63, [pHoriz, pVert]);
  end
  else
    tv1.Selected.Delete;
  Pchanged := false
end;


procedure THTMLLevEditor.tv1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 46) and (tv1.Selected <> nil) then tv1.Selected.Delete
end;

procedure THTMLLevEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  f: file;
  i, k: integer;
begin
  textsave(inttostr(form19.cbb1.ItemIndex), getpath + 'defg');
  assignFile(f, ExtractFilePath(application.ExeName) + 'set.opt');
  rewrite(f);
  closeFile(f);
  tv1.SaveToFile(ExtractFilePath(application.ExeName) + 'set.opt');
  if PChanged then
  begin
    k := is_save;
    if k = 1 then                       
      save2.Click;
    if k = 3 then
    begin
      action := canone;
    end;
  end;
  if fileexists(adres) then
    textsave(adres, getpath + 'pth');
end;

procedure THTMLLEVEDITOR.log(s: string; typ: TTyp = ttnormal);
var
  f, col: integer;
begin
  s := '[' + timetostr(time) + '] ' + s;
  f := length(m1.text);
  m1.Lines.Add(s);
  if typ = ttnormal then
    col := clBlack;
  if typ = tterror then
    col := clred;
  if typ = ttwarning then
    col := BlendColor(clred, clyellow, 128);
  if col = clblack then
    exit;
  m1.SelStart := f;
  m1.SelLength := length(s);
  m1.SelAttributes.Color := col;
end;

function THTMLLEVEDITOR.ask_for_save: integer;
var
  k: integer;
begin
  k := is_save;
  result := k;
  if k = 1 then
    save2.Click
end;

procedure THTMLLevEditor.Timer7Timer(Sender: TObject);
begin
  //if down_tag_edit then
    //Draw_css_obj;
end;

procedure THTMLLevEditor.Help1Click(Sender: TObject);
begin
  help
end;

procedure THTMLLevEditor.FormResize(Sender: TObject);
begin
  spnl3.Width := round(stbsht1.width / 1.2);
  spnl3.Height := round(stbsht1.height / 1.05);
  center(spnl3, stbsht1, [pHoriz, pVert]);
  spnl3.Top := 7;
  spnl56.Height := spnl2.Height - spnl17.Height + 400;
  spnl56.Width := spnl2.Width;
  spnl56.Top := spnl17.Height;
  spnl56.left := 0;
  spnl3.width := stbsht1.width;
  spnl3.height := stbsht1.height;
  spnl3.Top := 0;
  spnl3.left := 0;
  center(spnl48, spnl49, [pHoriz]);
  center(lbl38, spnl37, [pHoriz]);
  spnl38.left := clientwidth - spnl38.width;
  chrm1.Height := spnl37.Height - (spnl48.top + spnl48.height) - 50
  //recreatevis;
end;

procedure ActiveObjInsp;
begin
  with HTMLLevEditor do
  begin
    if ACTIVE_ELEMENT <> -1 then
    begin
      if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].NotDestroyed then
      begin
        edt11.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Color'];
        edt5.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Left'];
        edt4.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Top'];
        edt10.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Font'];
        edt3.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Width'];
        edt2.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Height'];
        edt9.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Border-radius'];
        edt8.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Border'];
        edt6.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Font-size'];
        edt7.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Box-shadow'];
        edt12.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Outline'];
        edt13.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Caption'];
        edt22.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnClick'];
        //ShowmEssage(edt14.Text);
        edt21.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnDblClick'];
        edt15.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Background'];
        edt20.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnChange'];
        edt19.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnFocus'];
        edt18.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnSelect'];
        edt17.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnMouseDown'];
        edt16.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnMouseMove'];
        edt14.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnMouseUp'];
        edt23.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Href'];
        edt24.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Src'];
        edt27.text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Class'];
        //spnl5.Caption := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Tag'] + ' #' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Id']
      end
    end
    else
    begin
      edt11.Text := '';
      edt5.Text := '';
      edt4.Text := '';
      edt10.Text := '';
      edt3.Text := '';
      edt2.Text := '';
      edt9.Text := '';
      edt8.Text := '';
      edt6.Text := '';
      edt7.Text := '';
      edt12.Text := '';
      //spnl5.Caption := ;
      edt13.Text := '';
      edt14.Text := '';
      edt15.Text := '';
      edt16.Text := '';
      edt17.Text := '';
      edt18.Text := '';
      edt19.Text := '';
      edt20.Text := '';
      edt21.Text := '';
      edt22.Text := '';
      edt23.Text := '';
      edt24.Text := '';
      edt27.text := '';
    end;
  end;
end;

procedure THTMLLevEditor.btn24Click(Sender: TObject);
begin
  Active_Element := -1;
  if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag <> (sender as TsSpeedButton).hint then
  begin
    CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag := (sender as TsSpeedButton).hint;
  end
  else
    if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag = (sender as TsSpeedButton).hint then
      CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag := '';
  log(tr('Tag: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag, 'Тег: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag, 'Etichetta: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag, 'Marque: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag))
end;

procedure THTMLLevEditor.spnl3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i: integer;
  w: word;
  function NoInRect: integer;
  var
    i: integer;
  begin
    result := -1;
    for i := 0 to high(VisS_S[ACTIVE_PAGE]) do
      if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[i].NotDestroyed then
        if (x >= VISS_S[ACTIVE_PAGE][i].left) and (y >= VISS_S[ACTIVE_PAGE][i].top) and (x <= VISS_S[ACTIVE_PAGE][i].left + VISS_S[ACTIVE_PAGE][i].width) and (y <= VISS_S[ACTIVE_PAGE][i].top + VISS_S[ACTIVE_PAGE][i].height) then
        begin
          result := i;
          exit;
        end;
  end;
var
  kkk: integer;
begin
  if ACTIVE_PAGE = -1 then
    exit;
  w := 13;
  //if (ACTIVE_ELEMENT_IS <> aeChWidth) and (ACTIVE_ELEMENT_IS <> aeChheight) then
    //self.edt2KeyDown(nil, w, []);
  //RecreateVis;               dfg
  //RectAllProjectItmesOnField;f''
  for i := 0 to high(Viss_s[ACTIVE_PAGE]) do
    if Viss_s[ACTIVE_PAGE][i] <> nil then
      if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[i].NotDestroyed then
      begin
        if range((VisS_S[ACTIVE_PAGE][i].Left + VisS_S[ACTIVE_PAGE][i].width), x, 6) and (viss_s[ACTIVE_PAGE][i].top <= y) and (viss_s[ACTIVE_PAGE][i].top + viss_s[ACTIVE_PAGE][i].Height >= y) then
        begin
          ACTIVE_ELEMENT_IS := aeChWidth;
          PChanged := true;
          exit;
        end;
        if range((VisS_S[ACTIVE_PAGE][i].top + VisS_S[ACTIVE_PAGE][i].height), y, 6) and (viss_s[ACTIVE_PAGE][i].left <= x) and (viss_s[ACTIVE_PAGE][i].left + viss_s[ACTIVE_PAGE][i].width >= x) then
        begin
          ACTIVE_ELEMENT_IS := aeChHeight;
          PChanged := true;
          exit;
        end;
      end;
  kkk := NoInRect;
  if (ACTIVE_ELEMENT <> -1) and (kkk = -1) then
  begin
    PChanged := true;
    edt2keydown(nil, w, []);
    ACTIVE_ELEMENT := -1;
    RectAllProjectItmesOnField();
    //recreatevis;
    ActiveObjInsp;
    exit;
  end
  else
    if kkk <> -1 then
      if ACTIVE_ELEMENT_IS = aeNo then
      begin
        ACTIVE_ELEMENT := kkk;
        ACTIVE_ELEMENT_POS.X := x - VisS_S[ACTIVE_PAGE][kkk].left;
        ACTIVE_ELEMENT_POS.Y := y - VisS_S[ACTIVE_PAGE][kkk].top;
        CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag := '';
        RectAllProjectItmesOnField;
        ActiveObjInsp;
      end;

  if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag = '' then
    exit;
  PChanged := true;
  InitNewObj(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag, x div CURRENT_PROJECT.CellWidth * CURRENT_PROJECT.CellWidth - 50, y div CURRENT_PROJECT.CellWidth * CURRENT_PROJECT.CellWidth - 20, 100, 100);
  ACTIVE_ELEMENT := high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects);
  if fileexists(getpath + 'offset\' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag + '.dop') then
    CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[ACTIVE_ELEMENT].Properties.LoadFromFile(getpath + 'offset\' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag + '.dop');
  ActiveObjInsp;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag := '';
  RecreateVis(ACTIVE_ELEMENT);
//  RectAllProjectItmesOnField
end;

procedure THTMLLevEditor.FormActivate(Sender: TObject);
var
  a: string;
  fls: TStringList;
  i, j, x: integer;
  p: TPoint;
begin
  if ProjectCreated then
    if instruction then
    begin
      p := btn24.ClientToScreen(
        coordfrompoint(
          btn24.width div 2, btn24.height div 2
        )
      );
      SlowCursorMove(curpos.x, curpos.y, p.x, p.y, 4);
      mouseclick(curpos.x, curpos.y);
      p := spnl3.ClientToScreen(
        coordfrompoint(
          spnl3.width div 2, spnl3.height div 2
        )
      );
      slowcursormove(curpos.x, curpos.Y, p.x, p.Y, 4);
      mouseclick(curpos.x, curpos.y);
      sleep(1000);
      application.ProcessMessages;
      mouseclick(curpos.x, curpos.y);
      sleep(50);
      mouseclick(curpos.x, curpos.y);
      application.ProcessMessages;
      //imitword('ALERT72HI, world!")');
      insert('alert("Hello, world!");');
      application.ProcessMessages;
      p := btn6.ClientToScreen(
        coordfrompoint(
          btn6.width div 2, btn6.height div 2
        )
      );
      slowcursormove(curpos.x, curpos.Y, p.x, p.Y, 4);
      application.ProcessMessages;
      sleep(200);
      mouseclick(curpos.x, curpos.y);
      instruction := false;
    end;
  if Inited then
    exit;
  spnl37.Align := alclient;
  pgc2.Align := alclient;
  TvLoadFromtext(tv1, mcf_getfilesfrom('C:\users\' + getuser + '\documents\projects', '>', 0, true, '.jssprj'), '>');
  //tv4.FullExpand;
  if fileexists(getpath + 'defg') then
  begin
    form19.cbb1.itemindex := strtoint(textopen(getpath + 'defg'));

    form19.cbb1Change(nil)
  end;
  fls := TStringList.Create;
  fls.text := getfilesfrom(getpath + 'offset');
  DefProps.DefaultPropsW := dict.setArray;
  DefProps.DefaultPropsH := dict.setArray;
  CURRENT_PROJECT.CellWidth := CURRENT_PROJECT_DEFAULT_CELL_WIDTH;
  for i := 0 to fls.Count - 1 do
    if fileexists(fls[i]) then
    begin
      Try
        DefProps.DefaultPropsW[LowerCase(ExtractFileTitle(fls[i]))] := AsInteger(GetValPx(ExtractDicPropertyFrom(fls[i], 'Width', COMPONENT_WIDTH)));
        DefProps.DefaultPropsH[LowerCase(ExtractFileTitle(fls[i]))] := AsInteger(GetValPx(ExtractDicPropertyFrom(fls[i], 'Height', COMPONENT_HEIGHT)));
      except
        RaiseError('Offset loading error. Try to delete file "' + fls[i] + '" and restart studio.');
      end;
    end;
  edt13.width := spnl18.width div 2;
  edt11.width := spnl18.width div 2;
  edt5.width := spnl18.width div 2;
  edt4.width := spnl18.width div 2;
  edt10.width := spnl18.width div 2;
  edt3.width := spnl18.width div 2;
  edt2.width := spnl18.width div 2;
  edt9.width := spnl18.width div 2;
  edt8.width := spnl18.width div 2;
  edt6.width := spnl18.width div 2;
  edt7.width := spnl18.width div 2;
  edt12.width := spnl18.width div 2;

  edt14.width := spnl18.width div 2;
  edt15.width := spnl18.width div 2;

  edt16.width := spnl18.width div 2;
  edt17.width := spnl18.width div 2;
  edt18.width := spnl18.width div 2;
  edt19.width := spnl18.width div 2;
  edt20.width := spnl18.width div 2;
  edt21.width := spnl18.width div 2;
  edt22.width := spnl18.width div 2;
  edt23.width := spnl18.width div 2;
  edt24.width := spnl18.width div 2;
  edt27.width := spnl18.width div 2;
  Inited := true;
  ExToolWindows.ListOfTask := true;
  ExToolWindows.ListOfObjects := false;
  ExToolWindows.ObjectInspector := false;
  ExToolWindows.StructureView := false;
  ExToolWindows.ListObjects := true;
  ExToolWindows.ListLayout := true;
  ExToolWindows.ListLinks := true;
  ExToolWindows.ListUnvisualObjects := true;
  ExToolWindows.SourceList := true;
  ExToolWindows.listheaders := true;
  btn28.click;

  btn1.click;
  lbl38.caption := Project_name;
  formresize(nil);
  if UserForm = nil then
  begin
    UserForm := TForm.create(SPNL3);
    userform.Parent := spnl63;
    //userform.Parent := nil;
    //userform.FormStyle := fsStayOnTop;
    //userform.Align := ;
    //userform.Left := 0;
    //userform.top := 0;
    userform.width := spnl63.width div 2;
    userform.height := round(spnl63.height / 1.5);
    sizeblocked := true;
    center(userform, spnl63, [pHoriz, pVert]);
    if userform.top < 0 then
      userform.top := 0;
    userform.OnClose := UserFormOnCloseAttemp;
    userform.OnCanResize := OnTryToResizeUserFormAction;
    userform.BorderIcons := [biSystemMenu];
    userform.VertScrollBar.Visible := false;
    userform.HorzScrollBar.Visible := false;
    userform.Show;
    UserPanel := TPanel.create(UserForm);
    UserPanel.Parent := UserFOrm;
    UserPanel.Align := alclient;
    UserPanel.color := clwhite;
    
    UserImageBack := TImage.create(UserPanel);
    UserImageBack.Parent := UserPanel;
    UserImageBack.Align := alClient;
    UserImageBack.SendToBack;
    MakeBitmap(UserImageBack);
    UserImageBack.Picture.Bitmap.PixelFormat := pf24bit;
    qpMainUserImageFront := TQuickPixels.create;
    qpMainUserImageFront.Attach(UserImageBack.Picture.Bitmap);
    UserImageBack.OnMouseDown := spnl3MouseDown;
    UserImageBack.OnMouseUp := spnl3MouseUp;
    UserImageBack.OnMouseMove := spnl3MouseMove;
    UserImageBack.OnDblClick := spnl3DblClick;
  end;
  recreatevis;(*
    if fileexists(getpath + 'pth') then
    begin
      a := copy(textopen(getpath + 'pth'), 1, length(textopen(getpath + 'pth')) - 2);
      if fileexists(a) then
        openproject(a)
    end
    else
      //ACTIVE_PAGE := NewWindow;
      form17.showmodal;  *)
  //Center(userform, spnl3, [pHoriz, pVert]);
  sizeblocked := false;
  PChanged := false;
  TranslateAll(plRu);
  //LoadExplorer(tv5, nil, 'C:\', [], 2);
  fls := TStringList.Create;
  fls.text := getdrives;
  for i := 0 to fls.Count - 1 do
    LoadExplorer(tv5, tv5.Items.Add(nil, fls[i] + ':\'), fls[i] + ':\', ['.jssprj'], 2);
  //for i := 0 to tv5.Items.Count - 1 do
    //sLoadExplorer(tv5, tv5.Items.Item[i], tv5.Items.Item[i].text, [], 2);
  fls.Free;
  x := 0;
  for i := 0 to application.ComponentCount - 1 do
    if application.Components[i] is TForm then
      x := x + (application.Components[i] as TForm).ComponentCount;
  log(inttostr(x) + ' loaded');
  exit;
  for i := 0 to self.ComponentCount - 1 do
    if components[i] is TsPanel then
      (components[i] as TsPanel).BevelOuter := bvLowered;
end;

procedure THTMLLevEditor.tmr1Timer(Sender: TObject);
var
  i: integer;
  p: TPoint;
  sh: boolean;
  l, t: Integer;
  MS: string;
  wasACT: integer;
const
  MoveQY = 200;
begin
  if ACTIVE_PAGE = -1 then
    exit;
  Btn47.Enabled := processexists(ExtractFilePath(adres) + CURRENT_PROJECT.ExeName + '.exe');
  btn6.Enabled := not btn47.Enabled;
  btn10.Enabled := not btn47.Enabled;
  btn36.Enabled := not btn47.Enabled;
  btn35.Enabled := not btn47.Enabled;
  btn56.Enabled := btn47.Enabled;
  btn55.Enabled := not btn47.Enabled;
  btn57.Enabled := not btn47.Enabled;
  if adres <> '' then
  begin
    ms := GenCaption + ' [' + ExtractfileCaption(adres) + ']';
    if processexists(extractfilepath(adres) + CURRENT_PROJECT.ExeName + '.exe') then
      ms := ms + '[' + tr('Running', 'Запущено', 'Funzionante', 'Fonctionnement') + ']';
    if pchanged then
      ms := ms + '*';
    if caption <> ms then
      caption := ms;
    application.Title := tr('Project: ', 'Проект: ', 'Progetto: ', 'Projet: ') + ExtractFileTitle((adres));
    userform.Caption := (ExtractFileTitle(adres));
  end
  else
  begin
    caption := GenCaption;
    userform.Caption := '';
  end;
  if not active then
    exit;
  //if spnl24.Caption <> '    ' + adres then
    //spnl24.Caption := '    ' + adres;
  if userform = nil then
    exit;
  if ObjInspBlocked then
    exit;

  spnl36.width := userform.width;
  spnl36.left := userform.Left;
  spnl36.Top := userform.top + userform.Height;
  if userform.Top < 0 then
    userform.Top := 0;
  GetCursorPos(p);
  if (p.x - left - spnl2.left >= spnl4.left) and ((p.y - top - spnl2.top >= spnl4.top)) and (p.x - left - spnl2.left <= spnl4.left + spnl4.width) and ((p.y - top - spnl2.top <= spnl4.top + spnl4.Height)) then
    exit;
  sh := comb([1]);
  //if ACTIVE_ELEMENT = -1 then
  if comb([46, VK_CONTROL]) then
    if active_element <> -1 then
      if active then
        if not ObjInspIsActive then
          btn39.Click;
  pgcspgcntrl2.visible := ACTIVE_ELEMENT <> -1;
  if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag <> '' then
  begin
    GetCursorPos(p);
    p.x := p.x - spnl2.left - left - spnl3.Left - userform.left - 25;
    p.y := p.y - spnl2.Top - top - spnl3.top - userform.top - 60;
  end;
  if (GetAsyncKeyState(1) = 0) and ((ACTIVE_ELEMENT_IS = aeChWidth) or (ACTIVE_ELEMENT_IS = aeChHeight)) then
    ACTIVE_ELEMENT_IS := aeNo;
  if active then
    if (pgc2.ActivePageIndex = 0) and (pgcspgcntrl1.ActivePageIndex = 0) then
      if (ACTIVE_ELEMENT_IS <> aeChWidth) and (ACTIVE_ELEMENT_IS <> aeChHeight) then
        if GetAsyncKeySTate(1) <> 0 then
          ACTIVE_ELEMENT_IS := aeMoving
        else
        begin
          ACTIVE_ELEMENT_IS := aeNo;
          if ACTIVE_ELEMENT <> -1 then
            //RectAllProjectItmesOnField(ACTIVE_ELEMENT);
            RectAllProjectItmesOnField();
        end;
  
  if active and (pgcspgcntrl1.ActivePageIndex = 0) and (pgc2.ActivePageIndex = 0) then
  begin
    if comb([VK_CONTROL, VK_C]) then
      Buffer := Active_element;
    if comb([VK_CONTROL, VK_V]) then
      Paste;
  end;
  (*
    else
      if visS_S[ACTIVE_ELEMENT] <> nil then
      visS_S[ACTIVE_ELEMENT].Cursor := crDefault;*)
  //spnl47.Visible := ACTIVE_ELEMENT <> -1
  btn37.Enabled := ACTIVE_ELEMENT <> -1;
  btn38.Enabled := ACTIVE_ELEMENT <> -1;
  btn39.Enabled := ACTIVE_ELEMENT <> -1;
  btn87.Enabled := ACTIVE_ELEMENT <> -1;
  btn88.Enabled := ACTIVE_ELEMENT <> -1;
  btn89.Enabled := ACTIVE_ELEMENT <> -1;
  spnl4.Enabled := (pgc2.ActivePageIndex = 0) and (stbcntrl1.TabIndex > 0) and (ACTIVE_ELEMENT <> -1)
end;

procedure THTMLLevEditor.edt2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key <> 13 then
    exit;
  if ACTIVE_ELEMENT = -1 then exit;
  if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].NotDestroyed = false then
    exit;
  PChanged := true;
  if length((edt3.text)) < 3 then
    edt3.Text := inttostr(COMPONENT_WIDTH) + 'px';
  if length((edt2.text)) < 3 then
    edt2.Text := inttostr(COMPONENT_HEIGHT) + 'px';
  if not correct_value((edt5.text)) then
    edt5.Text := '0';
  if not correct_value((edt4.text)) then
    edt4.Text := '0';
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Color'] := edt11.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Left'] := edt5.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Top'] := edt4.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Font'] := edt10.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Width'] := edt3.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Height'] := edt2.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Border-radius'] := edt9.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Border'] := edt8.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Font-size'] := edt6.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Box-shadow'] := edt7.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Outline'] := edt12.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Caption'] := edt13.Text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnClick'] := edt22.text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnDblClick'] := edt21.text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnChange'] := edt20.text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnFocus'] := edt19.text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnSelect'] := edt18.text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnMouseDown'] := edt17.text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnMouseMove'] := edt16.text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['OnMouseUp'] := edt14.text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Background'] := edt15.text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Href'] := edt23.text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Src'] := edt24.text;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Class'] := edt27.text;
  RecreateVis(ACTIVE_ELEMENT);
  Active_Element := -1;
  ActiveObjInsp
end;

function LoadAllLibs: string;
var
  i: integer;
  files: TStringList;
begin
  files := TStringList.create;
  files.text := GetFilesFrom(getpath + 'LaM');
  result := '';
  for i := 0 to files.Count - 1 do
    if fileexists(files[i]) then
      result := result + textopen(files[i]) + #13#10; 
  files.free;
end;

function CompileDigFormatToHtml(Num: integer = -1): string;
var
  i: integer;
  Objects: array of dict;
  Document: string;
  lng, lnb: string;
begin
  if num = -1 then
    num := active_page;
  if CURRENT_PROJECT.Language = lljs then
  begin
    lng := '';
    lnb := '';
  end
  else
  begin
    lng := ' onload="brython({debug:1, cache:' + chr(39) + 'none' + chr(39) + '})"';
    lnb := '<script type="text/javascript" src="brython.info/src/brython.js"></script>';
  end;
  Document := '<html ' + CURRENT_PROJECT.HConstructor[num].HtmlPaste + '><head ' + CURRENT_PROJECT.HConstructor[num].HeadPaste + '></head><body' + lng + ' ' + CURRENT_PROJECT.HConstructor[num].BodyPaste + '>' + #13#10 + lnb;
  Document := Document + '<style>' + #13#10 + TextOpen(GetUA + 'Classes.css') + #13#10 + '</style><script>' + LoadAllLibs + '</script>';
  setlength(Objects, length(CURRENT_PROJECT.HConstructor[num].Objects));
  for i := 0 to high(Objects) do
  begin
    if CURRENT_PROJECT.HConstructor[num].objects[i].NotDestroyed then
    begin
      Objects[i] := dict.glue([CURRENT_PROJECT.HConstructor[num].Objects[i].Properties]);
      if AsString(Objects[i]['Left'])[length(Objects[i]['Left'])] <> 'x' then
      begin
        Objects[i]['Left'] := AsString(Objects[i]['Left']) + 'px';
        Objects[i]['Top'] := AsString(Objects[i]['Top']) + 'px';
      end;
      //Objects[i]['Left'] := inttostr(round(VisS_S[num][i].Left / HTMLLevEditor.spnl3.width * 100)) + '%';
      //Objects[i]['Top'] := inttostr(round(VisS_S[num][i].top / HTMLLevEditor.spnl3.height * 100)) + '%';
      Document := Document + HTML_DICT_TO_TAG(Objects[i], true);
      if EndTag(Objects[i]['Tag']) then
        Document := Document + Objects[i]['Caption'] + '</' + Objects[i]['Tag'] + '>';
      Document := Document + #13#10;
      Objects[i].free;
    end;
  end;
  if CURRENT_PROJECT.Language = llJs then
    lng := ''
  else
    lng := ' type="text/python"';
  Document := Document + '<script src="https://code.jquery.com/jquery-1.12.0.min.js"' + lng + '></script>' + #13#10 + '<script>' + #13#10 + CURRENT_PROJECT.HConstructor[num].Code + #13#10 + '</script>';
  Document := Document + #13#10 + '</body></html>';
  result := Document
end;

procedure THTMLLevEditor.edt14DblClick(Sender: TObject);
var
  p: TPoint;
  s: string;
  edt14: TsEdit;
  poi: TPoint;
  res: string;
  event, params: string;
  func: string;
begin
  //if ACTIVE_ELEMENT = -1 then
    //exit;
  if not CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].NotDestroyed then
    exit;
  Edt14 := (sender as TsEdit);
  res := edt14.Hint;
  event := copy(res, 1, pos('|', res) - 1);
  params := copy(res, pos('|', res) + 1, length(res));
  func := edt14.text;
  if edt14.text = '' then
  begin
    s := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Tag'] + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Id'] + event + '(' + params + ')';
    func := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Tag'] + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Id'] + event + '(sender)';
    edt14.text := s;
  end;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties[event] := edt14.text;
  pgc2.ActivePageIndex := 1;
  mmofg.SetFocus;
  if pos('function ' + StringReplace(edt14.text, 'this', 'sender', [rfReplaceAll]), mmofg.text) = 0 then
  begin
    Mmofg.Text := Mmofg.Text + #13#10 + '  function ' + func + '{' + #13#10 + '    ' + #13#10 + '  }';
    poi.x := 5;
    poi.y := mmofg.Lines.Count - 1;
    mmofg.Caretx := poi.x;
    mmofg.CaretY := poi.y;
  end
  else
  begin
    mmofg.SelStart := pos('function ' + edt14.text, mmofg.text) + length('function ' + edt14.text) + 6;
    //poi.x := pos('function ' + edt14.text, mmofg.text)
  end;
end;

procedure THTMLLevEditor.edt14MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  ObjInspBlocked := true
end;

procedure THTMLLevEditor.edt14MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ObjInspBlocked := false
end;

function ObjToDigFormat: string;
var
  i, j: integer;
begin
  result := '';
  for i := 0 to high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects) do
  begin
    if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].NotDestroyed then
    begin
      CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].Properties.resetlenebilir;
      for j := 1 to CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].Properties.count do
      begin
        result := result + AsString(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].Properties.ActiveElement.key) + #13#10 + AsString(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].Properties.ActiveElement.value) + #13#10;
        CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[i].Properties.go();
      end;
      result := result + #13#10 + '****' + #13#10;
    end;
  end;
end;


function ConfessToWdFormat: string;
begin
  result := MoveChrCode(inttostr(UserFOrm.width) + #13#10 + inttostr(UserFOrm.height) + #13#10 + ObjToDigFormat + #13#10 + '******' + #13#10 + HTMLLevEditor.mmofg.Text, 1)
end;


procedure THTMLLevEditor.Open1Click(Sender: TObject);
var
  i: integer;
begin
  if open.Execute then
  begin
    OpenProject(open.FileName)
  end;
end;

procedure THTMLLevEditor.UserFormOnCloseAttemp(Sender: TObject; var Action: TCloseAction);
begin
  action := caNone;
end;

procedure THTMLLevEditor.btn1Click(Sender: TObject);
begin
  inv(ExToolWindows.StructureView);
  if ExToolWindows.StructureView then
    spnl33.width := 225
  else
    spnl33.width := btn1.Width;
  tv2.Visible := ExToolWindows.StructureView
end;

procedure THTMLLevEditor.btn4Click(Sender: TObject);
begin
  open1.click
end;

procedure THTMLLevEditor.btn5Click(Sender: TObject);
begin
  Save2.click;
end;

procedure THTMLLevEditor.Fff(Sender: TObject);
begin
  recreatevis;
end;

procedure THTMLLevEditor.C3Click(Sender: TObject);
begin
  PreCompile;
end;

procedure THTMLLevEditor.OnTryToResizeUserFormAction(Sender: TObject; var NewWidth, NewHeight: integer; var resize: boolean);
var
  i: integer;
begin
  if (qpMainUserImageFront = nil) or (userimageback = nil) then
    exit;
  if SizeBlocked then
    exit; 
  PChanged := true;
  for i := 0 to high(VisS_S[ACTIVE_PAGE]) do
    if VisS_S[ACTIVE_PAGE][i] <> nil then
      if ((VisS_S[ACTIVE_PAGE][i].left + VisS_S[ACTIVE_PAGE][i].width >= UserForm.clientwidth) and (NewWidth < UserForm.width)) or ((VisS_S[ACTIVE_PAGE][i].top + VisS_S[ACTIVE_PAGE][i].height >= UserForm.clientheight) and (NewHeight < UserForm.height)) then
      begin
        resize := false;
        if ((VisS_S[ACTIVE_PAGE][i].left + VisS_S[ACTIVE_PAGE][i].width >= UserForm.clientwidth) and (NewWidth < UserForm.width)) then
          NewWidth := VisS_S[ACTIVE_PAGE][i].left + VisS_S[ACTIVE_PAGE][i].width + 1
        else
          NewHeight := VisS_S[ACTIVE_PAGE][i].top + VisS_S[ACTIVE_PAGE][i].height + 1;
        CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].width := NewWidth;
        CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].height := NewHeight;
        exit;
      end;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].width := NewWidth;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].height := NewHeight;
  MakeBitmap(userimageback);
  qpMainUserImageFront.Attach(userimageback.Picture.Bitmap);
  DoThePointNetOnTheUserImageBackPictureCanvasBitmap;
end;

procedure THTMLLevEditor.spnl3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ((ACTIVE_ELEMENT_IS = aeChWidth) or (ACTIVE_ELEMENT_IS = aeChHeight) or (ACTIVE_ELEMENT_IS = aeMoving)) and (ACTIVE_ELEMENT <> -1) then
  begin
    recreatevis(ACTIVE_ELEMENT);
    //RectAllProjectItmesOnField();
    ACTIVE_ELEMENT_IS := aeNo;
  end;
end;

procedure THTMLLevEditor.spnl3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
  l, t: integer;
begin
  if ACTIVE_PAGE = -1 then
    exit;
  if (ACTIVE_ELEMENT <> -1) then
    if ACTIVE_ELEMENT_IS = aeMoving  then
    begin
      if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[ACTIVE_ELEMENT].NotDestroyed then
      begin
        p.x := x;
        p.y := y;
        l := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[ACTIVE_ELEMENT].properties['Left'] div CURRENT_PROJECT.CellWidth * CURRENT_PROJECT.CellWidth;
        t := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[ACTIVE_ELEMENT].properties['Top'] div CURRENT_PROJECT.CellWidth * CURRENT_PROJECT.CellWidth;
        p.x := (p.x - ACTIVE_ELEMENT_POS.X) div CURRENT_PROJECT.CellWidth * CURRENT_PROJECT.CellWidth;
        p.y := (p.Y - ACTIVE_ELEMENT_POS.Y) div CURRENT_PROJECT.CellWidth * CURRENT_PROJECT.CellWidth;
        PChanged := true;
        if l <> p.x then
        begin
          CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[ACTIVE_ELEMENT].properties['Left'] := NoLess(NoMore(p.x, userform.clientwidth - VisS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].width, userform.clientwidth - VisS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].width - 1), 0, 0);
        end;
        if t <> p.y then
        begin
          CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[ACTIVE_ELEMENT].properties['Top'] := NoLess(NoMore(p.y, userform.clientheight - VisS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].height, userform.clientheight - VisS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].height - 1), 0, 0);
        end;
        if (t <> p.y) or (l <> p.x) then
        begin
          //recreatevis(ACTIVE_ELEMENT);
          VIsS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].left := AsInteger(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[ACTIVE_ELEMENT].properties['Left']);// + QUATIENT_MOVE_X;
          VIsS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].top := AsInteger(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[ACTIVE_ELEMENT].properties['Top']);// + QUATIENT_MOVE_Y;
          //clearCan
          RectAllProjectItmesOnField();
          ActiveObjInsp;
        end;
      end;
    end;
  if (ACTIVE_ELEMENT_IS = aeNo) and (CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag <> '') then
  begin
    canvas_clear(userimageback.Picture.Bitmap.Canvas, userimageback.Picture.Bitmap.width, userimageback.Picture.Bitmap.Height);
    DoThePointNetOnTheUserImageBackPictureCanvasBitmap;
    RectAllProjectItmesOnField;
    userimageback.Picture.Bitmap.Canvas.Pen.color := clblack;
    x := ((x - COMPONENT_POS_X - QUATIENT_MOVE_X) div CURRENT_PROJECT.CellWidth + 0) * CURRENT_PROJECT.CellWidth + QUATIENT_MOVE_X;
    y := ((y - COMPONENT_POS_Y - QUATIENT_MOVE_Y) div CURRENT_PROJECT.CellWidth + 0) * CURRENT_PROJECT.CellWidth + QUATIENT_MOVE_Y;
    userimageback.Picture.Bitmap.Canvas.Rectangle(x,
                                                  y,
                                                  x + AsInteger(IfEmpty(DefProps.DefaultPropsW[LowerCase(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag)], COMPONENT_WIDTH)) + QUATIENT_MOVE_X,
                                                  y + AsInteger(IfEmpty(DefProps.DefaultPropsH[LowerCase(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag)], COMPONENT_HEIGHT)) + QUATIENT_MOVE_Y + 2);
    exit;
  end;
  if ACTIVE_ELEMENT = -1 then
    exit;
  if VisS_S[ACTIVE_PAGE][ACTIVE_ELEMENT] = nil then
    exit;
  if (ACTIVE_ELEMENT_IS = aeChWidth) or (ACTIVE_ELEMENT_IS = aeChHeight) then
  begin
    if ACTIVE_ELEMENT_IS = aeChWidth then
    begin
      CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[ACTIVE_ELEMENT].Properties['Width'] := inttostr((x - VisS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].left) div CURRENT_PROJECT.CellWidth * CURRENT_PROJECT.CellWidth - QUATIENT_MOVE_X) + 'px';
      VisS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].width := (x - VisS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].left) div CURRENT_PROJECT.CellWidth * CURRENT_PROJECT.CellWidth;;
    end
    else
    begin
      CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[ACTIVE_ELEMENT].Properties['Height'] := inttostr((y - VisS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].top) div CURRENT_PROJECT.CellWidth * CURRENT_PROJECT.CellWidth - QUATIENT_MOVE_Y) + 'px';
      VisS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].Height := (y - VisS_S[ACTIVE_PAGE][ACTIVE_ELEMENT].Top) div CURRENT_PROJECT.CellWidth * CURRENT_PROJECT.CellWidth;
    end;
    ActiveObjInsp;
    PChanged := true;
    DoThePointNetOnTheUserImageBackPictureCanvasBitmap;
    //UserImageBack.Picture.Bitmap.Canvas.Rectangle(VisS_S[ACTIVE_ELEMENT].left - 2, VisS_S[ACTIVE_ELEMENT].top - 2, VisS_S[ACTIVE_ELEMENT].left + VisS_S[ACTIVE_ELEMENT].width, VisS_S[ACTIVE_ELEMENT].top + VisS_S[ACTIVE_ELEMENT].height);
    RectAllProjectItmesOnField();
    //recreatevis(ACTIVE_ELEMENT)
  end;
end;

procedure THTMLLevEditor.tv2DblClick(Sender: TObject);
begin
  if tv2.Selected <> nil then
    if tv2.Selected.AbsoluteIndex > 1 then
    begin
      ACTIVE_ELEMENT := strtoint(copy(tv2.Selected.text, pos('#', tv2.Selected.text) + 1, length(tv2.Selected.text)));
      userimageback.Picture.Bitmap.Canvas.Rectangle(viss_s[ACTIVE_PAGE][ACTIVE_ELEMENT].Left - 2, viss_s[ACTIVE_PAGE][ACTIVE_ELEMENT].top - 2, viss_s[ACTIVE_PAGE][ACTIVE_ELEMENT].Left + viss_s[ACTIVE_PAGE][ACTIVE_ELEMENT].width, viss_s[ACTIVE_PAGE][ACTIVE_ELEMENT].top + viss_s[ACTIVE_PAGE][ACTIVE_ELEMENT].height);
    end;
end;

procedure Compile(adres: string; iconadres: string = '');
var
  s: string;
  cap: string;
  f: textfile;
  pth: string;
  i: integer;
  ICO: string;
  documents: array of string;
  kt_: string;
const
  lst: array [0..3] of integer = (256, 128, 64, 16);
begin
  form14.pb1.Progress := 0;
  form14.show;
  try
    cap := (ExtractFileTitle(adres));
    pth := ExtractFilePath(stdDelimiter(adres)) + cap;
  
    copyfile(PAnsiChar(GetPath + 'Comiler.exe'), PAnsiChar(pth + '.exe'), false);
    form14.pb1.Progress := 30;
    //if IconPath[16] <> '' then
      //ChangeIcon(pth + '.exe', IconPath[16], 'MAINICON', 16);
    if iconadres = '' then
    begin
      for i := 0 to 3 do//iconpath.count do
      begin
        ICO := CURRENT_PROJECT.Icon;
        if ICO <> '' then
        begin
          //ChangeIcon(pth + '.exe', ICO, 'MAINICON', AsInteger(IconPath.activeelement.key));
          textsave('[FILENAMES]' + #13#10 +
                    'Exe="' + pth + '.exe"' + #13#10 +
                    'SaveAs="' + pth + '.exe"' + #13#10 +
                    '[COMMANDS]' + #13#10 +
                    '-addoverwrite "' + ICO + '", ICONGROUP,MAINICON,0', getpath + 'tempic.ini');
          cmd('"' + GetPath + 'RHS\ResourceHacker.exe" -script "' + getpath + 'tempic.ini"');
          //cmd('cd ');
          //cmd('"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -script "' + getpath + 'tempic.ini"');
          break;
        end;
      end;
      form14.pb1.Progress := 60;
    end
    else
    begin
      textsave('[FILENAMES]' + #13#10 +
               'Exe="' + pth + '.exe"' + #13#10 +
               'SaveAs="' + pth + '.exe"' + #13#10 +
               '[COMMANDS]' + #13#10 +
               '-addoverwrite "' + iconadres + '", ICONGROUP,MAINICON,0', getpath + 'tempic.ini');
      cmd('"' + GetPath + 'RHS\ResourceHacker.exe" -script "' + getpath + 'tempic.ini"');
      form14.pb1.Progress := 60;
    end;
    RenameFile(pth + '.exe', pth + '.txt');
    form14.pb1.Progress := 70;
    Setlength(documents, length(CURRENT_PROJECT.HConstructor));
    for i := 0 to high(documents) do
    begin
      s := CompileDigFormatToHtml(i);
      kt_ := BytesToString(ValueToBytes(length(s)));
      documents[i] := chr(length(CURRENT_PROJECT.HConstructor[i].name)) + CURRENT_PROJECT.HConstructor[i].name + chr(CURRENT_PROJECT.HConstructor[i].width div 256) + chr(CURRENT_PROJECT.HConstructor[i].width - CURRENT_PROJECT.HConstructor[i].width div 256 * 256) + chr(CURRENT_PROJECT.HConstructor[i].height div 256) + chr(CURRENT_PROJECT.HConstructor[i].height - CURRENT_PROJECT.HConstructor[i].height div 256 * 256) + kt_ + s;
    end;
    form14.pb1.Progress := 90;
    
    assignfile(f, pth + '.txt');
    append(f);
    write(f, GET_GLOBAL_CONST('LS_DELIM'));
    for i := 0 to high(documents) do
      write(f, MoveChrCode(documents[i], 1));
    closefile(f);
    sleep(100);
    form14.pb1.Progress := 95;
    //textsave(textopen(pth + '.txt') + s, pth + '.txt');
    deletefile(pth + '.exe');
    RenameFile(pth + '.txt', ExtractFilePath(pth) + CURRENT_PROJECT.ExeName + '.exe');
    HTMLLevEditor.log(tr('Succesfully built ', 'Успешно собрано ', 'Costruito con successo ', 'Construit avec succes: ') + ExtractFilePath(pth) + CURRENT_PROJECT.ExeName + '.exe');
  except
    on e: exception do
      HTMLLevEditor.log(tr('Building error: ', 'Ошибка сборки: ', 'Errore di costruzione: ', 'Erreur de construction: ') + e.Message);
  end;
  form14.close;
end;

procedure THTMLLevEditor.Asasd(Sender: TObject);
begin
  PreCompile;
  if CURRENT_PROJECT.ExeName <> '' then
    ProcessCreate(ExtractFilePath(stdDelimiter(adres)) + CURRENT_PROJECT.ExeName + '.exe')
  else
    ProcessCreate(ExtractFileCaption((adres)) + '.exe')
end;

procedure THTMLLevEditor.edt15DblClick(Sender: TObject);
var
  w: word;
begin
  dlg3.Execute;
  (sender as TsEdit).Text := '#' + ReplaceColorInString(CountNaM(inttostr(dlg3.color), 10, 16, 6), 1, 3);
  ObjInspBlocked := false;
  w := 13;
  edt2KeyDown(sender, w, []);
end;

procedure THTMLLevEditor.edt23DblClick(Sender: TObject);
var
  w: word;
begin
  w := 13;
  dlg4.Execute;
  (Sender as TsEdit).Text := dlg4.FileName;
  edt2KeyDown(sender, w, []);
end;

procedure THTMLLevEditor.mmofgChange(Sender: TObject);
var
  i, m: integer;
const
  StepsAfterEnd = 8;
begin
  if ACTIVE_PAGE = -1 then
    exit;
  CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Code := mmofg.text;
  PChanged := true;
  if mmofg.Text = '' then
    exit;
  if not inited then
    exit;
  exit;
  m := 0;
  for i := mmofg.Lines.Count - 1 downto 0 do
    if mmofg.Lines[0] = '' then
      inc(m)
    else
      break;
  if m > StepsAfterEnd then
    while m <> StepsAfterEnd do
    begin
      mmofg.Lines.Delete(mmofg.Lines.Count - 1);
      dec(m)
    end
  else
    while m <> StepsAfterEnd do
    begin
      mmofg.Lines.add('');
      inc(m)
    end
end;

procedure THTMLLevEditor.btn39Click(Sender: TObject);
var
  a: integer;
begin
  if Active_element <> -1 then
    if CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[Active_element].NotDestroyed then
    begin
      //VisS_S[GetNumberById(Active_element)].Free;
      //DeleteObject(Active_element);
      a := AsInteger(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[Active_element].Properties['Id']);
      DeleteObject(a);
      Active_element := -1;
      recreatevis();
      CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].tag := '';
      activeobjinsp;
    end;
end;

procedure THTMLLevEditor.btn37Click(Sender: TObject);
begin
  Buffer := ACTIVE_ELEMENT
end;

procedure THTMLLevEditor.btn38Click(Sender: TObject);
begin
  paste
end;

procedure THTMLLevEditor.btn18Click(Sender: TObject);
var
  p: TPoint;
begin
  if ACTIVE_ELEMENT <> -1 then
  begin
    pgc2.ActivePageIndex := 1;
    mmofg.SetFocus;
    Insert('$("#' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[ACTIVE_ELEMENT].Properties['Id'] + '").' + LowerCase((Sender as TsSpeedButton).hint) + '();');
    p.x := mmofg.Caretx;
    p.y := mmofg.Carety;
    p.x := p.x - 3;
    mmofg.CaretX := p.x;
    mmofg.Carety := p.y;
  end;
end;

procedure THTMLLevEditor.Aaaa(Sender: TObject);
begin
  insert('$("")');
end;

procedure THTMLLevEditor.TranslateAll(Language: TLanguage);
var
  i, x, y: integer;
begin    (*
        *)
  Program_Language_local_ME := Language;
  file1.Caption := tr('File', 'Файл', 'File', 'Fichier');
  Run1.Caption := tr('Project', 'Проект', 'Progetto', 'Projet');
  B3.Caption := tr('Build', 'Сборка', 'Costruire', 'Construire');
  R1.Caption := tr('Run', 'Запуск', 'Correre', 'Courir');
  About1.Caption := tr('About', 'О', 'Di', 'Sur');
  New1.Caption := tr('New project', 'Новый проект', 'Nuovo progetto', 'Nouveau projet');
  Save2.Caption := tr('Save project', 'Сохранить проект', 'Salvare progetto', 'Sauvegarder projet');
  Save1.Caption := tr('Save project as...', 'Сохранить проект как...', 'Salvare progetto come...', 'Sauvegarder projet comme');
  Open1.Caption := tr('Open', 'Открыть', 'Aperto', 'Ouvrir');
  C2.Caption := tr('Convert | Compile', 'Конвертировать | Компилировать', 'Convertire | Compilare', 'Convertisseur | Compiler');

  T2.Caption := tr('Compile to Windows Executable file', 'Компилировать в Windows исполняемый файл', 'Compilare al file eseguibile di Windows', 'Compiler vers le fichier executable Windows');
  C1.Caption := tr('Compile to Windows Executable file and run', 'Компилировать в Windows исполняемый файл и запустить', 'Compilare al file eseguibile di Windows e run', 'Compiler vers le fichier executable Windows et courir');

  Help1.Caption := tr('Help', 'Помощь', 'Aiuto', 'Aidez-moi');

  AboutProjects1.Caption := tr('About project', 'О проекте', 'Descrizione del progetto', 'А propos du projet');
  w1.Caption := tr('Tools', 'Инструменты', 'Utensili', 'Outils');

  t1.Caption := tr('Task list', 'Список задач', 'Elenco delle attivitа', 'Liste de taches');
  c5.Caption := tr('Component list', 'Список компонентов', 'Elenco dei componenti', 'Liste des composants');
  O2.Caption := tr('Object inspector', 'Инспектор объектов', 'Ispezione oggetto', 'Inspecteur d''objets');
  L4.Caption := tr('Log', 'Лог', 'Log', 'Buche');
  S5.Caption := tr('Source view', 'Вид кода', 'La fonte', 'Source view');
  S6.Caption := tr('Structure view', 'Вид структуры', 'Vista Struttura', 'Vue structure');

  f3.Caption := tr('Forms', 'Формы', 'Forme', 'Formes');
  M2.Caption := tr('Mode', 'Режим', 'Modalitа', 'Mode');
  D4.Caption := tr('Design', 'Дизайн', 'Design', 'Conception');
  J4.Caption := tr('JS Code', 'JS Код', 'Codice', 'Code');

  C4.Caption := tr('Code', 'Код', 'Codice', 'Code');
  D3.Caption := tr('Show', 'Показать', 'Mostrare', 'Montrer');
  F4.Caption := tr('Find', 'Найти', 'Trova', 'Trouver');
  R3.Caption := tr('Replace', 'Заменить', 'Sostituire', 'Remplacer');
  H2.Caption := tr('Help', 'Помощь', 'Aiuto', 'Aidez-moi');
  J3.Caption := tr('JS Help', 'Помощь по JS', 'JS Aiuto', 'JS Aidez-moi');
  S4.Caption := tr('Style help', 'Помощь по стилям', 'Stile aiuto', 'Style aidez-moi');

  L1.Caption := tr('Language', 'Язык', 'Lingua', 'La langue');
  btn6.Caption := tr('Start', 'Пуск', 'Inizio', 'Debut');
  btn35.Caption := tr('Build', 'Сборка', 'Costruire', 'Construire');
  B1.Caption := tr('Build to exe and run', 'Сборка в exe и запуск', 'Costruire in exe ed eseguire', 'Construire pour exe et courir');
  T3.Caption := tr('To Windows Executable file (*.exe)', 'В Windows запускаемый файл (*.exe)', 'Per file eseguibile di Windows (*.exe)', 'Vers le fichier executable Windows (*.exe)');

  file1.Caption := tr('File', 'Файл', 'File', 'Fichier');
  //spnl48.Caption := tr('List of tasks', 'Список задач', 'Elenco dei compiti', 'Liste des taches');
  pgc2.Pages[0].Caption := tr('Design', 'Дизайн', 'Design', 'Conception');
  pgc2.Pages[1].Caption := tr('Js code', 'Js код', 'Js codice', 'Js code');
  spnl34.Caption := tr('Structure View', 'Вид Структуры', 'Struttura View', 'Vue structure');
  tv2.Items.Item[0].text := tr('Project', 'Проект', 'Progetto', 'Projet');
//  tv2.Items.Item[1].text := tr('Form', 'Форма');
  file1.Caption := tr('File', 'Файл', 'File', 'Fichier');
  pgcspgcntrl1.Pages[0].Caption := tr('Design', 'Дизайн', 'Design', 'Conception');
  pgcspgcntrl1.Pages[1].Caption := tr('Text', 'Текст', 'Testo', 'Texte');

  F5.Caption := tr('Code part', 'Область кода', 'Codice parte', 'Partie du code');
  Z1.Caption := tr('Font size up', 'Увеличить размер шрифта', 'Dimensione dei caratteri fino', 'Taille de la police');
  FontSizeUp1.Caption := tr('Font size down', 'Уменьшить размер шрифта', 'Dimensione carattere giu', 'Taille de police rйduite');
  M3.Caption := tr('Move code', 'Сдвинуть код', 'Codice mossa', 'Deplacer le code');
  A1.Caption := tr('Add to source...', 'Добавить к коду...', 'Aggiungere alla sorgente...', 'Ajouter а la source...');
  R5.Caption := tr('Replace source...', 'Заменить код...', 'Sostituire fonte...', 'Remplacer source...');

  spnl20.Caption := tr('Log', 'Лог', 'Log', 'Buche');
  spnl52.Caption := tr('Source', 'Код', 'Fonte', 'La source');

  pgcspgcntrl2.Pages[0].Caption := tr('Properties', 'Свойства', 'Proprietа', 'Proprietes');
  pgcspgcntrl2.Pages[1].Caption := tr('Events', 'События', 'Eventi', 'Evenements');
  spnl4.Caption := tr('(Nothing selected)', '(Ничего не выбрано)', '(Niente selezionato)', '(Rien selectionne)');
  pgcspgcntrl2.Pages[2].Caption := tr('Call', 'Вызов', 'Chiamata', 'Appel');
  lbl12.Caption := tr('Text', 'Текст', 'Testo', 'Texte');
  lbl14.Caption := tr('Color', 'Цвет', 'Colore', 'Couleur');
  lbl10.Caption := tr('F-Color', 'Ш-Цвет', 'F-Colore', 'F-Couleur');
  lbl9.Caption := tr('Font', 'Шрифт', 'Font', 'Fonte');
  lbl2.Caption := tr('Width', 'Ширина', 'Larghezza', 'Largeur');
  lbl1.Caption := tr('Height', 'Высота', 'Altezza', 'La taille');
  lbl8.Caption := tr('Bor-rad', 'Бор-рад', 'Rag-con', 'Ray-bor');
  lbl7.Caption := tr('Border', 'Бордюр', 'Confine', 'Bordure');
  lbl5.Caption := tr('F-Size', 'Ш-Размер', 'F-Dimensione', 'F-Taille');
  lbl6.Caption := tr('B-Sha', 'Б-Тень', 'C-Ombra', 'B-Ombre');
  lbl11.Caption := tr('Outline', 'О-Линия', 'Linea', 'Ligne');
  lbl22.Caption := tr('Href', 'Адрес', 'URL', 'URL');
  lbl23.Caption := tr('Source', 'Ресурс', 'Fonte', 'La source');
  lbl21.Caption := tr('OnClick', 'Клик', 'AlClic', 'SurClic');
  lbl20.Caption := tr('OnDblClick', 'Два-клик', 'OnDblClick', 'EnDblClic');
  lbl19.Caption := tr('OnChange', 'Изменение', 'OnChange', 'SurChange');
  lbl18.Caption := tr('OnFocus', 'Фокус', 'OnFuoco', 'SurConc');
  lbl17.Caption := tr('OnSelect', 'Выделение', 'OnSelez', 'SurSelect');
  lbl16.Caption := tr('OnMouseDown', 'Мышь-вниз', 'OnMouseDown', 'OnMouseDown');
  lbl15.Caption := tr('OnMouseMove', 'Мышь-двиг', 'OnMouseMove', 'OnMouseMove');
  lbl13.Caption := tr('OnMouseUp', 'Мышь-верх', 'OnMouseUp', 'OnMouseUp');
  btn45.Caption := tr('Hide', 'Спрятать', 'Nascondere', 'Cacher');
  btn46.Caption := tr('Show', 'Показать', 'Mostrare', 'Montrer');
  btn44.Caption := tr('Toggle', 'Спрятать/показать', 'Toggle', 'Basculer');
  btn43.Caption := tr('Height', 'Высота', 'Altezza', 'La taille');
  btn42.Caption := tr('Width', 'Ширина', 'Larghezza', 'Largeur');
  btn41.Caption := tr('Left', 'Отступ слева', 'Sinistra', 'La gauche');
  btn40.Caption := tr('Top', 'Отступ сверху', 'Superiore', 'Haut');
  btn23.Caption := tr('Html', 'Содержимое', 'Html', 'Html');
  btn19.Caption := tr('Text', 'Текст', 'Testo', 'Texte');
  btn18.Caption := tr('Value', 'Значение', 'Valore', 'Valeur');

  btn39.Hint := tr('Delete component', 'Удалить компонент', 'Elimina componente', 'Supprimer la composante') + ' (Ctrl + Del)';
  //btn11.Caption := tr('Paste', 'Вставка');
  with abt.Form4 do
  begin    (*
    lbl1.Caption := '    ' + Project_name + tr('- is easy way to create from simple', '- легкий путь создать от простой');
    lbl12.Caption := tr('program to amazing app with you-like-design and full cross-platform', 'программы до восхитительных приложений с вашим дизайном и кросс-платформенностью');

    lbl3.Caption := tr('    Our aim is - do not limit you in design taste, so you can create', '    Наша цель - не ограничивать вас в дизайне, поэтому вы можете создать');
    lbl4.Caption := tr('apps with all components you like to see; The second is full-', 'приложения со всеми компонентами, которые вы хотите видеть; Вторая - полная');
    lbl5.Caption := tr('cross-platform apps, you do not need to change your project', 'кросс-платформенность ваших приложений, вы не обязаны изменять ваш проект');
    lbl6.Caption := tr('to do it workable on Smartphones on Android, Ios!', 'чтобы сделать его работающим на смартфонах на Andoid, Ios!');
    lbl7.Caption := tr('    You can create exciting apps without changing your program for', 'Вы можете создать восхитительные приложения без изменение вашей программы для');
    lbl8.Caption := tr('Windows, Mac OS, Linus, Ios, Android and other! The program will', 'Windows, Mac OS, Linux, Ios, Android и другие! Программа будет');
    lbl9.Caption := tr('work on PC, Smartphones, smartwaches, smart glasses', 'работать на ПК, смартфонах, смарт-часах, смарт-очков');
    *)
  end;
  btn37.hint := tr('Copy', 'Копировать', 'Copia', 'Copie');
  btn38.hint := tr('Paste', 'Вставить', 'Incolla', 'Coller');
  btn95.Hint := tr('Drop litter', 'Выбросить мусор', 'Cucciolata di goccia', 'Jeter la litiere');
  with form7 do
  begin
    t1.Caption := tr('Do you want to save changes?', 'Хотите сохранить изменения?', 'Vuoi salvare le modifiche?', 'Voulez-vous enregistrer les modifications?');
    sbtbtn1.Caption := tr('Yes', 'Да', 'Si', 'Oui');
    sbtbtn2.Caption := tr('No', 'Нет', 'No', 'Non');
    sbtbtn3.Caption := tr('Cancel', 'Отмена', 'Annulla', 'Annuler');
    caption := tr('Changes', 'Изменения', 'I cambiamenti', 'Changements')
  end;
  with form13 do
  begin
    lbl1.caption := tr('Unknown error. You can see it in log', 'Неизвестная ошибка. Вы можете видеть в логе', 'Errore sconosciuto. Lo si puт vedere nel registro', 'Erreur inconnue. Vous pouvez le voir dans log');
    lbl2.caption := tr('Would you like to repair Studio?', 'Хотите исправить Студию?', 'Vuoi riparare Studio?', 'Voulez-vous rйparer Studio?');
    sbtbtn1.Caption := tr('Yes', 'Да', 'Si', 'Oui');
    sbtbtn2.Caption := tr('No', 'Нет', 'No', 'Non');
  end;
  lbl24.Caption := tr('To find:', 'Найти:', 'Trovare:', 'Trouver:');
  btn48.Caption := tr('Find next', 'Следующее', 'Trova il prossimo', 'Recherche suivante');
  //btn49.Caption := tr('Search', 'Поиск');

  with form14 do
  begin
    caption := tr('Compiling', 'Компиляция', 'Compilazione', 'Compilation');
  end;

  with form17 do
  begin
    caption := tr('Create new project or open existing?', 'Создать новый проект или открыть существующий?', 'Creare un nuovo progetto o aperto esistente?', 'Creer un nouveau projet ou ouvrir existant?');
    btn1.Caption := tr('Create new project...', 'Создать новый проект...', 'Creare un nuovo progetto...', 'Crйer un nouveau projet...');
    btn2.Caption := tr('Open existing project', 'Открыть доступный проект', 'Apri progetto esistente', 'Ouvrir un projet existant');
    btn3.caption := tr('Exit from studio', 'Выйти из студии', 'Uscire dallo studio', 'Sortir du studio');
    btn4.caption := tr('Open the last project', 'Открыть последний проект', 'Aprire l''ultimo progetto', 'Ouvrir le dernier projet');
    btn5.caption := tr('Learn how to create "Hello, world"', 'Узнать как сделать "Hello, world"', 'Imparare a creare "Hello, world"', 'Apprenez а crйer "Hello, world"');
  end;

  with form18 do
  begin
    caption := tr('New project', 'Новый проект', 'Nuovo progetto', 'Nouveau projet');
    lbl2.caption := tr('Application path', 'Путь приложения', 'Percorso di applicazione', 'Chemin d''application');
    lbl4.Caption := tr('Project name', 'Имя проекта', 'Nome del progetto', 'Nom du projet');
    lbl3.caption := tr('Main form name', 'Название формы', 'Principale nome del modulo', 'Nom du formulaire principal');
    sbtbtn1.Caption := tr('Ok', 'Ок', 'Ok', 'D''accord');
    sbtbtn2.Caption := tr('Cancel', 'Отмена', 'Annulla', 'Annuler');
  end;
  //with form8 do
    //lbl2.Caption := 'Разработано Mc Company';

  B2.Caption := tr('Project', 'Проект', 'Progetto', 'Projet');
  s3.Caption := tr('Settings', 'Настройки', 'Impostazioni', 'Parametres');
  s1.caption := tr('Save and exit', 'Сохранить и выйти', 'Salva ed esci', 'Sauvegarder et quitter');
  O1.Caption := tr('Options', 'Опции', 'Opzioni', 'Options');
  spnl5.Caption := tr('Object inspector', 'Инспектор объектов', 'Ispezione oggetto', 'Inspecteur d''objets');
  spnl17.Caption := tr('Components', 'Компоненты', 'Componenti', 'Composants');
  stbsht8.Caption := tr('Objects', 'Объекты', 'Oggetti', 'Objets');
  stbsht9.Caption := tr('Headers', 'Заголовки', 'Intestazioni', 'En-tetes');
  stbsht10.Caption := tr('Fields', 'Поля', 'Campi', 'Des champs');
  stbsht11.Caption := tr('Layout', 'Разметка', 'Disposizione', 'Disposition');
  stbsht12.Caption := tr('Links', 'Ссылки', 'Link', 'Des liens');
  s2.Caption := tr('Symbol code', 'Код символа', 'Simbolo codice', 'Code de symbole');
  d2.Caption := tr('Find', 'Найти', 'Trova', 'Trouver');
  r2.Caption := tr('Replace', 'Заменить', 'Sostituire', 'Remplacer');
  p1.Caption := tr('Paste word...', 'Вставить слово...', 'Incolla parola...', 'Coller le mot...');
  f1.Caption := tr('function', 'функцию', 'funzione', 'fonction');
  i3.Caption := tr('if-else', 'если-иначе', 'se-altro', 'sinon');
  l3.Caption := tr('loop', 'цикл', 'ciclo continuo', 'boucle');
  j2.Caption := tr('jQuery call', 'Вызов jQuery', 'chiamata jQuery', 'appel jQuery');
  h1.Caption := tr('Help', 'Помощь', 'Aiuto', 'Aidez-moi');
  O3.Caption := tr('Show in explorer', 'Показать в проводнике', 'Mostra in Explorer', 'Afficher dans l''explorateur');

  I1.Caption := tr('IDE Settings', 'Настройки среды', 'Impostazioni IDE', 'Parametres IDE');

  f6.Caption := tr('Included libraries', 'Встроенные библиотеки', 'Librerie incluse', 'Bibliotheques incluses');
  c3.Caption := tr('CSS Classes', 'CSS Классы', 'Le classi CSS', 'Classes CSS');

  tv4.Items.Clear;
  TvLoadFromtext(tv4, textopen(getpath + tr('En', 'Ру', 'En', 'En') + 'AvFunc.msf'), '>');
  form23.Caption := tr('Libraries', 'Библиотеки', 'Librerie', 'Bibliotheques');
  stbcntrl1.Tabs[0] := tr('Start page', 'Начальная страница', 'Pagina iniziale', 'Page de demarrage');
  lbl28.caption := tr('Create new project with studio', 'Создать новый проект с студией', 'Crea nuovo progetto con lo studio', 'Creer un nouveau projet avec studio');
  lbl29.Caption := tr('Open existing project', 'Открыть существующий проект', 'Apri progetto esistente', 'Ouvrir un projet existant');
  lbl30.caption := tr('Visit official website', 'Посетить официальный сайт', 'Visita il sito ufficiale', 'Visiter le site officiel');
  lbl31.caption := tr('Exit', 'Выйти', 'Uscita', 'Sortie');
  grp1.Caption := tr('Studio', 'Студия', 'Studio', 'Studio');
  lbl32.caption := tr('Create new form', 'Создать новую форму', 'Creare un nuovo modulo', 'Creer un nouveau formulaire');
  lbl33.caption := tr('Go to main form', 'Перейти к главной форме', 'Vai al modulo principale', 'Aller au formulaire principal');
  grp2.caption := tr('Project', 'Проект', 'Progetto', 'Projet');
  lbl34.caption := tr('Language', 'Язык', 'Lingua', 'La langue');
  stbsht13.Caption := tr('List of projects', 'Список проектов', 'Elenco dei progetti', 'Liste des projets');
  stbsht14.caption := tr('Explorer', 'Проводник', 'Esploratore', 'Explorateur');
  lbl35.caption := tr('Hello', 'Здравствуйте', 'Ciao', 'Bonjour') + ', ';
  lbl36.caption := getuser;
  lbl36.left := (dict.ArrayOf(['1', '2', '3', '4'], [55, 120, 50, 75]))[tr('1', '2', '3', '4')];
  lbl37.caption := lbl35.caption + lbl36.caption;
  //center(lbl37, spnl48, [pHoriz]);
end;

procedure THTMLLevEditor.E1Click(Sender: TObject);
begin
  TranslateAll(plEn)
end;

procedure THTMLLevEditor.R4Click(Sender: TObject);
begin
  TranslateAll(plRu)
end;

procedure THTMLLevEditor.btn48Click(Sender: TObject);
begin
  mmofg.SetFocus;
  nextfind(edt25.text)
end;

procedure THTMLLevEditor.btn49Click(Sender: TObject);
begin
  spnl43.Visible := not spnl43.Visible
end;

procedure THTMLLevEditor.S1Click(Sender: TObject);
begin
  save2.Click;
  close;
end;

procedure THTMLLevEditor.stbcntrl1Change(Sender: TObject);
begin
  if userform <> nil then
    log(inttostr(userform.left) + ' ' + inttostr(userform.top) + ' ' + inttostr(CURRENT_PROJECT.HConstructor[1].width));
  if stbcntrl1.TabIndex <> 0 then
  begin
    RelistTo(stbcntrl1.TabIndex - 1);
    pgc2.show;
    spnl37.Hide
  end
  else
  begin
    pgc2.Hide;
    spnl37.Show
  end;
  if userform <> nil then
    log(inttostr(userform.left) + ' ' + inttostr(userform.top) + ' ' + inttostr(CURRENT_PROJECT.HConstructor[1].width));
  refresh
end;

function NewWindow(name: string = 'NewWindow'): integer;
var
  i: integer;
  a: TMenuItem;
begin
  setlength(CURRENT_PROJECT.HConstructor, length(CURRENT_PROJECT.HConstructor) + 1);
  result := high(CURRENT_PROJECT.HConstructor);
  CURRENT_PROJECT.HConstructor[result].name := name;
  CURRENT_PROJECT.HConstructor[result].Width := htmlleveditor.spnl63.width div 2;
  CURRENT_PROJECT.HConstructor[result].height := round(htmlleveditor.spnl63.height / 1.5);
  CURRENT_PROJECT.HConstructor[result].left := (htmlleveditor.spnl63.width - CURRENT_PROJECT.HConstructor[result].Width) div 2;
  CURRENT_PROJECT.HConstructor[result].top := (htmlleveditor.spnl63.Height - CURRENT_PROJECT.HConstructor[result].Height) div 2;
  htmlleveditor.stbcntrl1.Tabs.Add(name);
  a := TMenuItem.Create(nil);
  a.Caption := name;
  a.Tag := result;
  a.OnClick := htmlleveditor.F3Click;
  htmlleveditor.F3.Add(a);
  //for i := 0 to htmlleveditor.stbcntrl1.Tabs.Count - 1 do
    //htmlleveditor.stbcntrl1
  Form15.stbcntrl1.Tabs.Add(name);
  setlength(VisS_S, length(VisS_S) + 1)
end;

procedure SaveProject(adres: string);
var
  ProjectFile, PageFile, adr, ammo: string;
  i, j, k: integer;
  inifile: TInifile;
begin
  ProjectFile := '';
  ProjectFile := ProjectFile + CURRENT_PROJECT.ExeName + #13#10;
  ProjectFile := ProjectFile + CURRENT_PROJECT.Icon + #13#10;
  if not FileExists(GetUA + 'classes.css') then
    textsave('', GetUA + 'classes.css');
  for i := 0 to high(CURRENT_PROJECT.HConstructor) do
  begin
    ProjectFile := ProjectFile + CURRENT_PROJECT.HConstructor[i].name + #13#10;
    inifile := TInifile.Create((extractfilepath(stdDelimiter(adres))) + CURRENT_PROJECT.HConstructor[i].name + '.cfg');
    //ammo := CURRENT_PROJECT.HConstructor[i].HtmlPaste + #13#10 + CURRENT_PROJECT.HConstructor[i].headPaste + #13#10 + CURRENT_PROJECT.HConstructor[i].bodyPaste;
    inifile.WriteString('paste', 'html', CURRENT_PROJECT.HConstructor[i].HtmlPaste);
    inifile.WriteString('paste', 'head', CURRENT_PROJECT.HConstructor[i].headPaste);
    inifile.WriteString('paste', 'body', CURRENT_PROJECT.HConstructor[i].bodyPaste);
    inifile.Free;
  end;
  textsave(ProjectFile, adres);
  for i := 0 to high(CURRENT_PROJECT.HConstructor) do
  begin
    PageFile := '';
    for k := 0 to high(CURRENT_PROJECT.HConstructor[i].objects) do
    begin
      if CURRENT_PROJECT.HConstructor[i].objects[k].NotDestroyed then
      begin
        CURRENT_PROJECT.HConstructor[i].Objects[k].Properties.resetlenebilir;
        for j := 1 to (CURRENT_PROJECT.HConstructor[i].objects[k].properties.count) do
        begin
          PageFile := PageFile + AsString(CURRENT_PROJECT.HConstructor[i].Objects[k].Properties.activeelement.key) + #13#10 + AsString(CURRENT_PROJECT.HConstructor[i].Objects[k].Properties.activeelement.value) + #13#10;
          CURRENT_PROJECT.HConstructor[i].Objects[k].Properties.go();
        end;
        PageFile := PageFile + '******' + #13#10;
      end;
    end;
    PageFile := chr(CURRENT_PROJECT.HConstructor[i].width div 256) + chr(CURRENT_PROJECT.HConstructor[i].width - CURRENT_PROJECT.HConstructor[i].width div 256 * 256) + chr(CURRENT_PROJECT.HConstructor[i].height div 256) + chr(CURRENT_PROJECT.HConstructor[i].height - CURRENT_PROJECT.HConstructor[i].height div 256 * 256) + PageFile + '***--***' + #13#10 + CURRENT_PROJECT.HConstructor[i].Code;
    adr := ExtractFilePath(stdDelimiter(adres)) + CURRENT_PROJECT.HConstructor[i].name + '.lct';
    TextSave(MoveChrCode(PageFile, 1), adr);
  end;
end;

procedure THTMLLevEditor.OpenProject(path: string);
var
  s: TTreeNode;
  txt: TStringList;
  FormCode: TMC_StringList;
  stack: TStringList;
  i, j, k, z: integer;
  Pages: string;
  inifile: TIniFile;
begin
  try
    clearproject;
    for i := 0 to high(CURRENT_PROJECT.HConstructor) do
      for j := 0 to high(CURRENT_PROJECT.HConstructor[i].objects) do
        CURRENT_PROJECT.HConstructor[i].Objects[i].Properties.Free;
    setlength(CURRENT_PROJECT.HConstructor, 0);
    open.Filter := tr('LS Project|*.', 'LS Проект|*.', 'LS Progetto|*.', 'LS Projet|*.') + User_Prj_ext;
    with Open, mmofg do
      begin
        adres := stdDelimiter(path);
        txt := TStringList.create;
        txt.LoadFromFile(adres);

        CURRENT_PROJECT.ExeName := txt[0];
        CURRENT_PROJECT.Icon := txt[1];
        for i := 1 to 2 do
          txt.Delete(0);
          
        for i := 0 to txt.Count - 1 do
        begin
          if fileexists(ExtractFilePath(adres) + txt[i] + '.lct') then
          begin
            ACTIVE_PAGE := NewWindow(txt[i]);
            FormCode := TMC_StringList.create;
            FormCode.LoadFromFile(ExtractFilePath(adres) + txt[i] + '.lct');
            FormCode.text := MoveChrCode(FormCode.text, -1);
            //userform.width := ord(FormCode.Text[1]) * 256 + ord(FormCode.Text[2]);
            //userform.height := ord(FormCode.Text[3]) * 256 + ord(FormCode.Text[4]);
            CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Width := ord(FormCode.Text[1]) * 256 + ord(FormCode.Text[2]);
            CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Height := ord(FormCode.Text[3]) * 256 + ord(FormCode.Text[4]);
            CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].left := (spnl63.Width - CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].width) div 2;
            CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].top := (spnl63.height - CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].height) div 2;
            FormCode.text := copy(FormCode.text, 5, length(FormCode.text));
            if fileexists(ExtractFilePath(adres) + txt[i] + '.cfg') then
            begin
              inifile := TInifile.Create(ExtractFilePath(adres) + txt[i] + '.cfg');
              CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].HtmlPaste := inifile.ReadString('paste', 'html', '');
              CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].headPaste := inifile.ReadString('paste', 'head', '');
              CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].bodyPaste := inifile.ReadString('paste', 'body', '');
              inifile.Free;
            end;
            //FormCode.Delete(0);
            //FormCode.Delete(0);
            //FormCode.Delete(0);

            setlength(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects, 0);
            //mmofg.text := copy(Copy(FormCode.text, pos('***--***', FormCode.text) + 6, length(FormCode.text)), 3, length(Copy(FormCode.text, pos('******', FormCode.text) + 6, length(FormCode.text))) - 3);
            CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Code := copy(formcode.text, pos('***--***', formcode.text) + 8, length(formcode.text));
            Clear32And13(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Code, [9, 10, 12, 13]);
            if pos('***--***', FormCode.text) > 1 then
              FormCode.text := copy(FormCode.text, 1, pos('***--***', FormCode.text) - 1)
            else
              FormCode.text := '';
            j := 0;
            Stack := TStringList.create;
            while pos('******', FormCode.text) <> 0 do
            begin
              stack.text := copy(FormCode.text, 1, pos('******', FormCode.text) - 1);
              if stack.text[1] = #13 then
                stack.Delete(0);
              FormCode.text := copy(FormCode.text, pos('******', FormCode.text) + 6, length(FormCode.text));
              setlength(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects, length(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects) + 1);
              CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects)].Properties := dict.setArray;
              CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects)].NotDestroyed := true;
              for k := 0 to Stack.Count div 2 - 1 do
                CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects[high(CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].Objects)].Properties[stack[k * 2]] := stack[k * 2 + 1];
            end;
            stack.free;
            FormCode.Free;
          end;
        end;
      end;
    if pos('/', CURRENT_PROJECT.ExeName) <> 0 then
      CURRENT_PROJECT.ExeName := extractfiletitle(CURRENT_PROJECT.ExeName);
    addtolist(adres);
    mmofg.Text := CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].code;
    //RelistTo(0);
    //stbcntrl1.TabIndex := 0;
    if userform.top < 0 then
      userform.top := 0;
    CURRENT_PROJECT.ExeName := ExtractFileTitle(adres);
    form15.stbcntrl1.Tabs.Text := htmlleveditor.stbcntrl1.Tabs.text
  except
    on e: exception do
      RaiseError(e.Message);
  end;
end;

procedure THTMLLevEditor.btn16Click(Sender: TObject);
begin
  form16.showmodal
end;

procedure THTMLLevEditor.S3Click(Sender: TObject);
begin
  form15.showmodal
end;

procedure THTMLLevEditor.btn6Click(Sender: TObject);
begin
  b1.Click
end;

procedure THTMLLevEditor.I1Click(Sender: TObject);
begin
  form19.showmodal
end;

procedure THTMLLevEditor.f2Click(Sender: TObject);
begin
  insertblock('function f1() {', '}', '  ');
end;

procedure THTMLLevEditor.i2Click(Sender: TObject);
begin
  insertblock('if (true) {', '} else {' + #13#10 + '  ' + #13#10 + '  }', '  ');
end;

procedure THTMLLevEditor.l2Click(Sender: TObject);
begin
  insertblock('for (i = 0; i < 10; i++) {', '}', '  ');
end;

procedure THTMLLevEditor.j1Click(Sender: TObject);
begin
  insert('$("")');
end;

procedure THTMLLevEditor.S2Click(Sender: TObject);
begin
  ShowMessage(inttostr(ord(mmofg.text[mmofg.SelStart])));
end;

procedure THTMLLevEditor.Aaaaa(Sender: TObject);
begin
  ProcessKill(ExtractFilePath(adres) + CURRENT_PROJECT.ExeName + '.exe');
end;

procedure THTMLLevEditor.btn58Click(Sender: TObject);
begin
  if chk1.Checked then
    mmofg.text := StringReplace(mmofg.text, edt1.text, edt26.text, [])
  else
    mmofg.text := StringReplace(mmofg.text, edt1.text, edt26.text, [rfIgnoreCase])
end;

procedure THTMLLevEditor.btn59Click(Sender: TObject);
begin
  if chk1.Checked then
    mmofg.text := StringReplace(mmofg.text, edt1.text, edt26.text, [rfReplaceAll])
  else
    mmofg.text := StringReplace(mmofg.text, edt1.text, edt26.text, [rfReplaceAll, rfIgnoreCase])
end;

procedure THTMLLevEditor.btn60Click(Sender: TObject);
begin
  spnl50.Visible := not spnl50.Visible
end;

procedure THTMLLevEditor.H1Click(Sender: TObject);
begin
  btn2.Click
end;

procedure THTMLLevEditor.D2Click(Sender: TObject);
begin
  btn49.Click
end;

procedure THTMLLevEditor.R2Click(Sender: TObject);
begin
  btn60.Click
end;

procedure THTMLLevEditor.btn62Click(Sender: TObject);
begin
  mmofg.Font.Size := mmofg.Font.Size + 1;
end;

procedure THTMLLevEditor.btn63Click(Sender: TObject);
begin
  mmofg.Font.Size := mmofg.Font.Size - 1;
end;

procedure THTMLLevEditor.btn64Click(Sender: TObject);
begin
  inv(ExToolWindows.SourceList);
  if ExToolWindows.SourceList then
  begin
    spnl52.Caption := tr('Source', 'Код', 'Codice', 'Code');
    spnl51.Width := 257;
    tv3.Visible := true;
  end
  else
  begin
    spnl52.Caption := '';
    spnl51.Width := btn64.Width;
    tv3.Visible := false;
  end;
end;

procedure THTMLLevEditor.J3Click(Sender: TObject);
begin
  form20.Ashow('https://developer.mozilla.org/en-US/docs/Web/JavaScript')
end;

procedure THTMLLevEditor.S4Click(Sender: TObject);
begin
  form20.ashow('http://htmlbook.ru/css')
end;

procedure THTMLLevEditor.tv3Click(Sender: TObject);
begin
  if tv3.Selected <> nil then
    mmofg.SelStart := pos(tv3.Selected.Text, LowerCase(mmofg.text)) - 1;
  mmofg.SetFocus
  //
end;

procedure THTMLLevEditor.mmofggutterclick(Sender: TObject; Button: TMouseButton;
    X, Y, Line: Integer; Mark: TSynEditMark);
var
  i: integer;
  r: integer;
  max: integer;
begin
  exit;
  r := -1;
  for i := 0 to mmofg.Marks.Count - 1 do
    if mmofg.Marks[i].Line = line then
    begin
      r := i;
      break
    end;
  max := -1;
  if r = -1 then
    for i := 0 to mmofg.Marks.Count - 1 do
      //if max < mmofg.Marks[i]. then
        max := mmofg.Marks[i].Char;
  if r = -1 then
  begin
    mmofg.SetBookMark(UsedBookMarks, 0, line);
    inc(UsedBookMarks)
  end
  else
    mmofg.Marks.Delete(r);
end;

procedure THTMLLevEditor.btn12Click(Sender: TObject);
begin
  spnl50.Visible := not spnl50.Visible
end;

procedure THTMLLevEditor.btn20Click(Sender: TObject);
begin
  spnl43.Visible := not spnl43.Visible
end;

procedure THTMLLevEditor.btn28Click(Sender: TObject);
begin
  inv(ExToolWindows.ListOfObjects);
  if ExToolWindows.ListOfObjects then
    spnl2.height := 105
  else
    spnl2.Height := spnl17.height;
end;

procedure THTMLLevEditor.B3Click(Sender: TObject);
begin
  btn35.Click
end;

procedure THTMLLevEditor.R1Click(Sender: TObject);
begin
  btn6.click
end;

procedure THTMLLevEditor.F4Click(Sender: TObject);
begin
  pgc2.ActivePageIndex := 1;
  spnl43.Visible := true
end;

procedure THTMLLevEditor.btn29Click(Sender: TObject);
begin
  m1.Visible := not m1.Visible;
  formresize(nil)
end;

procedure THTMLLevEditor.C5Click(Sender: TObject);
begin
  btn28.click
end;

procedure THTMLLevEditor.L4Click(Sender: TObject);
begin
  btn29.click
end;

procedure THTMLLevEditor.S5Click(Sender: TObject);
begin
  btn64.click
end;

procedure THTMLLevEditor.S6Click(Sender: TObject);
begin
  btn1.click
end;

procedure THTMLLevEditor.D4Click(Sender: TObject);
begin
  pgc2.ActivePageIndex := 0;
end;

procedure THTMLLevEditor.J4Click(Sender: TObject);
begin
  pgc2.ActivePageIndex := 1;
end;

procedure THTMLLevEditor.D3Click(Sender: TObject);
begin
  pgc2.ActivePageIndex := 1;
end;

procedure THTMLLevEditor.R3Click(Sender: TObject);
begin
  pgc2.ActivePageIndex := 1;
  spnl50.Visible := true;
end;

procedure THTMLLevEditor.F3Click(Sender: TObject);
begin
  stbcntrl1.TabIndex := (sender as TMenuItem).tag + 1;
  stbcntrl1Change(nil)
end;

procedure THTMLLevEditor.btn75Click(Sender: TObject);
begin
  dlg6.Execute;
  if fileexists(dlg6.Filename) then
    mmofg.text := mmofg.text + #13#10 + '//Added ' + DateToStr(Date) + ' From ' + dlg6.FileName + #13#10 + textopen(dlg6.FileName)
end;

procedure THTMLLevEditor.btn77Click(Sender: TObject);
begin
  dlg7.execute;
  if fileexists(dlg7.FileName) then
    mmofg.text := '/*' + StringReplace(mmofg.text, '*/', '', [rfReplaceAll]) + '*/' + #13#10 + '//Added ' + DateToStr(Date) + ' From ' + dlg7.FileName + #13#10 + textopen(dlg7.FileName)
end;

procedure THTMLLevEditor.btn79Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to mmofg.Lines.Count - 1 do
    mmofg.Lines[i] := ' ' + mmofg.Lines[i];
end;

procedure THTMLLevEditor.btn78Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to mmofg.Lines.Count - 1 do
    if mmofg.Lines[i] <> '' then
      if mmofg.Lines[i][1] = ' ' then
        mmofg.Lines[i] := copy(mmofg.Lines[i], 2, length(mmofg.Lines[i]))
end;

procedure THTMLLevEditor.Z1Click(Sender: TObject);
begin
  btn62.Click
end;

procedure THTMLLevEditor.Fontsizeup1Click(Sender: TObject);
begin
  btn63.click
end;

procedure THTMLLevEditor.N1Click(Sender: TObject);
begin
  btn79.Click
end;

procedure THTMLLevEditor.xfgfs(Sender: TObject);
begin
  btn78.click
end;

procedure THTMLLevEditor.A1Click(Sender: TObject);
begin
  btn75.click
end;

procedure THTMLLevEditor.R5Click(Sender: TObject);
begin
  btn77.click
end;

procedure THTMLLevEditor.O3Click(Sender: TObject);
begin
  shellexecute(0, 'open', PAnsiChar(extractfilepath(stdDelimiter(adres))), '', '', SW_SHOWNORMAL)
end;

procedure THTMLLevEditor.spnl3DblClick(Sender: TObject);
begin
  if ACTIVE_ELEMENT > -1 then
    if ACTIVE_PAGE > -1 then
      edt14dblclick(edt22)
end;

procedure THTMLLevEditor.bcOnCOdeCompl(Sender: TObject; var Value: UnicodeString;
    Shift: TShiftState; Index: Integer; EndToken: WideChar);
begin

end;

procedure THTMLLevEditor.Dfhdfsh(Sender: TObject);
begin
  form22.show();
end;

procedure THTMLLevEditor.btn82Click(Sender: TObject);
begin
  mmofg.selstart := pos(TextAsk(tr('Go to function', 'Перейти к ф-ии', 'Vai a funzionare', 'Aller а la fonction'), plate(CurCurX, CurCurY, 250, 80), clwhite, clwhite), mmofg.text) - 1;
  mmofg.SetFocus;
end;

procedure THTMLLevEditor.btn81Click(Sender: TObject);
begin
  mmofg.caretY := AsInteger(TextAsk(tr('Go to function', 'Перейти к ф-ии', 'Vai a funzionare', 'Aller а la fonction'), plate(CurCurX, CurCurY, 250, 80), clwhite, clwhite)) - 0;
  mmofg.SetFocus;
end;

procedure THTMLLevEditor.btn83Click(Sender: TObject);
begin
  if mmofg.CaretY - 1 > -1 then
    mmofg.Lines[mmofg.carety - 1] := '//' + mmofg.Lines[mmofg.carety - 1]
end;

procedure THTMLLevEditor.btn84Click(Sender: TObject);
begin
  if mmofg.CaretY - 1 > -1 then
    if length(mmofg.Lines[mmofg.carety - 1]) > 2 then
      if copy(mmofg.Lines[mmofg.carety - 1], 1, 2) = '//' then
        mmofg.Lines[mmofg.carety - 1] := copy(mmofg.Lines[mmofg.carety -1], 3, length(mmofg.Lines[mmofg.carety - 1]))
end;

procedure THTMLLevEditor.btn86Click(Sender: TObject);
begin
  CURRENT_PROJECT.CellWidth := 1;
end;

procedure THTMLLevEditor.btn85Click(Sender: TObject);
begin
  CURRENT_PROJECT.CellWidth := CURRENT_PROJECT_DEFAULT_CELL_WIDTH;
end;

procedure THTMLLevEditor.R6Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PAnsiChar(ExtractFilePath(stdDelimiter(adres)) + CURRENT_PROJECT.ExeName + '.exe'), '', '', SW_SHOWNORMAL)
end;

procedure THTMLLevEditor.btn90Click(Sender: TObject);
begin
  userform.top := 0;
  userform.left := spnl4.width
end;

procedure THTMLLevEditor.btn91Click(Sender: TObject);
var
  i: integer;
  width, height: integer;
begin
  if ACTIVE_PAGE = -1 then
    exit;
  width := 0;
  height := 0;
  for I := 0 to high(visS_S[ACTIVE_PAGE]) do
  begin
    if width < visS_S[ACTIVE_PAGE][i].width + visS_S[ACTIVE_PAGE][i].left then
      width := visS_S[ACTIVE_PAGE][i].width + visS_S[ACTIVE_PAGE][i].left;
    if height < visS_S[ACTIVE_PAGE][i].height + visS_S[ACTIVE_PAGE][i].top then
      height := visS_S[ACTIVE_PAGE][i].height + visS_S[ACTIVE_PAGE][i].top;
  end;
  if width > 50 then
    userform.ClientWidth := width;
  if height > 50 then
    userform.ClientHeight := height;
end;

procedure THTMLLevEditor.F6Click(Sender: TObject);
begin
  form23.show
end;

procedure THTMLLevEditor.btn95Click(Sender: TObject);
begin
  DropLitter;
end;

procedure THTMLLevEditor.E2Click(Sender: TObject);
begin
  close
end;

procedure THTMLLevEditor.tv4Click(Sender: TObject);
begin
  if tv4.Selected <> nil then
    if tv4.Selected.HasChildren = false then
      insert(tv4.Selected.Text);
end;

procedure THTMLLevEditor.btn96Click(Sender: TObject);
begin
  tv4.FullCollapse
end;

procedure THTMLLevEditor.btn98Click(Sender: TObject);
begin
  tv4.FullExpand
end;

procedure THTMLLevEditor.H2Click(Sender: TObject);
begin
  form20.AShow('http://mc-company.ru/doc');
end;

procedure THTMLLevEditor.F7Click(Sender: TObject);
begin
  translateall(plFr)
end;

procedure THTMLLevEditor.I4Click(Sender: TObject);
begin
  translateall(plIt)
end;

procedure THTMLLevEditor.tv5Expanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  //ShowMessage('C:\' + GetFullPath(node, '\'));
  node.DeleteChildren;
  LoadExplorer(tv5, node, GetFullPath(node, '\'), ['.jssprj'], 2)
end;

procedure THTMLLevEditor.lbl31Click(Sender: TObject);
begin
  die
end;

procedure THTMLLevEditor.lbl33Click(Sender: TObject);
begin
  stbcntrl1.TabIndex := 1;
  stbcntrl1Change(nil)
end;

procedure THTMLLevEditor.cbb1Change(Sender: TObject);
const
  lang: array [0..3] of TLanguage = (plRu, plEn, plIt, plFr);
begin
  Translateall(lang[cbb1.itemindex]);
end;

end.


