program Setup;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  OnlyOneClass in 'OnlyOneClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
