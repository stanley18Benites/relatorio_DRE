object frmTelaRelatorio: TfrmTelaRelatorio
  Left = 0
  Top = 0
  Caption = 'frmRelatorio'
  ClientHeight = 460
  ClientWidth = 845
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
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dsDRF
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 103
      BandType = btHeader
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 32
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel1: TRLLabel
          Left = 133
          Top = 3
          Width = 453
          Height = 21
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
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
        Width = 718
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
          Left = 684
          Top = 17
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
          Left = 669
          Top = 17
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
          Left = 634
          Top = 17
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
          Left = 596
          Top = 17
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
        Top = 78
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
        Top = 78
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
        Left = 504
        Top = 78
        Width = 50
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
        Left = 631
        Top = 78
        Width = 77
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
    object RLGroup1: TRLGroup
      Left = 38
      Top = 141
      Width = 718
      Height = 70
      DataFields = 'TIPO'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 29
        BandType = btColumnHeader
        object dbConta: TRLDBText
          Left = 0
          Top = 1
          Width = 155
          Height = 16
          AutoSize = False
          DataField = 'TIPODESC'
          DataSource = dsDRF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
          Text = ''
        end
        object labelTipo: TRLLabel
          Left = 161
          Top = 1
          Width = 155
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 29
        Width = 718
        Height = 16
        object dbTipoConta: TRLDBText
          Left = 68
          Top = 3
          Width = 213
          Height = 11
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = dsDRF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentFont = False
          Text = ''
        end
        object RLDBText1: TRLDBText
          Left = 504
          Top = 3
          Width = 82
          Height = 11
          AutoSize = False
          DataField = 'SALDO'
          DataSource = dsDRF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 45
        Width = 718
        Height = 16
        BandType = btSummary
      end
    end
  end
  object dsDRF: TDataSource
    DataSet = frm_dataModule.FDQuery1
    Left = 798
    Top = 63
  end
end
