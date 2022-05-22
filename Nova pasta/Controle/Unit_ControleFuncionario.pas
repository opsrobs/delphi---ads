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

    private

  end;
  var
  VCadPessoa:CadPessoa;
  VCadFuncionario: CadFuncionario;

implementation

{ TControle_Funcionario }

uses Form_CadPessoa,
     Objeto_CadPessoaFisica,
     Objeto_CadPessoaJuridica,
     Objeto_CadCliente, Form_Consulta, Form_CadFuncionario, Unit_Dados;

procedure TControle_Funcionario.cadastrarFuncionario(id: integer);
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
        end;
      VCadPessoa.insertDados;
end;

procedure TControle_Funcionario.cadastrarPessoaFisica(id:integer);
var
      VCadPessoaFisica: CadPessoaFisica;
begin
    VCadPessoaFisica:= CadPessoaFisica.Create;
  VCadPessoaFisica.setcpf(frm_Funcionario.edCpfCnpj.Text);
  VCadPessoaFisica.setPessoa_idPessoa(id);
  VCadPessoaFisica.insertDados;

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
              self.cadastrarFuncionario(idTemp)

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

  frm_Consulta.setSelectSQL('SELECT p.idPessoa as "N� de Registro", nome, cpf as CPF FROM pessoa p ,'+
  ' pessoa_fisica pf where pf.pessoa_idPessoa = p.idPessoa order by idPessoa asc');

  if frm_Consulta.ShowModal = mrOk then
  begin
    frm_Funcionario.spSalvar.Tag :=dm_ProjetoFinal.qrConsulta.Fields[0].AsInteger;
    frm_Funcionario.edNome.Text := dm_ProjetoFinal.qrConsulta.Fields[1].AsString;
    frm_Funcionario.edCpfCnpj.Text := dm_ProjetoFinal.qrConsulta.Fields[2].AsString;
  end;
  FreeAndNil(frm_Consulta);

end;

end.
