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

    VCadPF.setcpf(frm_Cliente.edCpfCnpj.Text);
    VCadPF.setPessoa_idPessoa(id);
    VCadPF.insertDados;
end;

procedure TControle.getCadPj(id:integer);
var
    VCadPJ:CadPessoaJuridica;
begin
    VCadPJ := CadPessoaJuridica.Create;

    VCadPJ.setcnpj(frm_Cliente.edCpfCnpj.Text);
    VCadPJ.setPessoa_idPessoa(id);
    VCadPJ.insertDados;
end;

procedure TControle.validarPessoa(id: integer);
begin
if (frm_Cliente.rdCNPJ.Checked) then
      self.getCadPj(id)
    else if (not frm_Cliente.rdCNPJ.Checked) then
      self.getCadPf(id);

end;

procedure TControle.getCadPessoa;
    var
    VCadPessoa:CadPessoa;
    VCadCliente: CadCliente;
    idTemp:integer;
begin
    if (frm_Cliente = nil) then
      frm_Cliente := Tfrm_Cliente.Create(nil);

    if (frm_Cliente.ShowModal = mrOk) then
      begin
          VCadPessoa := CadPessoa.Create;
          VCadCliente := CadCliente.create;
         case(frm_Cliente.getFuncao) of
            1: begin
               VCadPessoa.setnome(frm_Cliente.edNome.Text);
               VCadPessoa.insertDados;

               idTemp := VCadPessoa.getLastId;
               self.validarPessoa(idTemp);
               VCadCliente.setPessoa_idPessoa(idTemp);
               VCadCliente.insertDados

            end;
            2: begin

               end;
         end;
         VCadPessoa.Free;

      end;

      FreeAndNil(frm_Cliente);

end;



end.
