object Form7: TForm7
  Left = 597
  Top = 297
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Changes'
  ClientHeight = 128
  ClientWidth = 346
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object t1: TLabel
    Left = 64
    Top = 32
    Width = 214
    Height = 23
    Caption = 'Do you want to save changes?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object sbtbtn1: TsBitBtn
    Left = 24
    Top = 80
    Width = 89
    Height = 33
    TabOrder = 0
    OnClick = btn1Click
    Kind = bkOK
  end
  object sbtbtn2: TsBitBtn
    Left = 128
    Top = 80
    Width = 89
    Height = 33
    TabOrder = 1
    OnClick = btn2Click
    Kind = bkNo
  end
  object sbtbtn3: TsBitBtn
    Left = 232
    Top = 80
    Width = 89
    Height = 33
    TabOrder = 2
    OnClick = btn3Click
    Kind = bkCancel
  end
end
