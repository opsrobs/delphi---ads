unit Unit_Controle;

interface
    uses System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs;
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
     Objeto_CadPessoaJuridica,
     Objeto_CadCliente;

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
if (Cliente.rdCNPJ.Checked) then
      self.getCadPj(id)
    else if (not Cliente.rdCNPJ.Checked) then
      self.getCadPf(id);

end;

procedure TControle.getCadPessoa;
    var
    VCadPessoa:CadPessoa;
    VCadCliente: CadCliente;
    idTemp:integer;
begin
    if (Cliente = nil) then
      Cliente := TCliente.Create(nil);

    if (Cliente.ShowModal = mrOk) then
      begin
          VCadPessoa := CadPessoa.Create;
          VCadCliente := CadCliente.create;
         case(Cliente.getFuncao) of
            1: begin
               VCadPessoa.setnome(Cliente.edNome.Text);
               VCadPessoa.insertDados;
               idTemp := VCadPessoa.getLastId;

               self.validarPessoa(idTemp);
               VCadCliente.setPessoa_idPessoa(idTemp);
               VCadCliente.insertDados;


            end;
            2: begin

            end;
         end;
         VCadPessoa.Free;

      end;

      FreeAndNil(Cliente);

end;



end.
