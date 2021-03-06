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
        function identificadorCliente(nome:string):integer;


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

function CadCliente.identificadorCliente(nome:string): integer;
var
    query:TFDQuery;
    querySelect:string;
    id:integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect:='SELECT c.idcliente as "N? Registro",  p.nome FROM cliente c, pessoa p where c.pessoa_idPessoa = p.idpessoa and nome =  "'+nome+'" ;';

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
          showMessage('Erro ao fazer consulta no cliente : '+nome+' ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

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
