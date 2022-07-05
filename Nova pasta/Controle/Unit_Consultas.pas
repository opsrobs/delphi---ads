unit Unit_Consultas;

interface

uses
  System.SysUtils, Winapi.Messages, Vcl.Controls, Vcl.Dialogs, Vcl.Mask,
  Objeto_CadVeiculo, Objeto_CadMarcaVeiculo, Datasnap.DBClient,
  Data.DB, System.Generics.Collections, System.Classes, Vcl.ComCtrls;

type
  TConsulta = class
  public
    procedure getConsulta;
    procedure fields;
    procedure rows;
  private

  end;

implementation

uses Form_Edits;

procedure TConsulta.fields;
var
  cl: TListColumn;
  lt: TListItem;
begin

  cl := frm_edits.listDados.Columns.add;
  cl.Caption := 'Registro da entrega';
  cl.AutoSize :=true;

  cl := frm_edits.listDados.Columns.add;
  cl.Caption := 'Quantidade';
  cl.AutoSize :=true;

  cl := frm_edits.listDados.Columns.add;
  cl.Caption := 'Peso';
  cl.AutoSize :=true;

  cl := frm_edits.listDados.Columns.add;
  cl.Caption := 'Entregador';
  cl.AutoSize :=true;

  cl := frm_edits.listDados.Columns.add;
  cl.Caption := 'Marca';
  cl.AutoSize :=true;

  cl := frm_edits.listDados.Columns.add;
  cl.Caption := 'Modelo';
  cl.AutoSize :=true;

  cl := frm_edits.listDados.Columns.add;
  cl.Caption := 'Placa';
  cl.AutoSize :=true;




end;

procedure TConsulta.getConsulta;
var
  id: integer;
begin
  if (frm_edits = nil) then
    frm_edits := frm_edits.Create(nil);

  if (frm_edits.ShowModal = mrok) then
  begin

    ShowMessage('s');
    { VCadVeiculo := CadVeiculo.Create;
      case (frm_Veiculos.getFuncao) of
      1:
      begin
      Self.updateMarca;
      Self.cadastroVeiculo
      (VCadMarca.IdentificadorMarca(frm_Veiculos.lbMarca.Text));
      end;
      2:
      begin

      end; }
  end;

end;

procedure TConsulta.rows;
var
  lt: TListItem;
begin
  lt := frm_edits.listDados.Items.add;
  lt.Caption := 'teste';
  lt.SubItems.add('aaaaaaaaaaaaa');

  lt := frm_edits.listDados.Items.add;
  lt.SubItems.add('bbbbbbbbbbbbb');

end;

end.
