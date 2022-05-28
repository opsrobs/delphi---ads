object frm_Pedido: Tfrm_Pedido
  Left = 0
  Top = 0
  Caption = 'frm_Pedido'
  ClientHeight = 677
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 628
    Width = 693
    Height = 49
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 491
    object spButtonReturn: TSpeedButton
      Left = 104
      Top = 14
      Width = 137
      Height = 22
      DisabledImageIndex = 1
      DisabledImageName = 'GetItLogo'
      Caption = 'Retornar'
      ImageIndex = 14
      ImageName = 'icons8-voltar'
      Images = dm_ProjetoFinal.VirtualImageList1
      HotImageIndex = 9
      HotImageName = 'icons8-desfazer'
      Flat = True
      OnClick = spButtonReturnClick
    end
    object spSalvar: TSpeedButton
      Left = 223
      Top = 14
      Width = 122
      Height = 22
      Caption = 'Salvar'
      ImageIndex = 15
      ImageName = 'icons8-ok'
      Images = dm_ProjetoFinal.VirtualImageList1
      Flat = True
      OnClick = spSalvarClick
    end
    object spDelete: TSpeedButton
      Left = 359
      Top = 14
      Width = 122
      Height = 22
      Caption = 'Limpar'
      ImageIndex = 19
      ImageName = 'icons8-apagar'
      Images = dm_ProjetoFinal.VirtualImageList1
      Flat = True
      OnClick = spDeleteClick
    end
  end
  object edQuantidade: TPanel
    Left = 0
    Top = 0
    Width = 693
    Height = 628
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -32
    ExplicitTop = -6
    object spConsultaCep: TSpeedButton
      Left = 279
      Top = 242
      Width = 89
      Height = 22
      Caption = 'Buscar CEP'
      ImageIndex = 7
      ImageName = '42-search-outline'
      Images = dm_ProjetoFinal.VirtualImageList1
    end
    object Label1: TLabel
      Left = 97
      Top = 218
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object Label2: TLabel
      Left = 96
      Top = 43
      Width = 92
      Height = 15
      Caption = 'DATA DO PEDIDO'
    end
    object MaskCep: TMaskEdit
      Left = 96
      Top = 239
      Width = 144
      Height = 25
      EditMask = '00000\-000;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 0
      Text = ''
    end
    object lbRua: TLabeledEdit
      Left = 96
      Top = 421
      Width = 145
      Height = 23
      EditLabel.Width = 20
      EditLabel.Height = 15
      EditLabel.Caption = 'Rua'
      TabOrder = 1
      Text = ''
    end
    object lbNumero: TLabeledEdit
      Left = 279
      Top = 421
      Width = 89
      Height = 23
      EditLabel.Width = 14
      EditLabel.Height = 15
      EditLabel.Caption = 'N'#186
      TabOrder = 2
      Text = ''
    end
    object lbCidade: TLabeledEdit
      Left = 95
      Top = 365
      Width = 145
      Height = 23
      EditLabel.Width = 37
      EditLabel.Height = 15
      EditLabel.Caption = 'Cidade'
      TabOrder = 3
      Text = ''
    end
    object lbEstado: TLabeledEdit
      Left = 95
      Top = 303
      Width = 145
      Height = 23
      EditLabel.Width = 35
      EditLabel.Height = 15
      EditLabel.Caption = 'Estado'
      TabOrder = 4
      Text = ''
    end
    object lbUnidadeFederativa: TLabeledEdit
      Left = 279
      Top = 303
      Width = 89
      Height = 23
      EditLabel.Width = 14
      EditLabel.Height = 15
      EditLabel.Caption = 'UF'
      TabOrder = 5
      Text = ''
    end
    object lbBairro: TLabeledEdit
      Left = 279
      Top = 365
      Width = 145
      Height = 23
      EditLabel.Width = 31
      EditLabel.Height = 15
      EditLabel.Caption = 'Bairro'
      TabOrder = 6
      Text = ''
    end
    object lbComplemento: TLabeledEdit
      Left = 456
      Top = 421
      Width = 145
      Height = 23
      EditLabel.Width = 77
      EditLabel.Height = 15
      EditLabel.Caption = 'Complemento'
      TabOrder = 7
      Text = ''
    end
    object DateTimePicker1: TDateTimePicker
      Left = 96
      Top = 64
      Width = 145
      Height = 23
      Date = 44708.000000000000000000
      Time = 0.721111909719184000
      TabOrder = 8
    end
    object LabeledEdit1: TLabeledEdit
      Left = 279
      Top = 176
      Width = 145
      Height = 23
      EditLabel.Width = 100
      EditLabel.Height = 15
      EditLabel.Caption = 'VALOR DO PEDIDO'
      TabOrder = 9
      Text = ''
    end
    object LabeledEdit2: TLabeledEdit
      Left = 95
      Top = 120
      Width = 144
      Height = 23
      EditLabel.Width = 69
      EditLabel.Height = 15
      EditLabel.Caption = 'TIPO PEDIDO'
      TabOrder = 10
      Text = ''
    end
    object LabeledEdit3: TLabeledEdit
      Left = 94
      Top = 176
      Width = 145
      Height = 23
      EditLabel.Width = 73
      EditLabel.Height = 15
      EditLabel.Caption = 'QUANTIDADE'
      TabOrder = 11
      Text = ''
    end
    object edValorFrete: TLabeledEdit
      Left = 96
      Top = 493
      Width = 145
      Height = 23
      EditLabel.Width = 70
      EditLabel.Height = 15
      EditLabel.Caption = 'VALOR FRETE'
      TabOrder = 12
      Text = ''
    end
    object edValorTotal: TLabeledEdit
      Left = 279
      Top = 493
      Width = 145
      Height = 23
      EditLabel.Width = 71
      EditLabel.Height = 15
      EditLabel.Caption = 'VALOR TOTAL'
      TabOrder = 13
      Text = ''
    end
  end
end
