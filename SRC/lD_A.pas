unit lD_A;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, ExtCtrls, acImage, sPanel, Buttons, sSpeedButton,
  StdCtrls, sLabel, mc_utils, sDialogs;

type
  TForm17 = class(TForm)
    spnl1: TsPanel;
    img1: TsImage;
    lbl1: TsLabelFX;
    btn1: TsSpeedButton;
    btn2: TsSpeedButton;
    btn3: TsSpeedButton;
    dlg1: TsOpenDialog;
    d1: TOpenDialog;
    btn4: TsSpeedButton;
    btn5: TsSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;
  res: boolean;
  instruction: boolean = false;
var
  can: TCanvas = nil;
implementation
uses
  unit1, npr, HW;
{$R *.dfm}

procedure TForm17.FormCreate(Sender: TObject);
begin
  res := false;
  if directoryexists('C:\users\' + getuser + '\documents\projects\') then
    d1.InitialDir := 'C:\users\' + getuser + '\documents\projects\';
  lbl1.Caption := Project_name;
  //center(btn1, self, [pHoriz]);
  //center(btn2, self, [pHoriz]);
  //center(btn3, self, [pHoriz]);
  btn4.Enabled := fileexists(copy(textopen(getpath + 'pth'), 1, length(textopen(getpath + 'pth')) - 0))
end;

procedure TForm17.btn3Click(Sender: TObject);
begin
  die(true);
  die
end;

procedure TForm17.btn1Click(Sender: TObject);
var
  i: integer;
begin
  i := 1;
  while Directoryexists(stdDelimiter('C:/Users/' + GetUser + '/Documents/Projects/Project' + inttostr(i) + '/')) do
    inc(i);
  form18.edt1.text := 'C:/Users/' + GetUser + '/Documents/Projects/Project' + inttostr(i) + '/';
  application.ProcessMessages;
  if form18.CreateNewProject then
  begin
    res := true;
    close
  end;
end;

procedure TForm17.btn2Click(Sender: TObject);
begin
  if d1.Execute then
  begin
    res := true;
    close;
    htmlleveditor.OpenProject(d1.FileName);
  end;
end;

procedure TForm17.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not res then
    die(true)
end;

procedure TForm17.btn4Click(Sender: TObject);
begin
  res := true;
  close;
  htmlleveditor.openproject(copy(textopen(getpath + 'pth'), 1, length(textopen(getpath + 'pth')) - 0));
end;

procedure TForm17.btn5Click(Sender: TObject);
begin
  //form21.show
  instruction := true;
  formactivate(nil)
end;

procedure TForm17.FormActivate(Sender: TObject);
begin
  if instruction then
  begin
    SlowCursorMove(curpos.x, curpos.y, left + width div 2, spnl1.height + top + 40, 4);
    mouseclick(curpos.x, curpos.y);
  end;
end;

end.
