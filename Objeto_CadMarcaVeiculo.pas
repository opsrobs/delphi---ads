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
    result := self.idMarca_veiculo ;
end;

function CadMarcaVeiculo.getNome_marca: string;
begin
    result := self.nome_marca	;
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
