object Form15: TForm15
  Left = 466
  Top = 224
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Project settings'
  ClientHeight = 305
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TsPageControl
    Left = 0
    Top = 0
    Width = 581
    Height = 257
    ActivePage = stbsht1
    Align = alTop
    TabHeight = 20
    TabOrder = 0
    TabWidth = 80
    OnChange = pgc1Change
    object stbsht1: TsTabSheet
      Caption = 'Application'
      object grp1: TsGroupBox
        Left = 0
        Top = 0
        Width = 573
        Height = 105
        Align = alTop
        Caption = 'Name for binary file'
        TabOrder = 0
        object lbl1: TsLabel
          Left = 8
          Top = 24
          Width = 161
          Height = 13
          Caption = 'Choose name for you application.'
        end
        object edt1: TsEdit
          Left = 8
          Top = 56
          Width = 553
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'edt1'
          OnChange = edt1Change
        end
      end
      object grp2: TsGroupBox
        Left = 0
        Top = 105
        Width = 573
        Height = 120
        Align = alTop
        Caption = 'Icon'
        TabOrder = 1
        object lbl2: TsLabel
          Left = 8
          Top = 24
          Width = 169
          Height = 13
          Caption = 'Choose an icon for you application.'
        end
        object btn1: TsSpeedButton
          Left = 536
          Top = 56
          Width = 23
          Height = 22
          Glyph.Data = {
            E6040000424DE604000000000000360000002800000014000000140000000100
            180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF577AB9577AB9577AB9577AB9577AB9
            577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577A
            B9577AB9FFFFFFFFFFFFFFFFFF577AB9577AB9577AB9577AB9577AB9577AB957
            7AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9
            FFFFFFFFFFFFFFFFFF577AB9577AB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF577AB9577AB9FFFFFFFF
            FFFFFFFFFF577AB9577AB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF577AB9577AB9FFFFFFFFFFFFFFFF
            FF577AB9577AB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF577AB9577AB9FFFFFFFFFFFFFFFFFF577AB9
            577AB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF577AB9577AB9FFFFFFFFFFFFFFFFFF577AB9577AB9FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF577AB9577AB9FFFFFFFFFFFFFFFFFF577AB9577AB9FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF577AB9577AB9FFFFFFFFFFFFFFFFFF577AB9577AB9FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF577A
            B9577AB9FFFFFFFFFFFFFFFFFF577AB9577AB9577AB9577AB9577AB9577AB957
            7AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9
            FFFFFFFFFFFFFFFFFF577AB9577AB9577AB9577AB9577AB9577AB9577AB9577A
            B9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9FFFFFFFF
            FFFFFFFFFF577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF577AB9577AB9577AB9577AB9577AB9577AB9577AB9577AB9FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF577AB9
            577AB9577AB9577AB9577AB9577AB9577AB9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          OnClick = btn1Click
        end
        object img1: TsImage
          Left = 24
          Top = 48
          Width = 57
          Height = 57
          Picture.Data = {07544269746D617000000000}
          SkinData.SkinSection = 'CHECKBOX'
        end
        object edt2: TsEdit
          Left = 88
          Top = 56
          Width = 441
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'edt1'
          OnChange = edt2Change
        end
      end
    end
    object stbsht2: TsTabSheet
      Caption = 'Forms'
      object stbcntrl1: TsTabControl
        Left = 0
        Top = 0
        Width = 573
        Height = 227
        Align = alClient
        TabHeight = 20
        TabOrder = 0
        TabWidth = 80
        OnChange = stbcntrl1Change
        OnChanging = stbcntrl1Changing
        object grp3: TsGroupBox
          Left = 4
          Top = 6
          Width = 565
          Height = 217
          Align = alClient
          Caption = 'Block paste'
          TabOrder = 0
          object lbl3: TsLabel
            Left = 16
            Top = 48
            Width = 44
            Height = 18
            Caption = '<html '
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object lbl4: TsLabel
            Left = 16
            Top = 24
            Width = 196
            Height = 13
            Caption = 'You can configurate options in <> blocks'
          end
          object lbl5: TsLabel
            Left = 192
            Top = 48
            Width = 11
            Height = 18
            Caption = '>'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object lbl6: TsLabel
            Left = 192
            Top = 80
            Width = 11
            Height = 18
            Caption = '>'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object lbl7: TsLabel
            Left = 16
            Top = 80
            Width = 48
            Height = 18
            Caption = '<head '
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object lbl8: TsLabel
            Left = 192
            Top = 112
            Width = 11
            Height = 18
            Caption = '>'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object lbl9: TsLabel
            Left = 16
            Top = 112
            Width = 48
            Height = 18
            Caption = '<body '
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object edt3: TsEdit
            Left = 64
            Top = 48
            Width = 121
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = edt3Change
          end
          object edt4: TsEdit
            Left = 64
            Top = 80
            Width = 121
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = edt4Change
          end
          object edt5: TsEdit
            Left = 64
            Top = 112
            Width = 121
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = edt5Change
          end
        end
      end
    end
  end
  object sbtbtn1: TsBitBtn
    Left = 496
    Top = 264
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = sbtbtn1Click
    Kind = bkOK
  end
  object dlg1: TsOpenDialog
    Filter = 'Icons|*.ico'
    Left = 468
    Top = 242
  end
end
