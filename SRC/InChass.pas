unit InChass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    grp1: TGroupBox;
    btn1: TButton;
    lbledt1: TLabeledEdit;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbledt1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    function ShowDialog(S: string): String;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

function TForm3.ShowDialog(S: string): String;
begin
  lbledt1.EditLabel.Caption := s;
  ShowModal;
  result := lbledt1.text;
end;

procedure TForm3.btn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  lbledt1.SetFocus;
end;

procedure TForm3.lbledt1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then btn1.Click
end;

end.
