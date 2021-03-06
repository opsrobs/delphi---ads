unit Objeto_CadPessoaFisica;

interface

  uses
      FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs, Objeto_CadPessoa;

  type CadPessoaFisica = class

  private
        idPessoa_fisica: integer;
        cpf: string[45];
        Pessoa_idPessoa: integer;
  public
        procedure setidPessoa_fisica (idPessoa_fisica:integer);
        function getidPessoa_fisica: integer;
        procedure setcpf (cpf: string);
        function getcpf: string;
        procedure setPessoa_idPessoa (Pessoa_idPessoa:integer);
        function getPessoa_idPessoa: integer;
        function verifyCadPerson(idpessoa:integer):integer;
        function getLastId():integer;

                                                  {<--- CRUD --->}

        function insertDados:Boolean;
        function updateDados:Boolean;
        function deleteDados:Boolean;
        function selectDados:Boolean;


end;
implementation

{ CadPessoaFisica }

function CadPessoaFisica.deleteDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('delete from pessoa  where (idPessoa_fisica=: idPessoa_fisica');

  query.ParamByName('nome').AsInteger:= self.idPessoa_fisica;
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

function CadPessoaFisica.getcpf: string;
begin
  result := self.cpf;
end;

function CadPessoaFisica.getidPessoa_fisica: integer;
begin
     result := self.idPessoa_Fisica;
end;

function CadPessoaFisica.getLastId(): integer;
var
    query:TFDQuery;
    idresult:integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('SELECT LAST_INSERT_ID();');

      try
        query.open;


        if (not query.isEmpty) then
          begin
              {Alterar o valor do [] para a posi??o do atributo}
              idresult :=query.Fields[0].AsInteger;
              result :=idresult;
          end;
      except
        on e:exception do
        begin
          Result := 0;
          showMessage('Erro ao selecionar dados da Pessoa Fisica : ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadPessoaFisica.getPessoa_idPessoa: integer;
begin
     result := self.Pessoa_idPessoa;
end;

function CadPessoaFisica.insertDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into pessoa_fisica values( 0, :cpf, :pessoa_idPessoa)');

  query.ParamByName('cpf').AsString := self.getcpf;
  query.ParamByName('pessoa_idPessoa').AsInteger := self.getPessoa_idPessoa;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir Pessoa Fisica <<< Objeto_CadPessoaFisica >>>: ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadPessoaFisica.selectDados: Boolean;
begin

end;

procedure CadPessoaFisica.setcpf(cpf: string);
begin
     self.cpf := cpf;
end;

procedure CadPessoaFisica.setidPessoa_fisica(idPessoa_fisica: integer);
begin
     self.idPessoa_fisica := idPessoa_fisica;
end;

procedure CadPessoaFisica.setPessoa_idPessoa(Pessoa_idPessoa: integer);
begin
     self.Pessoa_idPessoa := Pessoa_idPessoa;
end;

function CadPessoaFisica.updateDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('update pessoa_fisica set cpf = :cpf where (idpessoa_fisica = :idpessoa_fisica)');

  query.ParamByName('cpf').AsString := self.getcpf;
  query.ParamByName('idpessoa_fisica').AsInteger := self.getidPessoa_fisica;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {update service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao alterar dados da pessoa Fisisca <<< Objeto_CadPessoaFisica >>>: ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadPessoaFisica.verifyCadPerson(idpessoa:integer): integer;
var
    query:TFDQuery;
    querySelect:string;
    id:integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect:='SELECT * FROM logistica_ads.pessoa_fisica where pessoa_idPessoa = "'+IntToStr(idpessoa)+'";';
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
          showMessage('Erro ao fazer consulta no estado : '+IntToStr(idpessoa)+' ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;
end.
