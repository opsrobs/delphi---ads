unit Objeto_CadVeiculo;

interface
  uses Objeto_CadMarcaVeiculo;
  type CadVeiculo = class(CadMarcaVeiculo)

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
