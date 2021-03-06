object frm_Consulta: Tfrm_Consulta
  Left = 0
  Top = 0
  Caption = 'Consultas'
  ClientHeight = 560
  ClientWidth = 723
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
    Width = 723
    Height = 81
    Align = alTop
    TabOrder = 0
    object spSalvar: TSpeedButton
      Left = 319
      Top = 8
      Width = 122
      Height = 22
      Caption = 'Buscar'
      Flat = True
      OnClick = spSalvarClick
    end
    object spButtonReturn: TSpeedButton
      Left = 184
      Top = 8
      Width = 97
      Height = 22
      DisabledImageIndex = 1
      Caption = 'Retornar'
      ImageIndex = 0
      Images = dm_ProjetoFinal.Ibagensmainmenu
      Flat = True
      OnClick = spButtonReturnClick
    end
    object RadioGroup1: TRadioGroup
      Left = 0
      Top = 0
      Width = 129
      Height = 79
      Ctl3D = True
      ItemIndex = 0
      Items.Strings = (
        'Pessoa Fisica'
        'Pessoa Juridica'
        'Veiculos'
        'Funcionarios')
      ParentCtl3D = False
      TabOrder = 0
      Visible = False
      OnClick = RadioGroup1Click
    end
    object chStatus: TCheckBox
      Left = 374
      Top = 55
      Width = 97
      Height = 17
      Caption = 'Status'
      TabOrder = 1
      Visible = False
      OnClick = chConsultaVeiculosClick
    end
    object cbVeiculos: TComboBox
      Left = 233
      Top = 53
      Width = 121
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 2
      Visible = False
      OnChange = cbVeiculosChange
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 81
    Width = 723
    Height = 479
    Align = alClient
    TabOrder = 1
    object dbConsulta: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 715
      Height = 423
      Align = alClient
      DataSource = dm_ProjetoFinal.dsConsulta
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = dbConsultaCellClick
    end
    object Panel2: TPanel
      Left = 1
      Top = 430
      Width = 721
      Height = 48
      Align = alBottom
      TabOrder = 1
      object lbResult: TLabel
        Left = 464
        Top = 27
        Width = 66
        Height = 15
        Caption = 'Resultados...'
      end
      object spDestinatario: TSpeedButton
        Left = 272
        Top = 20
        Width = 123
        Height = 22
        Caption = 'DESTINATARIO'
        ImageIndex = 21
        ImageName = 'add-user'
        Images = dm_ProjetoFinal.VirtualImageList1
        HotImageIndex = 22
        HotImageName = 'add'
        Layout = blGlyphRight
        ParentShowHint = False
        ShowHint = False
        Spacing = 20
        Visible = False
        OnClick = spDestinatarioClick
      end
      object edPesquisa: TLabeledEdit
        Left = 16
        Top = 19
        Width = 233
        Height = 23
        EditLabel.Width = 46
        EditLabel.Height = 15
        EditLabel.Caption = 'Pesquisa'
        TabOrder = 0
      end
    end
  end
end
