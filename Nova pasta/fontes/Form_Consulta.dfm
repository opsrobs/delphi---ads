object frm_Consulta: Tfrm_Consulta
  Left = 0
  Top = 0
  Caption = 'Consultas'
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
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 0
    object spButtonReturn: TSpeedButton
      Left = 192
      Top = 8
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
      Left = 319
      Top = 8
      Width = 122
      Height = 22
      Caption = 'Buscar'
      Flat = True
      OnClick = spSalvarClick
    end
    object spDestinatario: TSpeedButton
      Left = 479
      Top = 13
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 624
    Height = 48
    Align = alTop
    TabOrder = 1
    object lbResult: TLabel
      Left = 464
      Top = 27
      Width = 66
      Height = 15
      Caption = 'Resultados...'
    end
    object edPesquisa: TLabeledEdit
      Left = 16
      Top = 19
      Width = 393
      Height = 23
      EditLabel.Width = 46
      EditLabel.Height = 15
      EditLabel.Caption = 'Pesquisa'
      TabOrder = 0
      Text = ''
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 624
    Height = 352
    Align = alClient
    TabOrder = 2
    object dbConsulta: TDBGrid
      Left = 1
      Top = 1
      Width = 622
      Height = 350
      Align = alClient
      DataSource = dm_ProjetoFinal.dsConsulta
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
end
