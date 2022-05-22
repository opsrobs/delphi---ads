object frm_Funcionario: Tfrm_Funcionario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Funcionarios'
  ClientHeight = 424
  ClientWidth = 618
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
    Width = 618
    Height = 41
    Align = alTop
    TabOrder = 0
    object spButtonReturn: TSpeedButton
      Left = 16
      Top = 13
      Width = 113
      Height = 22
      Caption = 'Retornar'
      ImageIndex = 0
      Images = dm_ProjetoFinal.Ibagensmainmenu
      HotImageIndex = 5
      Flat = True
      OnClick = spButtonReturnClick
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
    object spSalvar: TSpeedButton
      Left = 135
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
    Top = 41
    Width = 618
    Height = 383
    Align = alClient
    Caption = 'search'
    TabOrder = 1
    object nmConsultar: TSpeedButton
      Left = 280
      Top = 14
      Width = 97
      Height = 33
      Caption = 'Consultar'
      ImageIndex = 6
      ImageName = 'file'
      Images = dm_ProjetoFinal.VirtualImageList1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
      OnClick = nmConsultarClick
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
      TabOrder = 0
      Text = ''
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
      TabOrder = 1
      Text = ''
    end
    object edPis: TLabeledEdit
      Left = 16
      Top = 120
      Width = 241
      Height = 23
      EditLabel.Width = 16
      EditLabel.Height = 15
      EditLabel.Caption = 'PIS'
      TabOrder = 2
      Text = ''
    end
    object edCnh: TLabeledEdit
      Left = 16
      Top = 181
      Width = 241
      Height = 23
      EditLabel.Width = 26
      EditLabel.Height = 15
      EditLabel.Caption = 'CNH'
      TabOrder = 3
      Text = ''
    end
  end
end
