object frmTelaInicial_DRF: TfrmTelaInicial_DRF
  Left = 0
  Top = 0
  Caption = 'DRF'
  ClientHeight = 221
  ClientWidth = 383
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
  object btImprimir: TButton
    Left = 272
    Top = 177
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 4
    OnClick = btImprimirClick
  end
  object GroupBox1: TGroupBox
    Left = 194
    Top = 5
    Width = 186
    Height = 52
    Caption = 'Por data de'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object comboBoxPeriodo: TComboBox
      Left = 8
      Top = 17
      Width = 145
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = 'Data de pagamento '
      Items.Strings = (
        'Data de pagamento '
        'Data de lan'#231'amento')
    end
  end
  object GroupBox2: TGroupBox
    Left = 7
    Top = 5
    Width = 185
    Height = 52
    Caption = 'Per'#237'odo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 86
      Top = 17
      Width = 14
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object dataini: TMaskEdit
      Left = 8
      Top = 14
      Width = 78
      Height = 21
      Alignment = taCenter
      AutoSize = False
      EditMask = '!99/99/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
    end
    object datafin: TMaskEdit
      Left = 101
      Top = 14
      Width = 78
      Height = 21
      Alignment = taCenter
      AutoSize = False
      EditMask = '!99/99/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object GroupBox3: TGroupBox
    Left = 7
    Top = 126
    Width = 202
    Height = 76
    Caption = 'Percentual conta analitica sobre:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object rb_analitica_sReceitas: TRadioButton
      Left = 14
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Receitas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object rb_analitica_sDespesas: TRadioButton
      Left = 14
      Top = 33
      Width = 113
      Height = 17
      Caption = 'Despesas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object rb_analitica_sSintetica: TRadioButton
      Left = 14
      Top = 50
      Width = 113
      Height = 17
      Caption = 'Conta Sintetica (Pai)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object GroupBox4: TGroupBox
    Left = 7
    Top = 63
    Width = 169
    Height = 63
    Caption = 'Percentual sintetica sobre:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object rb_Sintetica_Receitas: TRadioButton
      Left = 14
      Top = 11
      Width = 113
      Height = 17
      Caption = 'Receitas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object rb_Sinteticas_Despesas: TRadioButton
      Left = 14
      Top = 34
      Width = 113
      Height = 17
      Caption = 'Despesas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end
