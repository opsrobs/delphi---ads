unit Objeto_CadPessoaFisica;

interface

  uses
      FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs, Objeto_CadPessoa;

  type CadPessoaFisica = class (CadPessoa)

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

                                                  {<--- CRUD --->}

        function insertDados:Boolean;
        function updateDados:Boolean;
        function deleteDados:Boolean;
        function selectDados:Boolean;

end;
implementation

{ CadPessoaFisica }

            {*** DELETAR DADOS DAS PESSOA ***}
function CadPessoaFisica.deleteDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('delete from pessoa_fisica  where (idpessoa_fisica=: idpessoa_fisica');


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

function CadPessoaFisica.getPessoa_idPessoa: integer;
begin
     result := self.Pessoa_idPessoa;
end;

//          *** Inserir id pessoa ***
function CadPessoaFisica.insertDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into pessoa_fisica values( 0, :cpf, pessoa_idPessoa)');

  query.ParamByName('cpf').AsString := self.getcpf;
  query.ParamByName('pessoa_idPessoa').AsString := self.getPessoa_idPessoa;
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


//          *** SELECT NAS PESSOA FISICA ***
function CadPessoaFisica.selectDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('Select * from pessoa_fisica where pessoa_idPessoa = : pessoa_idPessoa ');

  query.ParamByName('nome').AsInteger:= self.getidPessoa;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.open;
        result := true;

        if (not query.isEmpty) then
          begin
              {Alterar o valor do [] para a posição do atributo}
              self.setnome(query.Fields[1].AsString);

          end;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao selecionar dados da pessoa : ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

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

  query.SQL.Add('update pessoa set   nome = :nome');

  query.ParamByName('nome').AsString := self.getnome;
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

end.
