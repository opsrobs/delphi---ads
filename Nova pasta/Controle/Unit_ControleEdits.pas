unit Unit_ControleEdits;

interface

uses Form_Edits, Vcl.Controls, Vcl.ComCtrls, Vcl.Dialogs, Unit_Controle,
  Form_CadPessoa, Objeto_CadVeiculo, Objeto_CadFuncionario,
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
    procedure setStyleOfField(status: boolean);
    function getStatusVeiculo: boolean;
    function getStatus: integer;
    procedure setStatus(idmarca: integer);
    procedure checkRadioStatus;
  private
    idmarca: integer;
    procedure setStyle;
    procedure atualizarVeiculo(status: integer);
    function returnStatus(status: integer): boolean;
    procedure ocultarComboBox;

    procedure atualizarStatusFuncionario(status: integer);

  end;

var
  Controle: TControle;
  veiculo: CadVeiculo;
  funcionario: CadFuncionario;

implementation

{ TControleEdit }

uses Unit_Dados, Form_Consulta, Objeto_CadContato, Form_CadVeiculos;

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

procedure TControleEdit.atualizarStatusFuncionario(status: integer);
begin
  funcionario := CadFuncionario.Create;
  funcionario.setAtivo(self.returnStatus(status));
  funcionario.setIdFuncionario(dm_ProjetoFinal.qrConsulta.Fields[4].AsInteger);
  ShowMessage(IntToStr(funcionario.getIdFuncionario));
   funcionario.updateStatus;

end;

procedure TControleEdit.atualizarVeiculo(status: integer);
begin
  veiculo := CadVeiculo.Create;
  veiculo.setIdVeiculo(dm_ProjetoFinal.qrConsulta.Fields[0].AsInteger);
  veiculo.setAtivo(self.returnStatus(status));
  veiculo.updadteDados;
  ShowMessage('Atualizou?')
end;

procedure TControleEdit.consultarPessoa;
begin
  Controle := TControle.Create;
  if (frm_Cliente = nil) then
    frm_Cliente := Tfrm_Cliente.Create(nil);

  if frm_Consulta = nil then
    frm_Consulta := Tfrm_Consulta.Create(nil);

  { frm_Consulta.setSelectSQL
    (self.setPersonType); }
  self.checkRadioStatus;
  if (frm_Consulta.ShowModal = mrOk) then
  begin
    //self.getStatusVeiculo;
    if frm_Consulta.RadioGroup1.ItemIndex = 2 then
    begin
      self.atualizarVeiculo(dm_ProjetoFinal.qrConsulta.Fields[4].AsInteger);
      exit
    end
    else if frm_Consulta.RadioGroup1.ItemIndex = 3 then
    begin
    ShowMessage(dm_ProjetoFinal.qrConsulta.Text);
      self.atualizarStatusFuncionario(dm_ProjetoFinal.qrConsulta.Fields[5].asinteger);
    end
    else
    begin
      frm_Cliente.spSalvar.tag := dm_ProjetoFinal.qrConsulta.Fields[12]
        .AsInteger;
      frm_Cliente.edNome.Text := dm_ProjetoFinal.qrConsulta.Fields[0].AsString;
      frm_Cliente.lbContato.Text := dm_ProjetoFinal.qrConsulta.Fields
        [2].AsString;

      frm_Cliente.MaskCep.Text := dm_ProjetoFinal.qrConsulta.Fields[4].AsString;
      frm_Cliente.lbComplemento.Text := dm_ProjetoFinal.qrConsulta.Fields
        [5].AsString;
      frm_Cliente.lbNumero.Text := dm_ProjetoFinal.qrConsulta.Fields[6]
        .AsString;
      frm_Cliente.lbBairro.Text := dm_ProjetoFinal.qrConsulta.Fields[7]
        .AsString;
      frm_Cliente.lbCidade.Text := dm_ProjetoFinal.qrConsulta.Fields[8]
        .AsString;
      frm_Cliente.lbEstado.Text := dm_ProjetoFinal.qrConsulta.Fields[9]
        .AsString;
      frm_Cliente.lbRua.Text := dm_ProjetoFinal.qrConsulta.Fields[11].AsString;
      frm_Cliente.lbUnidadeFederativa.Text := dm_ProjetoFinal.qrConsulta.Fields
        [10].AsString;
      frm_Cliente.edCpfCnpj.Text := dm_ProjetoFinal.qrConsulta.Fields
        [1].AsString;
      FreeAndNil(frm_Consulta);
      Controle.setPhone(frm_Cliente.lbContato.Text);
      self.verifyStatus;

      frm_Cliente.tag := 10;
      Controle.setIdendereco(dm_ProjetoFinal.qrConsulta.Fields[13].AsInteger);
      Controle.getCadPessoa;
    end;
    FreeAndNil(frm_Consulta);

  end;
  dm_ProjetoFinal.qrConsulta.Close;
  dm_ProjetoFinal.qrConsulta.SQL.Clear;
end;

procedure TControleEdit.setStatus(idmarca: integer);
begin
  idmarca := self.idmarca;
end;

function TControleEdit.getStatusVeiculo: boolean;
var
  status: integer;
begin
  result := true;
  status := dm_ProjetoFinal.qrConsulta.Fields[4].AsInteger;
  if frm_Consulta.cbVeiculos.tag = 10 then
  begin
    frm_Consulta.chStatus.Visible := true;
    case status of
      0:
        begin
          frm_Consulta.chStatus.Checked := false;
        end;
      1:
        begin
          frm_Consulta.chStatus.Checked := true;
          result := false;
        end;
    end;
    frm_Consulta.chStatus.Enabled := true;
  end;
end;

procedure TControleEdit.ocultarComboBox;
begin
frm_Consulta.cbVeiculos.Visible := false;
frm_Consulta.chStatus.Visible := false;
frm_Consulta.spSalvar.Enabled := true;
end;

function TControleEdit.returnStatus(status: integer): boolean;
begin
  result := true;
  if (frm_Consulta.cbVeiculos.tag = 10)
  or (frm_Consulta.RadioGroup1.ItemIndex = 3) then
  begin
  ShowMessage('achou');
    frm_Consulta.chStatus.Visible := true;
    case status of
      0:
        begin
          frm_Consulta.chStatus.Checked := false;
        end;
      1:
        begin
          frm_Consulta.chStatus.Checked := true;
          result := false;
        end;
    end;
    frm_Consulta.chStatus.Enabled := true;
  end;
end;

procedure TControleEdit.checkRadioStatus;
begin
  if frm_Consulta.RadioGroup1.ItemIndex = 0 then
  begin
    frm_Consulta.setSelectSQL
      ('SELECT * FROM logistica_ads.dados_refatorado where situacao = 1 and situacao_endereco = 1');
    frm_Consulta.resetScreen;
    self.ocultarComboBox;
  end;
  if frm_Consulta.RadioGroup1.ItemIndex = 1 then
  begin
    frm_Consulta.setSelectSQL
      ('SELECT * FROM logistica_ads.dados_pessoa_juridica where situacao = 1 and situacao_endereco = 1');
    frm_Consulta.resetScreen;
    self.ocultarComboBox;
  end;
  if frm_Consulta.RadioGroup1.ItemIndex = 2 then
  begin
    frm_Consulta.spSalvar.Caption := 'Atualizar';
    frm_Consulta.cbVeiculos.Visible := true;
    frm_Consulta.setSelectSQL
      ('select v.idveiculos as "N� do registro", mv.nome_marca as "Marca", v.modelo as "Modelo", v.placa as "Placa", v.ativo as "Status" from veiculo v inner join  marca_veiculo mv on v.marca_veiculo_idmarca_veiculo = mv.idmarca_veiculo and mv.idmarca_veiculo = ' + IntToStr(idmarca));
    frm_Consulta.resetScreen;
    if frm_Consulta.cbVeiculos.Text <> '' then
    begin
      idmarca := controleVeiculo.getIdMarca
        (frm_Consulta.cbVeiculos.ItemIndex + 1);
      self.setStyle;
      ShowMessage(IntToStr(idmarca));
      frm_Consulta.setSelectSQL
        ('select v.idveiculos as "N� do registro", mv.nome_marca as "Marca", v.modelo as "Modelo", v.placa as "Placa", v.ativo as "Status" from veiculo v inner join  marca_veiculo mv on v.marca_veiculo_idmarca_veiculo = mv.idmarca_veiculo and mv.idmarca_veiculo = ' + IntToStr(idmarca));
      frm_Consulta.resetScreen;
      self.getStatusVeiculo;
    end;
  end;
  if frm_Consulta.RadioGroup1.ItemIndex = 3 then
  begin
    frm_Consulta.setSelectSQL
      ('SELECT pes.nome, pf.cpf, fun.cnh, fun.pis, fun.idfuncionario, fun.ativo FROM logistica_ads.funcionario fun, logistica_ads.pessoa pes, logistica_ads.pessoa_fisica pf '
      + 'where fun.pessoa_fisica_idpessoa_fisica = pf.idpessoa_fisica and pf.pessoa_idPessoa = pes.idPessoa;');
    frm_Consulta.resetScreen;
    self.ocultarComboBox;
  end;

end;

function TControleEdit.getStatus: integer;
begin
  result := self.idmarca;
end;

procedure TControleEdit.setStyle;
begin
  frm_Consulta.chStatus.Visible := false;
  frm_Consulta.chStatus.Width := 55;
  frm_Consulta.chStatus.Left := 375;
end;

procedure TControleEdit.setStyleOfField(status: boolean);
begin
  frm_Cliente.newAddress.Visible := status;
  frm_Cliente.newAddress.Left := 310;
end;

procedure TControleEdit.verifyStatus;
begin
  utilitaria.newAddress(false);
  frm_Cliente.alterarContato.Visible := true;
  if (dm_ProjetoFinal.qrConsulta.Fields[3].AsInteger = 0) then
  // se a situa��o do contato for 0, o contato n�o ser� inserido no campo dele
  begin
    frm_Cliente.lbContato.Clear;

    frm_Cliente.chStatus.Checked := false;
    // setar o status do contato para inativo
    frm_Cliente.alterarContato.Visible := false;
    // ocultar bot�o para alterar contato

  end

end;

end.
