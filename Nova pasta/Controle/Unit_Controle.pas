unit Unit_Controle;

interface
    uses System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs,Vcl.Mask, REST.Types,StrUtils,
  Objeto_CadEstado,Objeto_CadCidade, Objeto_CadBairro, Objeto_CadEndereco;
type
TControle = class
  private
    function validateValue(numero:string):integer;


  public
    procedure getCadPessoa;
    procedure getCadPf(id:integer);
    procedure getCadPj(id:integer);

    procedure validarPessoa(id:integer);
    procedure CadastroEstado;
    procedure CadastroCidade;
    procedure cadastroBairro;
    procedure cadastroEndereco(idpessoa:integer);
    procedure cadastroContato(id:integer);
    end;
    var
      VCadEstado:CadEstado;
      VCadCidade:CadCidade;
      VCadBairro:CadBairro;
      VCadEndereco:CadEndereco;

implementation

{ TControle }

uses Form_CadPessoa,
     Objeto_CadPessoa,
     Objeto_CadPessoaFisica,
     Objeto_CadPessoaJuridica,
     Objeto_CadCliente, Form_Consulta, Form_CadFuncionario, Unit_Dados,
  Objeto_CadContato, Objeto_CadRecebedor;

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

function TControle.validateValue(numero:string): integer;
begin
    if frm_Cliente.lbNumero.Text = '' then
      result :=0
      else
      result := StrToInt(frm_Cliente.lbNumero.Text)
end;

procedure TControle.cadastroBairro;
var
  idCidade:integer;
begin
    idCidade:=VCadCidade.getIdentificadrocidade(frm_Cliente.lbCidade.Text);
    VCadBairro := CadBairro.Create;
    VCadBairro.setNome_Bairro(frm_Cliente.lbBairro.Text);
    VCadBairro.setCidade_idCidade(idCidade);
   if (VCadBairro.getIdentificadorBairro(frm_Cliente.lbBairro.Text) <= 0) then
    begin
        VCadBairro.insertDados
    end
    else
        VCadBairro.updateDados;
end;

procedure TControle.CadastroCidade();
var
  idestado:integer;
begin
   idestado:= VCadEstado.getIdEstade(frm_Cliente.lbEstado.Text);
   VCadCidade:=CadCidade.Create;
   VCadCidade.setNome_cidade(frm_Cliente.lbCidade.Text);
   VCadCidade.setEstado_idEstado(idEstado);
   if (VCadCidade.getIdentificadrocidade(frm_Cliente.lbCidade.Text) <= 0) then
    begin
        VCadCidade.insertDados
    end
    else
        VCadCidade.updateDados;
end;

procedure TControle.cadastroContato(id:integer);
var
  VCadContato:CadContato;
begin
  VCadContato := CadContato.Create;
  VCadContato.setStatus_contato(frm_Cliente.chStatus.Checked);
  VCadContato.setContato(frm_Cliente.lbContato.Text);
  VCadContato.setPessoa_idPessoa(id);

  VCadContato.insertDados;

end;

procedure TControle.cadastroEndereco(idpessoa:integer);
var
  idBairro:integer;
begin
    idBairro := VCadBairro.getIdentificadorBairro(frm_Cliente.lbBairro.Text);
    VCadEndereco := CadEndereco.Create;
    VCadEndereco.setCep(frm_Cliente.MaskCep.Text);
    VCadEndereco.setRua(frm_Cliente.lbRua.Text);
    VCadEndereco.setComplemto(frm_Cliente.lbComplemento.Text);
    VCadEndereco.setnumero(self.validateValue(frm_Cliente.lbNumero.Text));
    VCadEndereco.setPessoa_idPessoa(idpessoa);
    VCadEndereco.setBairro_idBairro(idbairro);

    VCadEndereco.insertDados;
end;

procedure TControle.CadastroEstado;
begin
  VCadEstado:=CadEstado.Create;

  VCadEstado.setNome_estado(frm_Cliente.lbEstado.Text);
  VCadEstado.setuf(frm_Cliente.lbUnidadeFederativa.Text);
  if (VCadEstado.getIdEstade(frm_Cliente.lbEstado.Text) <= 0) then
    begin
    VCadEstado.insertDados
    end
    else
    VCadEstado.updateDados;
end;


procedure TControle.getCadPessoa;
    var
    VCadRecebedor:CadRecebedor;
    VCadPessoa:CadPessoa;
    VCadCliente: CadCliente;
    idPessoa:integer;
begin
    if (frm_Cliente = nil) then
      frm_Cliente := Tfrm_Cliente.Create(nil);

    if (frm_Cliente.ShowModal = mrOk) then
      begin
          VCadPessoa := CadPessoa.Create;
          VCadCliente := CadCliente.create;
          VCadRecebedor :=CadRecebedor.Create;
         case(frm_Cliente.getFuncao) of
            1: begin
               VCadPessoa.setnome(frm_Cliente.edNome.Text);
               VCadPessoa.insertDados;
               idPessoa:= VCadPessoa.getLastId;
               self.cadastroContato(idPessoa);
               self.validarPessoa(idPessoa);
               if(frm_Cliente.chDestinatario.Checked)then
               begin
                VCadRecebedor.setPessoa_idPessoa(idPessoa);
                VCadRecebedor.insertDados
               end
               else
               begin
                VCadCliente.setPessoa_idPessoa(idPessoa);
                VCadCliente.insertDados;
               end;
               self.CadastroEstado;
               self.CadastroCidade();

               self.cadastroBairro;
               self.cadastroEndereco(idpessoa);
               ShowMessage('Cadastro reaalizado com sucesso!!!');


            end;
            2: begin

               end;
         end;
         VCadPessoa.Free;
         VCadCliente.Free;

      end;

      FreeAndNil(frm_Cliente);

end;



end.
