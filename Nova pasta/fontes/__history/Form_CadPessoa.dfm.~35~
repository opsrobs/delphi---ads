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
    Top = 65
    Width = 626
    Height = 384
    Align = alClient
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 200
      Top = 144
      Width = 73
      Height = 22
      Caption = 'Buscar CEP'
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 32
      Top = 120
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object edNome: TLabeledEdit
      Left = 32
      Top = 40
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
      Left = 32
      Top = 88
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
      Left = 296
      Top = 91
      Width = 113
      Height = 17
      Caption = 'CNPJ'
      TabOrder = 2
    end
    object MaskCep: TMaskEdit
      Left = 32
      Top = 141
      Width = 145
      Height = 25
      EditMask = '     \-    ;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '     -    '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 65
    Align = alTop
    TabOrder = 1
    object spButtonReturn: TSpeedButton
      Left = 16
      Top = 13
      Width = 137
      Height = 22
      DisabledImageIndex = 1
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
