program Studio;

uses
  Forms,
  Unit1 in 'SRC\Unit1.pas' {HTMLLevEditor},
  Unit2 in 'SRC\Unit2.pas' {Form2},
  HyperLinksDecorator in 'SRC\HyperLinksDecorator.pas',
  RegExpr in 'SRC\RegExpr.pas',
  cls in 'SRC\cls.pas',
  InChass in 'SRC\InChass.pas' {Form3},
  util in 'SRC\util.pas',
  abt in 'SRC\abt.pas' {Form4},
  ptrns in 'SRC\ptrns.pas' {Form5},
  setcol in 'SRC\setcol.pas' {Form6},
  winc in 'SRC\winc.pas' {Form7},
  CSSedt in 'SRC\CSSedt.pas',
  smAll in 'SRC\smAll.pas' {Form9},
  hall in 'SRC\hall.pas' {Form10},
  hlp in 'SRC\hlp.pas' {Form11},
  sr in 'SRC\sr.pas' {Form8},
  Dolphin_Changer_ico in 'SRC\Dolphin_Changer_ico.pas',
  Icc in 'SRC\Icc.pas' {Form12},
  ER in 'SRC\ER.pas' {Form13},
  mc_utils,
  SysUtils,
  Io in 'SRC\Io.pas' {Form14},
  st in 'SRC\st.pas' {Form15},
  SHOWA in 'SRC\SHOWA.pas' {Form16},
  lD_A in 'SRC\lD_A.pas' {Form17},
  npr in 'SRC\npr.pas' {Form18},
  dialogs,
  Ko in 'SRC\Ko.pas' {Form19},
  synedit in 'SRC\synedit.pas',
  QSynEditHighlighter in 'SRC\QSynEditHighlighter.pas',
  SynEditTypes in 'SRC\SynEditTypes.pas',
  SynHighLighterSample in 'SRC\SynHighLighterSample.pas',
  JSHELP in 'SRC\JSHELP.pas' {Form20},
  HW in 'SRC\HW.pas' {Form21},
  SynEditAutoComplete in 'SRC\SynEditAutoComplete.pas',
  SynCompletionProposal in 'SRC\SynCompletionProposal.pas',
  cslcl in 'SRC\cslcl.pas' {Form22},
  lbc in 'SRC\lbc.pas' {Form23};

{$R *.res}
var
  a: string;
  //k: array [1..10] of integer;
begin
  Application.Initialize;
  if not fileexists(getpath + 'GOT') then
    exit;
  //instruction := not fileexists(getpath + 'learned');
  form8 := TFOrm8.Create(nil);
  form8.Show;
  form8.Repaint;
  Application.CreateForm(THTMLLevEditor, HTMLLevEditor);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  form8.pb1.progress := 10;
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm18, Form18);
  form8.pb1.progress := 20;
  //sleep(700);
  Application.CreateForm(TForm19, Form19);
  //sleep(700);
  Application.CreateForm(TForm20, Form20);
  form8.pb1.progress := 25;
  Application.CreateForm(TForm21, Form21);
  Application.CreateForm(TForm22, Form22);
  //sleep(700);
  Application.CreateForm(TForm23, Form23);
  form8.pb1.progress := 30;
  Application.CreateForm(TForm2, Form2);
  //sleep(700);
  Application.CreateForm(TForm3, Form3);
  form8.pb1.progress := 40;
  Application.CreateForm(TForm4, Form4);
  //sleep(700);
  form8.pb1.progress := 50;
  Application.CreateForm(TForm5, Form5);
  form8.pb1.progress := 60;
  //sleep(700);
  Application.CreateForm(TForm6, Form6);
  form8.pb1.progress := 80;
  Application.CreateForm(TForm7, Form7);
  //sleep(700);
  form8.pb1.progress := 85;
  Application.CreateForm(TForm9, Form9);
  form8.pb1.progress := 100;
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);

  form8.close;

  a := OpenWith;

  HTMLLevEditor.OnActivate(nil);
  if a <> '' then
    HTMLLevEditor.OpenProject(a)
  else
    form17.showmodal;
  HTMLLevEditor.show;
  recreatevis;
  PChanged := false;
  Application.Run;
end.
