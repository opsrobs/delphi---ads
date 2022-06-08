unit Objeto_CadCarga;

interface
  type CadCarga = class

  private
    idCarga:integer;
    quantidade:integer;
    peso:Float64;
  public
    procedure setIdCarga(idCarga:integer);
    function getIdCarga:integer;
    procedure setQuantidade(quantidade:integer);
    function getQuantidade:integer;
    procedure setPeso(peso:Float64);
    function getPeso:Float64;

  end;

implementation

{ CadCarga }

function CadCarga.getIdCarga: integer;
begin
  result := self.idCarga ;
end;


function CadCarga.getPeso: Float64;
begin
     result := self.peso;
end;

function CadCarga.getQuantidade: integer;
begin
     result := self.quantidade;
end;

procedure CadCarga.setIdCarga(idCarga: integer);
begin
    self.idCarga := idCarga;
end;


procedure CadCarga.setPeso(peso: Float64);
begin
    self.peso	 := peso;
end;

procedure CadCarga.setQuantidade(quantidade: integer);
begin
    self.quantidade	 := quantidade;
end;

end.
