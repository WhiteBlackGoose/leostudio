unit OnlyOneClass;

interface

uses
  Windows, Messages, iniFiles, SysUtils, Registry, ShlObj, Dialogs;

// procedure MessageOnlyOne(var msg: TWMCopyData); message WM_COPYDATA;

type
  OnlyOne = class
    private
      class function Init_Mutex(mid: string): boolean;
      class function mut_id(s: string): string;
    public
      class procedure Init(handle: integer);
      class function GetHandle: integer;
      class procedure SendMessage(handle: THandle; messageStr: string);
      class function GetMessage:string;
  end;

procedure FileAssociate(const Ext, progName: string; Icon: string = ''; ProgPath: string = '');
procedure FileUnAssociate(const Ext, progName:string);

const iniName = 'Process.ini';

implementation

var
  mut, hmut: thandle;
  i: TIniFile;

procedure FileAssociate(const Ext, progName: string; Icon: string = ''; ProgPath: string = '');
var r: TRegistry;
begin
  r:=TRegistry.Create;
  r.RootKey:=HKEY_CURRENT_USER;
  r.OpenKey('Software\Classes\.'+UpperCase(Ext),true);
  r.WriteString('',progName);
  r.CloseKey;
  r.OpenKey('Software\Classes\'+progName+'\shell\open\command',true);
  if ProgPath='' then
     r.WriteString('','"'+ParamStr(0)+'" "%1"')
  else
     r.WriteString('','"'+ProgPath+'" "%1"');
  r.CloseKey;

  if Icon<>'' then begin
    r.OpenKey('Software\Classes\'+progName+'\DefaultIcon',true);
    r.WriteString('',Icon);
    r.CloseKey;
  end;
  r.Free;
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
end;

procedure FileUnAssociate(const Ext, progName:string);
var r: TRegistry;
begin
  r:=TRegistry.Create;
  r.RootKey:=HKEY_CURRENT_USER;
  if r.OpenKey('Software\Classes\'+progName,false) then begin
    r.CloseKey;
    r.DeleteKey('Software\Classes\'+progName);
  end;
  if r.OpenKey('Software\Classes\.'+UpperCase(Ext),false) and
     (r.ReadString('') = progName) then begin
     r.CloseKey;
     r.DeleteKey('Software\Classes\.'+UpperCase(Ext));
  end;
  r.Free;
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
end;

{ OnlyOne }

class function OnlyOne.GetHandle: integer;
begin
  i:=TIniFile.Create(ExtractFilePath(ParamStr(0))+iniName);
  result:=i.ReadInteger('process','handle',0);
  i.Free;
end;

class function OnlyOne.GetMessage: string;
begin
  i:=TIniFile.Create(ExtractFilePath(ParamStr(0))+iniName);
  result:=i.ReadString('process','data','');
  i.Free;
end;

class function OnlyOne.Init_Mutex(mid: string): boolean;
begin
  mut := CreateMutex(nil, false, pchar(mut_id(mid)));
  result := not((mut = 0) or (GetLastError = ERROR_ALREADY_EXISTS));
end;

class function OnlyOne.mut_id(s: string): string;
var
  f: integer;
begin
  result := s;
  for f := 1 to length(s) do
    if (result[f] = '\') or (result[f] = '/') then
      result[f] := '_';
end;

class procedure OnlyOne.Init(handle: integer);
begin
  i:=TIniFile.Create(ExtractFilePath(ParamStr(0))+iniName);
  i.WriteInteger('process','handle',handle);
  i.Free;
end;

class procedure OnlyOne.SendMessage(handle: THandle; messageStr: string);
var aCopyData: TCopyDataStruct;
begin
  with aCopyData do
   begin
     dwData := 0;
     cbdata := 0;
     lpData := pchar('');
   end;
   i:=TIniFile.Create(ExtractFilePath(ParamStr(0))+iniName);
   i.WriteString('process','data',messageStr);
   i.Free;
   Windows.SendMessage(handle, WM_COPYDATA, 0, Longint(@aCopyData));
end;

initialization

// запускем программу
mut := 0;
if not OnlyOne.Init_Mutex(ParamStr(0)) then begin
  // нельзя создать мютекс
  mut := 0;
  hmut:=OnlyOne.GetHandle;
  if hmut<>0 then begin
    // подаем сигнал процессу
    ShowWindow(hmut,SW_RESTORE);
    SetForegroundWindow(hmut);
    OnlyOne.SendMessage(hmut,ParamStr(1));
  end;
  halt; // аварийный выброс
end;

finalization

if mut <> 0 then
begin
  CloseHandle(mut);
  OnlyOne.Init(0);
end;

end.
