unit ER;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sMemo, sLabel;

type
  TForm13 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    sbtbtn1: TsBitBtn;
    sbtbtn2: TsBitBtn;
    lbl3: TsWebLabel;
    mmo1: TsMemo;
    procedure sbtbtn1Click(Sender: TObject);
    procedure sbtbtn2Click(Sender: TObject);
    procedure lbl3Click(Sender: TObject);
  private
    { Private declarations }
  public
    function ask(e: string): boolean;
  end;

var
  Form13: TForm13;
  res: boolean = false; 
implementation

{$R *.dfm}

function TForm13.ask(e: string): boolean;
begin
  mmo1.text := e;
  showmodal;
  result := res
end;

procedure TForm13.sbtbtn1Click(Sender: TObject);
begin
  res := true;
  close;
end;

procedure TForm13.sbtbtn2Click(Sender: TObject);
begin
  res := false;
  close
end;

procedure TForm13.lbl3Click(Sender: TObject);
begin
  mmo1.Visible := not mmo1.Visible;
  if mmo1.Visible then
    height := 349
  else
    height := 180;
end;

end.
