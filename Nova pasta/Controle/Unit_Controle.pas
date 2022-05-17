unit Unit_Controle;

interface
    uses System.SysUtils,Winapi.Messages, Vcl.Controls,Vcl.Dialogs;
type
TControle = class
  private

  public
    procedure getCadPessoa;
end;

implementation

{ TControle }

uses Form_CadPessoa, Objeto_CadPessoa, Objeto_CadPessoaFisica;



procedure TControle.getCadPessoa;
    var
    VCadPessoa:CadPessoa;
    VCadPF:CadPessoaFisica;

begin
    if (Cliente = nil) then
      Cliente := TCliente.Create(nil);

    if (Cliente.ShowModal = mrOk) then
      begin
          VCadPessoa := CadPessoa.Create;
          VCadPF := CadPessoaFisica.Create;
         case(Cliente.getFuncao) of
            1: begin
               VCadPessoa.setnome(Cliente.edNome.Text);
               VCadPessoa.insertDados;
               
                VCadPF.setcpf(Cliente.edCpfCnpj.Text);
                VCadPF.setPessoa_idPessoa(VCadPessoa.getLastId);
                VCadPF.insertDados;


            end;
            2: begin

            end;
         end;
         VCadPessoa.Free;

      end;

      FreeAndNil(Cliente);

end;


end.
