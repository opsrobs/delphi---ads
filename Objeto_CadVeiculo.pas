unit Objeto_CadVeiculo;

interface
  uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;
  type CadVeiculo = class

  private
    idVeiculo:integer;
    modelo:string[40];
    placa:string[10];
    marca_veiculo_idMarca:integer;
  public
    procedure setIdVeiculo(idVeiculo:integer);
    function getIdVeiculo:integer;
    procedure setModelo(modelo:string);
    function getModelo:string;
    procedure setPlaca(placa:string);
    function getPlaca:string;
    procedure setMarca_Veiculo_idMarca(marca_veiculo_idMarca:integer);
    function getMarca_veiculo_idMarca:integer;

                                              {<--- CRUD --->}

        function insertDados:Boolean;
  end;

implementation

{ CadVeiculo }

function CadVeiculo.getIdVeiculo: integer;
begin
    result := self.idVeiculo ;
end;

function CadVeiculo.getMarca_veiculo_idMarca: integer;
begin
    result := self.marca_veiculo_idMarca;
end;

function CadVeiculo.getModelo: string;
begin
    result := self.modelo	;
end;

function CadVeiculo.getPlaca: string;
begin
    result := self.placa;
end;

function CadVeiculo.insertDados: Boolean;
  var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into marca_veiculo values( 0, :nome_marca)');

  query.ParamByName('nome_marca').AsString := self.getModelo;
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

procedure CadVeiculo.setIdVeiculo(idVeiculo: integer);
begin
    self.idVeiculo  := idVeiculo ;
end;

procedure CadVeiculo.setMarca_Veiculo_idMarca(marca_veiculo_idMarca: integer);
begin
    self.marca_veiculo_idMarca := marca_veiculo_idMarca;
end;

procedure CadVeiculo.setModelo(modelo: string);
begin
    self.modelo := modelo;
end;

procedure CadVeiculo.setPlaca(placa: string);
begin
    self.placa := placa;
end;

end.
