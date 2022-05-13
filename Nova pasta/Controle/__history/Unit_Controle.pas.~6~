unit Unit_Controle;

interface
    uses System.SysUtils,Winapi.Messages, Vcl.Controls;
type
TControle = class
  private

  public
    procedure getCadPessoa;
end;

implementation

{ TControle }

uses Form_CadPessoa, Objeto_CadPessoa;

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
               VCadPessoa.setnome(Cliente.edNome);

               Cliente.ins
            end;
            2: begin

            end;
         end;

      end;

      FreeAndNil(Cliente);

end;

end.
