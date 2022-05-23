unit Unit_Controle;

interface
    uses System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs,Vcl.Mask, REST.Types,StrUtils,
  Objeto_CadEstado,Objeto_CadCidade, Objeto_CadBairro, Objeto_CadEndereco;
type
TControle = class
  private


  public
    procedure getCadPessoa;
    procedure getCadPf(id:integer);
    procedure getCadPj(id:integer);
    procedure loadingApiCep;
    procedure capturandoJson;
    procedure validarPessoa(id:integer);
    procedure nomeEstado(uf:string);
    procedure CadastroEstado;
    procedure CadastroCidade;
    procedure cadastroBairro;
    procedure cadastroEndereco(idpessoa:integer);
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
     Objeto_CadCliente, Form_Consulta, Form_CadFuncionario, Unit_Dados;

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

procedure TControle.loadingApiCep;
begin
    dm_ProjetoFinal.RESTClient1.BaseURL := 'https://viacep.com.br/ws/';
    dm_ProjetoFinal.RESTRequest1.Method := rmGET;
    dm_ProjetoFinal.RESTRequest1.Resource := '{cep}/json';
    dm_ProjetoFinal.RESTRequest1.Params.AddUrlSegment('cep',frm_Cliente.MaskCep.Text);
    dm_ProjetoFinal.RESTRequest1.Execute;
    self.capturandoJson;
end;

procedure TControle.nomeEstado(uf:string);
begin
    if (UpperCase(uf)= 'AC' ) then
    frm_Cliente.lbEstado.Text :='Acre'
    else if (UpperCase(uf)= 'AL' ) then
    frm_Cliente.lbEstado.Text :='Alagoas'
    else if (UpperCase(uf)= 'AP' ) then
    frm_Cliente.lbEstado.Text :='Amap�'
    else if (UpperCase(uf)= 'AM' ) then
    frm_Cliente.lbEstado.Text :='Amazonas'
    else if (UpperCase(uf)= 'BA' ) then
    frm_Cliente.lbEstado.Text :='Bahia'
    else if (UpperCase(uf)= 'CE' ) then
    frm_Cliente.lbEstado.Text :='Cear�'
    else if (UpperCase(uf)= 'DF' ) then
    frm_Cliente.lbEstado.Text :='Distrito Federal'
    else if (UpperCase(uf)= 'ES' ) then
    frm_Cliente.lbEstado.Text :='Esp�rito Santo'
    else if (UpperCase(uf)= 'GO' ) then
    frm_Cliente.lbEstado.Text :='Goi�s'
    else if (UpperCase(uf)= 'MA' ) then
    frm_Cliente.lbEstado.Text :='Maranh�o'
    else if (UpperCase(uf)= 'MT' ) then
    frm_Cliente.lbEstado.Text :='Mato Grosso'
    else if (UpperCase(uf)= 'MS' ) then
    frm_Cliente.lbEstado.Text :='Mato Grosso do Sul'
    else if (UpperCase(uf)= 'MG' ) then
    frm_Cliente.lbEstado.Text :='Minas Gerais'
    else if (UpperCase(uf)= 'PA' ) then
    frm_Cliente.lbEstado.Text :='Par�'
    else if (UpperCase(uf)= 'PB' ) then
    frm_Cliente.lbEstado.Text :='Para�ba '
    else if (UpperCase(uf)= 'PR' ) then
    frm_Cliente.lbEstado.Text :='Paran�'
    else if (UpperCase(uf)= 'PE' ) then
    frm_Cliente.lbEstado.Text :='Pernambuco'
    else if (UpperCase(uf)= 'PI' ) then
    frm_Cliente.lbEstado.Text :='Piau�'
    else if (UpperCase(uf)= 'RJ' ) then
    frm_Cliente.lbEstado.Text :='Rio de Janeiro'
    else if (UpperCase(uf)= 'RN' ) then
    frm_Cliente.lbEstado.Text :='Rio Grande do Norte'
    else if (UpperCase(uf)= 'RS' ) then
    frm_Cliente.lbEstado.Text :='Rio Grande do Sul'
    else if (UpperCase(uf)= 'RO' ) then
    frm_Cliente.lbEstado.Text :='Rond�nia'
    else if (UpperCase(uf)= 'RR' ) then
    frm_Cliente.lbEstado.Text :='Roraima'
    else if (UpperCase(uf)= 'SC' ) then
    frm_Cliente.lbEstado.Text :='Santa Catarina'
    else if (UpperCase(uf)= 'SP' ) then
    frm_Cliente.lbEstado.Text :='S�o Paulo'
    else if (UpperCase(uf)= 'SE' ) then
    frm_Cliente.lbEstado.Text :='Sergipe'
    else
    frm_Cliente.lbEstado.Text :='Tocantins'
end;

procedure TControle.validarPessoa(id: integer);
begin
if (frm_Cliente.rdCNPJ.Checked) then
      self.getCadPj(id)
    else if (not frm_Cliente.rdCNPJ.Checked) then
      self.getCadPf(id);

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

procedure TControle.cadastroEndereco(idpessoa:integer);
var
  idBairro:integer;
begin
    idBairro := VCadBairro.getIdentificadorBairro(frm_Cliente.lbBairro.Text);
    VCadEndereco := CadEndereco.Create;
    VCadEndereco.setCep(frm_Cliente.MaskCep.Text);
    VCadEndereco.setRua(frm_Cliente.lbRua.Text);
    VCadEndereco.setComplemto(frm_Cliente.lbComplemento.Text);
    VCadEndereco.setnumero(StrToInt(frm_Cliente.lbNumero.Text));
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

procedure TControle.capturandoJson;
begin
    self.nomeEstado(dm_ProjetoFinal.MemTable.FieldByName('uf').AsString);
    frm_Cliente.lbBairro.Text := dm_ProjetoFinal.MemTable.FieldByName('bairro').AsString;
    frm_Cliente.lbCidade.Text := dm_ProjetoFinal.MemTable.FieldByName('localidade').AsString;
    frm_Cliente.lbRua.Text := dm_ProjetoFinal.MemTable.FieldByName('logradouro').AsString;
    frm_Cliente.lbUnidadeFederativa.Text := dm_ProjetoFinal.MemTable.FieldByName('uf').AsString;
end;

procedure TControle.getCadPessoa;
    var
    VCadPessoa:CadPessoa;
    VCadCliente: CadCliente;
    idTemp:integer;
    idPessoa:integer;
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
               idPessoa:= VCadPessoa.getLastId;                      //Capturando o ID da pessoa
               self.validarPessoa(idPessoa);                           //Passando ID para o tipo de pessoa a ser cadastrada
               VCadCliente.setPessoa_idPessoa(idPessoa);
               VCadCliente.insertDados;
               self.CadastroEstado;
               self.CadastroCidade();

               self.cadastroBairro;
               self.cadastroEndereco(idpessoa);

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
