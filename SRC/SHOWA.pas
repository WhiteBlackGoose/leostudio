unit SHOWA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mc_utils, StdCtrls, Buttons, sBitBtn, sEdit, sGroupBox;

type
  TForm16 = class(TForm)
    grp1: TsGroupBox;
    edt1: TsEdit;
    sbtbtn1: TsBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtbtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation
uses
  unit1;
{$R *.dfm}

function Exists(s: string): boolean;
var
  i: integer;
begin
  result := false;
  for i := 0 to high(CURRENT_PROJECT.HConstructor) do
    if LowerCase(CURRENT_PROJECT.HConstructor[i].name) = LowerCase(s) then
    begin
      result := true;
      exit;
    end;
end;

procedure TForm16.FormCreate(Sender: TObject);
begin
  center(edt1, grp1, [pHoriz]);
  center(sbtbtn1, grp1, [pHoriz])
end;

procedure TForm16.FormActivate(Sender: TObject);
var
  s: string;
var
  i: integer;
begin
  i := 1;
  while exists('Form' + inttostr(i)) do
    inc(i);
  edt1.text := 'Form' + inttostr(i)
end;

procedure TForm16.sbtbtn1Click(Sender: TObject);
begin
  if exists(edt1.text) then
  begin
    ShowMEssage('Form already exists');
    exit
  end;
  close;
  RelistTo(NewWindow(edt1.text));
  recreatevis
end;

end.
