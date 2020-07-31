unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, ExtCtrls, acImage, sSkinManager, StdCtrls, sLabel,
  Buttons, sBitBtn, mc_utils, OnlyOneClass;
const
  User_Prj_ext = 'jssprj';
type
  TForm1 = class(TForm)
    sbtbtn1: TsBitBtn;
    sbtbtn2: TsBitBtn;
    lbl1: TsLabel;
    sknmngr1: TsSkinManager;
    img1: TsImage;
    procedure sbtbtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.sbtbtn1Click(Sender: TObject);
begin
  FileAssociate(User_Prj_ext,       'Studio',  (getpath + 'I2.ico'),    (getpath + 'Studio.exe'));
  FileAssociate(User_Prj_ext + 'e', 'Exec',    (getpath + 'Exec.ico'),  (GetPath + 'Execute.exe'));
  FileAssociate('lct',              'LDKx64',  (getpath + 'Ffile.ico'), (GetPath + 'LDKx64.exe'));
  textsave('+', getpath + 'GOT');
  ShowMessage('Successfully installed');
  close
end;

end.
