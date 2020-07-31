unit cls;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, ComCtrls, ActnList, Menus, Unit2, ShellAPI,
   Buttons, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP,  MSHTML, OleCtrls, SHDocVw, Urlmon, HyperLinksDecorator, RegExpr;
type
  TFuncBut = class(TSpeedButton)
  public
    block: boolean;
    tag: array [1..2] of string;
    dlg: string;
    constructor create(const s: string; bl: boolean; ff: TWinControl; dl: string = '');
    procedure PasteBlock(sender: TObject);
  end;

var
  FuncBut: array [1..100] of TFuncBut;
implementation
uses
  unit1, inChass, util;
constructor TFuncBut.create(const s: string; bl: boolean; ff: TWinControl; dl: string = '');

begin
  inherited create(ff);
  dlg := dl;
  parent := (owner as TWinControl);
  flat := true;
  if bl then
  begin
    tag[2] := '</' + s + '>';
    tag[1] := '<' + s + '>';
  end
  else
  begin
    tag[1] := '<' + copy(s, 2, length(s)) + '>';
  end;
  OnCLick := Pasteblock;
  block := bl;
  width := 38;
  height := width;
  ShowHint := true;
  hint := tag[1]
end;



procedure TFuncbut.PasteBlock(sender: TObject);
begin
end;



end.
