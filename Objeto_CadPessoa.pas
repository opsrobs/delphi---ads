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
        function updateDados:Boolean;
        function deleteDados:Boolean;
        function selectDados:Boolean;
        function getLastId:integer;
end;

implementation

{ CadPessoa }

function CadPessoa.insertDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into pessoa values( 0, :nome)');

  query.ParamByName('nome').AsString := self.getnome;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir pessoa: ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadPessoa.updateDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('update pessoa set   nome = :nome where (idPessoa = :idPessoa)');

  query.ParamByName('nome').AsString := self.getnome;
  query.ParamByName('idPessoa').AsInteger := self.getidPessoa;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {update service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao alterar dados da pessoa: ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadPessoa.deleteDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('delete from pessoa  where (idPessoa=: idPessoa');

  query.ParamByName('nome').AsInteger:= self.getidPessoa;
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

function CadPessoa.selectDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('Select * from pessoa where idPessoa = : idPessoa ');

  query.ParamByName('idPessoa').AsInteger:= self.getidPessoa;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.open;
        result := true;

        if (not query.isEmpty) then
          begin
              {Alterar o valor do [] para a posi??o do atributo}
              self.setnome(query.Fields[1].AsString);

          end;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao selecionar dados da pessoa ++++ : ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadPessoa.getidPessoa: integer;
begin
    result := self.idPessoa;
end;

function CadPessoa.getLastId: integer;
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
