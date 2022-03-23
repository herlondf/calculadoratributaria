object frmCalculadoraTributaria: TfrmCalculadoraTributaria
  Left = 0
  Top = 0
  Caption = 'Calculadora Tribut'#225'ria'
  ClientHeight = 559
  ClientWidth = 944
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblFrete: TLabel
    Left = 14
    Top = 78
    Width = 26
    Height = 13
    Caption = 'Frete'
  end
  object lblUF: TLabel
    Left = 14
    Top = 8
    Width = 14
    Height = 13
    Caption = 'UF'
  end
  object lblCRT: TLabel
    Left = 268
    Top = 8
    Width = 178
    Height = 13
    Caption = 'CRT (C'#243'digo do Regime Tribut'#225'rio)'
  end
  object lblCST: TLabel
    Left = 483
    Top = 8
    Width = 19
    Height = 13
    Caption = 'CST'
  end
  object lblCSOSN: TLabel
    Left = 555
    Top = 8
    Width = 36
    Height = 13
    Caption = 'CSOSN'
  end
  object lblSeguro: TLabel
    Left = 141
    Top = 78
    Width = 37
    Height = 13
    Caption = 'Seguro'
  end
  object lblDespesas: TLabel
    Left = 268
    Top = 78
    Width = 89
    Height = 13
    Caption = 'Despesas(Outras)'
  end
  object lblDesconto: TLabel
    Left = 395
    Top = 78
    Width = 71
    Height = 13
    Caption = 'Desconto (R$)'
  end
  object lblIndIEDest: TLabel
    Left = 86
    Top = 8
    Width = 159
    Height = 13
    Caption = 'Indicador da IE do destinat'#225'rio'
  end
  object lblDadosGlobaisNota: TLabel
    Left = 14
    Top = 62
    Width = 136
    Height = 13
    Caption = 'DADOS GERAIS DA NOTA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDadosItemNota: TLabel
    Left = 14
    Top = 126
    Width = 141
    Height = 13
    Caption = 'DADOS DO ITEM DA NOTA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblQuantidade: TLabel
    Left = 14
    Top = 194
    Width = 61
    Height = 13
    Caption = 'Quantidade'
  end
  object lblValorUnitario: TLabel
    Left = 141
    Top = 194
    Width = 71
    Height = 13
    Caption = 'Valor Unit'#225'rio'
  end
  object lblDescontoUnitario: TLabel
    Left = 14
    Top = 234
    Width = 94
    Height = 13
    Caption = 'Desconto Unit'#225'rio'
  end
  object lblTotalProd: TLabel
    Left = 522
    Top = 340
    Width = 75
    Height = 13
    Caption = 'Total Produtos'
  end
  object lblTotalNF: TLabel
    Left = 649
    Top = 340
    Width = 42
    Height = 13
    Caption = 'Total NF'
  end
  object lblAliquotaICMS: TLabel
    Left = 286
    Top = 194
    Width = 73
    Height = 13
    Caption = 'Al'#237'quota ICMS'
  end
  object lblAliquotaICMSST: TLabel
    Left = 413
    Top = 151
    Width = 88
    Height = 13
    Caption = 'Al'#237'quota ICMS ST'
  end
  object lblAliquotaST: TLabel
    Left = 413
    Top = 194
    Width = 59
    Height = 13
    Caption = 'Al'#237'quota ST'
  end
  object lblAliquotaIPI: TLabel
    Left = 413
    Top = 233
    Width = 59
    Height = 13
    Caption = 'Al'#237'quota IPI'
  end
  object lblMVA: TLabel
    Left = 555
    Top = 194
    Width = 23
    Height = 13
    Caption = 'MVA'
  end
  object lblReducaoBC: TLabel
    Left = 682
    Top = 194
    Width = 61
    Height = 13
    Caption = 'Redu'#231#227'o BC'
  end
  object lblReducaoBCST: TLabel
    Left = 682
    Top = 234
    Width = 76
    Height = 13
    Caption = 'Redu'#231#227'o BC ST'
  end
  object lblDiferimento: TLabel
    Left = 555
    Top = 234
    Width = 61
    Height = 13
    Caption = 'Diferimento'
  end
  object lblBCSTRetido: TLabel
    Left = 809
    Top = 194
    Width = 65
    Height = 13
    Caption = 'BC ST Retido'
  end
  object lblICMSSTRetido: TLabel
    Left = 809
    Top = 234
    Width = 78
    Height = 13
    Caption = 'ICMS ST Retido'
  end
  object lblAliquotaSN: TLabel
    Left = 286
    Top = 234
    Width = 61
    Height = 13
    Caption = 'Al'#237'quota SN'
  end
  object lblCSTIPI: TLabel
    Left = 627
    Top = 8
    Width = 12
    Height = 13
    Caption = 'IPI'
  end
  object lblDescontoTotalItem: TLabel
    Left = 141
    Top = 234
    Width = 102
    Height = 13
    Caption = 'Desconto Total Item'
  end
  object lblProdutoID: TLabel
    Left = 14
    Top = 147
    Width = 10
    Height = 13
    Caption = 'Id'
  end
  object lblTotalizadorNota: TLabel
    Left = 14
    Top = 318
    Width = 93
    Height = 13
    Caption = 'TOTALIZADORES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotalBC: TLabel
    Left = 14
    Top = 337
    Width = 41
    Height = 13
    Caption = 'Total BC'
  end
  object lblTotalICMS: TLabel
    Left = 141
    Top = 337
    Width = 54
    Height = 13
    Caption = 'Total ICMS'
  end
  object lblTotalBCST: TLabel
    Left = 268
    Top = 337
    Width = 56
    Height = 13
    Caption = 'Total BC ST'
  end
  object lblTotalICMSST: TLabel
    Left = 395
    Top = 337
    Width = 69
    Height = 13
    Caption = 'Total ICMS ST'
  end
  object lblTotalFrete: TLabel
    Left = 14
    Top = 382
    Width = 54
    Height = 13
    Caption = 'Total Frete'
  end
  object lblTotalSeg: TLabel
    Left = 141
    Top = 382
    Width = 65
    Height = 13
    Caption = 'Total Seguro'
  end
  object lblTotalOutros: TLabel
    Left = 268
    Top = 382
    Width = 64
    Height = 13
    Caption = 'Total Outros'
  end
  object lblTotalDesconto: TLabel
    Left = 395
    Top = 382
    Width = 80
    Height = 13
    Caption = 'Total Desconto '
  end
  object cmbCRT: TComboBox
    Left = 268
    Top = 24
    Width = 209
    Height = 22
    Style = csOwnerDrawVariable
    TabOrder = 2
    OnSelect = OnSelect
  end
  object cmbUF: TComboBox
    Left = 14
    Top = 24
    Width = 66
    Height = 22
    Style = csOwnerDrawVariable
    TabOrder = 0
    OnSelect = OnSelect
  end
  object cmbCST: TComboBox
    Left = 483
    Top = 24
    Width = 66
    Height = 22
    Style = csOwnerDrawVariable
    TabOrder = 3
    OnSelect = OnSelect
  end
  object cmbCSOSN: TComboBox
    Left = 555
    Top = 24
    Width = 66
    Height = 22
    Style = csOwnerDrawVariable
    TabOrder = 4
    OnSelect = OnSelect
  end
  object edtFrete: TEdit
    Left = 14
    Top = 94
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object edtSeguro: TEdit
    Left = 141
    Top = 94
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object edtDespesas: TEdit
    Left = 268
    Top = 94
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object edtDesconto: TEdit
    Left = 395
    Top = 94
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object cmbIndIEDest: TComboBox
    Left = 86
    Top = 24
    Width = 176
    Height = 22
    Style = csOwnerDrawVariable
    TabOrder = 1
    OnSelect = OnSelect
  end
  object edtQuantidade: TEdit
    Left = 14
    Top = 210
    Width = 121
    Height = 21
    TabOrder = 12
    OnChange = edtOnChange
  end
  object edtValorUnitario: TEdit
    Left = 141
    Top = 210
    Width = 121
    Height = 21
    TabOrder = 13
    OnChange = edtOnChange
  end
  object edtDescontoUnitario: TEdit
    Left = 14
    Top = 250
    Width = 121
    Height = 21
    TabOrder = 14
    OnChange = edtOnChange
  end
  object edtTotalProd: TEdit
    Left = 522
    Top = 356
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 28
  end
  object edtTotalNF: TEdit
    Left = 649
    Top = 356
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 29
  end
  object edtAliquotaICMS: TEdit
    Left = 286
    Top = 210
    Width = 121
    Height = 21
    TabOrder = 16
    OnChange = edtOnChange
  end
  object edtAliquotaICMSST: TEdit
    Left = 413
    Top = 167
    Width = 121
    Height = 21
    TabOrder = 17
  end
  object edtAliquotaST: TEdit
    Left = 413
    Top = 210
    Width = 121
    Height = 21
    TabOrder = 18
  end
  object edtAliquotaIPI: TEdit
    Left = 413
    Top = 249
    Width = 121
    Height = 21
    TabOrder = 20
  end
  object edtMVA: TEdit
    Left = 555
    Top = 210
    Width = 121
    Height = 21
    TabOrder = 21
  end
  object edtReducaoBC: TEdit
    Left = 682
    Top = 210
    Width = 121
    Height = 21
    TabOrder = 22
  end
  object edtReducaoBCST: TEdit
    Left = 682
    Top = 250
    Width = 121
    Height = 21
    TabOrder = 24
  end
  object edtDiferimento: TEdit
    Left = 555
    Top = 250
    Width = 121
    Height = 21
    TabOrder = 25
  end
  object edtBCSTRetido: TEdit
    Left = 809
    Top = 210
    Width = 121
    Height = 21
    TabOrder = 23
  end
  object edtICMSSTRetido: TEdit
    Left = 809
    Top = 250
    Width = 121
    Height = 21
    TabOrder = 26
  end
  object edtAliquotaSN: TEdit
    Left = 286
    Top = 250
    Width = 121
    Height = 21
    TabOrder = 19
  end
  object cmbCSTIPI: TComboBox
    Left = 627
    Top = 24
    Width = 66
    Height = 22
    Style = csOwnerDrawVariable
    TabOrder = 5
    OnSelect = OnSelect
  end
  object btnAdicionar: TButton
    Left = 855
    Top = 289
    Width = 75
    Height = 25
    Caption = '&Adicionar'
    TabOrder = 27
    OnClick = btnAdicionarClick
  end
  object edtDescontoTotalItem: TEdit
    Left = 141
    Top = 250
    Width = 121
    Height = 21
    TabOrder = 15
    OnChange = edtOnChange
  end
  object edtProdutoID: TEdit
    Left = 14
    Top = 166
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object btnInicializar: TButton
    Left = 522
    Top = 92
    Width = 75
    Height = 25
    Caption = 'Inicializar'
    TabOrder = 10
    OnClick = btnInicializarClick
  end
  object mmoLog: TMemo
    AlignWithMargins = True
    Left = 14
    Top = 432
    Width = 916
    Height = 113
    Margins.Left = 14
    Margins.Right = 14
    Margins.Bottom = 14
    Align = alBottom
    Lines.Strings = (
      'mmoLog')
    ScrollBars = ssVertical
    TabOrder = 30
  end
  object edtTotalBC: TEdit
    Left = 14
    Top = 356
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 31
  end
  object edtTotalICMS: TEdit
    Left = 141
    Top = 356
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 32
  end
  object edtTotalBCST: TEdit
    Left = 268
    Top = 356
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 33
  end
  object edtTotalICMSST: TEdit
    Left = 395
    Top = 356
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 34
  end
  object edtTotalFrete: TEdit
    Left = 14
    Top = 398
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 35
  end
  object edtTotalSeg: TEdit
    Left = 141
    Top = 398
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 36
  end
  object edtTotalOutros: TEdit
    Left = 268
    Top = 398
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 37
  end
  object edtTotalDesc: TEdit
    Left = 395
    Top = 398
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 38
  end
  object btnSimular: TButton
    Left = 855
    Top = 320
    Width = 75
    Height = 25
    Caption = '&Simular'
    TabOrder = 39
    OnClick = btnSimularClick
  end
end
