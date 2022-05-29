unit Unit_ControlePedido;

interface
    uses System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs,Vcl.Mask, REST.Types, Objeto_CadPedido,Objeto_CadEstado,
     StrUtils,Objeto_CadCidade, Objeto_CadBairro,Unit_Utils, Objeto_CadCliente, Objeto_CadEndereco;

type
 TControle_Pedido = class
   private
    procedure cadastroPedido;
    function verifyStatus:string;
    function setScript:string;

     public
     procedure getCadPedido;
     procedure gerarPeso;
     procedure populaCombo;

 end;
 var
  pesor:single;
  VCadPedido:CadPedido;
  VCadCliente:CadCliente;
  utilitaria:Utils;
  VCadEndereco:CadEndereco;

implementation

{ TControle_Pedido }

uses Form_CadPedido, Unit_Dados;

procedure TControle_Pedido.cadastroPedido;
var
VCadCliente:CadCliente;
begin
  VCadCliente := CadCliente.Create;
  VCadPedido := CadPedido.Create;
  VCadPedido.setData_pedido(frm_Pedido.dtDataPedido.Date);
  VCadPedido.setValor(StrToFloat(frm_Pedido.edValorPedido.Text));
  VCadPedido.setStatus(self.verifyStatus);
  VCadPedido.setCliente_idCliente(VCadCliente.identificadorCliente(frm_Pedido.cbCliente.Text));
  VCadPedido.setValor_total(StrToFloat(frm_Pedido.edValorTotal.Text));
  VCadPedido.setValor_frete(StrToFloat(frm_Pedido.edValorFrete.Text));
  VCadPedido.setendereco_idEndereco(0);
  VCadPedido.setpeso_pedido(1.12);

end;

procedure TControle_Pedido.gerarPeso;
var
value:Float32;
begin
    pesor := Random(100);
    value := pesor * 0.1;
    frm_Pedido.edPeso.Text := pesor.ToString;
end;

procedure TControle_Pedido.getCadPedido;
var
  idendereco:integer;
  idCliente:integer;
  id:integer;
begin
    if (frm_Pedido = nil) then
      frm_Pedido := Tfrm_Pedido.Create(nil);

    if (frm_Pedido.ShowModal = mrOk) then
      begin
      idendereco := utilitaria.identificadorEndereco(frm_Pedido.edDestinatario.Text);
      idCliente := VCadCliente.identificadorCliente(frm_Pedido.cbCliente.Text);
      id := utilitaria.identificadorRecebedor(frm_Pedido.edDestinatario.Text);
         case(frm_Pedido.getFuncao) of
            1: begin
                ShowMessage(IntToStr(id))
            end;
            2: begin

               end;
         end;

      end;

      FreeAndNil(frm_Pedido);
end;

procedure TControle_Pedido.populaCombo;
begin
    //frm_Veiculos.cbVeiculos.Style:=
    dm_ProjetoFinal.qrConsulta.Close;
    dm_ProjetoFinal.qrConsulta.SQL.Clear;
    dm_ProjetoFinal.qrConsulta.SQL.Add(self.setScript);
    try
      dm_ProjetoFinal.qrConsulta.Open;
      dm_ProjetoFinal.qrConsulta.First;
      while not dm_ProjetoFinal.qrConsulta.Eof  do
    begin
      //frm_Veiculos.cbVeiculos.Items.Add(dm_ProjetoFinal.qrVeiculonome_marca.Value);
      frm_Pedido.cbCliente.Items.Add(dm_ProjetoFinal.qrConsulta.FieldByName('nome').AsString);
      dm_ProjetoFinal.qrConsulta.Next;
    end;
    finally

    end;
    //frm_Veiculos.lbMarca.Text := frm_Veiculos.cbVeiculos.Text;

end;

function TControle_Pedido.setScript: string;
begin
    result := 'SELECT c.idcliente as "N� Registro",  p.nome FROM cliente c, pessoa p where c.pessoa_idPessoa = p.idpessoa;';
end;

function TControle_Pedido.verifyStatus: string;
begin
  if frm_Pedido.CheckBox1.Checked then
    result := 'EM AN�LISE'
    else
      result:= 'APROVADO'
end;

end.
