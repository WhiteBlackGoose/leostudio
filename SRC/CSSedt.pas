unit CSSedt;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, ComCtrls, ActnList, Menus, Unit2, ShellAPI,
   Buttons, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP,  MSHTML, OleCtrls, SHDocVw, Urlmon, HyperLinksDecorator, RegExpr, hookcomb,
  cefvcl, cefgui, MOZILLACONTROLLib_TLB, clipbrd;
type
  TTag = class(TPanel)
    cap: TPanel;
    edt: TEdit;

    constructor create;
    procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function fieldfocused: TEdit;
  public
    num: integer;
  end;
const
  ALL_TAGS = 34;
  Tags: array [1..ALL_TAGS, 1..2] of string = (
  ('Tag', 'button'),
  ('Caption', 'Text'),
  ('Left', '0'),
  ('Top', '0'),
  ('Id', '0'),

  ('OnClick', ''),
  ('OnDblClick', ''),
  ('OnChange', ''),
  ('OnFocus', ''),
  ('OnSelect', ''),
  ('OnMouseDown', ''),
  ('OnMouseMove', ''),
  ('OnMouseUp', ''),
  ('Href', ''),
  ('Src', ''),

  ('Color', '#0'),
  ('Background', '#d3d3d3'),
  ('Font-size', '17px'),
  ('Width', '80px'),
  ('Height', '32px'),
  ('Border', ''),
  ('Border-radius', '10px'),
  ('Box-shadow', '5px 5px 5px 0px gray'),
  ('Src', ''),
  ('Align', 'left'),
  ('Display', ''),
  ('Float', ''),
  ('Margin-top', ''),
  ('Margin-bottom', ''),
  ('Margin-left', ''),
  ('Margin-right', ''),
  ('Font', ''),
  ('Outline', 'none'),
  ('Position', 'absolute')
  );
  procedure css_init;
  function getCode: string;
  function GoToField(caption: string): TEdit;
  procedure Draw_css_obj;
  //procedure createfile(path: string);
var
  tag_elem: array [1..ALL_TAGS] of TTag;
  wb1: TChromium;
  wasactive: TEdit;
implementation
uses
  unit1, setcol;
constructor TTag.create;
begin

end;

function TTag.fieldfocused: TEdit;
var
  i: integer;
begin
  result := nil;
  for i := 1 to ALL_TAGS do
    if tag_elem[i].edt.Focused then
    begin
      result := tag_elem[i].edt;
      exit;
    end;
end;

procedure css_init;
var
  i: Word;
begin

end;

procedure Draw_css_obj;
var
  f: word;
begin
  f := 13;
  Tag_elem[1].KeyDown(Tag_elem[1], f, []);
end;

procedure TTag.KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  path: string;
  a: array of string;
  function explode(sep, haystack: string): boolean;
  var
    s: TStringList;
    i: integer;
  begin
    s := TStringList.create;
    s.Text := stringreplace(haystack, sep, #13#10, [rfReplaceAll]);
    setlength(a, s.Count);
    for i := 0 to s.Count - 1 do
      a[i] := s[i];
  end;
  function find(s: string): integer;
  var
    I: integer;
  begin
    for i := 0 to high(a) do
      if s = a[i] then
      begin
        result := i;
        exit;
      end;
    result := -1;
  end;
  function ApplicationUse(fName: string): boolean;
  var
    HFileRes: HFILE;
  begin
    Result := false;
    if not FileExists(fName) then exit;
    HFileRes := CreateFile(pchar(fName), GENERIC_READ or GENERIC_WRITE, 0, nil,
      OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    Result := (HFileRes = INVALID_HANDLE_VALUE);
    if not Result then CloseHandle(HFileRes);
  end;
  function IsFileInUse(FileName: TFileName): Boolean;
  var
   HFileRes: HFILE;
  begin
    Result := False;
    if not FileExists(FileName) then Exit;
    HFileRes := CreateFile(PChar(FileName),
                          GENERIC_READ or GENERIC_WRITE,
                          0,
                          nil,
                          OPEN_EXISTING,
                          FILE_ATTRIBUTE_NORMAL,
                          0);
    Result := (HFileRes = INVALID_HANDLE_VALUE);
    if not Result then
     CloseHandle(HFileRes);
  end;
  function IsOpen(const aFileName : String) : Boolean;
  var
    Hf : Integer;
  begin

    Result := FileExists(aFileName);

    if not Result then Exit;

    
    Hf := FileOpen(aFileName, fmOpenReadWrite or fmShareExclusive);
    Result := Hf = -1;
    if not Result then FileClose(Hf);
  end;
  var
    i: integer;
begin
  if key = 34 then
  begin
    if not fileexists(filepath + 'data/css_edit/' + ((sender as TEdit).parent as TTag).cap.Caption) then
    begin
      if trystrtoint((sender as TEdit).Text, i) then
        (sender as TEdit).Text := inttostr(strtoint((sender as TEdit).Text) + 1)
      else
        (sender as TEdit).Text := '1';
      exit;
    end;
    explode(#13#10, text_from_file(filepath + 'data/css_edit/' + ((sender as TEdit).parent as TTag).cap.Caption));
    if find((sender as TEdit).Text) + 1 > high(a) then
      (sender as TEdit).Text := a[0]
    else
      (sender as TEdit).Text := a[find((sender as TEdit).Text) + 1];
  end;
  if key = 33 then
  begin
    if not fileexists(filepath + 'data/css_edit/' + ((sender as TEdit).parent as TTag).cap.Caption) then
    begin
      if trystrtoint((sender as TEdit).Text, i) then
        (sender as TEdit).Text := inttostr(strtoint((sender as TEdit).Text) - 1)
      else
        (sender as TEdit).Text := '1';
      exit;
    end;
    explode(#13#10, text_from_file(filepath + 'data/css_edit/' + ((sender as TEdit).parent as TTag).cap.Caption));
    if find((sender as TEdit).Text) - 1 < 0 then
      (sender as TEdit).Text := a[high(a)]
    else
      (sender as TEdit).Text := a[find((sender as TEdit).Text) - 1];
  end;
  if key = 13 then
  begin
    path := filePath + '~Chr_NO_ERROR.html';
    createfile(PAnsiChar(path), 0, 0, 0, 0, 0, 0);
    try
      wb1.Load((path));
    except
    end;
  end;
  if key = 40 then
  begin
    if ((sender as TEdit).parent as TTag).num < ALL_TAGS then
      tag_elem[((sender as TEdit).parent as TTag).num + 1].edt.setfocus
    else
      tag_elem[1].edt.setfocus;
  end;
  if key = 38 then
  begin
    if ((sender as TEdit).parent as TTag).num > 1 then
      tag_elem[((sender as TEdit).parent as TTag).num - 1].edt.setfocus
    else
      tag_elem[ALL_TAGS].edt.setfocus;
  end;
end;


function getCode: string;
var
  i: integer;
  a, b: string;
begin
  if tag_elem[1].edt.text = '' then
  begin
    ShowMessage('Fill the Tag field');
    exit;
  end;
  b := '.class_' + tag_elem[1].edt.text + '{';
  a := '<' + tag_elem[1].edt.text + ' style = "';
  for i := 3 to ALL_TAGS do
    if tag_elem[i].edt.Text <> '' then
    begin
      a := a + tag_elem[i].cap.Caption + ': ' + tag_elem[i].edt.Text + '; ';
      b := b + #13#10 + '  ' + tag_elem[i].cap.Caption + ': ' + tag_elem[i].edt.Text + '; ';
    end;
  a := a + '">' + tag_elem[2].edt.text + '</' + tag_elem[1].edt.text + '>';
  b := b + #13#10 + '}' ;
  result := a
end;

function GoToField(caption: string): TEdit;
var
  i: integer;
begin
  for i := 1 to ALL_TAGS do
    if lowercase(tag_elem[i].cap.Caption) = lowercase(caption) then
    begin
      result := tag_elem[i].edt;
      exit;
    end;
  result := nil;
end;

procedure createfile(path: string);
var
  f: file;
  fs: TFileStream;
begin
  (*
  assignfile(f, path);
  rewrite(f);
  closefile(f);*)
  fs := TFileStream.Create(path, fmCreate or fmOpenWrite);
  fs.Write(path, Length(path));
  fs.Free
end;



end.
