unit Unit_Controle;

interface
    uses System.SysUtils,Winapi.Messages, Vcl.Controls,Vcl.Dialogs;
type
TControle = class
  private

  public
    procedure getCadPessoa;
    procedure getCadPf(id:integer);
    procedure getCadPj(id:integer);
    procedure validarPessoa(id:integer);
    end;

implementation

{ TControle }

uses Form_CadPessoa,
     Objeto_CadPessoa,
     Objeto_CadPessoaFisica,
     Objeto_CadPessoaJuridica;




procedure TControle.getCadPf(id: integer);
var
    VCadPF:CadPessoaFisica;
begin
    VCadPF := CadPessoaFisica.Create;

    VCadPF.setcpf(Cliente.edCpfCnpj.Text);
    VCadPF.setPessoa_idPessoa(id);
    VCadPF.insertDados;
end;

procedure TControle.getCadPj(id:integer);
var
    VCadPJ:CadPessoaJuridica;
begin
    VCadPJ := CadPessoaJuridica.Create;

    VCadPJ.setcnpj(Cliente.edCpfCnpj.Text);
    VCadPJ.setPessoa_idPessoa(id);
    VCadPJ.insertDados;
end;

procedure TControle.validarPessoa(id: integer);
begin
ShowMessage(inttostr(Cliente.rdCNPJ.Checked.ToInteger));
if (Cliente.rdCNPJ.Checked.ToInteger = 1) then
      self.getCadPj(id);

        self.getCadPf(id);

end;

procedure TControle.getCadPessoa;
    var
    VCadPessoa:CadPessoa;


begin
    if (Cliente = nil) then
      Cliente := TCliente.Create(nil);

    if (Cliente.ShowModal = mrOk) then
      begin
          VCadPessoa := CadPessoa.Create;
         case(Cliente.getFuncao) of
            1: begin
               VCadPessoa.setnome(Cliente.edNome.Text);
               VCadPessoa.insertDados;

               self.validarPessoa(VCadPessoa.getLastId);


            end;
            2: begin

            end;
         end;
         VCadPessoa.Free;

      end;

      FreeAndNil(Cliente);

end;



end.
