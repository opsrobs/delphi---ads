unit Objeto_CadPedido;

interface
  uses Objeto_CadCarga;

  type
    pedido = class(CadCarga)

    private
      numero_pedido:integer;
      data_pedido:TDate;
      valor:Float64;
      status:Boolean;
      entrega_idEntrega:integer;
      carga_idCarga:integer;
      Cliente_idCliente:integer;
    public
      procedure setNumero_pedido(numero_pedido:integer);
      function getNumero_pedido:integer;
      procedure setData_pedido(data_pedido:TDate);
      function getData_pedido:TDate;
      procedure setValor(valor:Float64);
      function getValor:Float64;
      procedure setStatus(status:Boolean);
      function getStatus:Boolean;
      procedure setEntrega_idEntrega(entrega_idEntrega:integer);
      function getEntrega_idEntrega:integer;
      procedure setCarga_idCarga(carga_idCarga:integer);
      function getCarga_idCarga:integer;
      procedure setCliente_idCliente(cliente_idCliente:integer);
      function getCliente_idCliente:integer;

    end;

implementation

{ pedido }

function pedido.getCarga_idCarga: integer;
begin

end;

function pedido.getCliente_idCliente: integer;
begin

end;

function pedido.getData_pedido: TDate;
begin

end;

function pedido.getEntrega_idEntrega: integer;
begin

end;

function pedido.getNumero_pedido: integer;
begin

end;

function pedido.getStatus: Boolean;
begin

end;

function pedido.getValor: Float64;
begin

end;

procedure pedido.setCarga_idCarga(carga_idCarga: integer);
begin

end;

procedure pedido.setCliente_idCliente(cliente_idCliente: integer);
begin

end;

procedure pedido.setData_pedido(data_pedido: TDate);
begin

end;

procedure pedido.setEntrega_idEntrega(entrega_idEntrega: integer);
begin

end;

procedure pedido.setNumero_pedido(numero_pedido: integer);
begin

end;

procedure pedido.setStatus(status: Boolean);
begin

end;

procedure pedido.setValor(valor: Float64);
begin

end;

end.
