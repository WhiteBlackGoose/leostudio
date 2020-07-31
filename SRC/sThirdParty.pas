unit sThirdParty;
{$I sDefs.inc}

interface

uses
  SysUtils, Classes, Windows, Graphics, Controls, imglist, comctrls, StdCtrls,
  {$IFNDEF ALITE} sToolBar, {$ENDIF}
  {$IFDEF USEPNG} PngImageList, PngFunctions, PngImage, {$ENDIF}
  sSkinManager, sCommonData, sConst, sBitBtn, sSpeedButton;


var
  ThirdPartySkipForms: TStringList;
  InitDevEx: procedure (const Active: boolean);
  CheckDevEx: function (const Control: TControl): boolean;
  RefreshDevEx: procedure;


type
  TacDrawGlyphData = record
    Blend,
    SkinIndex,
    NumGlyphs,
    ImageIndex,
    CurrentState: integer;

    Down,
    Grayed,
    Enabled,
    Reflected: boolean;

    Glyph,
    DstBmp: TBitmap;

    ImgRect: TRect;
    Canvas: TCanvas;
    BGColor: TColor;
    Images: TCustomImageList;
    SkinManager: TsSkinManager;
    DisabledGlyphKind: TsDisabledGlyphKind;
  end;

{$IFDEF FPC}
  TTBCustomDrawFlags = set of (tbNoEdges, tbHiliteHotTrack, tbNoOffset, tbNoMark, tbNoEtchedEffect);
{$ENDIF}


function GetImageCount(ImgList: TCustomImageList): integer;
function GetImageWidth(ImgList: TCustomImageList): integer;
function GetImageHeight(ImgList: TCustomImageList): integer;
procedure DrawBtnGlyph(Button: TControl; Canvas: TCanvas = nil);
procedure CopyToolBtnGlyph(ToolBar: TToolBar; Button: TToolButton; State: TCustomDrawState; Stage: TCustomDrawStage; var Flags: TTBCustomDrawFlags; BtnBmp: TBitmap);
procedure acDrawGlyphEx(DrawData: TacDrawGlyphData);


implementation

uses
  math,
  {$IFDEF DEVEX2011} acLFPainter, {$ENDIF}
  {$IFDEF DEVEX6} acLFPainter6, {$ENDIF} // for projects which uses the DEVEX key
  sDefaults, sGraphUtils, acAlphaImageList, acntUtils, sButton, sAlphaGraph, sMessages;



function GetImageCount(ImgList: TCustomImageList): integer;
begin
  if ImgList <> nil then
{$IFDEF USEPNG}
    if ImgList is TPngImageList then
      Result := TPngImageList(ImgList).PngImages.Count
    else
{$ENDIF}
      if ImgList is TsVirtualImageList then
        Result := TsVirtualImageList(ImgList).Count
      else
        Result := ImgList.Count
  else
    Result := 0;
end;


function GetImageWidth(ImgList: TCustomImageList): integer;
begin
  if ImgList is TsAlphaImageList then
    Result := TsAlphaImageList(ImgList).Width
  else
    Result := ImgList.Width;
end;


function GetImageHeight(ImgList: TCustomImageList): integer;
begin
  if ImgList is TsAlphaImageList then
    Result := TsAlphaImageList(ImgList).Height
  else
    Result := ImgList.Height;
end;


procedure acDrawGlyphEx(DrawData: TacDrawGlyphData);
var
  b: boolean;
  GrayColor: TColor;
  S0, S: PRGBAArray_;
  MaskColor: TsColor;
  TmpBmp, Bmp: TBitmap;
  nEvent: TNotifyEvent;
  IRect, SrcRect: TRect;
  DeltaS, X, Y, ActBlend: integer;
{$IFDEF USEPNG}
  PngCopy: TPNGObject;
{$ENDIF}

  procedure PrepareGlyph;
  begin
    with DrawData do begin
      Bmp.Width := GetImageWidth(Images);
      Bmp.Height := GetImageHeight(Images);
      Bmp.PixelFormat := pf32bit;
      if Images.BkColor <> clNone then
        MaskColor.C := Images.BkColor
      else
        MaskColor.C := clFuchsia;

      Bmp.Canvas.Brush.Color := MaskColor.C;
      Bmp.Canvas.FillRect(MkRect(Bmp));
      Images.GetBitmap(ImageIndex, Bmp);
    end;
  end;

begin
  with DrawData do begin
    if Grayed then
      GrayColor := DrawData.BGColor
    else
      GrayColor := clNone;

    if (DefaultManager <> nil) and DefaultManager.Options.StdGlyphsOrder then begin
      case CurrentState of
        0:
          if not Enabled then
            DrawData.CurrentState := 1;

        1: DrawData.CurrentState := 0

        else
          if NumGlyphs < 3 then
            DrawData.CurrentState := 0;
      end;
    end;

    if Assigned(Images) and IsValidIndex(ImageIndex, GetImageCount(Images)) then begin
      IRect := ImgRect;
{$IFDEF USEPNG}
      if (Images is TPngImageList) and (TPngImageCollectionItem(TPngImageList(Images).PngImages.Items[ImageIndex]).PngImage <> nil) then begin
        PngCopy := nil;
        if Enabled then
          if (CurrentState > 0) or ((Blend = 0) and not Grayed) then begin
            PngCopy := TPngImageCollectionItem(TPngImageList(Images).PngImages.Items[ImageIndex]).PngImage;
            if DstBmp <> nil then
              PngCopy.Draw(DstBmp.Canvas, IRect)
            else
              PngCopy.Draw(Canvas, IRect);
          end
          else begin
            if Blend > 0 then begin
              PngCopy := TPNGObject.Create;
              PngCopy.Assign(TPngImageCollectionItem(TPngImageList(Images).PngImages.Items[ImageIndex]).PngImage);
              MakeImageBlended(PngCopy);
            end;
            if Grayed then begin
              if PngCopy = nil then begin
                PngCopy := TPNGObject.Create;
                PngCopy.Assign(TPngImageCollectionItem(TPngImageList(Images).PngImages.Items[ImageIndex]).PngImage);
              end;
              MakeImageGrayscale(PngCopy);
            end;
            if PngCopy = nil then
              PngCopy := TPngImageCollectionItem(TPngImageList(Images).PngImages.Items[ImageIndex]).PngImage;

            if DstBmp <> nil then
              PngCopy.Draw(DstBmp.Canvas, IRect)
            else
              PngCopy.Draw(Canvas, IRect);

            FreeAndNil(PngCopy);
          end
        else begin
          if dgBlended in DisabledGlyphKind then begin
            PngCopy := TPNGObject.Create;
            PngCopy.Assign(TPngImageCollectionItem(TPngImageList(Images).PngImages.Items[ImageIndex]).PngImage);
            MakeImageBlended(PngCopy);
          end;
          if DrawData.Grayed then begin
            if PngCopy = nil then begin
              PngCopy := TPNGObject.Create;
              PngCopy.Assign(TPngImageCollectionItem(TPngImageList(Images).PngImages.Items[ImageIndex]).PngImage);
            end;
            MakeImageGrayscale(PngCopy);
          end;
          if PngCopy = nil then begin
            PngCopy := TPNGObject.Create;
            PngCopy.Assign(TPngImageCollectionItem(TPngImageList(Images).PngImages.Items[ImageIndex]).PngImage);
          end;
//            PngCopy := TPngImageCollectionItem(TPngImageList(Images).PngImages.Items[ImageIndex]).PngImage;

          if DstBmp <> nil then
            PngCopy.Draw(DstBmp.Canvas, IRect)
          else
            PngCopy.Draw(Canvas, IRect);

          FreeAndNil(PngCopy);
        end;
      end
      else
{$ENDIF}
      if (Images is TsAlphaImageList) or (Images is TsVirtualImageList) then
        if DstBmp <> nil then
          DrawAlphaImgList(Images, DstBmp, IRect.Left, IRect.Top, ImageIndex,
                 max(iff((CurrentState = 0), Blend, 0), iff(not Enabled and (dgBlended in DisabledGlyphKind), 50, 0)), GrayColor,
                 CurrentState + integer(Down), NumGlyphs, Reflected)
        else
          DrawAlphaImgListDC(Images, DrawData.Canvas.Handle, IRect.Left, IRect.Top, ImageIndex,
                 max(iff((CurrentState = 0), Blend, 0), iff(not Enabled and (dgBlended in DisabledGlyphKind), 50, 0)), GrayColor,
                 CurrentState + integer(Down), NumGlyphs, Reflected)
      else begin
        Bmp := TBitmap.Create;
        try
          if (DstBmp <> nil) {$IFDEF DELPHI_XE} and not ((Images is TImageList) and (Images.ColorDepth = cd32Bit)) {$ENDIF} then begin
            PrepareGlyph;
            if not Enabled then begin
              if DrawData.Grayed then
                GrayScaleTrans(Bmp, TsColor(Bmp.Canvas.Pixels[0, 0]));

              if dgBlended in DisabledGlyphKind then
                BlendTransRectangle(DstBmp, IRect.Left, IRect.Top, Bmp, MkRect(Bmp), 127)
              else
                CopyTransBitmaps(DstBmp, Bmp, IRect.Left, IRect.Top, MaskColor);
            end
            else begin
              if (CurrentState = 0) and Grayed then
                GrayScaleTrans(Bmp, TsColor(Bmp.Canvas.Pixels[0, 0]));

              if (CurrentState = 0) and (Blend > 0) then
                BlendTransRectangle(DstBmp, IRect.Left, IRect.Top, Bmp, MkRect(Bmp), byte(Blend))
              else
                CopyTransBitmaps(DstBmp, Bmp, IRect.Left, IRect.Top, MaskColor);
            end;
          end
          else
            Images.Draw(DrawData.Canvas, IRect.Left, IRect.Top, ImageIndex);
        finally
          FreeAndNil(Bmp);
        end;
      end;
    end
    else
      if Assigned(Glyph) and not Glyph.Empty then begin
        if (Glyph.PixelFormat = pfDevice) or not Enabled or (Glyph.PixelFormat = pf32bit) and ((DefaultManager = nil) or DefaultManager.Options.CheckEmptyAlpha) then begin
          nEvent := Glyph.OnChange;
          Glyph.OnChange := nil;
          Glyph.HandleType := bmDIB;
          if (Glyph.Handle <> 0) and (Glyph.PixelFormat = pf32bit) then begin // Checking for an empty alpha-channel
            b := False;
            if InitLine(Glyph, Pointer(S0), DeltaS) then
              for Y := 0 to Glyph.Height - 1 do begin
                S := Pointer(LongInt(S0) + DeltaS * Y);
                for X := 0 to Glyph.Width - 1 do
                  if S[X].A <> 0 then begin
                    b := True;
                    Break;
                  end;
              end;

            if not b then
              Glyph.PixelFormat := pf24bit;
          end;
          Glyph.OnChange := nEvent;
        end;
        if Glyph.PixelFormat = pf32bit then begin // Patch if Png, dosn't work in std. mode
          SrcRect.Left := WidthOf(ImgRect, True) * min(CurrentState, NumGlyphs - 1);
          SrcRect.Top := 0;
          SrcRect.Right := SrcRect.Left + WidthOf(ImgRect, True);
          SrcRect.Bottom := Glyph.Height;
          if DstBmp <> nil then begin
            Glyph.Handle;
            CopyBmp32(ImgRect, SrcRect, DstBmp, Glyph, EmptyCI, False, GrayColor, iff(CurrentState = 0, Blend, 0), Reflected);
          end
          else begin
            TmpBmp := CreateBmp32(ImgRect);
            BitBlt(TmpBmp.Canvas.Handle, 0, 0, TmpBmp.Width, Glyph.Height, Glyph.Canvas.Handle, SrcRect.Left, SrcRect.Top, SRCCOPY);
            if not Enabled and (dgBlended in DisabledGlyphKind) then
              ActBlend := max(50, Blend)
            else
              ActBlend := Blend;

            if (CurrentState = 0) and (ActBlend <> 0) then
              if InitLine(TmpBmp, Pointer(S0), DeltaS) then
                for Y := 0 to TmpBmp.Height - 1 do begin
                  S := Pointer(LongInt(S0) + DeltaS * Y);
                  for X := 0 to TmpBmp.Width - 1 do
                    with S[X] do
                      A := (A * ActBlend) div 100;
                end;

            if not Enabled and (dgGrayed in DisabledGlyphKind) or (CurrentState = 0) and Grayed then
              GrayScale(TmpBmp);

            Bmp := CreateBmp32(ImgRect);
            BitBlt(Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, Canvas.Handle, ImgRect.Left, ImgRect.Top, SRCCOPY);
            DrawBmp(Canvas, TmpBmp, ImgRect, Reflected);
            FreeAndNil(Bmp);
            FreeAndNil(TmpBmp);
          end;
        end
        else
          if DstBmp = nil then begin
            Bmp := CreateBmp32(ImgRect);
            BitBlt(Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, Canvas.Handle, ImgRect.Left, ImgRect.Top, SRCCOPY);
            sGraphUtils.DrawGlyphEx(Glyph, Bmp, MkRect(Bmp), NumGlyphs, Enabled, DisabledGlyphKind, CurrentState, Blend, Down, Reflected);
            BitBlt(Canvas.Handle, ImgRect.Left, ImgRect.Top, Bmp.Width, Bmp.Height, Bmp.Canvas.Handle, 0, 0, SRCCOPY);
            FreeAndNil(Bmp);
          end
          else
            sGraphUtils.DrawGlyphEx(Glyph, DstBmp, ImgRect, NumGlyphs, Enabled, DisabledGlyphKind, CurrentState, Blend, Down, Reflected);
      end
  end;
end;


procedure DrawBtnGlyph(Button: TControl; Canvas: TCanvas = nil);
var
  DrawData: TacDrawGlyphData;

  procedure GetCommonData(SkinData: TsCtrlSkinData);
  begin
    DrawData.SkinManager := SkinData.SkinManager;
    DrawData.DstBmp := SkinData.FCacheBmp;
    if (DrawData.CurrentState = 0) and
         (SkinData.FOwnerControl.Parent <> nil) and
           (SkinData.SkinManager <> nil) and SkinData.SkinManager.IsValidSkinIndex(SkinData.SkinIndex) and
             (SkinData.SkinManager.gd[SkinData.SkinIndex].Props[0].Transparency = 100) then
      DrawData.SkinIndex := GetFontIndex(Button, SkinData.SkinIndex, SkinData.SkinManager)
    else
      DrawData.SkinIndex := SkinData.SkinIndex;

    if SkinData.CustomColor then
      DrawData.BGColor := TsAccessControl(Button).Color
    else
      if (SkinData.SkinManager <> nil) and SkinData.SkinManager.IsValidSkinIndex(DrawData.SkinIndex) then
        DrawData.BGColor := SkinData.SkinManager.gd[DrawData.SkinIndex].Props[0].Color
      else
        DrawData.BGColor := $FFFFFF;

    if SkinData.HUEOffset <> 0 then
      DrawData.BGColor := ChangeHue(SkinData.HUEOffset, DrawData.BGColor);
  end;

begin
  DrawData.Canvas := Canvas;
  if Button is TsButton then
    with TsButton(Button) do begin
      DrawData.Images            := Images;
      DrawData.Glyph             := nil;
      DrawData.ImageIndex        := GlyphIndex;
      DrawData.ImgRect           := GlyphRect;
      DrawData.NumGlyphs         := 1;
      DrawData.Enabled           := Enabled;
      DrawData.Blend             := 0;
      DrawData.Down              := CurrentState = 2;
        if CurrentState = 0 then
          DrawData.Grayed := False
        else
          DrawData.Grayed := SkinData.Skinned and (SkinData.SkinManager <> nil) and SkinData.SkinManager.Effects.DiscoloredGlyphs;

      DrawData.CurrentState      := CurrentState;
      DrawData.DisabledGlyphKind := DefDisabledGlyphKind;
      DrawData.Reflected         := Reflected;
      GetCommonData(SkinData);
    end
  else
    if Button is TsBitBtn then
      with TsBitBtn(Button) do begin
        DrawData.Images            := Images;
        DrawData.Glyph             := Glyph;
        DrawData.ImageIndex        := ImageIndex;
        DrawData.ImgRect           := ImgRect;
        DrawData.NumGlyphs         := NumGlyphs;
        DrawData.Enabled           := Enabled;
        DrawData.Blend             := Blend;
        DrawData.Down              := Down;
        if CurrentState <> 0 then
          DrawData.Grayed := False
        else
          if SkinData.SkinManager <> nil then
            DrawData.Grayed := Grayed or SkinData.SkinManager.Effects.DiscoloredGlyphs or (not Enabled and (dkGrayed in DisabledKind))
          else
            DrawData.Grayed := Grayed or (not Enabled and (dkGrayed in DisabledKind));

        if not Enabled and (dgGrayed in DisabledGlyphKind) then
          DrawData.Grayed := True;

        DrawData.CurrentState      := CurrentState;
        DrawData.DisabledGlyphKind := DisabledGlyphKind;
        DrawData.Reflected         := Reflected;
        GetCommonData(SkinData);
        if GlyphColorTone <> clNone then begin
          DrawData.Grayed := True;
          DrawData.BGColor := GlyphColorTone;
        end;
      end
    else
      if Button is TsSpeedButton then
        with TsSpeedButton(Button) do begin
          DrawData.Images            := Images;
          DrawData.Glyph             := Glyph;
          DrawData.ImageIndex        := CurrentImageIndex;
          DrawData.CurrentState      := CurrentState;
          DrawData.ImgRect           := ImgRect;
          DrawData.NumGlyphs         := NumGlyphs;
          DrawData.Enabled           := Enabled;
          DrawData.Blend             := Blend;
          DrawData.Down              := Down;
          if SkinData.SkinManager <> nil then
            DrawData.Grayed := (GrayedMode = gmAlways) or (Grayed or SkinData.SkinManager.Effects.DiscoloredGlyphs) and (CurrentState = 0) or (not Enabled and (dkGrayed in DisabledKind))
          else
            DrawData.Grayed := Grayed or (not Enabled and (dkGrayed in DisabledKind));

          if not Enabled and (dgGrayed in DisabledGlyphKind) then
            DrawData.Grayed := True;

          DrawData.DisabledGlyphKind := DisabledGlyphKind;
          DrawData.Reflected         := Reflected;
          GetCommonData(SkinData);
          if GlyphColorTone <> clNone then begin
            DrawData.Grayed := True;
            DrawData.BGColor := GlyphColorTone;
          end;
        end
      else
        Exit;

  if DrawData.SkinIndex < 0 then
    DrawData.DstBmp := nil;

  acDrawGlyphEx(DrawData);
end;


procedure CopyToolBtnGlyph(ToolBar: TToolBar; Button: TToolButton; State: TCustomDrawState; Stage: TCustomDrawStage; var Flags: TTBCustomDrawFlags; BtnBmp: TBitmap);
var
  DrawData: TacDrawGlyphData;
  sd: TsCommonData;

  function AddedWidth: integer;
  begin
    Result := integer(Button.Style = tbsDropDown) * 8;
  end;

  function ImgRect: TRect;
  begin
    with ToolBar do
      if not List then begin
        Result.Left   := (Button.Width - Images.Width) div 2 + 1 - AddedWidth;
        Result.Top    := (Button.Height - Images.Height - integer(ShowCaptions) * (BtnBmp.Canvas.TextHeight('A') + 3)) div 2;
        Result.Right  := Result.Left + Images.Width;
        Result.Bottom := Result.Top + Images.Height;
      end
      else begin
        Result.Left   := 5;
        Result.Top    := (Button.Height - Images.Height) div 2;
        Result.Right  := Result.Left + Images.Width;
        Result.Bottom := Result.Top + Images.Height;
      end;
  end;

  function GetImages: TCustomImageList;
  begin
    with ToolBar do
      if (DrawData.CurrentState <> 0) and Assigned(HotImages) and (Button.ImageIndex < GetImageCount(HotImages)) then
        Result := HotImages
      else
        if not Button.Enabled and Assigned(DisabledImages) then
          Result := DisabledImages
        else
          Result := Images;
  end;

begin
  DrawData.Grayed := False;
  with ToolBar do begin
    if cdsSelected in State then
      DrawData.CurrentState := 2
    else
      if cdsHot in State then
        DrawData.CurrentState := 1
      else
        DrawData.CurrentState := integer(cdsChecked in State) * 2;

{$IFNDEF ALITE}
    if ToolBar is TsToolBar then begin
      sd := TsToolBar(ToolBar).SkinData;
      DrawData.Grayed := dkGrayed in TsToolBar(ToolBar).BtnDisabledKind;
    end
    else
{$ENDIF}
      sd := TsCommonData(SendMessage(Handle, SM_ALPHACMD, AC_GETSKINDATA_HI, 0));

    if sd <> nil then begin
      DrawData.Grayed := DrawData.Grayed or (DrawData.CurrentState = 0) and (sd.SkinManager <> nil) and sd.SkinManager.Effects.DiscoloredGlyphs;
      DrawData.SkinManager := sd.SkinManager;
      if (DrawData.CurrentState = 0) and
           (sd.FOwnerControl.Parent <> nil) and
             (sd.SkinManager.gd[sd.SkinIndex].Props[0].Transparency = 100) then
        DrawData.SkinIndex := GetFontIndex(ToolBar, sd.SkinIndex, sd.SkinManager)
      else
        DrawData.SkinIndex := sd.SkinIndex;
    end
    else begin
      DrawData.Grayed            := False;
      DrawData.SkinManager       := nil;
      DrawData.SkinIndex         := -1;
    end;
    if (cdsDisabled in State) and (DisabledImages <> nil) then
      DrawData.Images := DisabledImages
    else
      if (DrawData.CurrentState = 1) and (HotImages <> nil) then
        DrawData.Images := HotImages
      else
        DrawData.Images := Images;

    DrawData.Glyph             := nil;
    DrawData.ImageIndex        := Button.ImageIndex;
    DrawData.ImgRect           := ImgRect;
    DrawData.NumGlyphs         := 1;
    DrawData.Enabled           := Enabled;
    DrawData.Blend             := 0;
    DrawData.Down              := DrawData.CurrentState = 2;

{$IFNDEF ALITE}
    if DrawData.Grayed then begin
      DrawData.DisabledGlyphKind := [dgGrayed];
      if (DrawData.SkinIndex >= 0) and (DrawData.SkinManager <> nil) then
        DrawData.BGColor := DrawData.SkinManager.gd[DrawData.SkinIndex].Props[0].Color
    end
    else
{$ENDIF}
      DrawData.DisabledGlyphKind := [];

    DrawData.Reflected         := False;
    DrawData.DstBmp            := BtnBmp;
    DrawData.Canvas            := BtnBmp.Canvas;
  end;
  if DrawData.CurrentState = 2 then
    if (DrawData.SkinManager = nil) or TsSkinManager(DrawData.SkinManager).ButtonsOptions.ShiftContentOnClick then
      OffsetRect(DrawData.ImgRect, 1, 1);

  acDrawGlyphEx(DrawData);
end;


initialization
  // Create a list of form types which will be excluded from skinning
  ThirdPartySkipForms := TStringList.Create;
  ThirdPartySkipForms.Sorted := True;
  ThirdPartySkipForms.Add('TApplication');
//  ThirdPartySkipForms.Add('TQRStandardPreview');
  ThirdPartySkipForms.Add('TfcPopup'); {FastCube popup}
  ThirdPartySkipForms.Add('TcxComboBoxPopupWindow');
  ThirdPartySkipForms.Add('TcxCustomPopupWindow');
  ThirdPartySkipForms.Add('TdxPopupEditForm');
  ThirdPartySkipForms.Add('TcxDateEditPopupWindow');
  ThirdPartySkipForms.Add('TcxGridFilterPopup');

  
finalization
  ThirdPartySkipForms.Free;

end.
