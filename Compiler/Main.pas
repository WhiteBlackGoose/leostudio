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
    procedure wb1BeforeNavigate2(Sender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    procedure wb1NavigateComplete2(Sender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Pages: array of
         record
           Name: string;
           width, height: integer;
           code: string;
         end;
  GoingTo: string;
implementation

{$R *.dfm}

procedure ShowMessage(a: string; par1: boolean = false);
begin
  //if par1 then
    //dialogs.ShowMessage(a);
end;

function nametoid(name: string): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to high(pages) do
    if lowercase(name) = LowerCase(pages[i].Name) then
    begin
      result := i;
      exit;
    end;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  s, dc: TBytes;
  red: string;
  i, j: integer;
  d, g: boolean;
  FirstTime: boolean;
var
  tmp, iter: integer;
  ALS: string;
begin
  FirstTime := false;
  ALS := GET_GLOBAL_CONST('LS_DELIM');
  setlength(pages, 0);
  wb1.Width := round(screen.width / 1.3);
  wb1.height := round(screen.height / 1.3);
  copyfile(PAnsiChar(application.exename), PAnsiChar(getpath + 'tmp.txt'), true);
  s := binopen(getpath + 'tmp.txt');
  deletefile(PAnsiChar(getpath + 'tmp.txt'));
  g := false;
  for i := 0 to high(s) - length(ALS) do
  begin
    d := true;
    for j := 0 to length(ALS) - 1 do
      if s[i + j] <> ord(ALS[j + 1]) then
      begin
        d := false;
        break;
      end;
    if d then
    begin
      if not FirstTime then
      begin
        FirstTime := true;
        continue;
      end;
      ShowMessage(inttostr(i));
      setlength(dc, length(s) - i - LENGTH(ALS) + 1);
      red := '';
      for j := 0 to high(dc) do
        red := red + chr(s[j + i + LENGTH(ALS)] - 0);
      g := true;
      break;
    end;
  end;
  if g then
  begin
    ShowMessage('Нашел ' + ALS);
    red := MOveChrCode(red, -1);
    ShowMessage('105');
    iter := 1;
    while length(red) > 1 do
    begin
      ShowMessage('1 ' + inttostr(iter));
      setlength(pages, length(pages) + 1);
      ShowMessage('2 ' + inttostr(iter));
      ShowMessage(inttostr(ord(red[1])));
      ShowMessage(Copy(red, 1, 100));
      pages[high(pages)].Name := copy(red, 2, ord(red[1]));
      ShowMessage('3 ' + inttostr(iter));
      red := copy(red, length(pages[high(pages)].Name) + 2, length(red));
      ShowMessage('4 ' + inttostr(iter));
      pages[high(pages)].width := BytesToValue(StringToBytes(red[1] + red[2]));
      pages[high(pages)].height := BytesToValue(StringToBytes(red[3] + red[4]));
      ShowMessage('5 ' + inttostr(iter) + ' ' + inttostr(pages[high(pages)].height));
      tmp := BytesToValue(StringToBytes(copy(red, 5, 8)));

      ShowMessage('6 ' + inttostr(iter) + ' tmp = ' + inttostr(tmp));
      pages[high(pages)].code := copy(red, 12, tmp);
      ShowMessage('7 ' + inttostr(iter));
      red := copy(red, tmp + 13, length(red));
      ShowMessage('"' + pages[high(pages)].Name + '"');
      ShowMessage('Инит. ' + inttostr(length(pages)) + ' страница: ' + pages[high(pages)].Name);
      inc(iter)
    end;                     
    for i := 0 to high(pages) do
    begin
      ShowMessage('Сохр. в ' + getpath + '~' + Pages[i].name + '.html');
      pages[i].code := copy(pages[i].code, 2, length(pages[i].code)) + '>';
      textsave(pages[i].code, getpath + '~' + Pages[i].name + '.html');
    end;
    ShowMessage('Hye!');
    wb1.Navigate(Pages[0].Name);
  end
  else
    application.Terminate
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  for i := 0 to high(pages) do
    if fileexists(getpath + '~' + (pages[i].name) + '.html') then
      deletefile(getpath + '~' + (pages[i].name) + '.html')
end;

procedure TForm1.wb1BeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var
  s: string;
begin
  if fileexists(url) then
    exit;

end;

procedure TForm1.wb1NavigateComplete2(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  //URL := '/~' + GoingTo + '.html';
  caption := GoingTo;
  if NamEToId(goingto) = -1 then
    exit;
  //ShowMessage('Hey!' + inttostr(pages[NamEToId(goingto)].width), true);
  clientWidth := pages[NamEToId(goingto)].width;
  clientheight := pages[NamEToId(goingto)].height;
  center(form1, ScreenAsControl, [pHoriz, pVert])
end;

end.
