unit Dolphin_Changer_ico;
  
 interface   
  
 uses   
   Windows, Classes, SysUtils, Graphics;   
  
 procedure ChangeIcon(FileName, IconFile, ResName:string; size : integer = 16);
  
 implementation   
  
 resourcestring   
   SInvalidFileName = 'Invalide filename %s';   
  
 type   
   TNewHeader = record   
     idReserved:WORD;   
     idType:WORD;   
     idCount:WORD;   
   end;   
  
   TResDirHeader = packed record   
     bWidth:Byte;   
     bHeight:Byte;   
     bColorCount:Byte;   
     bReserved:Byte;   
     wPlanes:WORD;   
     wBitCount:WORD;   
     lBytesInRes:Longint;   
   end;   
  
   TIconFileResDirEntry = packed record   
     DirHeader:TResDirHeader;   
     lImageOffset:Longint;   
   end;   
  
   TIconResDirEntry = packed record   
     DirHeader:TResDirHeader;   
     wNameOrdinal:WORD;   
   end;   
  
   PIconResDirGrp = ^TIconResDirGrp;   
   TIconResDirGrp = packed record   
     idHeader:TNewHeader;   
     idEntries:array[0..0] of TIconResDirEntry;   
   end;   
  
   PIconFileResGrp = ^TIconFileResDirGrp;   
   TIconFileResDirGrp = packed record   
     idHeader:TNewHeader;   
     idEntries:array[0..0] of TIconFileResDirEntry;   
   end;   
  
   TBeginUpdateRes=function(pFileName: PChar; bDeleteExistingResources: BOOL): THandle; stdcall;   
  
   TUpdateRes=function(hUpdate: THandle; lpType, lpName: PChar;   
                wLanguage: Word; lpData: Pointer; cbData: DWORD): BOOL; stdcall;   
  
   TEndUpdateRes=function(hUpdate: THandle; fDiscard: BOOL): BOOL; stdcall;   
  
 function MakeLangID: WORD;
 begin   
   Result:=(SUBLANG_DEFAULT shl 10) or LANG_RUSSIAN;
 end;

 procedure CheckFileName(Value:string);
 var
   a, b: boolean;
 begin
   a := Trim(Value) = '';
   b := not FileExists(Value);
   if a or b then
     raise Exception.Create(Format(SInvalidFileName, [Value]));
 end;   
  
 procedure ChangeIcon(FileName, IconFile, ResName:string; size: integer = 16);
 var   
   I:Integer;   
   Group:Pointer;   
  
   Header:TNewHeader;   
   FileGrp:PIconFileResGrp;   
   IconGrp:PIconResDirGrp;   
   IconGrpSize,   
   FileGrpSize:Integer;   
  
   Icon:TIcon;   
   Stream:TMemoryStream;   
   hUpdateRes:THandle;   
 begin
   CheckFileName(FileName);
   hUpdateRes:=BeginUpdateResource(PChar(FileName), False);
   Win32Check(UpdateResource(hUpdateRes,RT_GROUP_ICON, PChar(ResName), MakeLangID, nil, 0));//adding the icongroup
   Win32Check(hUpdateRes <> 0);
   CheckFileName(IconFile);
   Icon:=TIcon.Create;
   Icon.LoadFromFile(IconFile);
   Stream:=TMemoryStream.Create;
   try
     Icon.SaveToStream(Stream);
   finally   
     Icon.Free;   
   end;
   Stream.Position:=0;
   Stream.Read(Header, SizeOf(Header));
   FileGrpSize := SizeOf(TIconFileResDirGrp) + (Header.idCount - 1) * SizeOf(TIconFileResDirEntry);
   IconGrpSize := SizeOf(TIconResDirGrp) + (Header.idCount - 1) * SizeOf(TIconResDirEntry);
   //IconGrpSize := size;
   GetMem(FileGrp, FileGrpSize);
   GetMem(IconGrp, IconGrpSize);
   Stream.Position := 0;
   Stream.Read(FileGrp^, FileGrpSize);//loading icongroup
   Group := nil;
   try
     for I:=0 to FileGrp^.idHeader.idCount - 1 do //building icongroup from loaded entries
     begin
       with IconGrp^ do
       begin
         idHeader:=FileGrp^.idHeader;
         idEntries[I].DirHeader:=FileGrp^.idEntries[I].DirHeader;
         idEntries[I].wNameOrdinal:=I;//fixing Ordinals
       end;
       with FileGrp^.idEntries[I] do
       begin
         Stream.Seek(lImageOffset, soFromBeginning);
         ReallocMem(Group, DirHeader.lBytesInRes);
         Stream.Read(Group^, DirHeader.lBytesInRes);
         //Win32Check(UpdateResource(hUpdateRes,RT_ICON,PChar(MakeIntResource(I)), MakeLangID, Group, DirHeader.lBytesInRes));
         //Win32Check(UpdateResource(hUpdateRes,RT_ICON,PChar(ResName), MakeLangID, Group, DirHeader.lBytesInRes));
         //Win32Check(UpdateResource(hUpdateRes, RT_ICON, PChar(ResName), LANG_RUSSIAN, Group, DirHeader.lBytesInRes));
         Win32Check(UpdateResource(hUpdateRes, RT_ICON, PChar(ResName), 0, Group, DirHeader.lBytesInRes));
       end;
     end;//for
       Win32Check(UpdateResource(hUpdateRes,RT_GROUP_ICON, PChar(ResName), 0, IconGrp, IconGrpSize));//adding the icongroup
     Win32Check(EndUpdateResource(hUpdateRes, False));
   finally
     Stream.Free;
     FreeMem(FileGrp);   
     FreeMem(IconGrp);   
     FreeMem(Group);   
   end;   
 end;   
  
 var   
   BeginUpdateRes:TBeginUpdateRes;   
   UpdateRes:TUpdateRes;   
   EndUpdateRes:TEndUpdateRes;   
  
 procedure GetFunctions(hLib:HMODULE);
 begin   
   @BeginUpdateRes:=GetProcAddress(hLib,'BeginUpdateResourceA');   
   @UpdateRes:=GetProcAddress(hLib,'UpdateResourceA');   
   @EndUpdateRes:=GetProcAddress(hLib,'EndUpdateResourceA');   
 end;   
  
 end.   

