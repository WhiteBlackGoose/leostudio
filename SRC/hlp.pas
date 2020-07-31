unit hlp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm11 = class(TForm)
    mmo1: TMemo;
    tv1: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure tv1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
procedure add(s: string);
procedure Help;
var
  Form11: TForm11;
  HelpPath: string;
implementation
uses
  unit1;
{$R *.dfm}

procedure TForm11.FormCreate(Sender: TObject);
var
  i: integer;
  s: TStringlist;
  t: TTreeNode;
  function GetAllFolders( Path: string): TStringList;
    var                                                                
      sRec: TSearchRec;
      isFound: boolean;

  begin
    result := TStringList.Create;
    result.Text := '';
    isFound := FindFirst( Path + '\*.*', faAnyFile, sRec ) = 0;
    while isFound do
    begin
      if ( sRec.Name <> '.' ) and ( sRec.Name <> '..' ) then
      begin
        if (( sRec.Attr and faDirectory ) = faDirectory) then
        begin
          result.Add(copy(sRec.Name, 1, length(sRec.Name)));
        end;
      end;
      Application.ProcessMessages;
      isFound := FindNext( sRec ) = 0;

    end;
    FindClose( sRec );
   
  end;
begin
  HelpPath := filePath + 'data/help/';
  s := getallfolders(HelpPath);
  for i := 0 to s.Count - 1 do
    add(s[i]);
end;

procedure add(s: string);
var
  f: TTreeNode;
begin
  f := TTreeNode.Create(form11.tv1.items);
  f.Text := s;
  form11.tv1.Items.Add(f, s);
end;

procedure TForm11.tv1Click(Sender: TObject);
begin
  if fileexists(HelpPath + tv1.Selected.Text + '/file.help') then
    mmo1.Lines.LoadFromFile(HelpPath + tv1.Selected.Text + '/file.help')
  else
    mmo1.Text := tr('Help not loaded', 'Справка не загружена', 'Aiuto non caricato', 'Aide non chargee');
end;

procedure help;
begin
  form11.ShowModal;
end;

end.
