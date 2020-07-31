object Form2: TForm2
  Left = 729
  Top = 182
  BorderStyle = bsSingle
  Caption = 'HTML_Editor'
  ClientHeight = 267
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 208
    Top = 224
    Width = 121
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = btn1Click
  end
  object redte: TRichEdit
    Left = 24
    Top = 24
    Width = 457
    Height = 196
    Color = clBtnFace
    Lines.Strings = (
      
        'Welcome to HTML_Editor! Here you can create simple site with HTM' +
        'L '
      'for <1h!  '
      'Right panel:'
      '  Speed buttons for creating word or text'
      'Menus in top:'
      '  file:'
      '    Save as...:'
      '      function saving'
      '    Save:'
      '      function saving in old file'
      '    New: creating new file(clering text window)'
      '  Menu:'
      '    CSS: design files'
      '    HTML: code html')
    ReadOnly = True
    TabOrder = 1
  end
end
