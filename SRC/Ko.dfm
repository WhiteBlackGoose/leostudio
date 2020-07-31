object Form19: TForm19
  Left = 375
  Top = 174
  Width = 830
  Height = 469
  Caption = 'IDE Settings'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TsPageControl
    Left = 0
    Top = 0
    Width = 814
    Height = 431
    ActivePage = stbsht1
    Align = alClient
    TabOrder = 0
    object stbsht1: TsTabSheet
      Caption = 'Appearence'
      object grp1: TsGroupBox
        Left = 0
        Top = 0
        Width = 806
        Height = 73
        Align = alTop
        Caption = 'Theme'
        TabOrder = 0
        object lbl1: TsLabel
          Left = 16
          Top = 35
          Width = 36
          Height = 13
          Caption = 'Choose'
        end
        object lbl2: TsLabel
          Left = 264
          Top = 16
          Width = 78
          Height = 13
          Caption = 'Theme is active:'
        end
        object cbb1: TsComboBox
          Left = 72
          Top = 32
          Width = 145
          Height = 21
          Alignment = taLeftJustify
          VerticalAlignment = taAlignTop
          Style = csDropDownList
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 15
          ItemIndex = 0
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Text = 'WEB2'
          OnChange = cbb1Change
          Items.Strings = (
            'WEB2'
            'FM (internal)')
        end
        object sldr1: TsSlider
          Left = 280
          Top = 32
          TabOrder = 1
          OnClick = sldr1Click
          FontOn.Charset = DEFAULT_CHARSET
          FontOn.Color = clWindowText
          FontOn.Height = -11
          FontOn.Name = 'Tahoma'
          FontOn.Style = []
        end
      end
    end
  end
end
