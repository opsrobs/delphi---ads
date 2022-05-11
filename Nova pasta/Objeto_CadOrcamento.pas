unit Objeto_CadOrcamento;

interface
  uses Objeto_CadPedido;

  type CadOrcamento = class(CadPedido)

  private
    idOrcamento:integer;
    valor_pedido:Float64;
    valor_frete:Float64;
    pedido_numero_pedido:integer;

  public
    procedure setIdOrcamento(idOrcamento:integer);
    function getIdOrcamento:integer;
    procedure setValor_pedido(valor_pedido:Float64);
    function getValor_pedido:Float64;
    procedure setValor_frete(valor_frete:Float64);
    function getValor_Frete:Float64;
    procedure setPedido_numero_pedido(pedido_numero_pedido:integer);
    function getPedido_numero_pedido:integer;
  end;



implementation

{ CadOrcamento }

function CadOrcamento.getIdOrcamento: integer;
begin
  result := self.idOrcamento;
end;

function CadOrcamento.getPedido_numero_pedido: integer;
begin
    result := self.pedido_numero_pedido ;
end;

function CadOrcamento.getValor_Frete: Float64;
begin
    result := self.valor_frete;
end;

function CadOrcamento.getValor_pedido: Float64;
begin
    result := self.valor_pedido;
end;

procedure CadOrcamento.setIdOrcamento(idOrcamento: integer);
begin
    self.idOrcamento := idOrcamento;
end;

procedure CadOrcamento.setPedido_numero_pedido(pedido_numero_pedido: integer);
begin
    self.pedido_numero_pedido := pedido_numero_pedido;
end;

procedure CadOrcamento.setValor_frete(valor_frete: Float64);
begin
    self.valor_frete := valor_frete;
end;

procedure CadOrcamento.setValor_pedido(valor_pedido: Float64);
begin
    self.valor_pedido := valor_pedido;
end;

end.
