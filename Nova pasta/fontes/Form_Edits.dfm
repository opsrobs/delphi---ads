object frm_edits: Tfrm_edits
  Left = 0
  Top = 0
  Caption = 'frm_edits'
  ClientHeight = 680
  ClientWidth = 1159
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poPrintToFit
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnConsulta: TPanel
    Left = 0
    Top = 0
    Width = 1159
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object dbConsulta: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 1153
    Height = 633
    Align = alClient
    DataSource = dm_ProjetoFinal.dsConsulta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbConsultaDblClick
  end
end
