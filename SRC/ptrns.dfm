object Form5: TForm5
  Left = 315
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Choose pattern for your site'
  ClientHeight = 477
  ClientWidth = 811
  Color = clBtnFace
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 477
    Align = alClient
    Color = clWhite
    TabOrder = 0
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 809
      Height = 475
      ActivePage = ts1
      Align = alClient
      MultiLine = True
      TabOrder = 0
      object ts1: TTabSheet
        Caption = 'Basic'
      end
      object ts2: TTabSheet
        Caption = 'Structures'
        ImageIndex = 1
      end
      object ts3: TTabSheet
        Caption = 'Structures and styles'
        ImageIndex = 2
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 88
    Top = 116
  end
end
