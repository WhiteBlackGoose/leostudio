object Form6: TForm6
  Left = 795
  Top = 326
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Form6'
  ClientHeight = 68
  ClientWidth = 295
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object im1: TImage
    Left = 224
    Top = 16
    Width = 233
    Height = 185
    Visible = False
    OnMouseDown = im1MouseDown
    OnMouseMove = im1MouseMove
    OnMouseUp = im1MouseUp
  end
  object btn1: TSpeedButton
    Left = 168
    Top = 40
    Width = 57
    Height = 25
    Caption = 'OK'
    Flat = True
    OnClick = btn1Click
  end
  object pb1: TPaintBox
    Left = 280
    Top = 32
    Width = 105
    Height = 105
  end
  object pnl1: TPanel
    Left = 56
    Top = 32
    Width = 33
    Height = 33
    Cursor = crArrow
    Color = clWhite
    TabOrder = 0
  end
  object clrbx1: TColorBox
    Left = 80
    Top = 0
    Width = 145
    Height = 22
    ItemHeight = 16
    TabOrder = 1
    OnChange = clrbx1Change
  end
end
