unit smAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls;

type
  TForm9 = class(TForm)
    t1: TLabel;
    tv1: TTreeView;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    d1: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure tv1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure add(s: string);
    procedure ShowModalIn(obj, caption: string; showIt: boolean = true);
  end;
  procedure replace(from, to1: string);
var
  Form9: TForm9;
  changingIs: TTreeNode;
  ObjAll: string;
  TheMainCAp: string;
implementation
uses
  unit1, InChass, setcol;
{$R *.dfm}

procedure TForm9.ShowModalIn(obj, caption: string; showIt: boolean = true);
var
  text, s: string;
begin
  ObjAll := obj;
  TheMainCap := caption;
  tv1.Items.Clear;
  t1.Caption := caption;
  text := lowercase(htmlleveditor.mmofg.Text);
  text := stringreplace(text, obj + ' = "', obj + '="', [rfreplaceall]);
  text := stringreplace(text, obj + '= "', obj + '="', [rfreplaceall]);
  text := stringreplace(text, obj + ' ="', obj + '="', [rfreplaceall]);

  while pos(obj + '="', text) <> 0 do
  begin
    s := copy(text, pos(obj + '="', text) + length(Obj) + 2, length(text));
    text := s;
    s := copy(s, 1, pos('"', s)-1);
    if s <> '' then add(s);
  end;

  if showit then
    showmodal
end;

procedure TForm9.FormShow(Sender: TObject);
begin
  t1.Left := (clientwidth - t1.Width) div 2;
end;

procedure TForm9.add(s: string);
var
  s1: TTreeNode;
begin
  s1 := TTreeNode.Create(tv1.Items);
  s1.Text := s;
  tv1.Items.Add(s1, s)
end;

procedure TForm9.btn2Click(Sender: TObject);
begin
  if tv1.Selected <> nil then
  begin
    if d1.Execute then
      replace(tv1.Selected.Text, d1.FileName);
  end;
  ShowModalIn(ObjAll, TheMainCap, false);
end;

procedure TForm9.btn3Click(Sender: TObject);
begin
  if tv1.Selected <> nil then
  begin
    replace(tv1.Selected.Text, '')
  end;
  ShowModalIn(ObjAll, TheMainCap, false);
end;

procedure TForm9.tv1DblClick(Sender: TObject);
begin
  if tv1.Selected <> nil then
  begin
    replace(tv1.Selected.Text, form3.showdialog('Input new path'))
  end;
  ShowModalIn(ObjAll, TheMainCap, false);
end;

procedure replace(from, to1: string);
var
  s: string;
begin
  createfile(PansiChar(filepath + 'tmp'), 0, 0, 0, 0, 0, 0);
  htmlleveditor.mmofg.Lines.SaveToFile(filepath + 'tmp');
  s := text_from_file(filepath + 'tmp');
  htmlleveditor.mmofg.Text := stringreplace(s, Form9.tv1.Selected.Text, Form9.d1.FileName, []);
  deletefile(filepath + 'tmp');
end;

end.
