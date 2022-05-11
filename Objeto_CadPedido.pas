unit Objeto_CadPedido;

interface
  uses Objeto_CadCarga;

  type
    CadPedido = class(CadCarga)

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

{ CadPedido }

function CadPedido.getCarga_idCarga: integer;
begin
  result := self.carga_idCarga;
end;

function CadPedido.getCliente_idCliente: integer;
begin
  result :=self.Cliente_idCliente;
end;

function CadPedido.getData_pedido: TDate;
begin
  result := Self.data_pedido;
end;

function CadPedido.getEntrega_idEntrega: integer;
begin
 result := self.entrega_idEntrega;
end;

function CadPedido.getNumero_pedido: integer;
begin
  result := self.numero_pedido;
end;

function CadPedido.getStatus: Boolean;
begin
  result := self.status;
end;

function CadPedido.getValor: Float64;
begin
  result := self.valor ;
end;

procedure CadPedido.setCarga_idCarga(carga_idCarga: integer);
begin
  self.carga_idCarga := carga_idCarga;
end;

procedure CadPedido.setCliente_idCliente(cliente_idCliente: integer);
begin
  self.Cliente_idCliente := cliente_idCliente;
end;

procedure CadPedido.setData_pedido(data_pedido: TDate);
begin
  self.data_pedido := data_pedido;
end;

procedure CadPedido.setEntrega_idEntrega(entrega_idEntrega: integer);
begin
  self.entrega_idEntrega  := entrega_idEntrega;
end;

procedure CadPedido.setNumero_pedido(numero_pedido: integer);
begin
  self.numero_pedido := numero_pedido;
end;

procedure CadPedido.setStatus(status: Boolean);
begin
  self.status := status;
end;

procedure CadPedido.setValor(valor: Float64);
begin
  self.valor := valor;
end;

end.
