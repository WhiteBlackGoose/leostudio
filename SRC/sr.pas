unit sr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, ComCtrls, acProgressBar, acPNG, ExtCtrls,
  acImage, sPanel, mc_utils, sGauge;

type
  TForm8 = class(TForm)
    spnl1: TsPanel;
    lbl1: TsLabelFX;
    pb1: TsGauge;
    img2: TsImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation
uses
  unit1;
{$R *.dfm}

procedure TForm8.FormCreate(Sender: TObject);
begin
  lbl1.Caption := Short_Project_Name
end;

end.
