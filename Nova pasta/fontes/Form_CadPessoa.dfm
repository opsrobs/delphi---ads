object frm_Cliente: Tfrm_Cliente
  Left = 0
  Top = 0
  Caption = 'Cadastros...'
  ClientHeight = 535
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 670
    Height = 470
    Align = alClient
    TabOrder = 0
    object spConsultaCep: TSpeedButton
      Left = 311
      Top = 173
      Width = 90
      Height = 22
      Caption = 'Buscar CEP'
      ImageIndex = 7
      ImageName = '42-search-outline'
      Images = dm_ProjetoFinal.VirtualImageList1
      OnClick = spConsultaCepClick
    end
    object Label1: TLabel
      Left = 144
      Top = 154
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
    object alterarContato: TSpeedButton
      Left = 400
      Top = 122
      Width = 113
      Height = 26
      Caption = 'Alterar Contato'
      ImageIndex = 21
      ImageName = 'add-user'
      Images = dm_ProjetoFinal.VirtualImageList1
      HotImageIndex = 16
      HotImageName = 'icons8-res'#237'duos'
      Flat = True
      Visible = False
      OnClick = alterarContatoClick
    end
    object newAddress: TSpeedButton
      Left = 407
      Top = 169
      Width = 113
      Height = 26
      Caption = 'Novo endere'#231'o'
      ImageIndex = 24
      ImageName = 'svgexport'
      Images = dm_ProjetoFinal.VirtualImageList1
      HotImageIndex = 24
      HotImageName = 'svgexport'
      Visible = False
      OnClick = newAddressClick
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
    end
    object MaskCep: TMaskEdit
      Left = 143
      Top = 170
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
      TabOrder = 2
      Text = ''
    end
    object lbRua: TLabeledEdit
      Left = 142
      Top = 365
      Width = 145
      Height = 23
      EditLabel.Width = 20
      EditLabel.Height = 15
      EditLabel.Caption = 'Rua'
      TabOrder = 3
    end
    object lbNumero: TLabeledEdit
      Left = 310
      Top = 365
      Width = 90
      Height = 23
      EditLabel.Width = 14
      EditLabel.Height = 15
      EditLabel.Caption = 'N'#186
      TabOrder = 4
    end
    object lbCidade: TLabeledEdit
      Left = 142
      Top = 269
      Width = 145
      Height = 23
      EditLabel.Width = 37
      EditLabel.Height = 15
      EditLabel.Caption = 'Cidade'
      TabOrder = 5
    end
    object lbEstado: TLabeledEdit
      Left = 142
      Top = 221
      Width = 145
      Height = 23
      EditLabel.Width = 35
      EditLabel.Height = 15
      EditLabel.Caption = 'Estado'
      TabOrder = 6
    end
    object lbUnidadeFederativa: TLabeledEdit
      Left = 310
      Top = 221
      Width = 90
      Height = 23
      EditLabel.Width = 14
      EditLabel.Height = 15
      EditLabel.Caption = 'UF'
      TabOrder = 7
    end
    object lbBairro: TLabeledEdit
      Left = 142
      Top = 317
      Width = 145
      Height = 23
      EditLabel.Width = 31
      EditLabel.Height = 15
      EditLabel.Caption = 'Bairro'
      TabOrder = 8
    end
    object lbComplemento: TLabeledEdit
      Left = 406
      Top = 365
      Width = 113
      Height = 23
      EditLabel.Width = 77
      EditLabel.Height = 15
      EditLabel.Caption = 'Complemento'
      TabOrder = 9
    end
    object lbContato: TLabeledEdit
      Left = 143
      Top = 125
      Width = 145
      Height = 23
      EditLabel.Width = 43
      EditLabel.Height = 15
      EditLabel.Caption = 'Contato'
      TabOrder = 10
      OnKeyPress = lbContatoKeyPress
    end
    object chStatus: TCheckBox
      Left = 311
      Top = 128
      Width = 89
      Height = 17
      Caption = 'Ativo'
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
    object rdCNPJ: TCheckBox
      Left = 416
      Top = 80
      Width = 104
      Height = 17
      Caption = 'CNPJ'
      TabOrder = 12
    end
    object chDestinatario: TCheckBox
      Left = 416
      Top = 96
      Width = 104
      Height = 17
      Caption = 'DESTINATARIO'
      TabOrder = 13
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 470
    Width = 670
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
