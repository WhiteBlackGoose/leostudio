unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, mc_utils, sButton, sSkinManager;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    btn1: TsButton;
    sknmngr1: TsSkinManager;
    lbl2: TLabel;
    btn2: TsButton;
    btn3: TsButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
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
  if fileexists(getpath + 'pth') then
    deletefile(getpath + 'pth')
  else
    deletefile(getpath + '..\pth');
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  if fileexists(getpath + 'set.opt') then
    deletefile(getpath + 'set.opt')
  else
    deletefile(getpath + '..\set.opt');
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  btn1.click;
  btn2.click
end;

end.
