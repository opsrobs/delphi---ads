object Cliente: TCliente
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
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 626
    Height = 408
    Align = alClient
    TabOrder = 0
    object nmConsultar: TSpeedButton
      Left = 280
      Top = 25
      Width = 57
      Height = 22
      Caption = 'Consultar'
      Images = dm_ProjetoFinal.Ibagensmainmenu
    end
    object edNome: TLabeledEdit
      Left = 16
      Top = 24
      Width = 241
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
      Left = 16
      Top = 72
      Width = 241
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
      Left = 280
      Top = 75
      Width = 113
      Height = 17
      Caption = 'CNPJ'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 41
    Align = alTop
    TabOrder = 1
    object spButtonReturn: TSpeedButton
      Left = 16
      Top = 13
      Width = 113
      Height = 22
      Caption = 'Retornar'
      ImageIndex = 0
      Images = dm_ProjetoFinal.Ibagensmainmenu
      Flat = True
      OnClick = spButtonReturnClick
    end
    object spSalvar: TSpeedButton
      Left = 135
      Top = 13
      Width = 122
      Height = 22
      Caption = 'Salvar'
      Flat = True
      OnClick = spSalvarClick
    end
    object spDelete: TSpeedButton
      Left = 263
      Top = 13
      Width = 122
      Height = 22
      Caption = 'Excluir'
      Flat = True
      OnClick = spDeleteClick
    end
  end
end
