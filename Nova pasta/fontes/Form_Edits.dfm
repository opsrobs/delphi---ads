object frm_edits: Tfrm_edits
  Left = 0
  Top = 0
  Caption = 'frm_edits'
  ClientHeight = 578
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    798
    578)
  PixelsPerInch = 96
  TextHeight = 13
  object listDados: TListView
    Left = -2
    Top = 48
    Width = 800
    Height = 522
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
  end
end
