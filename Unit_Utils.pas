unit Unit_Utils;

interface
uses
  REST.Types,Winapi.Messages,StrUtils, FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;
type
  Utils = class
    private
    procedure generatePerson;
    procedure generatePersonF;
    function generateTypePerson:string;
    procedure capturandoJson;
    procedure nomeEstado(uf:string);

    public
    procedure loadingApiPessoa;
    procedure loadingApiCep;
    function idPessoaCliente(nome:string):integer;
    function identificadorEndereco(nome:string):integer;
    function identificadorRecebedor(nome:string):integer;
    function identiicadorPessoa(nome:string):integer;
    function getLastId:integer;
  end;

implementation

{ Utils }

uses  Form_CadPessoa, Form_CadFuncionario,Form_CadPedido;

procedure Utils.capturandoJson;
begin
    if frm_Cliente <> nil then
    begin
      self.nomeEstado(dm_ProjetoFinal.MemTable.FieldByName('uf').AsString);
      frm_Cliente.lbBairro.Text := dm_ProjetoFinal.MemTable.FieldByName('bairro').AsString;
      frm_Cliente.lbCidade.Text := dm_ProjetoFinal.MemTable.FieldByName('localidade').AsString;
      frm_Cliente.lbRua.Text := dm_ProjetoFinal.MemTable.FieldByName('logradouro').AsString;
      frm_Cliente.lbUnidadeFederativa.Text := dm_ProjetoFinal.MemTable.FieldByName('uf').AsString;
    end

end;

procedure Utils.generatePerson;
begin
    frm_Cliente.edNome.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName('name').AsString;
    frm_Cliente.edCpfCnpj.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName(self.generateTypePerson).AsString;
    frm_Cliente.lbContato.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName('phone_number').AsString;
    //inserrir aaqui
end;

procedure Utils.generatePersonF;
begin
    frm_Funcionario.edNome.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName('name').AsString;
    frm_Funcionario.edCpfCnpj.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName('cpf').AsString;
end;

function Utils.generateTypePerson: string;
begin
if (frm_Cliente.rdCNPJ.Checked) then
      result := 'cnpj'
    else if (not frm_Cliente.rdCNPJ.Checked) then
            result := 'cpf'

end;

function Utils.getLastId: integer;
var
    query:TFDQuery;
    id:integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('SELECT LAST_INSERT_ID();');

      try
        query.open;
          if (not query.isEmpty) then
          begin
              id :=query.Fields[0].AsInteger;
              result :=id;
          end;
      except
        on e:exception do
        begin
          Result := 0;
          showMessage('Erro ao selecionar dados da pessoa : ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;
end;

function Utils.identificadorEndereco(nome: string): integer;
var
    query:TFDQuery;
    querySelect:string;
    id:integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect:='SELECT e.idEndereco,p.idPessoa, p.nome FROM logistica_ads.pessoa p, logistica_ads.endereco e where (p.nome = "'+ nome +'" and p.idPessoa = e.pessoa_idPessoa);';

  query.SQL.Add(querySelect);
      try
        query.open;


        if (not query.isEmpty) then
          begin
              //query.ParamByName('nome_estado').AsString := self.getNome_estado;
              {Alterar o valor do [] para a posi��o do atributo}
              id :=query.Fields[0].AsInteger;
              result :=id;
          end;
      except
        on e:exception do
        begin
          Result := 0;
          showMessage('Erro ao fazer consulta no endere�o de : '+nome+' ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function Utils.identificadorRecebedor(nome: string): integer;
var
    query:TFDQuery;
    querySelect:string;
    id:integer;
begin
  id:=0;
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect:='SELECT r.idrecebedor, p.nome FROM logistica_ads.pessoa p, logistica_ads.recebedor r where p.idPessoa = r.pessoa_idPessoa  and p.nome = "'+nome+'" ;';

  query.SQL.Add(querySelect);
      try
        query.open;
        if (not query.isEmpty) then
          begin
              id :=query.Fields[0].AsInteger;
              result :=id;
          end;
      except
        on e:exception do
        begin
          Result := 0;
          showMessage('Erro ao fazer consulta no cliente : '+nome+' ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;
    result :=id;
end;
function Utils.identiicadorPessoa(nome: string): integer;
var
    query:TFDQuery;
    querySelect:string;
    id:integer;
begin
  id :=0;
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect:='SELECT * FROM logistica_ads.pessoa where nome =  "'+nome+'" ;';

  query.SQL.Add(querySelect);
      try
        query.open;


        if (not query.isEmpty) then
          begin
              id :=query.Fields[0].AsInteger;
                            ShowMessage(IntToStr(id));
              result :=id;
          end;
      except
        on e:exception do
        begin
          Result := 0;
          showMessage('Erro ao fazer consulta na pessoa... : '+nome+' ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;
   result :=id;
end;

function Utils.idPessoaCliente(nome:string): integer;
var
    query:TFDQuery;
    querySelect:string;
    id:integer;
begin
id:=0;
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect:='SELECT c.idcliente as "N� Registro",  p.nome FROM cliente c, pessoa p where c.pessoa_idPessoa = p.idpessoa and nome =  "'+nome+'" ;';

  query.SQL.Add(querySelect);
      try
        query.open;
        if (not query.isEmpty) then
          begin
              id :=query.Fields[0].AsInteger;
              result :=id;
          end;
      except
        on e:exception do
        begin
          Result := 0;
          showMessage('Erro ao fazer consulta no cliente : '+nome+' ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;
      result := id;

end;

procedure Utils.loadingApiCep;
begin
    dm_ProjetoFinal.RESTClient1.BaseURL := 'https://viacep.com.br/ws/';
    dm_ProjetoFinal.RESTRequest1.Method := rmGET;
    dm_ProjetoFinal.RESTRequest1.Resource := '{cep}/json';
      dm_ProjetoFinal.RESTRequest1.Params.AddUrlSegment('cep',frm_Cliente.MaskCep.Text);
    dm_ProjetoFinal.RESTRequest1.Execute;
    self.capturandoJson;
end;

procedure Utils.loadingApiPessoa;
var
  TOKEN:string;
begin
  TOKEN:= '840|pe0mPZFHzecgsxgmMfBPxDWpSOP3xBzI';
    dm_ProjetoFinal.RESTClient2.BaseURL := 'https://api.invertexto.com/v1/faker?token='+TOKEN+'';
    dm_ProjetoFinal.RESTRequest2.Execute;
    if (frm_Funcionario <> nil) then
    begin
      self.generatePersonF
    end
    else
    self.generatePerson;
end;

procedure Utils.nomeEstado(uf: string);
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

end.