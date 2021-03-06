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
    ativo:boolean;
  public
    procedure setIdVeiculo(idVeiculo:integer);
    function getIdVeiculo:integer;
    procedure setModelo(modelo:string);
    function getModelo:string;
    procedure setPlaca(placa:string);
    function getPlaca:string;
    procedure setMarca_Veiculo_idMarca(marca_veiculo_idMarca:integer);
    function getMarca_veiculo_idMarca:integer;
    procedure setAtivo(ativo:boolean);
    function getAtivo:boolean;

                                              {<--- CRUD --->}

        function insertDados:Boolean;
        function updadteDados:Boolean;
        function IdentificadorVeiculo(modelo:string):integer;
        function getLastid:integer;
  end;

implementation

{ CadVeiculo }

function CadVeiculo.getAtivo: boolean;
begin
  result := self.ativo;
end;

function CadVeiculo.getIdVeiculo: integer;
begin
    result := self.idVeiculo ;
end;

function CadVeiculo.getLastid: integer;
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

function CadVeiculo.IdentificadorVeiculo(modelo: string): integer;
var
    query:TFDQuery;
    querySelect:string;
    id:integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect:='SELECT * FROM logistica_ads.veiculo where modelo = "'+modelo+'";';

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
          showMessage('Erro ao fazer consulta na marca: '+modelo+' ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadVeiculo.insertDados: Boolean;
  var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into veiculo values( 0, :modelo, :placa, :marca_veiculo_idmarca_veiculo, :ativo)');

  query.ParamByName('modelo').AsString := self.getModelo;
  query.ParamByName('placa').AsString := self.getPlaca;
  query.ParamByName('marca_veiculo_idmarca_veiculo').AsInteger := self.getMarca_veiculo_idMarca;
  query.ParamByName('ativo').AsBoolean := true;

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

procedure CadVeiculo.setAtivo(ativo: boolean);
begin
    self.ativo := ativo;
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

function CadVeiculo.updadteDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('update veiculo set  ativo =:ativo where (idveiculos = :idveiculos)');

  query.ParamByName('ativo').AsBoolean := self.getAtivo;
  query.ParamByName('idveiculos').AsInteger := self.getIdVeiculo;

      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {update service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao alterar dados desta marca... : '+ self.getModelo + '  ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

end.
