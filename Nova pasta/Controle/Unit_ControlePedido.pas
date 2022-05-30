unit Unit_ControlePedido;

interface
    uses System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs,Vcl.Mask, REST.Types, Objeto_CadPedido,Objeto_CadEstado,
     StrUtils,Objeto_CadCidade, Objeto_CadBairro,Unit_Utils, Objeto_CadCliente, Objeto_CadEndereco,Form_CadEntrega,Vcl.StdCtrls,
  Vcl.ComCtrls;

type
 TControle_Pedido = class
   private
    procedure cadastroPedido;
    function verifyStatus:string;
    function setScript:string;
    function returnIdDestinatario:integer;
    function scriptRecebedor:string;

     public
     procedure getCadPedido;
     procedure gerarPeso;
     procedure populaCombo;
     procedure getCadEntrega;
     procedure buscarPedidos;


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

procedure TControle_Pedido.buscarPedidos;
var
  dados:TListItem;
begin
  dm_ProjetoFinal.qrConsulta.Close;
  dm_ProjetoFinal.qrRecebedor.Close;
  dm_ProjetoFinal.qrConsulta.SQL.Clear;
  dm_ProjetoFinal.qrRecebedor.SQL.Clear;
  dm_ProjetoFinal.qrConsulta.SQL.Add(self.setScript);
  dm_ProjetoFinal.qrRecebedor.SQL.Add(self.scriptRecebedor);

  dm_ProjetoFinal.qrConsulta.Open;
  dm_ProjetoFinal.qrConsulta.First;

  dm_ProjetoFinal.qrRecebedor.Open;
  dm_ProjetoFinal.qrRecebedor.First;

  while not dm_ProjetoFinal.qrConsulta.Eof do
  begin
    dados := frm_carga.listDados.Items.Add;

    dados.Caption := dm_ProjetoFinal.qrConsulta.FieldByName('numero_pedido').AsString;
    dados.SubItems.Add(dm_ProjetoFinal.qrConsulta.FieldByName('nome').AsString);
    dados.SubItems.Add(dm_ProjetoFinal.qrConsulta.FieldByName('data_pedido').AsString);
    dados.SubItems.Add(dm_ProjetoFinal.qrConsulta.FieldByName('status').AsString);
    dados.SubItems.Add(dm_ProjetoFinal.qrRecebedor.FieldByName('Nome').AsString);
   // ShowMessage(dm_ProjetoFinal.qrConsulta.FieldByName('data_pedido').AsString) ;

    dm_ProjetoFinal.qrConsulta.Next;
    dm_ProjetoFinal.qrRecebedor.Next;
  end;
 // ShowMessage(dados.SubItems.GetText)

end;

procedure TControle_Pedido.cadastroPedido;
var
  idendereco:integer;
  idCliente:integer;
  id:integer;
begin
      idendereco := utilitaria.identificadorEndereco(frm_Pedido.edDestinatario.Text);
      idCliente := VCadCliente.identificadorCliente(frm_Pedido.cbCliente.Text);
      id := self.returnIdDestinatario;

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
      ShowMessage('Pedido realizado com Sucesso!!!');

end;


procedure TControle_Pedido.gerarPeso;
var
value:Float32;
begin
    pesor := Random(100);
    value := pesor * 0.1;
    frm_Pedido.edPeso.Text := pesor.ToString;
end;

procedure TControle_Pedido.getCadEntrega;
var
  idendereco:integer;
  idCliente:integer;
  id:integer;
begin
  VCadPedido :=CadPedido.Create;
    if (frm_carga = nil) then
      frm_carga := Tfrm_carga.Create(nil);

    if (frm_carga.ShowModal = mrOk) then
      begin
         case(frm_carga.getFuncao) of
            1: begin


            end;
            2: begin

               end;
         end;

      end;
      FreeAndNil(frm_carga);
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

                self.cadastroPedido;
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

function TControle_Pedido.scriptRecebedor: string;
begin
    result := 'SELECT pe.nome FROM logistica_ads.pedido pd, logistica_ads.recebedor re, logistica_ads.pessoa pe where pd.recebedor_idrecebedor = re.idrecebedor and re.pessoa_idPessoa = pe.idPessoa and status = "EM AN�LISE" order by idrecebedor asc;';
end;

function TControle_Pedido.setScript: string;
begin
    if frm_carga <> nil then
    begin
      result := 'SELECT pd.numero_pedido, p.nome, pd.data_pedido, pd.status, r.idrecebedor FROM logistica_ads.pessoa p, logistica_ads.cliente c, logistica_ads.recebedor r,'
      +' logistica_ads.pedido pd where pd.cliente_idcliente = c.idcliente and c.pessoa_idPessoa = p.idPessoa and pd.recebedor_idrecebedor = r.idrecebedor and r.pessoa_idPessoa'
    end
    else
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
