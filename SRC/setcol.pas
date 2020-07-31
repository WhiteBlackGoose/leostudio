unit setcol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls;

type
  TForm6 = class(TForm)
    im1: TImage;
    btn1: TSpeedButton;
    pnl1: TPanel;
    pb1: TPaintBox;
    clrbx1: TColorBox;
    procedure im1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure im1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure im1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure clrbx1Change(Sender: TObject);
  private
    { Private declarations }
  public
    procedure drawall;
  end;
function text_from_file(path: string): string;
function getcolor(default: string): string;
procedure DrawGradient(ACanvas: TCanvas; Rect: TRect;
   Horicontal: Boolean; Colors: array of TColor);
var
  Form6: TForm6;
  colorOf: integer;
  down: boolean = false;
implementation

{$R *.dfm}

function getcolor(default: string): string;
begin
  colorOf := StrToInt('$' + default);
  form6.pnl1.Color := colorOf;
  if not form6.Visible then
    form6.ShowModal;
  result := copy(format('%x', [colorOf]), 1, length(format('%x', [colorOf]))-1);
  while length(result) < 6 do
    result := result + '0';
  result := result[5] + result[6] + result[3] + result[4] + result[1] + result[2]
end;

procedure TForm6.im1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  down := true;
end;

procedure TForm6.drawall;
  const
  u = 200;
  var
  i, j: integer;
  a: array [0..u] of TColor;
  que: extended;
  function TakeRecFor(q: extended; x, y: integer): integer;
  var
    mainColor: TColor;
    per: extended;
  begin
    if Y * Q <= clwhite / 3 then
    begin
      per := y * q / (clwhite / 3) / 3;
      result := strToInt('$' + format('%x', [round(per * $ff)]) + format('%x', [round((1-per) * $ff)]) + '00')
    end;
    if Y * Q > clwhite / 3 then
    begin
      per := y * q / (clwhite / 3 * 2) / 1.5;
      result := strToInt('$' + format('%x', [round((1-per)/2 * $ff)]) + format('%x', [round(per * $ff)]) + format('%x', [round((1-per)/2 * $ff)]))
    end;
    if Y * Q > clwhite / 3 * 2 then
    begin
      per := y * q / (clwhite);
      result := strToInt('$00' + format('%x', [round((1-per) * $ff)]) + format('%x', [round((per) * $ff)]) + '00')
    end;
  end;
  var
    col, ex: extended;
begin
  for i := 0 to u do
    a[i] := i * ($ffffff div u);
  //DrawGradient(im1.canvas, rect(0, 0, im1.Width, im1.Height), false, a);
  //GdiGradientFill
  que := 255 / (im1.Height) * 1;
  col := 0;
  //for i := 1 to im1.Width do
    for j := 1 to im1.Height div 3 do
    begin
      col := col + que;
      im1.Canvas.Pen.Color := round(col);
      im1.Canvas.MoveTo(0, j);
      im1.Canvas.LineTo(im1.Width, j);
    end;

  //col := 0;
  //for i := 1 to im1.Width do
    for j := im1.Height div 3 to im1.Height div 3 * 2 do
    begin
      col := col + 4 * 255;
      im1.Canvas.Pen.Color := round(col);
      im1.Canvas.MoveTo(0, j);
      im1.Canvas.LineTo(im1.Width, j);
    end;

    //col := 0;
  //for i := 1 to im1.Width do
    for j := im1.Height div 3 * 2 to im1.Height do
    begin
      im1.Canvas.Pen.Color := round(col);
      im1.Canvas.MoveTo(0, j);
      im1.Canvas.LineTo(im1.Width, j);
      col := col + 4 * 65535;
    end;
  col := 0;
  ex := 16;
  for j := 1 to im1.Height do
  begin
    ex := ex + 1;
    col := strtoint('$' + format('%x', [round(ex)]) + format('%x', [round(ex)]) + format('%x', [round(ex)]));
    //col := ex * 65535 + ex * 255 * ex * 1;
    im1.Canvas.Pen.Color := round(col);
    im1.Canvas.MoveTo(0, j);
    im1.Canvas.LineTo(30, j);
  end;
end;

procedure TForm6.btn1Click(Sender: TObject);
begin
  close;
end;

procedure DrawGradient(ACanvas: TCanvas; Rect: TRect;
   Horicontal: Boolean; Colors: array of TColor);
 type
   RGBArray = array[0..2] of Byte;
 var
   x, y, z, stelle, mx, bis, faColorsh, mass: Integer;
   Faktor: double;
   A: RGBArray;
   B: array of RGBArray;
   merkw: integer;
   merks: TPenStyle;
   merkp: TColor;
 begin
   mx := High(Colors);
   if mx > 0 then
   begin
     if Horicontal then
       mass := Rect.Right - Rect.Left
     else
       mass := Rect.Bottom - Rect.Top;
     SetLength(b, mx + 1);
     for x := 0 to mx do
     begin
       Colors[x] := ColorToRGB(Colors[x]);
       b[x][0] := GetRValue(Colors[x]);
       b[x][1] := GetGValue(Colors[x]);
       b[x][2] := GetBValue(Colors[x]);
     end;
     merkw := ACanvas.Pen.Width;
     merks := ACanvas.Pen.Style;
     merkp := ACanvas.Pen.Color;
     ACanvas.Pen.Width := 1;
     ACanvas.Pen.Style := psSolid;
     faColorsh := Round(mass / mx);
     for y := 0 to mx - 1 do
     begin
       if y = mx - 1 then
         bis := mass - y * faColorsh - 1
       else
         bis := faColorsh;
       for x := 0 to bis do
       begin
         Stelle := x + y * faColorsh;
         faktor := x / bis;
         for z := 0 to 3 do
           a[z] := Trunc(b[y][z] + ((b[y + 1][z] - b[y][z]) * Faktor));
         ACanvas.Pen.Color := RGB(a[0], a[1], a[2]);
         if Horicontal then
         begin
           ACanvas.MoveTo(Rect.Left + Stelle, Rect.Top);
           ACanvas.LineTo(Rect.Left + Stelle, Rect.Bottom);
         end
         else
         begin
           ACanvas.MoveTo(Rect.Left, Rect.Top + Stelle);
           ACanvas.LineTo(Rect.Right, Rect.Top + Stelle);
         end;
       end;
     end;
     b := nil;
     ACanvas.Pen.Width := merkw;
     ACanvas.Pen.Style := merks;
     ACanvas.Pen.Color := merkp;
   end
   else
     // Please specify at least two colors 
    raise EMathError.Create('Es mussen mindestens zwei Farben angegeben werden.');
 end;

procedure TForm6.FormShow(Sender: TObject);
begin
  drawall
end;

procedure TForm6.im1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  down := false;
end;

procedure TForm6.im1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if down then
  begin
    colorOf := im1.Canvas.Pixels[x, y];
    form6.pnl1.Color := colorOf;
  end;
end;

function text_from_file(path: string): string;
var
  s: TStringList;
begin
  if not fileexists(path) then
  begin
    result := '';
    exit;
  end;
  s := TStringlist.Create;
  s.LoadFromFile(path);
  result := s.Text;
  s.Free;
end;

procedure TForm6.clrbx1Change(Sender: TObject);
begin
  colorof := clrbx1.Selected;
  pnl1.Color := colorof
end;

end.
