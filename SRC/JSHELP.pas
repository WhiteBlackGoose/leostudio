unit JSHELP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cefvcl;

type
  TForm20 = class(TForm)
    chrm1: TChromium;
  private
    { Private declarations }
  public
    procedure AShow(path: string);
  end;

var
  Form20: TForm20;

implementation

{$R *.dfm}

procedure TForm20.AShow(path: string);
begin
  chrm1.Load(path);
  show;
end;

end.
