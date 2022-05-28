object frm_Pedido: Tfrm_Pedido
  Left = 0
  Top = 0
  Caption = 'frm_Pedido'
  ClientHeight = 628
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 579
    Width = 682
    Height = 49
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 548
    ExplicitWidth = 687
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
    Width = 682
    Height = 579
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 687
    ExplicitHeight = 548
    object spConsultaCep: TSpeedButton
      Left = 336
      Top = 290
      Width = 89
      Height = 22
      Caption = 'Buscar CEP'
      ImageIndex = 7
      ImageName = '42-search-outline'
      Images = dm_ProjetoFinal.VirtualImageList1
      OnClick = spConsultaCepClick
    end
    object Label1: TLabel
      Left = 154
      Top = 266
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object Label2: TLabel
      Left = 152
      Top = 91
      Width = 92
      Height = 15
      Caption = 'DATA DO PEDIDO'
    end
    object Label3: TLabel
      Left = 153
      Top = 147
      Width = 89
      Height = 15
      Caption = 'TIPO DO PEDIDO'
    end
    object MaskCep: TMaskEdit
      Left = 153
      Top = 287
      Width = 144
      Height = 25
      AutoSelect = False
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
      Left = 153
      Top = 469
      Width = 145
      Height = 23
      EditLabel.Width = 20
      EditLabel.Height = 15
      EditLabel.Caption = 'Rua'
      TabOrder = 1
      Text = ''
    end
    object lbNumero: TLabeledEdit
      Left = 336
      Top = 469
      Width = 57
      Height = 23
      EditLabel.Width = 14
      EditLabel.Height = 15
      EditLabel.Caption = 'N'#186
      TabOrder = 2
      Text = ''
    end
    object lbCidade: TLabeledEdit
      Left = 152
      Top = 413
      Width = 145
      Height = 23
      EditLabel.Width = 37
      EditLabel.Height = 15
      EditLabel.Caption = 'Cidade'
      TabOrder = 3
      Text = ''
    end
    object lbEstado: TLabeledEdit
      Left = 152
      Top = 351
      Width = 145
      Height = 23
      EditLabel.Width = 35
      EditLabel.Height = 15
      EditLabel.Caption = 'Estado'
      TabOrder = 4
      Text = ''
    end
    object lbUnidadeFederativa: TLabeledEdit
      Left = 336
      Top = 351
      Width = 89
      Height = 23
      EditLabel.Width = 14
      EditLabel.Height = 15
      EditLabel.Caption = 'UF'
      TabOrder = 5
      Text = ''
    end
    object lbBairro: TLabeledEdit
      Left = 336
      Top = 413
      Width = 161
      Height = 23
      EditLabel.Width = 31
      EditLabel.Height = 15
      EditLabel.Caption = 'Bairro'
      TabOrder = 6
      Text = ''
    end
    object lbComplemento: TLabeledEdit
      Left = 415
      Top = 469
      Width = 82
      Height = 23
      EditLabel.Width = 77
      EditLabel.Height = 15
      EditLabel.Caption = 'Complemento'
      TabOrder = 7
      Text = ''
    end
    object dtDataPedido: TDateTimePicker
      Left = 152
      Top = 112
      Width = 145
      Height = 23
      Date = 44708.000000000000000000
      Time = 0.721111909719184000
      TabOrder = 8
    end
    object edValorPedido: TLabeledEdit
      Left = 150
      Top = 224
      Width = 145
      Height = 23
      EditLabel.Width = 100
      EditLabel.Height = 15
      EditLabel.Caption = 'VALOR DO PEDIDO'
      TabOrder = 9
      Text = ''
    end
    object edValorFrete: TLabeledEdit
      Left = 153
      Top = 541
      Width = 145
      Height = 23
      EditLabel.Width = 70
      EditLabel.Height = 15
      EditLabel.Caption = 'VALOR FRETE'
      TabOrder = 10
      Text = ''
    end
    object edValorTotal: TLabeledEdit
      Left = 336
      Top = 541
      Width = 161
      Height = 23
      EditLabel.Width = 71
      EditLabel.Height = 15
      EditLabel.Caption = 'VALOR TOTAL'
      TabOrder = 11
      Text = ''
    end
    object cbTipoPedido: TComboBox
      Left = 153
      Top = 168
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 12
      OnClick = cbTipoPedidoClick
      Items.Strings = (
        'EXEMPLO 1'
        'EXEMPLO 2'
        'EXEMPLO 3'
        'EXEMPLO 4')
    end
    object edTipoPedido: TEdit
      Left = 335
      Top = 168
      Width = 162
      Height = 23
      Enabled = False
      TabOrder = 13
    end
    object CheckBox1: TCheckBox
      Left = 415
      Top = 227
      Width = 97
      Height = 17
      Caption = 'EM AN'#193'LISE'
      Checked = True
      State = cbChecked
      TabOrder = 14
    end
    object edPeso: TLabeledEdit
      Left = 336
      Top = 224
      Width = 65
      Height = 23
      EditLabel.Width = 28
      EditLabel.Height = 15
      EditLabel.Caption = 'PESO'
      TabOrder = 15
      Text = ''
    end
    object cbCliente: TComboBox
      Left = 153
      Top = 29
      Width = 240
      Height = 23
      TabOrder = 16
      Text = 'CLIENTE'
      OnClick = cbClienteClick
    end
    object Button1: TButton
      Left = 304
      Top = 32
      Width = 1
      Height = 17
      Caption = 'Button1'
      TabOrder = 17
    end
    object ButtonedEdit1: TButtonedEdit
      Left = 424
      Top = 64
      Width = 121
      Height = 23
      TabOrder = 18
      Text = 'ButtonedEdit1'
    end
  end
end
