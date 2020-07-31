object Form13: TForm13
  Left = 468
  Top = 304
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Error'
  ClientHeight = 142
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 20
    Top = 24
    Width = 208
    Height = 16
    Caption = 'Unknown error. You can see it in log'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 64
    Top = 40
    Width = 182
    Height = 16
    Caption = 'Would you like to repair Studio?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TsWebLabel
    Left = 32
    Top = 128
    Width = 24
    Height = 13
    Caption = 'Error'
    OnClick = lbl3Click
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HoverFont.Charset = DEFAULT_CHARSET
    HoverFont.Color = clWindowText
    HoverFont.Height = -11
    HoverFont.Name = 'Tahoma'
    HoverFont.Style = []
  end
  object sbtbtn1: TsBitBtn
    Left = 32
    Top = 88
    Width = 75
    Height = 25
    TabOrder = 0
    OnClick = sbtbtn1Click
    Kind = bkYes
  end
  object sbtbtn2: TsBitBtn
    Left = 216
    Top = 88
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = sbtbtn2Click
    Kind = bkNo
  end
  object mmo1: TsMemo
    Left = 32
    Top = 144
    Width = 257
    Height = 153
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
end
