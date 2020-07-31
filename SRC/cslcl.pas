unit cslcl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, synedit, SynHighlighterCSS, ExtCtrls, sPanel, mc_utils, Buttons,
  sSpeedButton, StdCtrls, sBitBtn;

type
  TForm22 = class(TForm)
    spnl1: TsPanel;
    sbtbtn1: TsBitBtn;
    sbtbtn2: TsBitBtn;
    btn1: TsSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtbtn1Click(Sender: TObject);
    procedure sbtbtn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    editor: TSynEdit;
    b_: TSynCSSSyn;
  end;

var
  Form22: TForm22;

implementation
uses
  Unit1;
{$R *.dfm}

procedure TForm22.FormCreate(Sender: TObject);
begin
  b_ := TSynCSSSyn.Create(nil);
  b_.CommentAttri.Foreground := clgreen;
  b_.SpaceAttri.Foreground := cllime;
  //b_.IdentifierAttri.Background := blendcolor(clwhite, clblue, 250);
  b_.NumberAttri.Foreground := clblue;
  b_.KeyAttri.Foreground := clnavy;
  b_.StringAttri.Foreground := clblue;

  editor := TSynEdit.Create(form22);
  editor.Parent := self;
  editor.Align := alclient;
  editor.Gutter.ShowLineNumbers := true;
  editor.Highlighter := b_
end;

procedure TForm22.FormActivate(Sender: TObject);
begin
  editor.Text := TextOpen(GetUA + 'classes.css');
  btn1.Enabled := ACTIVE_ELEMENT <> -1
end;

procedure TForm22.sbtbtn1Click(Sender: TObject);
begin
  textsave(editor.text, GetUA + 'classes.css');
  close;
end;

procedure TForm22.sbtbtn2Click(Sender: TObject);
begin
  close;
end;

procedure TForm22.btn1Click(Sender: TObject);
var
  i: integer;
begin
  i := length(editor.text);
  editor.text := editor.text + '.NewClass{' + #13#10 +
                 '  width: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[BUFFER].properties['Width'] + ';' + #13#10 +
                 '  height: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[BUFFER].properties['Height'] + ';' + #13#10 +
                 '  Background: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[BUFFER].properties['Background'] + ';' + #13#10 +
                 '  border-radius: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[BUFFER].properties['Border-radius'] + ';' + #13#10 +
                 '  font-size: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[BUFFER].properties['Font-size'] + ';' + #13#10 +
                 '  border-shadow: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[BUFFER].properties['Box-shadow'] + ';' + #13#10 +
                 '  outline: ' + CURRENT_PROJECT.HConstructor[ACTIVE_PAGE].objects[BUFFER].properties['Outline'] + ';' + #13#10 +
                 '}';
  editor.SelStart := i + 1;
  editor.SelLength := 8
end;

end.
