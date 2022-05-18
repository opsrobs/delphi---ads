unit Objeto_CadCliente;

interface
    uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

type CadCliente = class

private
      idcliente : integer;
      Pessoa_idPessoa: integer;
public
      procedure setidcliente (idcliente: integer);
      function getidcliente: integer;
      procedure setPessoa_idPessoa (Pessoa_idPessoa:integer);
      function getPessoa_idPessoa: integer;

                                                                {<--- CRUD --->}

        function insertDados:Boolean;


end;

implementation

{ CadCliente }

function CadCliente.getidcliente: integer;
begin
    result := self.idcliente;
end;

function CadCliente.getPessoa_idPessoa: integer;
begin
    result := self.Pessoa_idPessoa;
end;

function CadCliente.insertDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into cliente values( 0, :pessoa_idPessoa)');

  query.ParamByName('pessoa_idPessoa').AsInteger := self.getPessoa_idPessoa;

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

procedure CadCliente.setidcliente(idcliente: integer);
begin
    self.idcliente := idcliente;
end;

procedure CadCliente.setPessoa_idPessoa(Pessoa_idPessoa: integer);
begin
    self.Pessoa_idPessoa := Pessoa_idPessoa;
end;

end.
