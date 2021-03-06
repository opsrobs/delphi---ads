unit Objeto_CadFuncionario;

interface

uses
  FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

type
  CadFuncionario = class

  private
    idFuncionario: integer;
    pis: string[45];
    cnh: string[45];
    pessoa_fisica_idPessoa: integer;
    ativo: boolean;

  public
    procedure setIdFuncionario(idFuncionario: integer);
    function getIdFuncionario: integer;
    procedure setPis(pis: string);
    function getPis: string;
    procedure setCnh(cnh: string);
    function getCnh: string;
    procedure setpessoa_fisica_idPessoa(pessoa_fisica_idPessoa: integer);
    function getpessoa_fisica_idPessoa: integer;
    procedure setAtivo(ativo: boolean);
    function getAtivo: boolean;

    { <--- CRUD ---> }

    function insertDados: boolean;
    function updateStatus: boolean;
    function updateDados: boolean;
    function funcionariosExists(idPessoaFisica: integer): integer;
    function selectFuncionario(nome: string): integer;
  end;

implementation

{ CadFuncionario }




function CadFuncionario.funcionariosExists(idPessoaFisica: integer): integer;
var
  query: TFDQuery;
  script: string;
begin
  script := 'SELECT pessoa_fisica_idpessoa_fisica , count(idfuncionario) FROM logistica_ads.funcionario where pessoa_fisica_idpessoa_fisica = "'
    + IntToStr(idPessoaFisica) + '"';

  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  query.SQL.Add(script);

  { Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo }

  try
    query.open;
    if (not query.isEmpty) then
    begin
      // query.ParamByName('nome_estado').AsString := self.getNome_estado;
      { Alterar o valor do [] para a posi??o do atributo }
      result := query.Fields[0].AsInteger; //idPessoaFisica;
    end;
  except
    on e: exception do
    begin
      result := 0;
      showMessage('Erro ao alterar dados do Funcionario: ' + e.ToString);
    end;

  end;
  query.Close;
  query.Free;

end;

function CadFuncionario.getAtivo: boolean;
begin
  result := self.ativo;
end;

function CadFuncionario.getCnh: string;
begin
  result := self.cnh;
end;

function CadFuncionario.getIdFuncionario: integer;
begin
  result := self.idFuncionario;
end;

function CadFuncionario.getpessoa_fisica_idPessoa: integer;
begin
  result := self.pessoa_fisica_idPessoa;
end;

function CadFuncionario.getPis: string;
begin
  result := self.pis;
end;

function CadFuncionario.insertDados: boolean;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add
    ('INSERT INTO logistica_ads.funcionario values( 0, :pis, :cnh, :pessoa_fisica_idpessoa_fisica, :ativo)');

  query.ParamByName('pis').AsString := self.getPis;
  query.ParamByName('cnh').AsString := self.getCnh;
  query.ParamByName('pessoa_fisica_idpessoa_fisica').AsInteger :=
    self.getpessoa_fisica_idPessoa;
  query.ParamByName('ativo').AsBoolean := self.getAtivo;
  { Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo }

  try
    query.ExecSQL; { Insert service }
    result := true;
  except
    on e: exception do
    begin
      result := false;
      showMessage('Erro ao incluir funcionario... : ' + e.ToString);
    end;

  end;
  query.Close;
  query.Free;

end;

function CadFuncionario.selectFuncionario(nome: string): integer;
var
  query: TFDQuery;
  script: string;
begin
  script := 'SELECT fun.idfuncionario, count(p.nome) FROM logistica_ads.funcionario fun , logistica_ads.pessoa_fisica pf, logistica_ads.pessoa p where fun.pessoa_fisica_idpessoa_fisica = pf.idpessoa_fisica and pf.pessoa_idPessoa = p.idPessoa and nome like "%'+nome+'%"';

  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  query.SQL.Add(script);

  { Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo }

  try
    query.open;
    if (not query.isEmpty) then
    begin
      // query.ParamByName('nome_estado').AsString := self.getNome_estado;
      { Alterar o valor do [] para a posi??o do atributo }
      result := query.Fields[0].AsInteger; //idPessoaFisica;
    end;
  except
    on e: exception do
    begin
      result := 0;
      showMessage('Erro ao alterar dados do Funcionario: ' + e.ToString);
    end;

  end;
  query.Close;
  query.Free;

end;

procedure CadFuncionario.setAtivo(ativo: boolean);
begin
  self.ativo := ativo;
end;

procedure CadFuncionario.setCnh(cnh: string);
begin
  self.cnh := cnh;
end;

procedure CadFuncionario.setIdFuncionario(idFuncionario: integer);
begin
  self.idFuncionario := idFuncionario;
end;

procedure CadFuncionario.setpessoa_fisica_idPessoa(pessoa_fisica_idPessoa
  : integer);
begin
  self.pessoa_fisica_idPessoa := pessoa_fisica_idPessoa;
end;

procedure CadFuncionario.setPis(pis: string);
begin
  self.pis := pis;
end;

function CadFuncionario.updateDados: boolean;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  query.SQL.Add
    ('update funcionario set pis = :pis, cnh = :cnh where (pessoa_fisica_idpessoa_fisica = :pessoa_fisica_idpessoa_fisica)');

  query.ParamByName('pis').AsString := self.getPis;
  query.ParamByName('cnh').AsString := self.getCnh;
  query.ParamByName('pessoa_fisica_idpessoa_fisica').AsInteger := self.getpessoa_fisica_idPessoa;
  { Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo }

  try
    query.ExecSQL; { update service }
    result := true;
  except
    on e: exception do
    begin
      result := false;
      showMessage('Erro ao alterar dados do Funcionario: ' + e.ToString);
    end;

  end;
  query.Close;
  query.Free;

end;

function CadFuncionario.updateStatus: boolean;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add
    ('update funcionario set   ativo = :ativo where (idfuncionario = :idfuncionario)');

  query.ParamByName('ativo').AsBoolean := self.getAtivo;
  query.ParamByName('idfuncionario').AsInteger := self.getIdFuncionario;
  { Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo }

  try
    query.ExecSQL; { update service }
    result := true;
  except
    on e: exception do
    begin
      result := false;
      showMessage('Erro ao alterar dados do Funcionario: ' + e.ToString);
    end;

  end;
  query.Close;
  query.Free;

end;

end.
