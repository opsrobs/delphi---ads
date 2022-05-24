object frm_Cliente: Tfrm_Cliente
  Left = 0
  Top = 0
  Caption = 'Cadastros...'
  ClientHeight = 449
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 384
    Align = alClient
    TabOrder = 0
    object spConsultaCep: TSpeedButton
      Left = 311
      Top = 133
      Width = 90
      Height = 22
      Caption = 'Buscar CEP'
      ImageIndex = 7
      ImageName = '42-search-outline'
      Images = dm_ProjetoFinal.VirtualImageList1
      OnClick = spConsultaCepClick
    end
    object Label1: TLabel
      Left = 143
      Top = 109
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object SpeedButton1: TSpeedButton
      Left = 416
      Top = 29
      Width = 32
      Height = 26
      ImageIndex = 17
      ImageName = 'icons8-people'
      Images = dm_ProjetoFinal.VirtualImageList1
      HotImageIndex = 18
      HotImageName = 'icons8-grupos-de-usu'#225'rios'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object edNome: TLabeledEdit
      Left = 143
      Top = 29
      Width = 258
      Height = 23
      EditLabel.Width = 33
      EditLabel.Height = 15
      EditLabel.BiDiMode = bdRightToLeftNoAlign
      EditLabel.Caption = 'Nome'
      EditLabel.ParentBiDiMode = False
      MaxLength = 100
      TabOrder = 0
      Text = ''
    end
    object edCpfCnpj: TLabeledEdit
      Left = 143
      Top = 77
      Width = 258
      Height = 23
      EditLabel.Width = 53
      EditLabel.Height = 15
      EditLabel.BiDiMode = bdRightToLeftNoAlign
      EditLabel.Caption = 'CPF/CNPJ'
      EditLabel.ParentBiDiMode = False
      MaxLength = 100
      TabOrder = 1
      Text = ''
    end
    object rdCNPJ: TRadioButton
      Left = 407
      Top = 80
      Width = 113
      Height = 17
      Caption = 'CNPJ'
      TabOrder = 2
    end
    object MaskCep: TMaskEdit
      Left = 143
      Top = 130
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
      TabOrder = 3
      Text = ''
    end
    object lbRua: TLabeledEdit
      Left = 143
      Top = 325
      Width = 145
      Height = 23
      EditLabel.Width = 20
      EditLabel.Height = 15
      EditLabel.Caption = 'Rua'
      TabOrder = 4
      Text = ''
    end
    object lbNumero: TLabeledEdit
      Left = 311
      Top = 325
      Width = 90
      Height = 23
      EditLabel.Width = 14
      EditLabel.Height = 15
      EditLabel.Caption = 'N'#186
      TabOrder = 5
      Text = ''
    end
    object lbCidade: TLabeledEdit
      Left = 143
      Top = 229
      Width = 145
      Height = 23
      EditLabel.Width = 37
      EditLabel.Height = 15
      EditLabel.Caption = 'Cidade'
      TabOrder = 6
      Text = ''
    end
    object lbEstado: TLabeledEdit
      Left = 143
      Top = 181
      Width = 145
      Height = 23
      EditLabel.Width = 35
      EditLabel.Height = 15
      EditLabel.Caption = 'Estado'
      TabOrder = 7
      Text = ''
    end
    object lbUnidadeFederativa: TLabeledEdit
      Left = 311
      Top = 181
      Width = 90
      Height = 23
      EditLabel.Width = 14
      EditLabel.Height = 15
      EditLabel.Caption = 'UF'
      TabOrder = 8
      Text = ''
    end
    object lbBairro: TLabeledEdit
      Left = 143
      Top = 277
      Width = 145
      Height = 23
      EditLabel.Width = 31
      EditLabel.Height = 15
      EditLabel.Caption = 'Bairro'
      TabOrder = 9
      Text = ''
    end
    object lbComplemento: TLabeledEdit
      Left = 407
      Top = 325
      Width = 113
      Height = 23
      EditLabel.Width = 77
      EditLabel.Height = 15
      EditLabel.Caption = 'Complemento'
      TabOrder = 10
      Text = ''
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 384
    Width = 626
    Height = 65
    Align = alBottom
    TabOrder = 1
    object spButtonReturn: TSpeedButton
      Left = 112
      Top = 21
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
      Left = 231
      Top = 21
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
      Left = 367
      Top = 21
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
end
