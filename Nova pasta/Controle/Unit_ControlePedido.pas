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
    function returnIdDestinatario:integer;

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

uses Form_CadPedido, Unit_Dados, Objeto_CadRecebedor;

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
  VCadPedido :=CadPedido.Create;
    if (frm_Pedido = nil) then
      frm_Pedido := Tfrm_Pedido.Create(nil);

    if (frm_Pedido.ShowModal = mrOk) then
      begin
      idendereco := utilitaria.identificadorEndereco(frm_Pedido.edDestinatario.Text);
      idCliente := VCadCliente.identificadorCliente(frm_Pedido.cbCliente.Text);
      id := self.returnIdDestinatario;
         case(frm_Pedido.getFuncao) of
            1: begin
                VCadPedido.setData_pedido(frm_Pedido.dtDataPedido.Date);
                VCadPedido.setValor(StrToFloat(frm_Pedido.edValorPedido.Text));
                VCadPedido.setStatus(self.verifyStatus);
                VCadPedido.setCliente_idCliente(idCliente);
                VCadPedido.setValor_total(StrToFloat(frm_Pedido.edValorTotal.Text));
                VCadPedido.setValor_frete(StrToFloat(frm_Pedido.edValorFrete.Text));
                ShowMessage(IntToStr(idendereco));
                VCadPedido.setendereco_idEndereco(idendereco);
                VCadPedido.setpeso_pedido(StrToFloat(frm_Pedido.edPeso.Text));
                VCadPedido.setrecebedor_idRecebedor(id);
                VCadPedido.insertDados;
                ShowMessage(IntToStr(id));
            end;
            2: begin

               end;
         end;
         VCadEndereco.Free;
         VCadCliente.Free;

      end;
      FreeAndNil(frm_Pedido);
end;

procedure TControle_Pedido.populaCombo;
begin
    dm_ProjetoFinal.qrConsulta.Close;
    dm_ProjetoFinal.qrConsulta.SQL.Clear;
    dm_ProjetoFinal.qrConsulta.SQL.Add(self.setScript);
    try
      dm_ProjetoFinal.qrConsulta.Open;
      dm_ProjetoFinal.qrConsulta.First;
      while not dm_ProjetoFinal.qrConsulta.Eof  do
    begin
      frm_Pedido.cbCliente.Items.Add(dm_ProjetoFinal.qrConsulta.FieldByName('nome').AsString);
      dm_ProjetoFinal.qrConsulta.Next;
    end;
    finally

    end;

end;

function TControle_Pedido.returnIdDestinatario: integer;
var
VCadRecebedor:CadRecebedor;
id:integer;
begin
utilitaria := Utils.Create;
    VCadRecebedor := CadRecebedor.Create;
    id :=utilitaria.identificadorRecebedor(frm_Pedido.edDestinatario.Text);
    if (utilitaria.identificadorRecebedor(frm_Pedido.edDestinatario.Text) <=0) then
    begin
        VCadRecebedor.setPessoa_idPessoa(utilitaria.identiicadorPessoa(frm_Pedido.edDestinatario.Text));
        VCadRecebedor.insertDados;

      result :=utilitaria.getLastId;
    end
    else
    result :=id;
          VCadRecebedor.Destroy;
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
