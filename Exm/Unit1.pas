unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mc_utils, shellapi;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  a, b: string;
  List: TStringList;
begin
  a := openwith;
  if not fileexists(a) then
    application.Terminate;
  b := extractfileextension(a);
  if b = '.lct' then
  begin
    List := TStringList.Create;
    list.Text := getfilesfrom(ExtractFilePath(a), false, '.jssprj');
    if list.text <> '' then
      if Fileexists(list[1]) then
        Shellexecute(0, 'open', PAnsiChar(getpath + 'Studio.exe'), PAnsiChar(list[1]), '', SW_SHOWNORMAL);
  end;
  application.terminate
end;

end.
 