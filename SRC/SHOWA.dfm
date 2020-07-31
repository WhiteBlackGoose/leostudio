object Form16: TForm16
  Left = 547
  Top = 287
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'New form'
  ClientHeight = 145
  ClientWidth = 221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TsGroupBox
    Left = 0
    Top = 0
    Width = 221
    Height = 145
    Align = alClient
    Caption = 'Create new form'
    TabOrder = 0
    object edt1: TsEdit
      Left = 32
      Top = 56
      Width = 153
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Form'
    end
    object sbtbtn1: TsBitBtn
      Left = 64
      Top = 104
      Width = 75
      Height = 25
      TabOrder = 1
      OnClick = sbtbtn1Click
      Kind = bkOK
    end
  end
end
