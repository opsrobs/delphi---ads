unit Unit_Controle;

interface
    uses System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs,Vcl.Mask, REST.Types,StrUtils;
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
    procedure CadEstado;
    end;

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
    frm_Cliente.lbEstado.Text :='Amapá'
    else if (UpperCase(uf)= 'AM' ) then
    frm_Cliente.lbEstado.Text :='Amazonas'
    else if (UpperCase(uf)= 'BA' ) then
    frm_Cliente.lbEstado.Text :='Bahia'
    else if (UpperCase(uf)= 'CE' ) then
    frm_Cliente.lbEstado.Text :='Ceará'
    else if (UpperCase(uf)= 'DF' ) then
    frm_Cliente.lbEstado.Text :='Distrito Federal'
    else if (UpperCase(uf)= 'ES' ) then
    frm_Cliente.lbEstado.Text :=' Espírito Santo'
    else if (UpperCase(uf)= 'GO' ) then
    frm_Cliente.lbEstado.Text :='Goiás'
    else if (UpperCase(uf)= 'MA' ) then
    frm_Cliente.lbEstado.Text :='Maranhão'
    else if (UpperCase(uf)= 'MT' ) then
    frm_Cliente.lbEstado.Text :='Mato Grosso'
    else if (UpperCase(uf)= 'MS' ) then
    frm_Cliente.lbEstado.Text :='Mato Grosso do Sul'
    else if (UpperCase(uf)= 'MG' ) then
    frm_Cliente.lbEstado.Text :='Minas Gerais'
    else if (UpperCase(uf)= 'PA' ) then
    frm_Cliente.lbEstado.Text :='Pará'
    else if (UpperCase(uf)= 'PB' ) then
    frm_Cliente.lbEstado.Text :='Paraíba '
    else if (UpperCase(uf)= 'PR' ) then
    frm_Cliente.lbEstado.Text :='Paraná'
    else if (UpperCase(uf)= 'PE' ) then
    frm_Cliente.lbEstado.Text :='Pernambuco'
    else if (UpperCase(uf)= 'PI' ) then
    frm_Cliente.lbEstado.Text :='Piauí'
    else if (UpperCase(uf)= 'RJ' ) then
    frm_Cliente.lbEstado.Text :='Rio de Janeiro'
    else if (UpperCase(uf)= 'RN' ) then
    frm_Cliente.lbEstado.Text :='Rio Grande do Norte'
    else if (UpperCase(uf)= 'RS' ) then
    frm_Cliente.lbEstado.Text :='Rio Grande do Sul'
    else if (UpperCase(uf)= 'RO' ) then
    frm_Cliente.lbEstado.Text :='Rondônia'
    else if (UpperCase(uf)= 'RR' ) then
    frm_Cliente.lbEstado.Text :='Roraima'
    else if (UpperCase(uf)= 'SC' ) then
    frm_Cliente.lbEstado.Text :='Santa Catarina'
    else if (UpperCase(uf)= 'SP' ) then
    frm_Cliente.lbEstado.Text :='São Paulo'
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

procedure TControle.CadEstado;
begin

end;

procedure TControle.capturandoJson;
begin
    //frm_Cliente.lbEstado.Text := dm_ProjetoFinal.MemTable.FieldByName('Estado').AsString;
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
         VCadCliente.Free;

      end;

      FreeAndNil(frm_Cliente);

end;



end.