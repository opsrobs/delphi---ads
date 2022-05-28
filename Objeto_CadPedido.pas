unit Objeto_CadPedido;

interface
  uses FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

  type
    CadPedido = class

    private
      numero_pedido:integer;
      data_pedido:TDate;
      valor:Float64;
      status:string;
      Cliente_idCliente:integer;
      endereco_idEndereco:integer;
      valor_total:Float64;
      valor_frete:Float64;
      peso_pedido:Float64;
    public
      procedure setNumero_pedido(numero_pedido:integer);
      function getNumero_pedido:integer;
      procedure setData_pedido(data_pedido:TDate);
      function getData_pedido:TDate;
      procedure setValor(valor:Float64);
      function getValor:Float64;
      procedure setStatus(status:string);
      function getStatus:string;
      procedure setCliente_idCliente(cliente_idCliente:integer);
      function getCliente_idCliente:integer;
      procedure setendereco_idEndereco(endereco_idEndereco:integer);
      function getendereco_idEndereco:integer;
      procedure setValor_total(valor_total:Float64);
      function getValor_total:Float64;
      procedure setValor_frete(valor_frete:Float64);
      function getValor_Frete:Float64;
      procedure setpeso_pedido(peso_pedido:Float64);
      function getpeso_pedido:Float64;

                                                {<--- CRUD --->}

        function insertDados:Boolean;

    end;

implementation

{ CadPedido }




function CadPedido.getCliente_idCliente: integer;
begin
  result := self.Cliente_idCliente;
end;

function CadPedido.getData_pedido: TDate;
begin
  result := Self.data_pedido;
end;


function CadPedido.getendereco_idEndereco: integer;
begin
    result := self.getendereco_idEndereco;
end;

function CadPedido.getNumero_pedido: integer;
begin
  result := self.numero_pedido;
end;

function CadPedido.getpeso_pedido: Float64;
begin
    result := self.peso_pedido;
end;

function CadPedido.getStatus: string;
begin
  result := self.status;
end;

function CadPedido.getValor: Float64;
begin
  result := self.valor ;
end;

function CadPedido.getValor_Frete: Float64;
begin
    result := self.valor_frete;
end;

function CadPedido.getValor_total: Float64;
begin
    result := self.valor_total;
end;

function CadPedido.insertDados: Boolean;
  var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into pedido values( 0, :data_pedido, :valor, :status, :cliente_idcliente, :valor_total, :valor_frete, :endereco_idEndereco, :peso_pedido )');

  query.ParamByName('data_pedido').AsDate := self.getData_pedido;
  query.ParamByName('valor').AsFloat := self.getValor;
  query.ParamByName('status').AsString := self.getStatus;
  query.ParamByName('cliente_idcliente').AsInteger := self.getCliente_idCliente;
  query.ParamByName('valor_total').AsFloat := self.getValor_total;
  query.ParamByName('valor_frete').AsFloat := self.getValor_Frete;
  query.ParamByName('endereco_idEndereco').AsInteger := self.getendereco_idEndereco;
  query.ParamByName('peso_pedido').AsFloat := self.getpeso_pedido;
      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir pedido: ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;



procedure CadPedido.setCliente_idCliente(cliente_idCliente: integer);
begin
  self.Cliente_idCliente := cliente_idCliente;
end;

procedure CadPedido.setData_pedido(data_pedido: TDate);
begin
  self.data_pedido := data_pedido;
end;


procedure CadPedido.setendereco_idEndereco(endereco_idEndereco: integer);
begin
    self.endereco_idEndereco := endereco_idEndereco;
end;

procedure CadPedido.setNumero_pedido(numero_pedido: integer);
begin
  self.numero_pedido := numero_pedido;
end;

procedure CadPedido.setpeso_pedido(peso_pedido: Float64);
begin
    self.peso_pedido := peso_pedido;
end;

procedure CadPedido.setStatus(status: string);
begin
  self.status := status;
end;

procedure CadPedido.setValor(valor: Float64);
begin
  self.valor := valor;
end;

procedure CadPedido.setValor_frete(valor_frete: Float64);
begin
    self.valor_frete := valor_frete;
end;

procedure CadPedido.setValor_total(valor_total: Float64);
begin
    self.valor_total := valor_total;
end;

end.
