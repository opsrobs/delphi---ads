unit Objeto_CadMarcaVeiculo;

interface
  type CadMarcaVeiculo = class

  private
    idMarca_veiculo:integer;
    nome_marca:string[45];
  public
    procedure setIdMarca_veiculo(idMarca_veiculo:integer);
    function getIdMarca_veiculo:integer;
    procedure setNome_marca(nome_marca:string);
    function getNome_marca:string;
  end;

implementation

{ CadMarcaVeiculo }

function CadMarcaVeiculo.getIdMarca_veiculo: integer;
begin

end;

function CadMarcaVeiculo.getNome_marca: string;
begin

end;

procedure CadMarcaVeiculo.setIdMarca_veiculo(idMarca_veiculo: integer);
begin

end;

procedure CadMarcaVeiculo.setNome_marca(nome_marca: string);
begin

end;

end.
