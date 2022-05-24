unit Unit_ControleFuncionario;

interface
uses System.SysUtils,Winapi.Messages,Objeto_CadFuncionario,Vcl.Controls,Vcl.Dialogs,
     Objeto_CadPessoa,Unit_Controle;
  type
  TControle_Funcionario = class
    public
    procedure getCadFuncionario;
    procedure getConsultaPessoas;
    procedure cadastrarPessoa;
    procedure cadastrarPessoaFisica(id:integer);
    procedure cadastrarFuncionario(id:integer);
    procedure setDadosFuncionario;

    private
        procedure loadingApiPessoa;
        procedure generatePerson;

  end;
  var
  VCadPessoa:CadPessoa;
  VCadFuncionario: CadFuncionario;
  id_pessoaFisica:integer;


implementation

{ TControle_Funcionario }

uses Form_CadPessoa,
     Objeto_CadPessoaFisica,
     Objeto_CadPessoaJuridica,
     Objeto_CadCliente, Form_Consulta, Form_CadFuncionario, Unit_Dados;

     var
       VCadPessoaFisica:CadPessoaFisica;

procedure TControle_Funcionario.cadastrarFuncionario(id:integer);
begin
    VCadFuncionario := CadFuncionario.Create;
    VCadFuncionario.setPis(frm_Funcionario.edPis.Text);
    VCadFuncionario.setCnh(frm_Funcionario.edCnh.Text);
    VCadFuncionario.setpessoa_fisica_idPessoa(id);
    VCadFuncionario.insertDados;
end;

procedure TControle_Funcionario.cadastrarPessoa;
begin

VCadPessoa := CadPessoa.Create;
    VCadPessoa.setnome(frm_Funcionario.edNome.Text);
      if (frm_Funcionario.spSalvar.Tag <> 0) then
        begin
          VCadPessoa.setidPessoa(frm_Funcionario.spSalvar.Tag);
          VCadPessoa.updateDados;
        end
        else
          VCadPessoa.insertDados;
          id_pessoaFisica := VCadPessoa.getLastId;
end;

procedure TControle_Funcionario.cadastrarPessoaFisica(id:integer);
var
      VCadPessoaFisica: CadPessoaFisica;
begin
    VCadPessoaFisica:= CadPessoaFisica.Create;
  VCadPessoaFisica.setcpf(frm_Funcionario.edCpfCnpj.Text);
  if (VCadPessoaFisica.verifyCadPerson(id) <= 0) then
  begin
    VCadPessoaFisica.setPessoa_idPessoa(id);
    VCadPessoaFisica.insertDados;
  end
  else
    VCadPessoaFisica.setPessoa_idPessoa(id);
    VCadPessoaFisica.updateDados;

end;

procedure TControle_Funcionario.generatePerson;
begin
    frm_Funcionario.edNome.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName('name').AsString;
    frm_Funcionario.edCpfCnpj.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName('cpf').AsString;
end;
procedure TControle_Funcionario.getCadFuncionario;
var
    idTemp:integer;
begin
  if (frm_Funcionario = nil) then
     frm_Funcionario := Tfrm_Funcionario.Create(nil);

     if (frm_Funcionario.ShowModal = mrOk) then
     begin

        case(frm_Funcionario.getFuncao)of
          1:begin
              self.cadastrarPessoa;
              self.cadastrarPessoaFisica(VCadPessoa.getLastId);
              idTemp := VCadPessoa.getLastId;
              ShowMessage(IntToStr(VCadPessoaFisica.getLastId(idTemp))); //verificar erro no cadastro do funcionario
              self.cadastrarFuncionario(VCadPessoaFisica.getLastId(idTemp));

          end;
          2:begin

          end;
        end;
        VCadFuncionario.Free;
     end;
     FreeAndNil(frm_Funcionario)



end;

procedure TControle_Funcionario.getConsultaPessoas;
begin
   if frm_Consulta = nil then
      frm_Consulta := Tfrm_Consulta.Create(nil);

  frm_Consulta.setSelectSQL('SELECT p.idPessoa as "Nº de Registro", nome, cpf as CPF FROM pessoa p ,'+
  ' pessoa_fisica pf where pf.pessoa_idPessoa = p.idPessoa order by idPessoa asc');

  if frm_Consulta.ShowModal = mrOk then
  begin
    frm_Funcionario.spSalvar.Tag :=dm_ProjetoFinal.qrConsulta.Fields[0].AsInteger;
    frm_Funcionario.edNome.Text := dm_ProjetoFinal.qrConsulta.Fields[1].AsString;
    frm_Funcionario.edCpfCnpj.Text := dm_ProjetoFinal.qrConsulta.Fields[2].AsString;
  end;
  FreeAndNil(frm_Consulta);

end;

procedure TControle_Funcionario.loadingApiPessoa;
var
  TOKEN:string;
begin
  TOKEN:= '840|pe0mPZFHzecgsxgmMfBPxDWpSOP3xBzI';
    dm_ProjetoFinal.RESTClient2.BaseURL := 'https://api.invertexto.com/v1/faker?token='+TOKEN+'';
    dm_ProjetoFinal.RESTRequest2.Execute;
    self.generatePerson;
end;

procedure TControle_Funcionario.setDadosFuncionario;
begin
    self.loadingApiPessoa;
end;

end.
