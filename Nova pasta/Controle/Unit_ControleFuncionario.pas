unit Unit_ControleFuncionario;

interface
uses System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs;
  type
  TControle_Funcionario = class
    public
    procedure getCadFuncionario;
    procedure getConsultaPessoas;

    private
  end;

implementation

{ TControle_Funcionario }

uses Form_CadPessoa,
     Objeto_CadPessoa,
     Objeto_CadPessoaFisica,
     Objeto_CadPessoaJuridica,
     Objeto_CadCliente, Form_Consulta, Form_CadFuncionario, Unit_Dados,
  Objeto_CadFuncionario;

procedure TControle_Funcionario.getCadFuncionario;
var
    VCadPessoa:CadPessoa;     //?
    VCadCliente: CadCliente;  //?
    VCadFuncionario: CadFuncionario;
    idTemp:integer;
begin
  if (frm_Funcionario = nil) then
     frm_Funcionario := Tfrm_Funcionario.Create(nil);

     if (frm_Funcionario.ShowModal = mrOk) then
     begin
        VCadFuncionario := CadFuncionario.Create;
        case(frm_Funcionario.getFuncao)of
          1:begin

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

  frm_Consulta.setSelectSQL('SELECT nome, cpf as CPF FROM pessoa p ,'+
  ' pessoa_fisica pf where pf.pessoa_idPessoa = p.idPessoa order by nome asc');

  if frm_Consulta.ShowModal = mrOk then
  begin
    frm_Funcionario.edNome.Text := dm_ProjetoFinal.qrConsulta.Fields[0].AsString;
    frm_Funcionario.edCpfCnpj.Text := dm_ProjetoFinal.qrConsulta.Fields[1].AsString;
  end;
  FreeAndNil(frm_Consulta);

end;

end.
