unit sgdsgdsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sDialogs, Buttons, sSpeedButton, sSkinManager, StdCtrls, sEdit,
  sBitBtn, sLabel, mc_utils;
const
  User_Prj_ext = 'jssprj';
type
  TForm1 = class(TForm)
    edt1: TsEdit;
    sknmngr1: TsSkinManager;
    btn1: TsSpeedButton;
    dlg1: TsOpenDialog;
    sbtbtn1: TsBitBtn;
    sbtbtn2: TsBitBtn;
    edt2: TsEdit;
    btn2: TsSpeedButton;
    lbl1: TsLabel;
    lbl2: TsLabel;
    dlg2: TsOpenDialog;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure sbtbtn1Click(Sender: TObject);
    procedure sbtbtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  HConstructor: record
                  tag: string;
                  Objects: array of record
                                      NotDestroyed: boolean;
                                      Properties: Dict;
                                    end;
                  CellWidth: integer;
                end;
  sc: string;
  userform: TPlate;
implementation
{$R *.dfm}

procedure OpenProject(path: string);
var
  txt: TStringList;
  stack: TStringList;
  i, j: integer;
  adres: string;
begin
  try
   // with Open, mmofg do
      begin
        adres := path;
        txt := TStringList.create;
        txt.LoadFromFile(adres);
        if copy(txt.text, 1, length(User_Prj_ext)) <> User_Prj_ext then
        begin
          Showmessage('File is corrupted');
          exit;
        end;
        txt.text := copy(txt.text, 7, length(txt.text));
        if pos('||', txt.text) <> 0 then
        begin
          txt.text := copy(txt.Text, 3, length(txt.text));
          if pos('||', txt.text) = 0 then
          begin
            Showmessage('File is corrupted');
            exit;
          end;
          txt.text := copy(txt.text, pos('||', txt.text) + 2, length(txt.text));
        end;
        txt.text := MoveChrCode(txt.text, -1);
        userform.width := strtoint(txt[0]);
        userform.height := strtoint(txt[1]);
        txt.Delete(0);
        txt.Delete(0);

        setlength(HConstructor.Objects, 0);
        sc := copy(Copy(txt.text, pos('******', txt.text) + 6, length(txt.text)), 3, length(Copy(txt.text, pos('******', txt.text) + 6, length(txt.text))) - 3);
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
          HConstructor.Objects[high(HConstructor.Objects)].NotDestroyed := true;
          for i := 0 to Reven(stack.Count - 1) div 2 - 1 do
            HConstructor.Objects[high(HConstructor.Objects)].Properties[stack[i * 2]] := stack[i * 2 + 1];
        end;
        stack.free;
        txt.Free;
      end;
  except
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
    if HConstructor.objects[i].NotDestroyed then
    begin
      Objects[i] := dict.glue([HConstructor.Objects[i].Properties]);
      //Objects[i]['Left'] := inttostr(round(VisS_S[i].Left / HTMLLevEditor.spnl3.width * 100)) + '%';
      //Objects[i]['Top'] := inttostr(round(VisS_S[i].top / HTMLLevEditor.spnl3.height * 100)) + '%';
      Document := Document + HTML_DICT_TO_TAG(Objects[i], true);
      if EndTag(Objects[i]['Tag']) then
        Document := Document + Objects[i]['Caption'] + '</' + Objects[i]['Tag'] + '>';
      Document := Document + #13#10;
      Objects[i].free;
    end;
  end;
  Document := Document + '<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>' + #13#10 + '<script>' + #13#10 + sc + #13#10 + '</script>';
  Document := Document + #13#10 + '</body></html>';
  result := Document
end;

procedure Compile(adres: string; iconadres: string = '');
var
  s: string;
  cap: string;
  f: textfile;
  pth: string;
  i: integer;
  ICO: string;
begin
  try
    cap := extractfilecaption(extractfilename(adres));
    pth := ExtractFilePath(adres) + cap;

    copyfile(PAnsiChar(GetPath + '..\Comiler.exe'), PAnsiChar(pth + '.exe'), false);
    //if IconPath[16] <> '' then
      //ChangeIcon(pth + '.exe', IconPath[16], 'MAINICON', 16);
    if iconadres <> '' then
    begin
      textsave('[FILENAMES]' + #13#10 +
               'Exe="' + pth + '.exe"' + #13#10 +
               'SaveAs="' + pth + '.exe"' + #13#10 +
               '[COMMANDS]' + #13#10 +
               '-addoverwrite "' + iconadres + '", ICONGROUP,MAINICON,0', getpath + 'tempic.ini');
      cmd('"' + GetPath + '..\RHS\ResourceHacker.exe" -script "' + getpath + 'tempic.ini"');
    end;
    RenameFile(pth + '.exe', pth + '.txt');

    s := MOveChrCode(CompileDigFormatToHtml, 1);
    s := '**********' + chr(UserForm.width div 256) + chr(UserForm.width - UserForm.width div 256 * 256) + chr(UserForm.height div 256) + chr(UserForm.height - UserForm.height div 256 * 256) + s;
    assignfile(f, pth + '.txt');
    append(f);
    write(f, s);
    closefile(f);
    //textsave(textopen(pth + '.txt') + s, pth + '.txt');
    deletefile(pth + '.exe');
    RenameFile(pth + '.txt', pth + '.exe');
  except
    Showmessage('Executing error.');
    deletefile(getpath + 'tempic.ini');
    form1.close();
  end;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  dlg1.Execute;
  edt1.text := dlg1.FileName
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  dlg2.Execute;
  edt2.text := dlg2.FileName
end;

procedure TForm1.sbtbtn1Click(Sender: TObject);
begin
  openproject(edt1.text);
  Compile(edt1.text, edt2.text);
end;

procedure TForm1.sbtbtn2Click(Sender: TObject);
begin
  close
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  deletefile(getpath + 'tempic.ini');
end;

end.
