object frm_Pedido: Tfrm_Pedido
  Left = 0
  Top = 0
  Caption = 'frm_Pedido'
  ClientHeight = 493
  ClientWidth = 636
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
  object Panel2: TPanel
    Left = 0
    Top = 444
    Width = 636
    Height = 49
    Align = alBottom
    TabOrder = 0
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
    Width = 636
    Height = 444
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 152
      Top = 171
      Width = 92
      Height = 15
      Caption = 'DATA DO PEDIDO'
    end
    object nmConsultar: TSpeedButton
      Left = 399
      Top = 142
      Width = 97
      Height = 23
      Caption = 'Consultar'
      ImageIndex = 7
      ImageName = '42-search-outline'
      Images = dm_ProjetoFinal.VirtualImageList1
      HotImageIndex = 8
      HotImageName = 'icons8-editar-propriedade'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
      OnClick = nmConsultarClick
    end
    object dtDataPedido: TDateTimePicker
      Left = 150
      Top = 192
      Width = 145
      Height = 23
      Date = 44727.000000000000000000
      Time = 0.721111909719184000
      Checked = False
      TabOrder = 0
    end
    object edValorPedido: TLabeledEdit
      Left = 149
      Top = 248
      Width = 145
      Height = 23
      EditLabel.Width = 100
      EditLabel.Height = 15
      EditLabel.Caption = 'VALOR DO PEDIDO'
      TabOrder = 1
    end
    object edValorFrete: TLabeledEdit
      Left = 149
      Top = 308
      Width = 145
      Height = 23
      EditLabel.Width = 70
      EditLabel.Height = 15
      EditLabel.Caption = 'VALOR FRETE'
      TabOrder = 2
      OnExit = edValorFreteExit
    end
    object edValorTotal: TLabeledEdit
      Left = 335
      Top = 308
      Width = 161
      Height = 23
      EditLabel.Width = 71
      EditLabel.Height = 15
      EditLabel.Caption = 'VALOR TOTAL'
      TabOrder = 3
    end
    object CheckBox1: TCheckBox
      Left = 406
      Top = 251
      Width = 97
      Height = 17
      Caption = 'EM AN'#193'LISE'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object edPeso: TLabeledEdit
      Left = 335
      Top = 248
      Width = 65
      Height = 23
      EditLabel.Width = 28
      EditLabel.Height = 15
      EditLabel.Caption = 'PESO'
      TabOrder = 5
    end
    object cbCliente: TComboBox
      Left = 153
      Top = 93
      Width = 240
      Height = 23
      TabOrder = 6
      Text = 'CLIENTE'
      OnClick = cbClienteClick
    end
    object Button1: TButton
      Left = 304
      Top = 96
      Width = 1
      Height = 17
      Caption = 'Button1'
      TabOrder = 7
    end
    object edDestinatario: TLabeledEdit
      Left = 153
      Top = 142
      Width = 240
      Height = 23
      EditLabel.Width = 77
      EditLabel.Height = 15
      EditLabel.Caption = 'DESTINATARIO'
      TabOrder = 8
    end
  end
end
