unit Icc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sLabel, sSpeedButton, sEdit,
  sDialogs, ExtCtrls;

type
  TForm12 = class(TForm)
    edt1: TsEdit;
    btn1: TsSpeedButton;
    sbtbtn1: TsBitBtn;
    dlg1: TsOpenDialog;
    im1: TImage;
    procedure sbtbtn1Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation
uses
  unit1;
{$R *.dfm}

procedure TForm12.sbtbtn1Click(Sender: TObject);
begin
  close
end;

procedure TForm12.edt1Change(Sender: TObject);
begin
  if fileexists(edt1.text) then
    im1.Picture.LoadFromFile(edt1.Text);
end;

procedure TForm12.btn1Click(Sender: TObject);
begin
  dlg1.execute;
  edt1.text := dlg1.FileName
end;

end.
