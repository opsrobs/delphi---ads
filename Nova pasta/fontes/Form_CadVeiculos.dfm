object frm_Veiculos: Tfrm_Veiculos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Veiculos...'
  ClientHeight = 441
  ClientWidth = 624
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
    Top = 400
    Width = 624
    Height = 41
    Align = alBottom
    TabOrder = 0
    object spButtonReturn: TSpeedButton
      Left = 120
      Top = 13
      Width = 113
      Height = 22
      Caption = 'Retornar'
      ImageIndex = 14
      ImageName = 'icons8-voltar'
      Images = dm_ProjetoFinal.VirtualImageList1
      HotImageIndex = 9
      HotImageName = 'icons8-desfazer'
      Flat = True
    end
    object spDelete: TSpeedButton
      Left = 367
      Top = 13
      Width = 122
      Height = 22
      Caption = 'Excluir'
      Flat = True
      OnClick = spDeleteClick
    end
    object spSalvar: TSpeedButton
      Left = 239
      Top = 13
      Width = 122
      Height = 22
      Caption = 'Salvar'
      ImageIndex = 0
      ImageName = 'search'
      Images = dm_ProjetoFinal.VirtualImageList1
      HotImageIndex = 5
      HotImageName = 'SVGIconVirtualImageListComponentIcon'
      Flat = True
      OnClick = spSalvarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 400
    Align = alClient
    TabOrder = 1
    object lbMarca: TLabeledEdit
      Left = 112
      Top = 104
      Width = 121
      Height = 23
      EditLabel.Width = 74
      EditLabel.Height = 15
      EditLabel.Caption = 'Marca Veiculo'
      TabOrder = 0
      Text = ''
    end
    object lbModelo: TLabeledEdit
      Left = 112
      Top = 152
      Width = 121
      Height = 23
      EditLabel.Width = 82
      EditLabel.Height = 15
      EditLabel.Caption = 'Modelo Veiculo'
      TabOrder = 1
      Text = ''
    end
    object lbPlaca: TLabeledEdit
      Left = 112
      Top = 200
      Width = 121
      Height = 23
      EditLabel.Width = 69
      EditLabel.Height = 15
      EditLabel.Caption = 'Placa Veiculo'
      TabOrder = 2
      Text = ''
    end
    object cbVeiculos: TComboBox
      Left = 112
      Top = 56
      Width = 121
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 3
      OnChange = cbVeiculosChange
    end
  end
end
