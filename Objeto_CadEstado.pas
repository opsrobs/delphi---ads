unit Objeto_CadEstado;

interface
uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

  type CadEstado = class
  private
    idEstado: integer;
    nome_estado: string[45];
    uf: string[2];
  public
    procedure setidEstado (idEstado:integer);
    function getidEstado: integer;
    procedure setNome_estado(nome_estado: string);
    function getNome_estado: string;
    procedure setuf (uf: string);
    function getuf: string;

     {<--- CRUD --->}

        function insertDados:Boolean;
        function estadeExists(estado:string):integer;
        function getIdEstade(estado:string):integer;
        function updateDados:Boolean;

  end;

implementation

{ CadEstado }

function CadEstado.estadeExists(estado:string): integer;
var
    query:TFDQuery;
    querySelect:string;
    id:integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect:='SELECT count(*) FROM logistica_ads.estado where (nome_estado = "'+estado+'" )';

  query.SQL.Add(querySelect);
      try
        query.open;


        if (not query.isEmpty) then
          begin
              //query.ParamByName('nome_estado').AsString := self.getNome_estado;
              {Alterar o valor do [] para a posição do atributo}
              id :=query.Fields[0].AsInteger;
              result :=id;
          end;
      except
        on e:exception do
        begin
          Result := 0;
          showMessage('Erro ao fazer consulta no estado : '+estado+' ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadEstado.getIdEstade(estado:string): integer;
var
    query:TFDQuery;
    querySelect:string;
    id:integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect:='SELECT idEstado,count(*) FROM logistica_ads.estado where (nome_estado = "'+estado+'" )';

  query.SQL.Add(querySelect);
      try
        query.open;


        if (not query.isEmpty) then
          begin
              //query.ParamByName('nome_estado').AsString := self.getNome_estado;
              {Alterar o valor do [] para a posição do atributo}
              id :=query.Fields[0].AsInteger;
              result :=id;
          end;
      except
        on e:exception do
        begin
          Result := 0;
          showMessage('Erro ao fazer consulta no estado : '+estado+' ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadEstado.getidEstado: integer;
begin
    result := self.idEstado;
end;

function CadEstado.getNome_estado: string;
begin
    result := Self.nome_estado;
end;

function CadEstado.getuf: string;
begin
    result := self.uf;
end;

function CadEstado.insertDados: Boolean;
  var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into estado values( 0, :nome_estado, :uf)');

  query.ParamByName('nome_estado').AsString := self.getNome_estado;
  query.ParamByName('uf').AsString := self.getuf;

      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir Estado... : ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;


procedure CadEstado.setidEstado(idEstado: integer);
begin
    self.idEstado	 := idEstado;
end;

procedure CadEstado.setNome_estado(nome_estado: string);
begin
    self.nome_estado := nome_estado;
end;

procedure CadEstado.setuf(uf: string);
begin
    self.uf := uf;
end;

function CadEstado.updateDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('update estado set uf =:uf  where (nome_estado = :nome_estado)');

  query.ParamByName('uf').AsString := self.getuf;
  query.ParamByName('nome_estado').AsString := self.getNome_estado;

      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {update service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao alterar dados do estado... : ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

end.
