unit Unit_Utils;

interface

uses
  REST.Types, Winapi.Messages, StrUtils, FireDAC.Comp.Client, Unit_Dados,
  System.SysUtils, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Controls;

type
  Utils = class
  private
    procedure generatePerson;
    procedure generatePersonF;
    function generateTypePerson: string;
    procedure capturandoJson;
    procedure nomeEstado(uf: string);
    procedure confirmData;
    procedure clearData;
    function statusButton: boolean;

  public
    procedure loadingApiPessoa;
    procedure loadingApiCep;
    function insertDados(idPedido, idCarga: integer): boolean;
    function idPessoaCliente(nome: string): integer;
    function identificadorEndereco(nome: string): integer;
    function identificadorRecebedor(nome: string): integer;
    function identiicadorPessoa(nome: string): integer;
    function getLastId: integer;
    function alterContact(content: string): boolean;
    procedure bloquearDados;
    function validateJson: boolean;
    procedure updateStatusContato(status: boolean; id: integer);
    procedure verifyValueOfField;
    function setConfirmData: boolean;
    procedure newAddress(status: boolean);

    procedure activeButton;
    procedure inativeButton;
    function statusButton: boolean;

    procedure setValues;

  end;

implementation

{ Utils }

uses Form_CadPessoa, Form_CadFuncionario, Form_CadPedido, Objeto_CadContato,
  Unit_ControleEdits, Form_Consulta;

procedure Utils.activeButton;
begin
  frm_Consulta.Tag := 2;
end;

function Utils.alterContact(content: string): boolean;
begin
  if MessageDlg('Voc� quer DESABILITAR o contato ' + #13 + content + ' ?',
    TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrno
  then
  begin // Caso o usuario n�o queira desabilitar o contato, o campo 'contato' retornara o valor do bd
    result := false;
    frm_Cliente.lbContato.Text := frm_Cliente.getContato;
    exit
  end
  else
  begin // caso contr�rio, ser� atualizado o status do respectivo contato para inativo
    result := false;
    utilitaria.updateStatusContato(false, frm_Cliente.spSalvar.Tag);
    frm_Cliente.chStatus.Checked := true;
    frm_Cliente.lbContato.Clear;
    frm_Cliente.alterarContato.Visible := false;
    exit
  end;
  result := true;
end;

procedure Utils.bloquearDados;
var
  edit: TControleEdit;
begin
  // frm_consulta := Tfrm_Consulta.Create(nil);
  edit.setStyleOfField(true);
  frm_Cliente.SpeedButton1.Visible := false;
  frm_Cliente.rdCNPJ.Visible := false;
  frm_Cliente.edNome.Enabled := false;
  frm_Cliente.edCpfCnpj.Enabled := false;
end;

procedure Utils.capturandoJson;
begin

  if self.validateJson then
  begin
    exit
  end
  else
  begin
    if frm_Cliente <> nil then
    begin
      self.nomeEstado(dm_ProjetoFinal.MemTable.FieldByName('uf').AsString);
      frm_Cliente.lbBairro.Text := dm_ProjetoFinal.MemTable.FieldByName
        ('bairro').AsString;
      frm_Cliente.lbCidade.Text := dm_ProjetoFinal.MemTable.FieldByName
        ('localidade').AsString;
      frm_Cliente.lbRua.Text := dm_ProjetoFinal.MemTable.FieldByName
        ('logradouro').AsString;
      frm_Cliente.lbUnidadeFederativa.Text :=
        dm_ProjetoFinal.MemTable.FieldByName('uf').AsString;
    end
  end

end;

procedure Utils.clearData;
begin
  frm_Cliente.spConsultaCep.Visible := true;
  frm_Cliente.MaskCep.Clear;
  frm_Cliente.lbEstado.Clear;
  frm_Cliente.lbUnidadeFederativa.Clear;
  frm_Cliente.lbCidade.Clear;
  frm_Cliente.lbRua.Clear;
  frm_Cliente.lbNumero.Clear;
  frm_Cliente.lbBairro.Clear;
  frm_Cliente.lbComplemento.Clear;
end;

procedure Utils.confirmData;
var
  Text: string;
begin
  Text := 'CONFIRMAR DADOS' + #13 + frm_Cliente.lbContato.EditLabel.Caption +
    ': ' + frm_Cliente.lbContato.Text + #13 + frm_Cliente.Label1.Caption + ': '
    + frm_Cliente.MaskCep.Text + #13 + frm_Cliente.lbCidade.EditLabel.Caption +
    ': ' + frm_Cliente.lbCidade.Text + #13 +
    frm_Cliente.lbBairro.EditLabel.Caption + ': ' + frm_Cliente.lbBairro.Text +
    #13 + frm_Cliente.lbRua.EditLabel.Caption + ': ' + frm_Cliente.lbRua.Text +
    #13 + frm_Cliente.lbNumero.EditLabel.Caption + ': ' +
    frm_Cliente.lbNumero.Text + #13 + frm_Cliente.lbComplemento.EditLabel.
    Caption + ': ' + frm_Cliente.lbComplemento.Text;

end;

procedure Utils.generatePerson;
begin
  if frm_Cliente.rdCNPJ.Visible and frm_Cliente.rdCNPJ.Checked then
  begin
    frm_Cliente.edNome.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName
      ('company').AsString
  end
  else
    frm_Cliente.edNome.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName
      ('name').AsString;
  frm_Cliente.edCpfCnpj.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName
    (self.generateTypePerson).AsString;
  frm_Cliente.lbContato.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName
    ('phone_number').AsString;
  // inserrir aaqui
end;

procedure Utils.generatePersonF;
begin
  if (frm_Funcionario.generate.Tag = 0) and (frm_Cliente.rdCNPJ.Checked) then
    frm_Funcionario.edNome.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName
      ('company').AsString
  else
    frm_Funcionario.edNome.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName
      ('name').AsString;

  frm_Funcionario.edCpfCnpj.Text := dm_ProjetoFinal.MemTable_Pessoa.FieldByName
    ('cpf').AsString;
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
  query: TFDQuery;
  id: integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('SELECT LAST_INSERT_ID();');

  try
    query.open;
    if (not query.isEmpty) then
    begin
      id := query.Fields[0].AsInteger;
      result := id;
    end;
  except
    on e: exception do
    begin
      result := 0;
      ShowMessage('Erro ao selecionar dados da pessoa : ' + e.ToString);
    end;

  end;
  query.Close;
  query.Free;
end;

function Utils.identificadorEndereco(nome: string): integer;
var
  query: TFDQuery;
  querySelect: string;
  id: integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect :=
    'SELECT e.idEndereco,p.idPessoa, p.nome FROM logistica_ads.pessoa p, logistica_ads.endereco e where (p.nome = "'
    + nome + '" and p.idPessoa = e.pessoa_idPessoa);';

  query.SQL.Add(querySelect);
  try
    query.open;

    if (not query.isEmpty) then
    begin
      // query.ParamByName('nome_estado').AsString := self.getNome_estado;
      { Alterar o valor do [] para a posi��o do atributo }
      id := query.Fields[0].AsInteger;
      result := id;
    end;
  except
    on e: exception do
    begin
      result := 0;
      ShowMessage('Erro ao fazer consulta no endere�o de : ' + nome + ' ' +
        e.ToString);
    end;

  end;
  query.Close;
  query.Free;

end;

function Utils.identificadorRecebedor(nome: string): integer;
var
  query: TFDQuery;
  querySelect: string;
  id: integer;
begin
  id := 0;
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect :=
    'SELECT r.idrecebedor, p.nome FROM logistica_ads.pessoa p, logistica_ads.recebedor r where p.idPessoa = r.pessoa_idPessoa  and p.nome = "'
    + nome + '" ;';

  query.SQL.Add(querySelect);
  try
    query.open;
    if (not query.isEmpty) then
    begin
      id := query.Fields[0].AsInteger;
      result := id;
    end;
  except
    on e: exception do
    begin
      result := 0;
      ShowMessage('Erro ao fazer consulta no cliente : ' + nome + ' ' +
        e.ToString);
    end;

  end;
  query.Close;
  query.Free;
  result := id;
end;

function Utils.identiicadorPessoa(nome: string): integer;
var
  query: TFDQuery;
  querySelect: string;
  id: integer;
begin
  id := 0;
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect := 'SELECT * FROM logistica_ads.pessoa where nome =  "' +
    nome + '" ;';

  query.SQL.Add(querySelect);
  try
    query.open;

    if (not query.isEmpty) then
    begin
      id := query.Fields[0].AsInteger;
      result := id;
    end;
  except
    on e: exception do
    begin
      result := 0;
      ShowMessage('Erro ao fazer consulta na pessoa... : ' + nome + ' ' +
        e.ToString);
    end;

  end;
  query.Close;
  query.Free;
  result := id;
end;

function Utils.idPessoaCliente(nome: string): integer;
var
  query: TFDQuery;
  querySelect: string;
  id: integer;
begin
  id := 0;
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect :=
    'SELECT c.idcliente as "N� Registro",  p.nome FROM cliente c, pessoa p where c.pessoa_idPessoa = p.idpessoa and nome =  "'
    + nome + '" ;';

  query.SQL.Add(querySelect);
  try
    query.open;
    if (not query.isEmpty) then
    begin
      id := query.Fields[0].AsInteger;
      result := id;
    end;
  except
    on e: exception do
    begin
      result := 0;
      ShowMessage('Erro ao fazer consulta no cliente : ' + nome + ' ' +
        e.ToString);
    end;

  end;
  query.Close;
  query.Free;
  result := id;

end;

procedure Utils.inativeButton;
begin
  frm_Consulta.Tag := 1;
end;

function Utils.insertDados(idPedido, idCarga: integer): boolean;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  query.SQL.Add
    ('insert into carga_pedido values( :pedido_numero_pedido, :carga_IdCarga)');

  query.ParamByName('pedido_numero_pedido').AsInteger := idPedido;
  query.ParamByName('carga_IdCarga').AsInteger := idCarga;
  { Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo }

  try
    query.ExecSQL; { Insert service }
    result := true;
  except
    on e: exception do
    begin
      result := false;
      ShowMessage('Erro ao incluir dados... : ' + e.ToString);
    end;

  end;
  query.Close;
  query.Free;

end;

procedure Utils.loadingApiCep;
begin
  dm_ProjetoFinal.RESTClient1.Disconnect;
  dm_ProjetoFinal.RESTClient1.BaseURL := 'https://viacep.com.br/ws/';
  dm_ProjetoFinal.RESTRequest1.Method := rmGET;
  dm_ProjetoFinal.RESTRequest1.Resource := '{cep}/json';
  dm_ProjetoFinal.RESTRequest1.Params.AddUrlSegment('cep',
    frm_Cliente.MaskCep.Text);

  dm_ProjetoFinal.RESTRequest1.Execute;
  self.capturandoJson;
end;

procedure Utils.loadingApiPessoa;
var
  TOKEN: string;
begin
  TOKEN := '840|pe0mPZFHzecgsxgmMfBPxDWpSOP3xBzI';
  dm_ProjetoFinal.RESTClient2.BaseURL :=
    'https://api.invertexto.com/v1/faker?token=' + TOKEN + '';
  dm_ProjetoFinal.RESTRequest2.Execute;
  if (frm_Funcionario <> nil) then
  begin
    self.generatePersonF
  end
  else
    self.generatePerson;
end;

procedure Utils.newAddress(status: boolean);
var
  edit: TControleEdit;
begin

  frm_Cliente.spConsultaCep.Visible := status;
  frm_Cliente.Label1.Enabled := status;
  frm_Cliente.MaskCep.Enabled := status;
  frm_Cliente.lbEstado.Enabled := status;
  frm_Cliente.lbUnidadeFederativa.Enabled := status;
  frm_Cliente.lbCidade.Enabled := status;
  frm_Cliente.lbRua.Enabled := status;
  frm_Cliente.lbNumero.Enabled := status;
  frm_Cliente.lbBairro.Enabled := status;
  frm_Cliente.lbComplemento.Enabled := status;
  edit.setStyleOfField(false);
  if frm_Cliente.newAddress.Tag = 1 then
  begin
    Controle.atualizarEndereco(Controle.getIdendereco,
      frm_Cliente.spSalvar.Tag);
    self.clearData;
  end;
end;

procedure Utils.nomeEstado(uf: string);
begin
  if (UpperCase(uf) = 'AC') then
    frm_Cliente.lbEstado.Text := 'Acre'
  else if (UpperCase(uf) = 'AL') then
    frm_Cliente.lbEstado.Text := 'Alagoas'
  else if (UpperCase(uf) = 'AP') then
    frm_Cliente.lbEstado.Text := 'Amap�'
  else if (UpperCase(uf) = 'AM') then
    frm_Cliente.lbEstado.Text := 'Amazonas'
  else if (UpperCase(uf) = 'BA') then
    frm_Cliente.lbEstado.Text := 'Bahia'
  else if (UpperCase(uf) = 'CE') then
    frm_Cliente.lbEstado.Text := 'Cear�'
  else if (UpperCase(uf) = 'DF') then
    frm_Cliente.lbEstado.Text := 'Distrito Federal'
  else if (UpperCase(uf) = 'ES') then
    frm_Cliente.lbEstado.Text := 'Esp�rito Santo'
  else if (UpperCase(uf) = 'GO') then
    frm_Cliente.lbEstado.Text := 'Goi�s'
  else if (UpperCase(uf) = 'MA') then
    frm_Cliente.lbEstado.Text := 'Maranh�o'
  else if (UpperCase(uf) = 'MT') then
    frm_Cliente.lbEstado.Text := 'Mato Grosso'
  else if (UpperCase(uf) = 'MS') then
    frm_Cliente.lbEstado.Text := 'Mato Grosso do Sul'
  else if (UpperCase(uf) = 'MG') then
    frm_Cliente.lbEstado.Text := 'Minas Gerais'
  else if (UpperCase(uf) = 'PA') then
    frm_Cliente.lbEstado.Text := 'Par�'
  else if (UpperCase(uf) = 'PB') then
    frm_Cliente.lbEstado.Text := 'Para�ba '
  else if (UpperCase(uf) = 'PR') then
    frm_Cliente.lbEstado.Text := 'Paran�'
  else if (UpperCase(uf) = 'PE') then
    frm_Cliente.lbEstado.Text := 'Pernambuco'
  else if (UpperCase(uf) = 'PI') then
    frm_Cliente.lbEstado.Text := 'Piau�'
  else if (UpperCase(uf) = 'RJ') then
    frm_Cliente.lbEstado.Text := 'Rio de Janeiro'
  else if (UpperCase(uf) = 'RN') then
    frm_Cliente.lbEstado.Text := 'Rio Grande do Norte'
  else if (UpperCase(uf) = 'RS') then
    frm_Cliente.lbEstado.Text := 'Rio Grande do Sul'
  else if (UpperCase(uf) = 'RO') then
    frm_Cliente.lbEstado.Text := 'Rond�nia'
  else if (UpperCase(uf) = 'RR') then
    frm_Cliente.lbEstado.Text := 'Roraima'
  else if (UpperCase(uf) = 'SC') then
    frm_Cliente.lbEstado.Text := 'Santa Catarina'
  else if (UpperCase(uf) = 'SP') then
    frm_Cliente.lbEstado.Text := 'S�o Paulo'
  else if (UpperCase(uf) = 'SE') then
    frm_Cliente.lbEstado.Text := 'Sergipe'
  else
    frm_Cliente.lbEstado.Text := 'Tocantins'
end;

function Utils.setConfirmData: boolean;
begin
  result := true;
  if MessageDlg('CONFIRMAR DADOS' + #13 + frm_Cliente.lbContato.EditLabel.
    Caption + ': ' + frm_Cliente.lbContato.Text + #13 +
    frm_Cliente.Label1.Caption + ': ' + frm_Cliente.MaskCep.Text + #13 +
    frm_Cliente.lbCidade.EditLabel.Caption + ': ' + frm_Cliente.lbCidade.Text +
    #13 + frm_Cliente.lbBairro.EditLabel.Caption + ': ' +
    frm_Cliente.lbBairro.Text + #13 + frm_Cliente.lbRua.EditLabel.Caption + ': '
    + frm_Cliente.lbRua.Text + #13 + frm_Cliente.lbNumero.EditLabel.Caption +
    ': ' + frm_Cliente.lbNumero.Text + #13 +
    frm_Cliente.lbComplemento.EditLabel.Caption + ': ' +
    frm_Cliente.lbComplemento.Text, TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrno then
  begin
    result := false;
    exit;
  end;
end;

procedure Utils.setValues;
begin
  if frm_Consulta.cbVeiculos.Text <> '' then
  begin
    frm_Consulta.setSelectSQL
      ('SELECT * FROM logistica_ads.marca_veiculo mv,logistica_ads.veiculo v  where v.marca_veiculo_idmarca_veiculo = mv.idmarca_veiculo;');
    if frm_Consulta.ShowModal = mrOk then
    begin
      frm_Pedido.edDestinatario.Text := dm_ProjetoFinal.qrConsulta.Fields
        [1].AsString;
    end;

    FreeAndNil(frm_Consulta);
  end
end;

function Utils.statusButton: boolean;
begin
  if frm_Consulta.spSalvar.Caption = 'Atualizar' then
  begin
    if frm_Consulta.Tag = 2 then
    begin
      frm_Consulta.spSalvar.Enabled := true;
    end
    else
      frm_Consulta.spSalvar.Enabled := false;
  end;
end;

procedure Utils.updateStatusContato(status: boolean; id: integer);
begin
  contato := CadContato.Create;
  contato.setStatus_contato(status);
  contato.setPessoa_idPessoa(id);
  contato.setContato(frm_Cliente.lbContato.Text);

  contato.updateStatus;
end;

function Utils.validateJson: boolean;
begin
  result := false;
  if (dm_ProjetoFinal.RESTResponse1.ContentType <> CONTENTTYPE_APPLICATION_JSON)
    or (Length(dm_ProjetoFinal.RESTResponse1.content) < 60) then
  begin
    ShowMessage('Verifique o CEP informado');
    result := true;
  end
end;

procedure Utils.verifyValueOfField;
var
  i: integer;
begin

  if Length(frm_Cliente.lbContato.Text) <= 8 then
  begin
    exit
  end
  else
    for i := Length(frm_Cliente.lbContato.Text) downto 0 do
    begin
      frm_Cliente.alterarContato.Visible := false;
    end;
end;

end.
