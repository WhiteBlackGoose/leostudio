object Form14: TForm14
  Left = 681
  Top = 269
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Compiling'
  ClientHeight = 109
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pb1: TsGauge
    Left = 0
    Top = 48
    Width = 257
    Height = 25
    ForeColor = clBlack
    MaxValue = 100
    Suffix = '%'
  end
  object lbl1: TsLabel
    Left = 104
    Top = 32
    Width = 34
    Height = 13
    Caption = 'Wait...'
  end
end
