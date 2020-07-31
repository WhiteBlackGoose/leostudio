unit lbc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sTreeView, mc_utils, SynEdit, SynHighlighterJScript, stdctrls;

type
  TForm23 = class(TForm)
    tv1: TsTreeView;
    procedure FormActivate(Sender: TObject);
    procedure tv1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form23: TForm23;
  edit: TSynEdit = nil;
implementation
uses
  unit1;
{$R *.dfm}

procedure TForm23.FormActivate(Sender: TObject);
var
  i: integer;
  a: TStringList;
begin
  tv1.Items.Clear;
  a := TStringList.create;
  a.text := getfilesfrom(getpath + 'LaM');
  if a.Text <> '' then
    for i := 0 to a.count - 1 do
      if fileexists(a[i]) then
        tv1.Items.Add(nil, extractfilename(stddelimiter(a[i])));
  a.free;
  edit.Free;
  edit := TSynEdit.Create(form23);
  edit.parent := form23;
  edit.Align := alclient;
  edit.Gutter.ShowLineNumbers := true;
  edit.Gutter.Color := htmlleveditor.mmofg.Gutter.Color;
  edit.Gutter.font := htmlleveditor.mmofg.Gutter.font;
  edit.Highlighter := htmlleveditor.mmofg.Highlighter;
  edit.Font := htmlleveditor.mmofg.Font;
  edit.color := htmlleveditor.mmofg.Color;
  edit.BorderStyle := bsNone;
  edit.ScrollBars := ssNone;
  edit.ReadOnly := true;
end;

procedure TForm23.tv1Click(Sender: TObject);
begin
  if tv1.Selected <> nil then
    edit.Lines.LoadFromFile(getpath + 'LaM\' + tv1.Selected.Text);
end;

end.
