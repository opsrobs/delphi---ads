unit Unit_ControlePedido;

interface
    uses System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs,Vcl.Mask, REST.Types, Objeto_CadPedido,Objeto_CadEstado,
     StrUtils,Objeto_CadCidade, Objeto_CadBairro,Unit_Utils, Objeto_CadCliente, Objeto_CadEndereco,Form_CadEntrega,Vcl.StdCtrls,
  Vcl.ComCtrls,CommCtrl, Winapi.Windows,Unit_ControleVeiculo,Objeto_CadCarga;

type
 TControle_Pedido = class
   private
    procedure cadastroPedido;
    procedure cadastroMotoristaVeiculo;
    function verifyStatus:string;
    function setScript:string;
    function returnIdDestinatario:integer;
    procedure cadastroEntrega;

     public
     procedure getCadPedido;
     procedure gerarPeso;
     procedure populaCombo;
     procedure getCadEntrega;
     procedure buscarPedidos;
     procedure setPesoEntrega;
     function verifyValue:integer;


 end;
 var
  pesor:single;
  VCadPedido:CadPedido;
  VCadCliente:CadCliente;
  utilitaria:Utils;
  VCadEndereco:CadEndereco;
  VCadCarga:CadCarga;
  ControleVeiculo:TControle_Veiculo;


implementation

{ TControle_Pedido }

uses Form_CadPedido, Unit_Dados, Objeto_CadRecebedor,
  Objeto_Funcionario_has_Veiculos, Form_CadFuncionario, Form_CadPessoa,
  unit_ProjetoFinal, Form_CadVeiculos;

procedure TControle_Pedido.buscarPedidos;
var
  dados:TListItem;
begin
  dm_ProjetoFinal.qrConsulta.Close;
  dm_ProjetoFinal.qrConsulta.SQL.Clear;
  dm_ProjetoFinal.qrConsulta.SQL.Add(self.setScript);

  dm_ProjetoFinal.qrConsulta.Open;
  dm_ProjetoFinal.qrConsulta.First;
  while not dm_ProjetoFinal.qrConsulta.Eof do
  begin
    dados := frm_carga.listDados.Items.Add;

    dados.Caption := dm_ProjetoFinal.qrConsulta.FieldByName('numero_pedido').AsString;
    dados.SubItems.Add(dm_ProjetoFinal.qrConsulta.FieldByName('nome').AsString);
    dados.SubItems.Add(dm_ProjetoFinal.qrConsulta.FieldByName('data_pedido').AsString);
    dados.SubItems.Add(dm_ProjetoFinal.qrConsulta.FieldByName('status').AsString);
    dados.SubItems.Add(dm_ProjetoFinal.qrConsulta.FieldByName('nome recebedor').AsString);
    dados.SubItems.Add(dm_ProjetoFinal.qrConsulta.FieldByName('valor_total').AsString);
    dados.SubItems.Add(dm_ProjetoFinal.qrConsulta.FieldByName('peso_pedido').AsString);

    dm_ProjetoFinal.qrConsulta.Next;
  end;
end;

procedure TControle_Pedido.cadastroEntrega;
begin
   VCadCarga := CadCarga.Create;
   VCadCarga.setQuantidade(verifyValue);
   VCadCarga.setPeso(StrToInt(frm_carga.edPeso.Text));
   ShowMessage(IntToStr(utilitaria.getLastId));
   VCadCarga.setIdFuncionarioVeiculo(utilitaria.getLastId);

   VCadCarga.insertDados;
end;

procedure TControle_Pedido.cadastroMotoristaVeiculo;
var
VFunc_VVeic:Funcionario_has_Veiculos;
idFuncionario, idVeiculo:integer;
begin
idFuncionario:= Frm_Principal.ControleFuncionario.getIdFuncionario(frm_carga.cbMotoristaEntrega.ItemIndex +1);
idVeiculo := Frm_Principal.ControleVeiculo.getIdMotorista(frm_carga.cbVeiculoEntrega.ItemIndex +1);
  VFunc_VVeic := Funcionario_has_Veiculos.Create;
  VFunc_VVeic.setVeiculos_idVeiculos(idVeiculo);
  VFunc_VVeic.setFuncionario_idFuncionario(idFuncionario);

  VFunc_VVeic.insertDados;

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
              self.cadastroMotoristaVeiculo;
              self.cadastroEntrega;

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
                self.cadastroEntrega;
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



procedure TControle_Pedido.setPesoEntrega;
var
  dados :TListItem;
begin
  if frm_carga.listDados.ColumnClick then
  begin
      frm_carga.edPeso.Text := dm_ProjetoFinal.qrConsulta.Fields[2].AsString;
    frm_carga.listDados.ColumnClick := false;
    ShowMessage('x')
  end;

end;


function TControle_Pedido.setScript: string;
begin
    if frm_carga <> nil then
    begin
      result := 'SELECT * FROM logistica_ads.dados_pedido_corrigido;'
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



function TControle_Pedido.verifyValue:integer;
var
i:integer;
value:Float64;
qtd:integer;
begin
qtd:=0;
i :=0;
value:=0;


    for I := 0 to frm_carga.listDados.Items.Count -1 do
    begin
      if frm_carga.listDados.Items.Item[i].Checked then
      begin
        inc(qtd);
        value := value + StrToFloat(frm_carga.listDados.Items.Item[i].SubItems[5]);
        frm_carga.edPeso.Text := FormatFloat('0.###',value);
      end
      else
      begin
        frm_carga.edPeso.Text := '';
        frm_carga.edPeso.Text := FormatFloat('0.##',value);
      end;
    end;
    result := qtd;

end;

end.