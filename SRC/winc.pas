unit winc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, sBitBtn;

type
  TForm7 = class(TForm)
    t1: TLabel;
    sbtbtn1: TsBitBtn;
    sbtbtn2: TsBitBtn;
    sbtbtn3: TsBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
function is_save: integer;
var
  Form7: TForm7;
  I: integer;
implementation

{$R *.dfm}

function is_save: integer;
begin
  i := 0;
  form7.ShowModal;
  result := i
end;

procedure TForm7.btn1Click(Sender: TObject);
begin
  i := 1;
  close
end;

procedure TForm7.btn2Click(Sender: TObject);
begin
  i := 2;
  close
end;

procedure TForm7.btn3Click(Sender: TObject);
begin
  I := 3;
  close;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if i = 0 then i := 3;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
  left := (screen.width - width) div 2;
  top := (screen.height - height) div 2;
end;

end.
