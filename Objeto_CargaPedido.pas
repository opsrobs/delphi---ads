unit Objeto_CargaPedido;

interface
type
  CargaPedido = class
    private
      idNumeroPedido:integer;
      idCarga:integer;
    public
    function getIdNumeroPedido:integer;
    procedure setidNumeroPedido(idNumeroPedido:integer);
    function getidCarga:integer;
    procedure setidCarga(idCarga:integer);


  end;

implementation

{ CargaPedido }

function CargaPedido.getidCarga: integer;
begin
    result := self.idCarga;
end;

function CargaPedido.getIdNumeroPedido: integer;
begin
    result := self.idNumeroPedido;
end;

procedure CargaPedido.setidCarga(idCarga: integer);
begin
    idCarga := self.idCarga;
end;

procedure CargaPedido.setidNumeroPedido(idNumeroPedido: integer);
begin
    idNumeroPedido := self.idNumeroPedido;
end;

end.
