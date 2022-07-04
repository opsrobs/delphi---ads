unit Objeto_CadContato;

interface

uses
  FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

type
  CadContato = class

  private
    idStatus_telefone: integer;
    status_contato: Boolean;
    contato: string[45];
    Pessoa_idPessoa: integer;
  public
    procedure setIdStatus_Telefone(idStatus_telefone: integer);
    function getIdStatus_Telefone: integer;
    procedure setStatus_contato(status_contato: Boolean);
    function getSattus_contato: Boolean;
    procedure setContato(contato: string);
    function getContato: string;
    procedure setPessoa_idPessoa(Pessoa_idPessoa: integer);
    function getPessoa_idPessoa: integer;

    { <--- CRUD ---> }

    function insertDados: Boolean;
    function updateDados: Boolean;
    function updateStatus: Boolean;
    function updateEspecifyNumber(number: string): Boolean;
  end;

implementation

{ CadContato }

function CadContato.getContato: string;
begin
  result := Self.contato;
end;

function CadContato.getIdStatus_Telefone: integer;
begin
  result := Self.idStatus_telefone;
end;

function CadContato.getPessoa_idPessoa: integer;
begin
  result := Self.Pessoa_idPessoa;
end;

function CadContato.getSattus_contato: Boolean;
begin
  result := Self.status_contato;
end;

function CadContato.insertDados: Boolean;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add
    ('insert into contato values( 0, :status_contato, :contato,  :pessoa_idPessoa)');

  query.ParamByName('status_contato').AsBoolean := Self.getSattus_contato;
  query.ParamByName('contato').AsString := Self.getContato;
  query.ParamByName('pessoa_idPessoa').AsInteger := Self.getPessoa_idPessoa;
  { Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo }

  try
    query.ExecSQL; { Insert service }
    result := true;
  except
    on e: exception do
    begin
      result := false;
      showMessage('Erro ao incluir pessoa: ' + e.ToString);
    end;

  end;
  query.Close;
  query.Free;

end;

procedure CadContato.setContato(contato: string);
begin
  Self.contato := contato;
end;

procedure CadContato.setIdStatus_Telefone(idStatus_telefone: integer);
begin
  Self.idStatus_telefone := idStatus_telefone;
end;

procedure CadContato.setPessoa_idPessoa(Pessoa_idPessoa: integer);
begin
  Self.Pessoa_idPessoa := Pessoa_idPessoa;
end;

procedure CadContato.setStatus_contato(status_contato: Boolean);
begin
  Self.status_contato := status_contato;
end;

function CadContato.updateDados: Boolean;
var
  script: string;
  query: TFDQuery;
begin
  script := 'update contato set status_contato =:status_contato, contato =:contato where '
    + ' (pessoa_idPessoa = :pessoa_idPessoa)';
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  query.SQL.Add(script);

  query.Params[0].AsBoolean := Self.getSattus_contato;
  query.Params[1].AsString := Self.getContato;
  query.ParamByName('pessoa_idPessoa').AsInteger := Self.getPessoa_idPessoa;

  { Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo }

  try
    query.ExecSQL; { update service }
    result := true;
  except
    on e: exception do
    begin
      result := false;
      showMessage('Erro ao alterar dados do contato: ' + Self.contato + '  ' +
        e.ToString);
    end;

  end;
  query.Close;
  query.Free;
end;

function CadContato.updateEspecifyNumber(number: string): Boolean;
var
  script: string;
  query: TFDQuery;
begin
  script := 'update contato set status_contato =:status_contato, contato =:contato where '
    + ' (pessoa_idPessoa = :pessoa_idPessoa and contato = "'+number+'" )';
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  query.SQL.Add(script);

  query.Params[0].AsBoolean := Self.getSattus_contato;
  query.Params[1].AsString := Self.getContato;
  query.ParamByName('pessoa_idPessoa').AsInteger := Self.getPessoa_idPessoa;
  try
    query.ExecSQL; { update service }
    result := true;
    MessageDlg('Alteração do contato '+self.getContato+' realizada com sucesso!!!', TMsgDlgType.mtInformation,
    [TMsgDlgBtn.mbYes], 0)
  except
    on e: exception do
    begin
      result := false;
      showMessage('Erro ao alterar dados do contato: ' + Self.contato + '  ' +
        e.ToString);
    end;

  end;
  query.Close;
  query.Free;
end;

function CadContato.updateStatus: Boolean;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  query.SQL.Add
    ('update contato set status_contato = :status_contato where (pessoa_idPessoa = :pessoa_idPessoa) and (contato = "'+self.getcontato+'")');

  query.ParamByName('status_contato').AsBoolean := Self.getSattus_contato;
  query.ParamByName('pessoa_idPessoa').AsInteger := Self.getPessoa_idPessoa;
  //query.Params[1].AsString := self.getContato;
  try
    query.ExecSQL; { update service }
    result := true;
  except
    on e: exception do
    begin
      result := false;
      showMessage('Erro ao alterar dados do contato: ' + Self.contato + '  ' +
        e.ToString);
    end;

  end;
  query.Close;
  query.Free;
end;

end.
