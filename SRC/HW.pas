unit HW;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sSpeedButton, ExtCtrls, sPanel, cefvcl, OleCtrls,
  SHDocVw;

type
  TForm21 = class(TForm)
    spnl1: TsPanel;
    btn1: TsSpeedButton;
    btn2: TsSpeedButton;
    wb1: TWebBrowser;
    btn3: TsSpeedButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form21: TForm21;
  curr: integer = 0;
  inited: boolean = false;
implementation

uses lD_A;

{$R *.dfm}

procedure TForm21.btn1Click(Sender: TObject);
begin
  if curr < 5 then
  begin
    inc(curr);
    wb1.Navigate('http://mc-company.ru/studio/help/hw/' + inttostr(curr) + '.html');
  end;
end;

procedure TForm21.btn2Click(Sender: TObject);
begin
  if curr > 1 then
  begin
    dec(curr);
    wb1.Navigate('http://mc-company.ru/studio/help/hw/' + inttostr(curr) + '.html');
  end;
end;

procedure TForm21.FormActivate(Sender: TObject);
begin
  if inited then
    exit;
  inited := true;
  btn1.Click;
  //form17.top := top - form17.height - 10
end;

procedure TForm21.btn3Click(Sender: TObject);
begin
  close
end;

end.
