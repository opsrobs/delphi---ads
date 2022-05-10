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
  result := self.carga_idCarga;
end;

function pedido.getCliente_idCliente: integer;
begin
  result :=self.Cliente_idCliente;
end;

function pedido.getData_pedido: TDate;
begin
  result := Self.data_pedido;
end;

function pedido.getEntrega_idEntrega: integer;
begin
 result := self.entrega_idEntrega;
end;

function pedido.getNumero_pedido: integer;
begin
  result := self.numero_pedido;
end;

function pedido.getStatus: Boolean;
begin
  result := self.status;
end;

function pedido.getValor: Float64;
begin
  result := self.valor ;
end;

procedure pedido.setCarga_idCarga(carga_idCarga: integer);
begin
  self.carga_idCarga := carga_idCarga;
end;

procedure pedido.setCliente_idCliente(cliente_idCliente: integer);
begin
  self.Cliente_idCliente := cliente_idCliente;
end;

procedure pedido.setData_pedido(data_pedido: TDate);
begin
  self.data_pedido := data_pedido;
end;

procedure pedido.setEntrega_idEntrega(entrega_idEntrega: integer);
begin
  self.entrega_idEntrega  := entrega_idEntrega;
end;

procedure pedido.setNumero_pedido(numero_pedido: integer);
begin
  self.numero_pedido := numero_pedido;
end;

procedure pedido.setStatus(status: Boolean);
begin
  self.status := status;
end;

procedure pedido.setValor(valor: Float64);
begin
  self.valor := valor;
end;

end.
