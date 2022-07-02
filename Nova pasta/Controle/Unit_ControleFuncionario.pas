unit Unit_ControleFuncionario;

interface

uses System.SysUtils, Winapi.Messages, Objeto_CadFuncionario, Vcl.Controls,
  Vcl.Dialogs,
  Objeto_CadPessoa, Unit_Controle, Form_CadPedido;

type
  TControle_Funcionario = class
  public
    procedure getCadFuncionario;
    procedure getConsultaPessoas;
    procedure cadastrarPessoa;
    procedure cadastrarPessoaFisica(id: integer);
    procedure alterarPessoaFisica(id: integer);
    procedure cadastrarFuncionario(id: integer);
    procedure populaComboCbPessoa;
    function getIdFuncionario(index: integer): integer;

  private
    function verifyValueOfId(lastId, tag: integer): integer;
    function setScriptCbMotorista: String;

  end;

var
  VCadPessoa: CadPessoa;
  VCadFuncionario: CadFuncionario;
  id_pessoaFisica: integer;
  arrayDeMotoristas: array of integer;

implementation

{ TControle_Funcionario }

uses Form_CadPessoa,
  Objeto_CadPessoaFisica,
  Objeto_CadPessoaJuridica,
  Objeto_CadCliente, Form_Consulta, Form_CadFuncionario, Unit_Dados,
  Form_CadEntrega, unit_ProjetoFinal;

var
  VCadPessoaFisica: CadPessoaFisica;

procedure TControle_Funcionario.alterarPessoaFisica(id: integer);
begin
  VCadPessoaFisica := CadPessoaFisica.Create;

  VCadPessoaFisica.setcpf(frm_Funcionario.edCpfCnpj.Text);
  VCadPessoaFisica.setPessoa_idPessoa(id);

  VCadPessoaFisica.updateDados;

end;

procedure TControle_Funcionario.cadastrarFuncionario(id: integer);
var
  resp: integer;
begin
  resp := VCadFuncionario.funcionariosExists(id);
  VCadFuncionario := CadFuncionario.Create;
  VCadFuncionario.setPis(frm_Funcionario.edPis.Text);
  VCadFuncionario.setCnh(frm_Funcionario.edCnh.Text);
  VCadFuncionario.setpessoa_fisica_idPessoa(id);
  VCadFuncionario.setAtivo(true);
  if resp > 0 then
  begin
    VCadFuncionario.updateDados;
    ShowMessage('Cadastro atualizado com sucesso!!!');
  end
  else
  begin
    VCadFuncionario.insertDados;
    ShowMessage('Cadastro reaalizado com sucesso!!!');
  end;
end;

procedure TControle_Funcionario.cadastrarPessoa;
begin

  VCadPessoa := CadPessoa.Create;
  VCadPessoa.setnome(frm_Funcionario.edNome.Text);
  if (frm_Funcionario.spSalvar.tag <> 0) then
  begin
    VCadPessoa.setidPessoa(frm_Funcionario.spSalvar.tag);
    VCadPessoa.updateDados;
  end
  else
    VCadPessoa.insertDados;
end;

procedure TControle_Funcionario.cadastrarPessoaFisica(id: integer);
begin
  VCadPessoaFisica := CadPessoaFisica.Create;
  VCadPessoaFisica.setcpf(frm_Funcionario.edCpfCnpj.Text);
  VCadPessoaFisica.setPessoa_idPessoa(id);

  VCadPessoaFisica.insertDados;

end;



procedure TControle_Funcionario.getConsultaPessoas;
begin
  if frm_Consulta = nil then
    frm_Consulta := Tfrm_Consulta.Create(nil);
  if frm_Pedido <> nil then
  begin
    frm_Consulta.setSelectSQL
      ('SELECT p.idPessoa as "Nº Registro", p.nome as "Nome", e.cep as "CEP", e.rua as "Rua" '
      + ' FROM logistica_ads.pessoa p, logistica_ads.endereco e where p.idPessoa = e.pessoa_idPessoa;');
    if frm_Consulta.ShowModal = mrOk then
    begin
      frm_Pedido.edDestinatario.Text := dm_ProjetoFinal.qrConsulta.Fields
        [1].AsString;
    end;

    FreeAndNil(frm_Consulta);
  end
  else
  begin
    frm_Consulta.setSelectSQL
      ('SELECT p.idPessoa as "Nº de Registro", nome, cpf as CPF FROM pessoa p ,'
      + ' pessoa_fisica pf where pf.pessoa_idPessoa = p.idPessoa order by idPessoa asc');
    if frm_Consulta.ShowModal = mrOk then
    begin
      frm_Funcionario.spSalvar.tag := dm_ProjetoFinal.qrConsulta.Fields[0]
        .AsInteger;
      frm_Funcionario.edNome.Text := dm_ProjetoFinal.qrConsulta.Fields
        [1].AsString;
      frm_Funcionario.edCpfCnpj.Text := dm_ProjetoFinal.qrConsulta.Fields
        [2].AsString;
      FreeAndNil(frm_Consulta);
    end
  end;

  dm_ProjetoFinal.qrConsulta.Close;
  dm_ProjetoFinal.qrConsulta.SQL.Clear;

end;

function TControle_Funcionario.getIdFuncionario(index: integer): integer;
begin
  result := arrayDeMotoristas[index];
end;

procedure TControle_Funcionario.populaComboCbPessoa;
var
  i: integer;
begin
  i := 1;
 // SetLength(arrayDeMotoristas, i);

  dm_ProjetoFinal.qr.Close;
  dm_ProjetoFinal.qrConsulta.SQL.Clear;
  dm_ProjetoFinal.qrConsulta.SQL.Add(self.setScriptCbMotorista);
  try
    dm_ProjetoFinal.qrConsulta.Open;
    dm_ProjetoFinal.qrConsulta.First;

    while not dm_ProjetoFinal.qrConsulta.Eof do
    begin

      frm_carga.cbMotoristaEntrega.Items.Add
        (dm_ProjetoFinal.qrConsulta.FieldByName('nome').AsString);
      arrayDeMotoristas[i] := dm_ProjetoFinal.qrConsulta.FieldByName
        ('idfuncionario').AsInteger;
      dm_ProjetoFinal.qrConsulta.Next;
      inc(i)
    end;
  finally

  end;
  dm_ProjetoFinal.qrConsulta.Close;
  dm_ProjetoFinal.qrConsulta.Free;
end;

function TControle_Funcionario.setScriptCbMotorista: String;
begin
  result := 'SELECT * FROM logistica_ads.funcionario f, pessoa p, pessoa_fisica pf where pf.pessoa_idPessoa = p.idPessoa and f.pessoa_fisica_idpessoa_fisica = pf.idpessoa_fisica order by p.nome'
end;

function TControle_Funcionario.verifyValueOfId(lastId, tag: integer): integer;
begin

  if (tag <> 0) then
    result := tag
  else
    result := lastId;
end;

procedure TControle_Funcionario.getCadFuncionario;
var
  idTemp: integer;
  tagId: integer;
begin
  if (frm_Funcionario = nil) then
    frm_Funcionario := Tfrm_Funcionario.Create(nil);

  if (frm_Funcionario.ShowModal = mrOk) then
  begin

    case (frm_Funcionario.getFuncao) of
      1:
        begin
          tagId := frm_Funcionario.spSalvar.tag;
          self.cadastrarPessoa;
          if (tagId <> 0) then
          begin
            self.alterarPessoaFisica(tagId);
            self.cadastrarFuncionario(VCadPessoaFisica.verifyCadPerson(tagId))
          end
          else
          begin
            self.cadastrarPessoaFisica(VCadPessoa.getLastId);
            self.cadastrarFuncionario(VCadPessoaFisica.getLastId);
          end;

        end;
      2:
        begin

        end;
    end;
    VCadFuncionario.Free;
    VCadPessoa.Free;
    VCadPessoaFisica.Free;
  end;
  FreeAndNil(frm_Consulta);
  FreeAndNil(frm_Funcionario);

end;

end.
