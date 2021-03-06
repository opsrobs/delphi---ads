unit Objeto_CadPessoaJuridica;

interface

uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs,Objeto_CadPessoa;

type CadPessoaJuridica = class (CadPessoa)

  private
        idPessoa_juridica: integer;
        cnpj: string [45];
        Pessoa_idPessoa: integer;
  public
        procedure setidPessoa_juridica (idPessoa_juridica:integer);
        function getidPessoa_juridica: integer;
        procedure setcnpj (cnpj: string);
        function getcnpj: string;
        procedure setPessoa_idPessoa (Pessoa_idPessoa:integer);
        function getPessoa_idPessoa: integer;

                                                          {<--- CRUD --->}

        function insertDados:Boolean;

end;

implementation

{ CadPessoaJuridica }

function CadPessoaJuridica.insertDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into pessoa_juridica values( 0, :cnpj, :pessoa_idPessoa)');

  query.ParamByName('cnpj').AsString := self.getcnpj;
  query.ParamByName('pessoa_idPessoa').AsInteger := self.getPessoa_idPessoa;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir Pessoa Juridica: ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;


function CadPessoaJuridica.getcnpj: string;
begin
     result := self.cnpj;
end;

function CadPessoaJuridica.getidPessoa_juridica: integer;
begin
     result := self.idPessoa_juridica;
end;

function CadPessoaJuridica.getPessoa_idPessoa: integer;
begin
      result := self.Pessoa_idPessoa;
end;


procedure CadPessoaJuridica.setcnpj(cnpj: string);
begin
     self.cnpj := cnpj;
end;

procedure CadPessoaJuridica.setidPessoa_juridica(idPessoa_juridica: integer);
begin
     self.idPessoa_juridica := idPessoa_juridica;
end;

procedure CadPessoaJuridica.setPessoa_idPessoa(Pessoa_idPessoa: integer);
begin
      self.Pessoa_idPessoa := Pessoa_idPessoa;
end;

end.
