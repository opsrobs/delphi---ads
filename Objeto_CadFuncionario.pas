unit Objeto_CadFuncionario;

interface
  uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

  type CadFuncionario = class

  private
    idFuncionario:integer;
    pis:string[45];
    cnh:string[45];
    pessoa_fisica_idPessoa:integer;

  public
    procedure setIdFuncionario(idFuncionario:integer);
    function getIdFuncionario:integer;
    procedure setPis(pis:string);
    function getPis:string;
    procedure setCnh(cnh:string);
    function getCnh:string;
    procedure setpessoa_fisica_idPessoa(pessoa_fisica_idPessoa:integer);
    function getpessoa_fisica_idPessoa:integer;

                                              {<--- CRUD --->}

        function insertDados:Boolean;
        function deleteDados:Boolean;

  end;

implementation

{ CadFuncionario }

function CadFuncionario.deleteDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('delete from funcionario  where (idfuncionario = : idfuncionario');

  query.ParamByName('idfuncionario').AsInteger:= self.getIdFuncionario;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {update service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao Excluir dados da pessoa: ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadFuncionario.getCnh: string;
begin
    result := self.cnh;
end;

function CadFuncionario.getIdFuncionario: integer;
begin
    result := self.idFuncionario ;
end;

function CadFuncionario.getpessoa_fisica_idPessoa: integer;
begin
    result := self.pessoa_fisica_idPessoa;
end;

function CadFuncionario.getPis: string;
begin
    result := self.pis ;
end;

function CadFuncionario.insertDados: Boolean;
  var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('INSERT INTO logistica_ads.funcionario values( 0, :pis, :cnh, :pessoa_fisica_idpessoa_fisica)');

  query.ParamByName('pis').AsString := self.getPis;
  query.ParamByName('cnh').AsString := self.getCnh;
  query.ParamByName('pessoa_fisica_idpessoa_fisica').AsInteger:= self.getpessoa_fisica_idPessoa;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir funcionario... : ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

procedure CadFuncionario.setCnh(cnh: string);
begin
    self.cnh  := cnh;
end;

procedure CadFuncionario.setIdFuncionario(idFuncionario: integer);
begin
    self.idFuncionario := idFuncionario;
end;

procedure CadFuncionario.setpessoa_fisica_idPessoa(
  pessoa_fisica_idPessoa: integer);
begin
    self.pessoa_fisica_idPessoa := pessoa_fisica_idPessoa;
end;

procedure CadFuncionario.setPis(pis: string);
begin
    self.pis :=pis;
end;

end.
