unit Unit_Controle;

interface

uses System.SysUtils, Winapi.Messages, Vcl.Controls, Vcl.Dialogs, Vcl.Mask,
  REST.Types, StrUtils,
  Objeto_CadEstado, Objeto_CadCidade, Objeto_CadBairro, Objeto_CadEndereco,
  Winapi.Windows;

type
  TControle = class
  private
    phone: string;
    idEndereco: integer;

    function validateValue(numero: string): integer;

  public
    procedure getCadPessoa;
    procedure getCadPf(id: integer);
    procedure getCadPj(id: integer);

    procedure validarPessoa(id: integer);
    procedure CadastroEstado;
    procedure CadastroCidade;
    procedure cadastroBairro;
    procedure cadastroEndereco(idpessoa: integer);
    procedure cadastroContato(id: integer);
    { ========= }
    function updateContato(content: string): boolean;
    procedure atualizarContato(id: integer);
    procedure atualizarEndereco(id, idpessoa: integer);

    procedure setPhone(phone: string);
    function getPhone: string;
    procedure setIdendereco(idEndereco: integer);
    function getIdendereco: integer;
    procedure conferirContatoAlterado(contato: string);

  end;

var
  VCadEstado: CadEstado;
  VCadCidade: CadCidade;
  VCadBairro: CadBairro;
  VCadEndereco: CadEndereco;

implementation

{ TControle }

uses Form_CadPessoa,
  Objeto_CadPessoa,
  Objeto_CadPessoaFisica,
  Objeto_CadPessoaJuridica,
  Objeto_CadCliente, Form_Consulta, Form_CadFuncionario, Unit_Dados,
  Objeto_CadContato, Objeto_CadRecebedor, Unit_ControleEdits;

procedure TControle.getCadPf(id: integer);
var
  VCadPF: CadPessoaFisica;
begin
  VCadPF := CadPessoaFisica.Create;

  VCadPF.setcpf(frm_Cliente.edCpfCnpj.Text);
  VCadPF.setPessoa_idPessoa(id);
  VCadPF.insertDados;
end;

procedure TControle.getCadPj(id: integer);
var
  VCadPJ: CadPessoaJuridica;
begin
  VCadPJ := CadPessoaJuridica.Create;

  VCadPJ.setcnpj(frm_Cliente.edCpfCnpj.Text);
  VCadPJ.setPessoa_idPessoa(id);
  VCadPJ.insertDados;
end;

function TControle.getIdendereco: integer;
begin
  result := self.idEndereco;
end;

function TControle.getPhone: string;
begin
  result := self.phone;

end;

procedure TControle.setIdendereco(idEndereco: integer);
begin
  self.idEndereco := idEndereco;
end;

procedure TControle.setPhone(phone: string);
begin
  self.phone := phone;
end;

function TControle.updateContato(content: string): boolean;
var
  edit: TControleEdit;
begin
  edit := TControleEdit.Create;
  result := true;
  if (frm_Cliente.getContato.Equals(content)) then
  begin
    utilitaria.alterContact(content);
    result := false;
    exit
  end
  else
  begin
    edit.atualizarContato(frm_Cliente.spSalvar.Tag);
    result := true;
  end;

end;

procedure TControle.validarPessoa(id: integer);
begin
  if (frm_Cliente.rdCNPJ.Checked) then
    self.getCadPj(id)
  else if (not frm_Cliente.rdCNPJ.Checked) then
    self.getCadPf(id);

end;

function TControle.validateValue(numero: string): integer;
begin
  if frm_Cliente.lbNumero.Text = '' then
    result := 0
  else
    result := StrToInt(frm_Cliente.lbNumero.Text)
end;

procedure TControle.atualizarContato(id: integer);
var
  VCadContato: CadContato;
  edit: TControleEdit;
begin
  edit := TControleEdit.Create;
  if frm_Cliente.chStatus.Checked = true then
  begin
    VCadContato := CadContato.Create;
    VCadContato.setStatus_contato(frm_Cliente.chStatus.Checked);
    VCadContato.setContato(frm_Cliente.lbContato.Text);
    VCadContato.setPessoa_idPessoa(id);
    VCadContato.updateEspecifyNumber('22');
  end;
  MessageDlg('Altera??o realizada com sucesso!!!', TMsgDlgType.mtInformation,
    [TMsgDlgBtn.mbYes], 0)

end;

procedure TControle.atualizarEndereco(id, idpessoa: integer);
begin
  VCadEndereco := CadEndereco.Create;
  VCadEndereco.setIdendereco(id);

  VCadEndereco.setPessoa_idPessoa(idpessoa);
  VCadEndereco.setAtivo(false);
  VCadEndereco.setCep(frm_Cliente.MaskCep.Text);

  VCadEndereco.updateEspecifyAddress(idEndereco)
end;

procedure TControle.cadastroBairro;
var
  idCidade: integer;
begin
  idCidade := VCadCidade.getIdentificadrocidade(frm_Cliente.lbCidade.Text);
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
  idestado: integer;
begin
  idestado := VCadEstado.getIdEstade(frm_Cliente.lbEstado.Text);
  VCadCidade := CadCidade.Create;
  VCadCidade.setNome_cidade(frm_Cliente.lbCidade.Text);
  VCadCidade.setEstado_idEstado(idestado);
  if (VCadCidade.getIdentificadrocidade(frm_Cliente.lbCidade.Text) <= 0) then
  begin
    VCadCidade.insertDados
  end
  else
    VCadCidade.updateDados;
end;

procedure TControle.cadastroContato(id: integer);
var
  VCadContato: CadContato;
begin
  VCadContato := CadContato.Create;
  VCadContato.setStatus_contato(frm_Cliente.chStatus.Checked);
  VCadContato.setContato(frm_Cliente.lbContato.Text);
  VCadContato.setPessoa_idPessoa(id);
  VCadContato.insertDados;

end;

procedure TControle.cadastroEndereco(idpessoa: integer);
var
  idBairro: integer;
begin
  idBairro := VCadBairro.getIdentificadorBairro(frm_Cliente.lbBairro.Text);
  VCadEndereco := CadEndereco.Create;
  VCadEndereco.setCep(frm_Cliente.MaskCep.Text);
  VCadEndereco.setRua(frm_Cliente.lbRua.Text);
  VCadEndereco.setComplemto(frm_Cliente.lbComplemento.Text);
  VCadEndereco.setnumero(self.validateValue(frm_Cliente.lbNumero.Text));
  VCadEndereco.setPessoa_idPessoa(idpessoa);
  VCadEndereco.setBairro_idBairro(idBairro);
  VCadEndereco.setAtivo(true);

  VCadEndereco.insertDados;
end;

procedure TControle.CadastroEstado;
begin
  VCadEstado := CadEstado.Create;

  VCadEstado.setNome_estado(frm_Cliente.lbEstado.Text);
  VCadEstado.setuf(frm_Cliente.lbUnidadeFederativa.Text);
  if (VCadEstado.getIdEstade(frm_Cliente.lbEstado.Text) <= 0) then
  begin
    VCadEstado.insertDados
  end
  else
    VCadEstado.updateDados;
end;

procedure TControle.conferirContatoAlterado(contato: string);
begin
  if frm_Cliente.getContato = contato then
    exit
  else
    self.cadastroContato(frm_Cliente.spSalvar.Tag);
end;

procedure TControle.getCadPessoa;
var
  edit: TControleEdit;
  VCadRecebedor: CadRecebedor;
  VCadPessoa: CadPessoa;
  VCadCliente: CadCliente;
  idpessoa: integer;
begin
  if (frm_Cliente = nil) then
    frm_Cliente := Tfrm_Cliente.Create(nil);

  if (frm_Cliente.ShowModal = mrOk) then
  begin
    edit := TControleEdit.Create;
    VCadPessoa := CadPessoa.Create;
    VCadCliente := CadCliente.Create;
    VCadRecebedor := CadRecebedor.Create;

    case (frm_Cliente.getFuncao) of
      1:
        begin
          if frm_Cliente.spSalvar.Caption = 'Atualizar' then
          begin
            self.conferirContatoAlterado(frm_Cliente.lbContato.Text);
            if frm_Cliente.newAddress.Tag = 1 then
            begin
              self.CadastroEstado;
              self.CadastroCidade();

              self.cadastroBairro;
              self.cadastroEndereco(frm_Cliente.spSalvar.Tag);

            end;
          end
          else
          begin
            VCadPessoa.setnome(frm_Cliente.edNome.Text);
            VCadPessoa.insertDados;
            idpessoa := VCadPessoa.getLastId; // <
            self.cadastroContato(idpessoa);
            self.validarPessoa(idpessoa);
            if (frm_Cliente.chDestinatario.Checked) then
            begin
              VCadRecebedor.setPessoa_idPessoa(idpessoa);
              VCadRecebedor.insertDados
            end
            else
            begin
              VCadCliente.setPessoa_idPessoa(idpessoa);
              VCadCliente.insertDados;
            end;
            self.CadastroEstado;
            self.CadastroCidade();

            self.cadastroBairro;
            self.cadastroEndereco(idpessoa);
            ShowMessage('Cadastro realizado com sucesso!!!');
          end;

        end;
      2:
        begin

        end;
    end;

    VCadPessoa.Free;
    VCadCliente.Free;

  end;
  FreeAndNil(frm_Cliente);

end;

end.
