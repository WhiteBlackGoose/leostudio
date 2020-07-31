unit ptrns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, buttons, StdCtrls, inifiles;

type
  TForm5 = class(TForm)
    Timer1: TTimer;
    pnl1: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TPattern = class(TPanel)
    preview: TImage;
    captionOf: TLabel;
    but, oib, IE: TSpeedButton;
  public
    text: string;
    num: integer;
    pathOf: string;
    procedure Click(sender: TObject);
    procedure Open(sender: TObject);
    procedure OpenIE(sender: TObject);
    (*
    procedure down(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure up(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);*)
    constructor create(path: string; owner: TWinControl);
    //procedure repos;
  end;

var
  Form5: TForm5;
  pats: array of TPattern;
implementation
uses
  unit1;
{$R *.dfm}

constructor TPattern.create(path: string; owner: TWinControl);
  function LoadIni(sect, vr, path: string): string;
  var
    ini: TIniFile;
  begin
    ini := TIniFile.Create(path);
    result := ini.ReadString(sect, vr, '')
  end;
const
  WID = 300;
  HEI = 300;
  FONT_NAME = 'Comic Sans MS';
  Q_TOP = 17;
var
  f: TStringList;
begin
  inherited create(owner);
  self.Parent := owner;
  width := WID;
  Height := HEI - 60;
  color := clInactiveBorder;
  pathof := path;


  preview := TImage.Create(self);
  preview.Parent := self;
  if fileexists(path + 'preview.bmp') then
    preview.Picture.LoadFromFile(path + 'preview.bmp');
  preview.Width := round(WID / 100 * 90);
  preview.Left := (WID - preview.Width) div 2;
  preview.Height := preview.Width div 2;
  preview.Top := hei - preview.Height - 15 - 60 - Q_TOP*2;
  preview.Visible := true;
  preview.Stretch := true;

  but := TSpeedButton.create(self);
  but.Parent := self;
  but.Top := preview.Top + preview.Height + 20 - Q_TOP;
  but.Height := 30;
  but.Width := 75;
  but.Caption := 'USE';
  but.Flat := true;
  but.OnClick := Click;
  but.Visible := true;
  but.Left := (WID - but.Width) div 2 + 75;
  but.Font.Name := FONT_NAME;
  but.Font.Style := [fsBold];

  oib := TSpeedButton.create(self);
  oib.Parent := self;
  oib.Top := preview.Top + preview.Height + 20 - Q_TOP;
  oib.Height := 30;
  oib.Width := 75;
  oib.Caption := 'SEE E. G.';
  oib.Font.Name := FONT_NAME;
  oib.Flat := true;
  oib.OnClick := Open;
  oib.Visible := true;
  oib.Left := (WID - oib.Width) div 2 - 75;
  oib.Font.Style := [fsBold];

  IE := TSpeedButton.create(self);
  IE.Parent := self;
  IE.Top := preview.Top + preview.Height + 20 - Q_TOP;
  IE.Height := 30;
  IE.Width := 75;
  IE.Caption := 'SEE IN IE';
  IE.Font.Name := FONT_NAME;
  IE.Flat := true;
  IE.OnClick := OpenIE;
  IE.Visible := true;
  IE.Left := (WID - IE.Width) div 2;
  IE.Font.Style := [fsBold];

  but.ShowHint := true;
  oib.ShowHint := true;
  ie.ShowHint:= true;

  but.Hint := 'Paste the pattern to your project';
  oib.Hint := 'Show the example in Google Chrome';
  IE.Hint := 'Show the example in Interner Explorer';

  captionOf := TLabel.create(self);
  captionof.Parent := self;
  captionof.Caption := LoadIni('info', 'name', path + 'info.ini');
  captionOf.Font.Size := 16;
  captionOf.Left := (WID - captionof.Width) div 2;
  captionOf.Top := 24 - Q_TOP;
  captionOf.Font.Name := FONT_NAME;

  f := TStringList.Create;
  f.LoadFromFile(path + 'pattern.html');
  text := f.Text;
  f.Free
end;




procedure TPattern.Click(sender: TObject);
begin
  form5.Close;
  HTMLLevEditor.mmofg.text := text;
end;


procedure TPattern.Open(sender: TObject);
begin
  Start(pathof+'pattern.html', 2)
end;

procedure TPattern.OpenIE(sender: TObject);
begin
  Start(pathof+'pattern.html', 4)
end;


{The class's declaring methods ended}



procedure TForm5.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled := false;
  //if not visible then showmodal
end;

function CountAllFolders(Path: string): integer;
    var
      sRec: TSearchRec;
      isFound: boolean;

  begin
    result := 0;
    isFound := FindFirst( Path + '\*.*', faAnyFile, sRec ) = 0;
    while isFound do
    begin
      if ( sRec.Name <> '.' ) and ( sRec.Name <> '..' ) then
      begin
        if (( sRec.Attr and faDirectory ) = faDirectory) then
        begin
          inc(result);
        end;
      end;
      Application.ProcessMessages;
      isFound := FindNext( sRec ) = 0;

    end;
    FindClose( sRec );
   
  end;

procedure TForm5.FormShow(Sender: TObject);
const
  INTERVAL = 20;
var
  fol: integer;
  i, j, kil: integer;
  DefPath: string;
  uy: integer;
begin
  clientwidth := INTERVAL * 2 + 300 * 3;
  clientheight := INTERVAL + 300 * 2;
  uy := 0;
  DefPath := EXtractFilePath(application.ExeName) + 'pat/';

  for i := 0 to pgc1.PageCount - 1 do
  begin
    fol := CountAllFolders(DefPath + pgc1.Pages[i].Caption);
    for j := 1 to fol do
    begin
      inc(uy);
      setlength(pats, uy);
      pats[uy-1] := TPattern.create(DefPath + pgc1.Pages[i].Caption + '/' + inttostr(j) + '/', pgc1.Pages[i]);
      kil := j mod 3;
      if kil = 0 then kil := 3;
      pats[uy-1].Left := (kil - 1) * (300 + INTERVAL);
      pats[uy-1].Top := ((j-1) div 3) * (300 + INTERVAL);
    end;
  end;
  left := (screen.Width - width) div 2;
  top := (screen.height - height) div 2;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  for i := 0 to high(pats) do
  begin
    pats[i].preview.Free;
    pats[i].captionOf.Free;
    pats[i].Free
  end;

end;

end.
