unit hall;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls;

type
  TForm10 = class(TForm)
    tv1: TTreeView;
    pnl1: TPanel;
    procedure tv1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tv1KeyPress(Sender: TObject; var Key: Char);
    procedure tv1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
function Hint_pasted: boolean;
var
  Form10: TForm10;
  res: boolean;
implementation
uses
  unit1;
{$R *.dfm}

procedure TForm10.tv1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then
  begin
    res := false;
    close;
  end;
  if key = 13 then
  begin
    HTMLLevEditor.insertBlock('<' + tv1.Selected.Text + '>', '</' + tv1.Selected.text + '>', '');
    res := true;
    close;

  end;
end;
                               
procedure TForm10.FormShow(Sender: TObject);
begin
  tv1.Selected := tv1.Items[0]
end;

procedure TForm10.FormCreate(Sender: TObject);
var
  i, j: integer;
  s: TTreeNode;
  procedure compare(item1, item2: TTreeNode);
  var
    i: integer;
    continue: boolean;
    t: string;
  const
    ENG = 'abcdefghijklmnopqrstuvwxyz0123456789';
  begin
    continue := true;
    i := 1;
    while continue and (length(item1.Text) >= i) and (length(item2.Text) >= i) do
      if pos(item1.Text[i], ENG) <> pos(item2.Text[i], ENG) then
      begin
        if pos(item1.Text[i], ENG) > pos(item2.Text[i], ENG) then
        begin
          t := item1.Text;
          item1.Text := item2.Text;
          item2.Text := t;
        end;
        continue := false;
      end
      else
        inc(i) 
  end;
begin
  for i := 0 to tv1.Items.Count - 1 do
    for j := i + 1 to tv1.Items.Count - 1 do
      compare(tv1.Items[i], tv1.Items[j]);
end;

procedure TForm10.tv1KeyPress(Sender: TObject; var Key: Char);
var
  i: integer;
  ut: char;
  function count(k: char): integer;
  var
    i: integer;
  begin
    result := 0;
    for i := 0 to tv1.Items.Count - 1 do
      if tv1.Items[i].Text[1] = k then
        inc(result)
  end;
begin
  i := 0;
  ut := key;
  //key := #0;
  if count(ut) = 0 then tv1.Selected := tv1.Items[0];
  if tv1.Selected.Text[1] <> key then
  begin
    for i := 0 to tv1.Items.Count - 1 do
      if tv1.Items[i].Text[1] = ut then
      begin
        tv1.Selected := tv1.Items[i];
        exit;
      end;
    exit;
  end;
  for i := tv1.Selected.Index + 0 to tv1.Items.Count - 1 do
    if tv1.Items[i].Text[1] = ut then
    begin
      tv1.Selected := tv1.Items[i];
      exit;
    end;
  for i := 0 to tv1.Selected.Index do
    if tv1.Items[i].Text[1] = ut then
    begin
      tv1.Selected := tv1.Items[i];
      exit;
    end;

end;

procedure TForm10.tv1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 66) or (key = 86) then tv1.SetFocus
end;

function Hint_pasted: boolean;
begin
  Form10.ShowModal;
  result := res
end;

end.
