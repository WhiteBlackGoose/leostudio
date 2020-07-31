unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, mc_utils;

type
  TForm1 = class(TForm)
    wb1: TWebBrowser;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
var
  s, dc: TBytes;
  red: string;
  i, j: integer;
  d: boolean;
begin
  wb1.Width := round(screen.width / 1.3);
  wb1.height := round(screen.height / 1.3);
  copyfile(PAnsiChar(application.exename), PAnsiChar(getpath + 'tmp.txt'), true);
  s := binopen(getpath + 'tmp.txt');
  deletefile(PAnsiChar(getpath + 'tmp.txt'));
  for i := 0 to high(s) - 10 do
  begin
    d := true;
    for j := 0 to 9 do
      if s[i + j] <> 42 then
      begin
        d := false;
        break;
      end;
    if d then
    begin
      setlength(dc, length(s) - i - 9);
      red := '';
      for j := 0 to high(dc) do
        red := red + chr(s[j + i + 10] - 0);
      break;
    end;
  end;
  if d then
  begin
    caption := ExtractFileCaption(ExtractFileName(Application.ExeName));
    clientwidth := ord(red[1]) * 256 + ord(red[2]);
    clientheight := ord(red[3]) * 256 + ord(red[4]);
    red := MoveChrCode(copy(red, 5, length(red) - 5), -1);
    textsave(red, getpath + '~.html');
    wb1.Navigate(getpath + '~.html');
  end
  else
    application.Terminate
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if fileexists(getpath + '~.html') then
    deletefile(getpath + '~.html')
end;

end.
