unit Unit_ControleEdits;

interface

uses Form_Edits, Vcl.Controls, Vcl.ComCtrls, Vcl.Dialogs, Unit_Controle,
  Form_CadPessoa,
  System.SysUtils;

type
  TControleEdit = class
  public
    { contato: string;
      procedure setContato(contato: string);
      function getContato: string; }
    procedure consultarPessoa;
    procedure verifyStatus;
    procedure atualizarContato(id: integer);
    procedure setStyleOfField(status:boolean);
  private


  end;

var
  Controle: TControle;

implementation

{ TControleEdit }

uses Unit_Dados, Form_Consulta, Objeto_CadContato;

procedure TControleEdit.atualizarContato(id: integer);
var
  VCadContato: CadContato;
  edit: TControleEdit;
begin
  edit := TControleEdit.Create;
  if frm_Cliente.chStatus.Checked = true then
  begin
    VCadContato := CadContato.Create;
    VCadContato.setStatus_contato(frm_Cliente.chStatus.Checked);
    VCadContato.setContato(frm_Cliente.lbContato.Text);
    VCadContato.setPessoa_idPessoa(id);
    VCadContato.updateEspecifyNumber(Controle.getPhone);
  end;

end;

procedure TControleEdit.consultarPessoa;
begin
  Controle := TControle.Create;
  if (frm_Cliente = nil) then
    frm_Cliente := Tfrm_Cliente.Create(nil);

  if frm_Consulta = nil then
    frm_Consulta := Tfrm_Consulta.Create(nil);

  frm_Consulta.setSelectSQL
    ('SELECT * FROM logistica_ads.dados_refatorado;');
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
    frm_Cliente.edCpfCnpj.Text := dm_ProjetoFinal.qrConsulta.Fields[1].AsString;
    FreeAndNil(frm_Consulta);
    Controle.setPhone(frm_Cliente.lbContato.Text);
    self.verifyStatus;
    frm_Cliente.tag := 10;
    Controle.setIdendereco(dm_ProjetoFinal.qrConsulta.Fields[13].AsInteger);
    Controle.getCadPessoa;
    // frm_Cliente.ShowModal;

  end;
  dm_ProjetoFinal.qrConsulta.Close;
  dm_ProjetoFinal.qrConsulta.SQL.Clear;
end;

procedure TControleEdit.setStyleOfField(status:boolean);
begin
frm_Cliente.newAddress.Visible := status;
 frm_Cliente.newAddress.Left := 310;
end;

procedure TControleEdit.verifyStatus;
begin
utilitaria.newAddress(false);
  frm_Cliente.alterarContato.Visible := true;
  if (dm_ProjetoFinal.qrConsulta.Fields[3].AsInteger = 0) then
  // se a situação do contato for 0, o contato não será inserido no campo dele
  begin
    frm_Cliente.lbContato.Clear;

    frm_Cliente.chStatus.Checked := false;
    // setar o status do contato para inativo
    frm_Cliente.alterarContato.Visible := false;
    // ocultar botão para alterar contato

  end

end;

end.
