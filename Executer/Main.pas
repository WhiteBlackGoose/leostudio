unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cefvcl, mc_utils;
const
  User_Prj_ext = 'jssprj';
type
  TForm1 = class(TForm)
    chrm1: TChromium;
    chrmsr1: TChromiumOSR;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure OpenProject(path: string);
  end;

var
  Form1: TForm1;
  Mmofg: TStringList;
  HConstructor: record
                  tag: string;
                  Objects: array of record
                                      Properties: Dict;
                                    end;
                  CellWidth: integer;
                end;
implementation

{$R *.dfm}

procedure TForm1.OpenProject(path: string);
var
  txt: TStringList;
  stack: TStringList;
  i, j: integer;
begin
  with mmofg do
    begin
      txt := TStringList.create;
      txt.LoadFromFile(path);
      if copy(txt.text, 1, length(User_Prj_ext)) <> User_Prj_ext then
      begin
        Showmessage('File is corrupted');
        exit;
      end;
      txt.text := copy(txt.text, 7, length(txt.text));
      txt.text := MoveChrCode(txt.text, -1);
      form1.width := strtoint(txt[0]);
      form1.height := strtoint(txt[1]);
      txt.Delete(0);
      txt.Delete(0);
      setlength(HConstructor.Objects, 0);
      mmofg.text := Copy(txt.text, pos('******', txt.text) + 6, length(txt.text));
      txt.text := copy(txt.text, 1, pos('******', txt.text) - 1);
      i := 0;
      j := 0;
      Stack := TStringList.create;
      while pos('****', txt.text) <> 0 do
      begin
        stack.text := copy(txt.text, 1, pos('****', txt.text) - 1);
        if stack.text[1] = #13 then
          stack.Delete(0);
        txt.text := copy(txt.text, pos('****', txt.text) + 4, length(txt.text));
        setlength(HConstructor.Objects, length(HConstructor.Objects) + 1);
        HConstructor.Objects[high(HConstructor.Objects)].Properties := dict.setArray;
        for i := 0 to Reven(stack.Count - 1) div 2 - 1 do
          HConstructor.Objects[high(HConstructor.Objects)].Properties[stack[i * 2]] := stack[i * 2 + 1];
      end;
      stack.free;
      txt.Free;
    end;
end;

function CompileDigFormatToHtml: string;
var
  i: integer;
  Objects: array of dict;
  Document: string;
begin
  Document := '<html><body>' + #13#10;
  setlength(Objects, length(HConstructor.Objects));
  for i := 0 to high(Objects) do
  begin
    Objects[i] := dict.glue([HConstructor.Objects[i].Properties]);
    Document := Document + HTML_DICT_TO_TAG(Objects[i], true);
    if EndTag(Objects[i]['Tag']) then
      Document := Document + Objects[i]['Caption'] + '</' + Objects[i]['Tag'] + '>';
    Document := Document + #13#10;
    Objects[i].free;
  end;
  Document := Document + '<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>' + #13#10 + '<script>' + #13#10 + mmofg.Text + #13#10 + '</script>';
  Document := Document + #13#10 + '</body></html>';
  result := Document
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  a: string;
  b: string;
begin
  Mmofg := TStringList.create;
  a := openwith;
  if a = '' then
  begin
    application.Terminate;
    exit;
  end;
  if a[1] = '|' then
  begin
    a := copy(a, 2, length(a));
    b := a;
    b := copy(b, pos('|', b) + 1, length(b));
    clientwidth := strtoint(copy(b, 1, pos('|', b) - 1));
    clientheight := strtoint(copy(b, pos('|', b) + 1, length(b)));
    a := copy(a, 1, pos('|', a) - 1);
  end;
  OpenProject(a);
  textsave(CompileDigFormatToHtml, getpath + '~.html');
  chrm1.Load(getpath + '~.html');
  caption := EXtractFileName(ExtractFileCaption(a))
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if fileexists(getpath + '~html') then
    deletefile(getpath + '~html')
end;

end.
