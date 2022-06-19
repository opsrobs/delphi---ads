unit Unit_ControleEdits;

interface

uses Form_Edits, Vcl.Controls, Vcl.ComCtrls, Vcl.Dialogs, Unit_Controle,
  Form_CadPessoa,
  System.SysUtils;

type
  TControleEdit = class
  public
    procedure consultarPessoa;

  private

  end;

var
  Controle: TControle;

implementation

{ TControleEdit }

uses Unit_Dados, Form_Consulta;

procedure TControleEdit.consultarPessoa;
begin
  if frm_Consulta = nil then
    frm_Consulta := Tfrm_Consulta.Create(nil);

  frm_Consulta.setSelectSQL
    ('SELECT * FROM logistica_ads.getdadospessoafisica;');
  if frm_Consulta.ShowModal = mrOk then
  begin
    frm_Cliente.spSalvar.tag := dm_ProjetoFinal.qrConsulta.Fields[12].AsInteger;
    frm_Cliente.edNome.Text := dm_ProjetoFinal.qrConsulta.Fields[0].AsString;
    frm_Cliente.lbContato.Text := dm_ProjetoFinal.qrConsulta.Fields[2].AsString;
    frm_Cliente.MaskCep.Text := dm_ProjetoFinal.qrConsulta.Fields[4].AsString;
    frm_Cliente.lbComplemento.Text := dm_ProjetoFinal.qrConsulta.Fields
      [5].AsString;
    frm_Cliente.lbNumero.Text := dm_ProjetoFinal.qrConsulta.Fields[6].AsString;
    frm_Cliente.lbBairro.Text := dm_ProjetoFinal.qrConsulta.Fields[7].AsString;
    frm_Cliente.lbCidade.Text := dm_ProjetoFinal.qrConsulta.Fields[8].AsString;
    frm_Cliente.lbEstado.Text := dm_ProjetoFinal.qrConsulta.Fields[9].AsString;
    frm_Cliente.lbRua.Text := dm_ProjetoFinal.qrConsulta.Fields[11].AsString;
    frm_Cliente.lbUnidadeFederativa.Text := dm_ProjetoFinal.qrConsulta.Fields
      [10].AsString;
    ShowMessage(dm_ProjetoFinal.qrConsulta.Fields[0].AsString);
    frm_Cliente.edCpfCnpj.Text := dm_ProjetoFinal.qrConsulta.Fields[1].AsString;

    // Controle.getCadPessoa;
    FreeAndNil(frm_Consulta);

  end;
  dm_ProjetoFinal.qrConsulta.Close;
  dm_ProjetoFinal.qrConsulta.SQL.Clear;
end;

end.
