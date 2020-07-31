unit Main1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, mc_utils, StdCtrls, Buttons, ExtCtrls, geckobrowser, mshtml;

type
  TForm1 = class(TForm)
    tmr1: TTimer;
    wb1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure wb1BeforeNavigate2(Sender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    procedure tmr1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wb1DocumentComplete(Sender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
  private
    { Private declarations }
  public
    DeAl, en, ext: boolean;
    num: integer;
    canUI: TCanvas;
  end;
procedure act;
procedure Error(src, cause: string; line: integer);
procedure SEND_API_MESSAGE(uril: string; AHAndle: THandle);
var
  Form1: TForm1;
var
  Pages: array of
         record
           Form: TForm1;
           Name: string;
           width, height: integer;
           code: string;
         end;
  AHandle: HWND;
implementation
{$R *.dfm}
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

procedure act;
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
  copyfile(PAnsiChar(application.exename), PAnsiChar(getpath + 'tmp.txt'), true);
  //ShowOkMess;
  s := binopen(getpath + 'tmp.txt');
  //ShowOkMess;
  deletefile(PAnsiChar(getpath + 'tmp.txt'));
  //ShowOkMess;
  //ShowOkMess;
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
    red := MOveChrCode(red, -1);
    iter := 1;
    while length(red) > 1 do
    begin
      setlength(pages, length(pages) + 1);
      pages[high(pages)].Name := copy(red, 2, ord(red[1]));
      //ShowMessage(pages[high(pages)].Name);
      red := copy(red, length(pages[high(pages)].Name) + 2, length(red));
      pages[high(pages)].width := BytesToValue(StringToBytes(red[1] + red[2]));
      pages[high(pages)].height := BytesToValue(StringToBytes(red[3] + red[4]));
      tmp := BytesToValue(StringToBytes(copy(red, 5, 8)));
      pages[high(pages)].code := copy(red, 12, tmp);
      red := copy(red, tmp + 13, length(red));
      inc(iter)
    end;
    for i := 0 to high(pages) do
    begin
      pages[i].code := copy(pages[i].code, 2, length(pages[i].code)) + '>';
      textsave(pages[i].code, getpath + '~' + Pages[i].name + '.html');
    end;
  end
  else
    die(true)
end;

procedure Error(src, cause: string; line: integer);
begin
  MessageDlg('Error by src: ' + #13 + src + #13 + 'in line ' + inttostr(line) + #13 + 'Cause: ' + cause, mtError, [mbOk], 0);
  die;
end;

procedure SEND_API_MESSAGE(uril: string; AHAndle: THandle);
var
  i: integer;
begin
  SendMessage(AHAndle, WM_COPYDATA, -1, 3141);
  for i := 1 to length(uril) do
    SendMessage(AHAndle, WM_COPYDATA, ord(uril[i]), 3141);
  SendMessage(AHAndle, WM_COPYDATA, -1, 3141);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  a: string;
begin
  a := openwith;
  ahandle := 0;
  if a <> '' then
  begin
    //ShowMessage(a);
    if length(a) = 4 then
    begin
      aHANDLE := BytesToValue(StringToBytes(a));
      //Showmessage(inttostr(ahandle));
    end;
  end;
end;

procedure TForm1.wb1BeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var
  i, j, x: integer;
  form, comm, params: string;
  uril: string;
  commands: TStringList;
  victim: TForm1;
  pth: string;
  doc: IHTMLDocument2;
  term: IHTMLWindow2;
  AFile: TStringList;
  scriptdynamicloadingwebbrowserscript: string;
  ElID, func: string;
  DeliValue: OleVariant;
  tmp_A_: string;
  tmp_A_B: integer;
  tmp_A_0: string;
  CurrentDynamicTemp: string;
begin
  if not en then
    exit;
  if not DeAl then
  begin
    DeAl := true;
    exit;
  end;
  if not ext then
  begin
    cancel := true;
    exit;
  end;
  uril := url;
  if fileexists(uril) then
    exit;
  if copy(uril, 1, 3) = 'res' then
    exit;
  //ShowMessage(uril);
  try
    if copy(uril, 1, 7) = 'http://' then
      uril := copy(uril, 8, length(url));
    if uril[length(uril)] = '/' then
      uril := copy(uril, 1, length(uril) - 1);
    //ShowMessage(uril);
  except
    on e: exception do
     // showmessage(e.Message + #13 + uril + #13 + uril[length(uril)])
  end;
  cancel := true;
  SEND_API_MESSAGE(uril, AHandle);
  commands := TStringList.create;
  Commands.text := StringReplace(Uril, ';', #13#10, [rfreplaceall]);
  canUI := TCanvas.Create;
  for i := 0 to commands.Count - 1 do
    if commands[i] <> '' then
      if pos('.', commands[i]) <> 0 then
      begin
        tmp_A_ := stdDelimiter(commands[i]);
        tmp_A_B := pos('(', commands[i]);
        tmp_A_B := RePos('\', copy(commands[i], 1, tmp_A_B));
        tmp_A_ := copy(commands[i], tmp_A_B + 2, length(tmp_A_));
        commands[i] := tmp_A_;
        Form := LowerCase(copy(commands[i], 1, pos('.', commands[i]) - 1));
        comm := (copy(commands[i], pos('.', commands[i]) + 1, length(Commands[i])));
        if nametoid(form) <> -1 then
          victim := pages[nametoid(form)].Form
        else
          Error(uril, 'Form ' + Form + ' not found', i);
        pth := getpath + '~' + form + '.html';
        if (pos('(', comm) * pos(')', comm) = 0) then
          error(uril, 'Required "(...)" in function or method', i);
        if pos(')', comm) < pos('(', comm) then
          error(uril, 'Incorrect request.', i);
        params := copy(comm, pos('(', comm) + 1, Repos(')', comm) - pos('(', comm) - 0);
        //showMessage((params));
        comm := copy(comm, 1, pos('(', comm) - 1);
        if comm = 'close' then victim.Close;
        if comm = 'show' then victim.show;
        if comm = 'hide' then victim.hide;
        if comm = 'caption' then victim.caption := params;
        if comm = 'showmodal' then victim.ShowModal;

        if comm = 'rect' then
        begin
          canui.Rectangle(0, 0, 400, 400);
        end;

        if comm = 'createfile' then
        begin
          params := StringReplace(params, '^', '/', [rfReplaceAll]);
          createfile(params)
        end;

        if comm = 'deletefile' then
        begin
          params := StringReplace(params, '^', '/', [rfReplaceAll]);
          if fileexists(params) then
            deletefile(params)
          else
            error(uril, 'File ' + params + ' does not exists', i);
        end;

        if comm = 'fileexists' then
        begin
          //ShowMessage(params);
          doc := WB1.Document as IHTMLDocument2;
          term := doc.parentWindow as IHTMLWindow2;
          params := StringReplace(params, '^', '/', [rfReplaceAll]);
          //ShowMessage(params);
          if not fileexists(params) then
            if fileexists(getpath + params) then
              params := getpath + params;
          term.execScript('result = ' + lowercase(booltostr(fileexists(params))) + ';', 'javascript')
        end;

        if comm = 'getpath' then
        begin
          doc := WB1.Document as IHTMLDocument2;
          term := doc.parentWindow as IHTMLWindow2;
          //ShowMessage('result = "' + StringReplace(getpath, '\', '/', [rfReplaceAll]) + '";');
          term.execScript('result = "' + StringReplace(getpath, '\', '/', [rfReplaceAll]) + '";', 'javascript')
        end;

        try
          if comm = 'addtofile' then
          begin
            doc := WB1.Document as IHTMLDocument2;
            term := doc.parentWindow as IHTMLWindow2;
            tmp_A_ := copy(params, pos(',', params) + 1, length(params));
            params := StringReplace(params, '^', '/', [rfReplaceAll]);
            params := copy(params, 1, pos(',', params) - 1);
            if not fileexists(params) then
              if fileexists(getpath + params) then
                params := getpath + params
              else
                error(uril, 'File ' + params + ' does not exist', i);
            //textsave(textopen(params) + tmp_A)
            //ShowMessage(params);
            if length(tmp_A_) = 0 then
              error(uril, 'Reuired 0 or 1 in the first char', i);
            if tmp_A_[1] = '1' then
             textsave(textopen(params) + #13#10 + copy(tmp_A_, 2, length(tmp_A_)), params)
            else
              if tmp_A_[1] = '0' then
                textsave(textopen(params) + Copy(tmp_A_, 2, length(tmp_A_)), params)
              else
                error(uril, 'Reuired 0 or 1 but found ' + tmp_A_[1], i)
          end;
          if comm = 'openfromfile' then 
          begin
            doc := WB1.Document as IHTMLDocument2;
            term := doc.parentWindow as IHTMLWindow2;
            params := StringReplace(params, '^', '/', [rfReplaceAll]);
            if not fileexists(params) then
              if fileexists(getpath + params) then
                params := getpath + params
              else
                error(uril, 'File ' + params + ' does not exist', i);
            AFile := TStringList.Create;
            afile.LoadFromFile(params);
            ShowMessagE(afile.text);
            for j := 0 to afile.Count - 1 do
            begin
              tmp_A_0 := ((afile[j]));
              for x := 1 to length(tmp_A_0) do
              begin
                CurrentDynamicTemp := tmp_A_0[x];
                case CurrentDynamicTemp[1] of
                  '\': CurrentDynamicTemp := '"\\"';
                  '"': CurrentDynamicTemp := '"\""';
                else
                  CurrentDynamicTemp := '"' + CurrentDynamicTemp + '"';
                end;
                scriptdynamicloadingwebbrowserscript := scriptdynamicloadingwebbrowserscript + 'text = text + ' + CurrentDynamicTemp + ';' + #13#10;
              end;
              scriptdynamicloadingwebbrowserscript := scriptdynamicloadingwebbrowserscript + 'text = text + "\n";' + #13#10;
            end;
            if scriptdynamicloadingwebbrowserscript = '' then
              scriptdynamicloadingwebbrowserscript := 'text = "";';
            term.execScript('text = "";' + scriptdynamicloadingwebbrowserscript, 'javascript');
            AFile.Free;
          end;
        except
          on e: exception do
            error(uril, 'Handled exception: ' + e.Message, i);
        end;
        if comm = 'savetofile' then
        begin
          if pos(',', params) = 0 then
            error(uril, 'function needs two params', i);
          params := StringReplace(params, '^', '/', [rfReplaceAll]);
          if not fileexists(params) then
            if fileexists(getpath + params) then
              params := getpath + params;
          pth := Copy(params, 1, pos(',', params) - 1);
          //ShowMessage(pth);
          textsave(copy(params, length(pth) + 2, length(params)), pth);
        end;

        try
          if comm = 'width' then victim.Width := strtoint(params);
          if comm = 'height' then victim.height := strtoint(params);
          if comm = 'x' then victim.Left := strtoint(params);
          if comm = 'y' then victim.Top := strtoint(params);
          if comm = 'alphablend' then victim.AlphaBlend := params = 'true';
          if comm = 'alphablendvalue' then victim.AlphaBlendValue := strtoint(params);

          if comm = 'border' then
          begin
            if LowerCase(params) = 'dialog' then
              victim.borderstyle := bsdialog;
            if LowerCase(params) = 'none' then
              victim.borderstyle := bsnone;
            if LowerCase(params) = 'single' then
              victim.borderstyle := bssingle;
            if LowerCase(params) = 'sizeable' then
              victim.borderstyle := bssizeable;
            if LowerCase(params) = 'sizetoolwin' then
              victim.borderstyle := bssizetoolwin;
            if LowerCase(params) = 'toolwindow' then
              victim.borderstyle := bstoolwindow;
            victim.wb1.Navigate(getpath + '~' + pages[victim.num].Name + '.html');
          end;
          if comm = 'icons' then
          begin
            if length(params) = 3 then
            begin
              for j := 1 to 3 do
                if (params[j] <> '1') and (params[j] <> '0') then
                  error(uril, 'icons() needs just [1, 0] * 3', i);
              if params[1] = '1' then
              begin
                if not (biSystemMenu in victim.bordericons) then
                  victim.bordericons := victim.bordericons + [biSystemMenu]
              end
              else
                if (biSystemMenu in victim.bordericons) then
                  victim.bordericons := victim.bordericons - [biSystemMenu];
              if params[2] = '1' then
              begin
                if not (biMinimize in victim.bordericons) then
                  victim.bordericons := victim.bordericons + [biMinimize]
              end
              else
                if (biMinimize in victim.bordericons) then
                  victim.bordericons := victim.bordericons - [biMinimize];
              if params[3] = '1' then
              begin
                if not (biMaximize in victim.bordericons) then
                  victim.bordericons := victim.bordericons + [biMaximize]
              end
              else
                if (biMaximize in victim.bordericons) then
                  victim.bordericons := victim.bordericons - [biMaximize];
              victim.wb1.Navigate(getpath + '~' + pages[victim.num].Name + '.html');
            end
            else
              error(uril, 'icons() needs 3-char parametr (e. g. 101)', i);
          end;
        except
          on e: exception do
            Error(uril, 'Code: ' + e.Message, i)
        end;
        SEND_API_MESSAGE('Command: ' + form + comm + '(' + params + ')', AHandle);
        //ShowMessage(comm)
      end
      else
        Error(uril, 'No point', i);
  canUI.free;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  form1.hide;
  tmr1.Enabled := false;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  if num = 0 then
  begin
    for i := 0 to high(pages) do
      deletefile(getpath + '~' + pages[i].Name + '.html');
    die(true);
  end;
end;

procedure TForm1.wb1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  while (Sender as TWebBrowser).ReadyState <> READYSTATE_COMPLETE do
    enabled := false;
  enabled := true;
end;

end.
