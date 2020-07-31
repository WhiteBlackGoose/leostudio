object Form3: TForm3
  Left = 412
  Top = 234
  Width = 240
  Height = 175
  BorderIcons = []
  Caption = 'Adding...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 0
    Top = 0
    Width = 224
    Height = 137
    Align = alClient
    Caption = 'Input opt'
    TabOrder = 0
    object btn1: TButton
      Left = 72
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btn1Click
    end
    object lbledt1: TLabeledEdit
      Left = 16
      Top = 64
      Width = 185
      Height = 21
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = 'lbledt1'
      TabOrder = 1
      OnKeyDown = lbledt1KeyDown
    end
  end
end
