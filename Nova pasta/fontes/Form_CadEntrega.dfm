object frm_carga: Tfrm_carga
  Left = 0
  Top = 0
  Caption = 'Cadastro de entrega'
  ClientHeight = 553
  ClientWidth = 800
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    800
    553)
  PixelsPerInch = 96
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 488
    Width = 800
    Height = 65
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      800
      65)
    object spButtonReturn: TSpeedButton
      AlignWithMargins = True
      Left = 168
      Top = 18
      Width = 216
      Height = 16
      Anchors = [akLeft, akTop, akRight, akBottom]
      DisabledImageIndex = 1
      DisabledImageName = 'GetItLogo'
      Caption = 'Retornar'
      ImageIndex = 14
      ImageName = 'icons8-voltar'
      Images = dm_ProjetoFinal.VirtualImageList1
      HotImageIndex = 9
      HotImageName = 'icons8-desfazer'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 137
      ExplicitHeight = 22
    end
    object spSalvar: TSpeedButton
      AlignWithMargins = True
      Left = 287
      Top = 18
      Width = 201
      Height = 16
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Salvar'
      ImageIndex = 15
      ImageName = 'icons8-ok'
      Images = dm_ProjetoFinal.VirtualImageList1
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = spSalvarClick
      ExplicitWidth = 122
      ExplicitHeight = 22
    end
    object spDelete: TSpeedButton
      AlignWithMargins = True
      Left = 423
      Top = 18
      Width = 201
      Height = 16
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Limpar'
      ImageIndex = 19
      ImageName = 'icons8-apagar'
      Images = dm_ProjetoFinal.VirtualImageList1
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 122
      ExplicitHeight = 22
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 66
    Align = alTop
    TabOrder = 1
    object nmConsultar: TSpeedButton
      Left = 272
      Top = 22
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
    end
    object cbCliente: TComboBox
      Left = 10
      Top = 22
      Width = 240
      Height = 23
      TabOrder = 0
      Text = 'CLIENTE'
    end
  end
  object edPeso: TLabeledEdit
    AlignWithMargins = True
    Left = 679
    Top = 37
    Width = 65
    Height = 23
    Anchors = [akTop, akRight]
    EditLabel.Width = 28
    EditLabel.Height = 15
    EditLabel.Caption = 'PESO'
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 66
    Width = 800
    Height = 422
    Align = alClient
    TabOrder = 3
    DesignSize = (
      800
      422)
    object listDados: TListView
      Left = 0
      Top = 48
      Width = 800
      Height = 377
      Anchors = [akLeft, akTop, akRight, akBottom]
      Checkboxes = True
      Columns = <
        item
          AutoSize = True
          Caption = 'Numero do Pedido'
        end
        item
          AutoSize = True
          Caption = 'Cliente'
        end
        item
          AutoSize = True
          Caption = 'Data do Pedido'
        end
        item
          AutoSize = True
          Caption = 'Status do Pedido'
        end
        item
          AutoSize = True
          Caption = 'Recebedor'
        end
        item
          AutoSize = True
          Caption = 'Valor total'
        end
        item
          AutoSize = True
          Caption = 'Peso'
        end>
      FullDrag = True
      GridLines = True
      Groups = <
        item
          GroupID = 0
          State = [lgsNormal]
          HeaderAlign = taLeftJustify
          FooterAlign = taLeftJustify
          TitleImage = -1
        end
        item
          GroupID = 1
          State = [lgsNormal]
          HeaderAlign = taLeftJustify
          FooterAlign = taLeftJustify
          TitleImage = -1
        end>
      MultiSelect = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = listDadosClick
    end
    object cbMotoristaEntrega: TComboBox
      Left = 120
      Top = 19
      Width = 193
      Height = 23
      TabOrder = 1
      Text = 'Selecione o motorista'
    end
    object cbVeiculoEntrega: TComboBox
      Left = 482
      Top = 14
      Width = 193
      Height = 23
      TabOrder = 2
      Text = 'Selecione o veiculo'
    end
  end
end
