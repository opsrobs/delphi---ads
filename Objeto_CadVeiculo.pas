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

  end;

implementation

{ CadVeiculo }

function CadVeiculo.getIdVeiculo: integer;
begin

end;

function CadVeiculo.getModelo: string;
begin

end;

function CadVeiculo.getPlaca: string;
begin

end;

procedure CadVeiculo.setIdVeiculo(idVeiculo: integer);
begin

end;

procedure CadVeiculo.setMarca_Veiculo_idMarca(marca_veiculo_idMarca: integer);
begin

end;

procedure CadVeiculo.setModelo(modelo: string);
begin

end;

procedure CadVeiculo.setPlaca(placa: string);
begin

end;

end.
