unit Ko;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sComboBox, sLabel, sGroupBox, ComCtrls, sPageControl, sSpeedButton, uqpixels,
  mc_utils, sEdit, ExtCtrls, sPanel, acSlider, SynHighlighterJScript;

type
  TForm19 = class(TForm)
    pgc1: TsPageControl;
    stbsht1: TsTabSheet;
    grp1: TsGroupBox;
    lbl1: TsLabel;
    cbb1: TsComboBox;
    sldr1: TsSlider;
    lbl2: TsLabel;
    procedure cbb1Change(Sender: TObject);
    procedure sldr1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation
uses
  unit1;
{$R *.dfm}

procedure TForm19.cbb1Change(Sender: TObject);
var
  i, x, y: integer;
  but: TsEdit;
  a: TQuickPixels;
  b: integer;
  kl: boolean;
  qwer: integer;
begin
  htmlleveditor.sknmngr1.SkinName := cbb1.text;
  //but := htmlleveditor.Components[i] as TsSpeedButton;
  if cbb1.Text = 'DarkMetro (internal)' then
  begin
    screen.MenuFont.Color := clwhite;
    //screen.MenuFont.Size := 20
  end
  else
    screen.MenuFont.Color := clblack;

  //ShowMessage(inttostr(application.ComponentCount));
  for x := 0 to application.ComponentCount - 1 do
    if application.Components[x] is TForm then
      for i := 0 to (application.Components[x] as TForm).ComponentCount - 1 do
      begin
        if (application.Components[x] as TForm).Components[i] is TsWebLabel then
          if cbb1.text = 'WEB2' then
          begin
            ((application.Components[x] as TForm).Components[i] as TsWebLabel).Font.Color := clblue;
            ((application.Components[x] as TForm).Components[i] as TsWebLabel).HoverFont.Color := blendcolor(clwhite, clblue, 130);
            ((application.Components[x] as TForm).Components[i] as TsWebLabel).UseSkinColor := false;
          end
          else
            begin
              ((application.Components[x] as TForm).Components[i] as TsWebLabel).Font.Color := clwhite;
              ((application.Components[x] as TForm).Components[i] as TsWebLabel).HoverFont.Color := clgray;
              ((application.Components[x] as TForm).Components[i] as TsWebLabel).UseSkinColor := false;
            end;

        if (application.Components[x] as TForm).Components[i] is TsSpeedButton then
          //if cbb1.text = 'Steam (internal)' then
        begin
          ((application.Components[x] as TForm).Components[i] as TsSpeedButton).Cursor := crHandPoint;

        //  ((application.Components[x] as TForm).Components[i] as TsSpeedButton).SkinData.SkinSection := 'PANEL'
        end
      end;
  qwer := blendcolor(clwhite, clblack, 200);
  if cbb1.text = 'WEB2' then
  begin
    htmlleveditor.mmofg.Gutter.Color := blendcolor(clblue, clwhite, 20);
    htmlleveditor.mmofg.Font.Color := clwhite;
    htmlleveditor.mmofg.Gutter.Font.Color := clblack;
    htmlleveditor.mmofg.Color := clwhite;
    htmlleveditor.mmofg.ActiveLineColor := blendcolor(clwhite, clyellow, 220);
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).CommentAttri.Foreground := clgreen;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).SymbolAttri.Foreground := clblack;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).IdentifierAttri.Foreground := clblack;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).IdentifierAttri.Background := blendcolor(clred, clwhite, 10);
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).SpaceAttri.Foreground := cllime;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).NonReservedKeyAttri.Foreground := clblack;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).NumberAttri.Foreground := clblue;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).KeyAttri.Foreground := clnavy;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).StringAttri.Foreground := clblue;
  end
  else
  begin
    htmlleveditor.mmofg.Gutter.Color := clwhite - qwer;
    htmlleveditor.mmofg.ScrollBars := ssNone;
    htmlleveditor.mmofg.Font.Color := clwhite;
    htmlleveditor.mmofg.Color := clwhite - qwer;
    htmlleveditor.mmofg.Gutter.Font.Color := qwer - clblack;
    htmlleveditor.mmofg.ActiveLineColor := clwhite - qwer;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).SymbolAttri.Foreground := qwer;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).CommentAttri.Foreground := qwer - clgreen ;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).IdentifierAttri.Foreground := clwhite;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).IdentifierAttri.Background := clwhite - qwer;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).SpaceAttri.Foreground := qwer - cllime ;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).NonReservedKeyAttri.Foreground := qwer - clblack ;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).NumberAttri.Foreground := blendcolor(clblue, clwhite, 40);
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).KeyAttri.Foreground := qwer - clnavy ;
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).StringAttri.Foreground := blendcolor(clblue, clwhite, 40);
    (htmlleveditor.mmofg.Highlighter as TSynJScriptSyn).EventAttri.Foreground := clwhite;
    //(htmlleveditor.mmofg.Highlighter as TSynJScriptSyn)
  end;
  exit;
  for i := 0 to htmlleveditor.ComponentCount - 1 do
    if htmlleveditor.Components[i] is TsEdit then
    begin
      //htmlleveditor.log('i: ' + inttostr(i), tterror);// + ' x: ' + inttostr(x) + ' y: ' + inttostr(y), tterror);{

      but := htmlleveditor.Components[i] as TsEdit;
      if cbb1.Text = 'DarkMetro (internal)' then
        but.SkinData.SkinSection := 'SPEED_BUTTON'
      else
        but.SkinData.SkinSection := '';
      (*
      if (but.Glyph <> nil) and (but.Glyph.Width <> 0) then
      begin
        a := TQuickPixels.Create;
        but.Glyph.PixelFormat := pf24bit;
        but.Glyph.TransparentMode := tmFixed;
        but.Glyph.TransparentColor := 0;
        htmlleveditor.log(inttostr(i), tterror);
        htmlleveditor.log(inttostr(but.Glyph.Width), ttwarning);
        a.Attach(but.Glyph);
        for x := 0 to but.Glyph.Width - 1 do
        begin
          for y := 0 to but.Glyph.height - 1 do
          begin
            //textsave(textopen(getpath + 'o.txt') + 'i: ' + inttostr(i) + ' x: ' + inttostr(x) + ' y: ' + inttostr(y), getpath + 'o.txt');
            if but.Glyph.Canvas.Pixels[x + 1, y + 1] >= 0 then
            begin
              b := a.Pixels[x, y];
              if cbb1.Text = 'DarkMetro' then
                kl := b < BlendColor(clwhite, clblack, 128)
              else
                //kl := b >= BlendColor(clwhite, clblack, 128);
                kl := true;
              if kl then
              begin
                a.Pixels[x, y] := clwhite - a.Pixels[x, y];
              end;
            end;
          end;
        end;
        a.free;
      end;          *)
    end;
//  ShowMessage(IntToStr(htmlleveditor.btn30.Glyph.Canvas.Pixels[1, 1]));
  Htmlleveditor.Refresh
end;

procedure TForm19.sldr1Click(Sender: TObject);
begin
  htmlleveditor.sknmngr1.Active := not sldr1.SliderOn
end;

end.
