unit K;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sDialogs, sSkinManager, StdCtrls, sLabel, sEdit, Buttons,
  sSpeedButton, sBitBtn, mc_utils;

type
  TForm1 = class(TForm)
    sbtbtn2: TsBitBtn;
    btn2: TsSpeedButton;
    btn1: TsSpeedButton;
    edt1: TsEdit;
    edt2: TsEdit;
    sbtbtn1: TsBitBtn;
    lbl1: TsLabel;
    lbl2: TsLabel;
    sknmngr1: TsSkinManager;
    dlg2: TsOpenDialog;
    dlg1: TsOpenDialog;
    edt3: TsEdit;
    lbl3: TsLabel;
    edt4: TsEdit;
    lbl4: TsLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure sbtbtn2Click(Sender: TObject);
    procedure sbtbtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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

procedure TForm1.sbtbtn2Click(Sender: TObject);
begin
  close
end;

procedure TForm1.sbtbtn1Click(Sender: TObject);
var
  s, cap, pth: string;
  f: textfile;
begin
  cap := extractfilecaption(extractfilename(edt1.text));
  pth := ExtractFilePath(edt1.text) + cap;
  copyfile(PAnsiChar(GetPath + '..\Comiler.exe'), PAnsiChar(pth + '.exe'), false);
  s := MOveChrCode(textopen(edt1.text), 1);
  s := '**********' + chr(strtoint(edt4.text) div 256) + chr(strtoint(edt4.text) - strtoint(edt4.text) div 256 * 256) + chr(strtoint(edt3.text) div 256) + chr(strtoint(edt3.text) - strtoint(edt3.text) div 256 * 256) + s;
  if edt2.text <> '' then
  begin
    textsave('[FILENAMES]' + #13#10 +
             'Exe="' + pth + '.exe"' + #13#10 +
             'SaveAs="' + pth + '.exe"' + #13#10 +
             '[COMMANDS]' + #13#10 +
             '-addoverwrite "' + edt2.text + '", ICONGROUP,MAINICON,0', getpath + 'tempic.ini');
    cmd('"' + GetPath + '..\RHS\ResourceHacker.exe" -script "' + getpath + 'tempic.ini"');
  end;
  RenameFile(pth + '.exe', pth + '.txt');
  assignfile(f, pth + '.txt');
  append(f);
  write(f, s);
  closefile(f);
  //textsave(textopen(pth + '.txt') + s, pth + '.txt');
  deletefile(pth + '.exe');
  RenameFile(pth + '.txt', pth + '.exe');
end;

end.
