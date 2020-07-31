program Comiler;

uses
  Forms,
  windows,
  dialogs,
  sysutils,
  mc_utils,
  Main1 in 'Compiler\Main1.pas' {Form1},
  geckobrowser in 'Compiler\GeckoBrowser.pas',
  graphics;

{$R *.res}

var
  i: integer;
begin
  Application.Initialize;
  //ShowOkMess;
  try
    act;
  except
    die(true)
  end;
  for i := 0 to high(pages) do
  begin
    pages[i].Form := TForm1.create(application);
    //application.CreateForm(TForm1, pages[i].Form);
    pages[i].Form.DeAl := true;
    pages[i].Form.en := false;
    pages[i].Form.ClientWidth := pages[i].width;
    pages[i].Form.ClientHeight := pages[i].height;
    pages[i].Form.wb1.Navigate(getpath + '~' + pages[i].Name + '.html');
    //ShowMessage(BoolToStr(Fileexists(getpath + '~' + pages[i].Name + '.html')));
    //ShowMessage('AAAAAA' + getpath + '~' + pages[i].Name + '.html');
    pages[i].Form.num := i;
    pages[i].Form.en := true;
    pages[i].Form.ext := true;
    pages[i].Form.canUI := TCanvas.create;
    pages[i].Form.canUI.Handle := getWindowDC(pages[i].Form.Handle);
  end;
  Application.CreateForm(TForm1, Form1);
  form1.num := -1;
  //pages[0].Form.wb1.navigate(pages[0].name + '.show');
  center(pages[0].Form, ScreenAsControl, [pHoriz]);
  pages[0].Form.show;
  Application.Run;
end.
