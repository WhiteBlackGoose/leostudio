unit npr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sDialogs, Buttons, sSpeedButton, sLabel, acPNG, ExtCtrls,
  acImage, StdCtrls, sPanel, sEdit, mc_utils, sBitBtn, acPathDialog;

type
  TForm18 = class(TForm)
    edt1: TsEdit;
    spnl1: TsPanel;
    lbl1: TsLabelFX;
    img1: TsImage;
    lbl2: TsLabel;
    btn1: TsSpeedButton;
    dlg1: TsSaveDialog;
    edt2: TsEdit;
    lbl3: TsLabel;
    edt3: TsEdit;
    lbl4: TsLabel;
    sbtbtn1: TsBitBtn;
    sbtbtn2: TsBitBtn;
    dlg2: TsPathDialog;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure sbtbtn1Click(Sender: TObject);
    procedure sbtbtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function CreateNewProject: boolean;
  end;

var
  Form18: TForm18;
  res: boolean;
implementation
uses
  unit1, ld_a;
{$R *.dfm}

function TForm18.CreateNewProject: boolean;
begin
  res := false;
  showmodal;
  result := res;
end;

procedure TForm18.FormCreate(Sender: TObject);
var
  i: integer;
begin
  lbl1.caption := Project_name;
  i := 1;
  while Directoryexists(stdDelimiter('C:/Users/' + GetUser + '/Documents/Projects/Project' + inttostr(i) + '/')) do
    inc(i);
  edt1.text := 'C:/Users/' + GetUser + '/Documents/Projects/Project' + inttostr(i) + '/';
  edt3.text := 'Project' + inttostr(i)
end;

procedure TForm18.btn1Click(Sender: TObject);
begin
  if dlg2.Execute then
    edt1.text := (dlg2.Path);
end;                                            

procedure TForm18.sbtbtn1Click(Sender: TObject);
begin
  if edt1.text = '' then
  begin
    RedWhiteEdtWarning(edt1, clred, 150);
    exit;
  end;
  if edt2.text = '' then
  begin
    RedWhiteEdtWarning(edt2, clred, 150);
    exit;
  end;
  if edt3.text = '' then
  begin
    RedWhiteEdtWarning(edt3, clred, 150);
    exit;
  end;
  if edt1.Text[length(edt1.text)] <> '/' then
    edt1.Text := edt1.Text + '/';
  ForceDirectories(stdDelimiter(edt1.text));
  clearproject;
  createfile(edt1.text + edt3.text + '.' + User_Prj_ext);
  adres := edt1.text + edt3.text + '.' + User_Prj_ext;
  ACTIVE_PAGE := NewWindow(edt2.text);
  saveproject(adres);
  ACtiveObjInsp;
  recreatevis;
  res := true;
  CURRENT_PROJECT.ExeName := ExtractFileTitle(adres);
  close;
end;

procedure TForm18.sbtbtn2Click(Sender: TObject);
begin
  close
end;

procedure TForm18.FormActivate(Sender: TObject);
begin
  if instruction then
  begin
    SlowCursorMove(curpos.x, curpos.y, left + sbtbtn1.left + 45, top + sbtbtn1.top + 35, 4);
    mouseclick(curpos.x, curpos.y);
  end;
end;

procedure TForm18.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ProjectCreated := true;
end;

end.
