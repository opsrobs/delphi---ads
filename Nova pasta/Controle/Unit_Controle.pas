unit Unit_Controle;

interface
    uses System.SysUtils,Winapi.Messages, Vcl.Controls,Vcl.Dialogs;
type
TControle = class
  private

  public
    procedure getCadPessoa;
    procedure getCadTipoPessoa(id:integer);
end;

implementation

{ TControle }

uses Form_CadPessoa, Objeto_CadPessoa, Objeto_CadPessoaFisica;

procedure TControle.getCadTipoPessoa(id:integer);
var
  VCadPessoa:CadPessoa;
  VCadPF:CadPessoaFisica;
  cadCliente:TCliente;
begin
    if (cadCliente.rdCNPJ.Checked.ToString() = '0') then
      begin
         VCadPF.setcpf(cadCliente.edCpfCnpj.Text);
         VCadPF.setPessoa_idPessoa(id);
         VCadPF.insertDados;
      end;

end;

procedure TControle.getCadPessoa;
    var
    id:integer;
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
               id := VCadPessoa.getLastId;
               self.getCadTipoPessoa(id);
               ShowMessage(VCadPessoa.getLastId.ToString)
            end;
            2: begin

            end;
         end;
         VCadPessoa.Free;

      end;

      FreeAndNil(Cliente);

end;


end.
