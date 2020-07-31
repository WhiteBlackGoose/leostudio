unit abt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons, sLabel, acPNG, acImage,
  sMemo, sPanel, mc_utils, sBitBtn;

type
  TForm4 = class(TForm)
    spnl1: TsPanel;
    lbl1: TsLabelFX;
    lbl2: TsWebLabel;
    lbl3: TsWebLabel;
    img1: TsImage;
    lbl4: TsLabel;
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
  Form4: TForm4;
  There: boolean = false;
implementation
uses
  unit1, hlp;
{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
  doublebuffered := true;
  lbl1.Caption := Short_Project_name;
  center(lbl1, self, [pHoriz]);
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
  lbl4.caption := tr('Project: ', 'Проект: ', 'Progetto: ', 'Projet: ') + Project_name + #13#10 +
                  tr('Version', 'Версия', 'Versione', 'Version') + ': ' + version + #13#10 +
                  tr('Publisher', 'Владелец', 'Autore', 'Auteur') + ': Angourisoft' + #13#10 +
                  tr('Build', 'Сборка', 'Costruire', 'Construire') + ': 369' + #13#10 +
                  tr('Compiler', 'Компилятор', 'Compiler', 'Compilateur') + ': Borland compiler' + #13#10 +
                  tr('Site', 'Сайт', 'Sito web', 'Site Internet') + ': ' + 'www.mc-company.ru';
end;

procedure TForm4.sbtbtn1Click(Sender: TObject);
begin
  close
end;

end.
