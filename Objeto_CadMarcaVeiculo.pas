unit Objeto_CadMarcaVeiculo;

interface
  uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;
  type CadMarcaVeiculo = class

  private
    idMarca_veiculo:integer;
    nome_marca:string[45];
  public
    procedure setIdMarca_veiculo(idMarca_veiculo:integer);
    function getIdMarca_veiculo:integer;
    procedure setNome_marca(nome_marca:string);
    function getNome_marca:string;

                                              {<--- CRUD --->}

        function insertDados:Boolean;
        function updadteDados:Boolean;
        function IdentificadorMarca(marca:string):integer;
  end;

implementation

{ CadMarcaVeiculo }

function CadMarcaVeiculo.getIdMarca_veiculo: integer;
begin
    result := self.idMarca_veiculo ;
end;

function CadMarcaVeiculo.getNome_marca: string;
begin
    result := self.nome_marca	;
end;

function CadMarcaVeiculo.IdentificadorMarca(marca: string): integer;
var
    query:TFDQuery;
    querySelect:string;
    id:integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect:='SELECT * FROM logistica_ads.marca_veiculo where nome_marca = "'+marca+'";';

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
          showMessage('Erro ao fazer consulta na marca: '+marca+' ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadMarcaVeiculo.insertDados: Boolean;
  var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into marca_veiculo values( 0, :nome_marca)');

  query.ParamByName('nome_marca').AsString := self.getNome_marca;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir Marca: ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

procedure CadMarcaVeiculo.setIdMarca_veiculo(idMarca_veiculo: integer);
begin
    self.idMarca_veiculo := idMarca_veiculo;
end;

procedure CadMarcaVeiculo.setNome_marca(nome_marca: string);
begin
    self.nome_marca	 := nome_marca;
end;

function CadMarcaVeiculo.updadteDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('update marca_veiculo set nome_marca =:nome_marca  where (idmarca_veiculo = :idmarca_veiculo)');

  query.ParamByName('nome_marca').AsString := self.getNome_marca;
  query.ParamByName('idmarca_veiculo').AsInteger := self.getIdMarca_veiculo;

      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {update service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao alterar dados desta marca... : '+ self.getNome_marca + '  ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;
end.
