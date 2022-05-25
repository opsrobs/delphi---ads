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

end.
