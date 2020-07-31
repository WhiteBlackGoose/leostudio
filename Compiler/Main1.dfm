object Form1: TForm1
  Left = 213
  Top = 163
  Width = 1088
  Height = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wb1: TWebBrowser
    Left = 0
    Top = 0
    Width = 1072
    Height = 525
    Align = alClient
    TabOrder = 0
    OnBeforeNavigate2 = wb1BeforeNavigate2
    OnDocumentComplete = wb1DocumentComplete
    ControlData = {
      4C000000CB6E0000433600000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object tmr1: TTimer
    Interval = 1
    OnTimer = tmr1Timer
    Left = 280
    Top = 80
  end
end
