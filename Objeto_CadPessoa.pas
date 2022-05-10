unit Objeto_CadPessoa;

interface
  uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

type CadPessoa = class

  private
         idPessoa:integer;
         nome:string[45];

  public
        procedure setidPessoa(idPessoa:integer);
        function getidPessoa:integer;
        procedure setnome (nome:string);
        function getnome:string;

                                          {<--- CRUD --->}

        function insertDados:Boolean;
end;

implementation

{ CadPessoa }

function CadPessoa.insertDados: Boolean;
  var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into pessoa values( 0, :nome');

  query.ParamByName('nome').AsString := self.getnome;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {Insert service}
      except
        on e:exception do
          showMessage('Erro ao incluir pessoa: ' + e.ToString);
      end;
      query.Close;
      query.Free;

end;

function CadPessoa.getidPessoa: integer;
begin
    result := self.idPessoa;
end;

function CadPessoa.getnome: string;
begin
      result := self.nome;
end;


procedure CadPessoa.setidPessoa(idPessoa: integer);
begin
     self.idPessoa := idPessoa;
end;

procedure CadPessoa.setnome(nome: string);
begin
      self.nome := nome;
end;

end.
