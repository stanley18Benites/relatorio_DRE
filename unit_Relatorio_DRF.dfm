object frmTelaRelatorio: TfrmTelaRelatorio
  Left = 0
  Top = 0
  Caption = 'frmRelatorio'
  ClientHeight = 460
  ClientWidth = 814
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
  object rpRelatorioDRF: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Margins.LeftMargin = 2.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 2.000000000000000000
    Margins.BottomMargin = 3.000000000000000000
    DataSource = dsDRF
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 8
      Top = 19
      Width = 778
      Height = 93
      BandType = btHeader
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 1107
        Height = 32
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Layout = tlCenter
        object RLLabel1: TRLLabel
          Left = 0
          Top = 0
          Width = 778
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'DEMONSTRATIVO DE RESULTADO FINANCEIRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
      end
      object RLPanel2: TRLPanel
        Left = 0
        Top = 38
        Width = 778
        Height = 34
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLLabel2: TRLLabel
          Left = 0
          Top = 3
          Width = 56
          Height = 16
          AutoSize = False
          Caption = 'Empresa: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 0
          Top = 17
          Width = 51
          Height = 14
          AutoSize = False
          Caption = 'Per'#237'odo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object labelPeriodo: TRLLabel
          Left = 56
          Top = 17
          Width = 358
          Height = 14
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentFont = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 1022
          Top = 3
          Width = 25
          Height = 14
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = itLastPageNumber
          Layout = tlCenter
          ParentFont = False
          Text = ''
        end
        object RLLabel4: TRLLabel
          Left = 1007
          Top = 3
          Width = 15
          Height = 14
          Alignment = taCenter
          AutoSize = False
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 972
          Top = 3
          Width = 34
          Height = 14
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = itPageNumber
          Layout = tlCenter
          ParentFont = False
          Text = ''
        end
        object RLLabel9: TRLLabel
          Left = 934
          Top = 3
          Width = 37
          Height = 14
          Caption = 'Pagina:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
        object labelNomeEmpresa: TRLLabel
          Left = 56
          Top = 3
          Width = 358
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentFont = False
        end
      end
      object RLLabel5: TRLLabel
        Left = 0
        Top = 72
        Width = 58
        Height = 16
        AutoSize = False
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 68
        Top = 72
        Width = 61
        Height = 16
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 577
        Top = 74
        Width = 82
        Height = 16
        AutoSize = False
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 737
        Top = 71
        Width = 38
        Height = 16
        AutoSize = False
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 8
      Top = 112
      Width = 778
      Height = 15
      Color = clWhite
      ParentColor = False
      Transparent = False
      BeforePrint = RLBand2BeforePrint
      object dbConta: TRLDBText
        Left = 0
        Top = 0
        Width = 320
        Height = 12
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = dsDRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object dbSaldoTotal: TRLDBText
        Left = 577
        Top = -1
        Width = 82
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'SALDO'
        DataSource = dsDRF
        DisplayMask = 'R$ #,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Layout = tlCenter
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLLabel14: TRLLabel
        Left = 737
        Top = -1
        Width = 38
        Height = 13
        AutoSize = False
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
        Transparent = False
      end
    end
  end
  object dsDRF: TDataSource
    DataSet = frm_dataModule.FDQuery1
    Left = 14
    Top = 11
  end
end
