unit st;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sPageControl, sDialogs, Buttons, sSpeedButton,
  StdCtrls, sLabel, sEdit, sGroupBox, sBitBtn, sTabControl, ExtCtrls,
  acImage, mc_utils, sComboBox;

type
  TForm15 = class(TForm)
    pgc1: TsPageControl;
    stbsht1: TsTabSheet;
    grp1: TsGroupBox;
    edt1: TsEdit;
    lbl1: TsLabel;
    grp2: TsGroupBox;
    edt2: TsEdit;
    lbl2: TsLabel;
    btn1: TsSpeedButton;
    dlg1: TsOpenDialog;
    sbtbtn1: TsBitBtn;
    stbsht2: TsTabSheet;
    stbcntrl1: TsTabControl;
    img1: TsImage;
    grp3: TsGroupBox;
    lbl3: TsLabel;
    lbl4: TsLabel;
    lbl5: TsLabel;
    lbl6: TsLabel;
    lbl7: TsLabel;
    lbl8: TsLabel;
    lbl9: TsLabel;
    edt3: TsEdit;
    edt4: TsEdit;
    edt5: TsEdit;
    procedure btn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edt3Change(Sender: TObject);
    procedure edt4Change(Sender: TObject);
    procedure edt5Change(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure edt2Change(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure stbcntrl1Change(Sender: TObject);
    procedure stbcntrl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure sbtbtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation
uses
  unit1;
{$R *.dfm}

procedure TForm15.btn1Click(Sender: TObject);
begin
  if dlg1.Execute then
    edt2.Text := dlg1.FileName
end;

procedure TForm15.FormActivate(Sender: TObject);
begin
  edt1.text := CURRENT_PROJECT.ExeName;
  edt2.text := CURRENT_PROJECT.Icon;
  if length(CURRENT_PROJECT.HConstructor) > 0 then
  begin
    edt3.text := CURRENT_PROJECT.HConstructor[0].HtmlPaste;
    edt4.text := CURRENT_PROJECT.HConstructor[0].headPaste;
    edt5.text := CURRENT_PROJECT.HConstructor[0].bodyPaste;
  end;
  //stbcntrl1.Tabs.Text := 'aaa' + #13 + 'bbb'
end;

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CURRENT_PROJECT.ExeName := edt1.text;
  CURRENT_PROJECT.Icon := edt2.text;
end;

procedure TForm15.FormCreate(Sender: TObject);
begin
  pgc1.ActivePageIndex := 0
end;

procedure TForm15.edt3Change(Sender: TObject);
begin
  if stbcntrl1.TabIndex > 0 then
    CURRENT_PROJECT.HConstructor[stbcntrl1.TabIndex].HtmlPaste := edt3.text;
end;

procedure TForm15.edt4Change(Sender: TObject);
begin
  if stbcntrl1.TabIndex > 0 then
    CURRENT_PROJECT.HConstructor[stbcntrl1.TabIndex].HeadPaste := edt4.text;
end;

procedure TForm15.edt5Change(Sender: TObject);
begin
  if stbcntrl1.TabIndex > 0 then
    CURRENT_PROJECT.HConstructor[stbcntrl1.TabIndex].BodyPaste := edt5.text;
end;

procedure TForm15.edt1Change(Sender: TObject);
begin
  if edt1.text <> '' then
    CURRENT_PROJECT.ExeName := edt1.text
  else
    RedWhiteEdtWarning(edt1, clred, 150)
end;

procedure TForm15.edt2Change(Sender: TObject);
begin
  if fileexists(edt2.text) then
  begin
    CURRENT_PROJECT.Icon := edt2.text;
    img1.Picture.LoadFromFile(edt2.text);
  end
end;

procedure TForm15.pgc1Change(Sender: TObject);
begin
  self.stbcntrl1.Visible := true;
  refresh;
  repaint;
  application.ProcessMessages;
  realign;
end;

procedure TForm15.stbcntrl1Change(Sender: TObject);
begin
  if stbcntrl1.TabIndex = -1 then
    exit;
  edt3.text := CURRENT_PROJECT.HConstructor[stbcntrl1.TabIndex].HtmlPaste;
  edt4.text := CURRENT_PROJECT.HConstructor[stbcntrl1.TabIndex].headpaste;
  edt5.text := CURRENT_PROJECT.HConstructor[stbcntrl1.TabIndex].bodypaste;
end;

procedure TForm15.stbcntrl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if stbcntrl1.TabIndex = -1 then
    exit;
  CURRENT_PROJECT.HConstructor[stbcntrl1.TabIndex].HtmlPaste := edt3.text;
  CURRENT_PROJECT.HConstructor[stbcntrl1.TabIndex].headpaste := edt4.text;
  CURRENT_PROJECT.HConstructor[stbcntrl1.TabIndex].bodypaste := edt5.text;
end;

procedure TForm15.sbtbtn1Click(Sender: TObject);
begin
  close;
  nullobj.b := true;
  stbcntrl1Changing(nil, nullobj.b);
end;

end.
