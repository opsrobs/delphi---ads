unit Unit_ControlePedido;

interface
    uses System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs,Vcl.Mask, REST.Types, Objeto_CadPedido,Objeto_CadEstado,
     StrUtils,Objeto_CadCidade, Objeto_CadBairro, Objeto_CadEndereco;

type
 TControle_Pedido = class
   private
    procedure cadastroPedido;
    function verifyStatus:string;
    function setScript:string;
    procedure CadastroEstado;
    procedure CadastroCidade;
    procedure cadastroBairro;
    procedure cadastroEndereco;
    function validateValue(numero: string): integer;


   public
   procedure getCadPedido;
   procedure gerarPeso;
   procedure populaCombo;

 end;
 var
  pesor:single;
  VCadPedido:CadPedido;
  VCadEstado:CadEstado;
  VCadCidade:CadCidade;
  VCadBairro:CadBairro;
  VCadEndereco:CadEndereco;

implementation

{ TControle_Pedido }

uses Form_CadPedido, Unit_Dados, Objeto_CadCliente, Unit_Utils;

procedure TControle_Pedido.cadastroBairro;
var
  idCidade:integer;
begin
    idCidade:=VCadCidade.getIdentificadrocidade(frm_Pedido.lbCidade.Text);
    VCadBairro := CadBairro.Create;
    VCadBairro.setNome_Bairro(frm_Pedido.lbBairro.Text);
    VCadBairro.setCidade_idCidade(idCidade);
   if (VCadBairro.getIdentificadorBairro(frm_Pedido.lbBairro.Text) <= 0) then
    begin
        VCadBairro.insertDados
    end
    else
        VCadBairro.updateDados;
end;

procedure TControle_Pedido.CadastroCidade;
var
  idestado:integer;
begin
   idestado:= VCadEstado.getIdEstade(frm_Pedido.lbEstado.Text);
   VCadCidade:=CadCidade.Create;
   VCadCidade.setNome_cidade(frm_Pedido.lbCidade.Text);
   VCadCidade.setEstado_idEstado(idEstado);
   if (VCadCidade.getIdentificadrocidade(frm_Pedido.lbCidade.Text) <= 0) then
    begin
        VCadCidade.insertDados
    end
    else
        VCadCidade.updateDados;
end;

procedure TControle_Pedido.cadastroEndereco;
var
  utilitaria:Utils;
  idpessoa:integer;
  idBairro:integer;
begin
    utilitaria := Utils.Create;
    idpessoa:= utilitaria.idPessoaCliente(frm_Pedido.cbCliente.Text);
    idBairro := VCadBairro.getIdentificadorBairro(frm_Pedido.lbBairro.Text);
    VCadEndereco := CadEndereco.Create;
    VCadEndereco.setCep(frm_Pedido.MaskCep.Text);
    VCadEndereco.setRua(frm_Pedido.lbRua.Text);
    VCadEndereco.setComplemto(frm_Pedido.lbComplemento.Text);
    VCadEndereco.setnumero(self.validateValue(frm_Pedido.lbNumero.Text));
    VCadEndereco.setPessoa_idPessoa(idpessoa);
    VCadEndereco.setBairro_idBairro(idbairro);

    VCadEndereco.insertDados;
end;

function TControle_Pedido.validateValue(numero:string): integer;
begin
    if frm_Pedido.lbNumero.Text = '' then
      result :=0
      else
      StrToInt(frm_Pedido.lbNumero.Text)
end;

procedure TControle_Pedido.CadastroEstado;
begin
  VCadEstado:=CadEstado.Create;

  VCadEstado.setNome_estado(frm_Pedido.lbEstado.Text);
  VCadEstado.setuf(frm_Pedido.lbUnidadeFederativa.Text);
  if (VCadEstado.getIdEstade(frm_Pedido.lbEstado.Text) <= 0) then
    begin
    VCadEstado.insertDados
    end
    else
    VCadEstado.updateDados;
end;

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
  id:integer;
begin
    if (frm_Pedido = nil) then
      frm_Pedido := Tfrm_Pedido.Create(nil);

    if (frm_Pedido.ShowModal = mrOk) then
      begin

         case(frm_Pedido.getFuncao) of
            1: begin
               self.CadastroEstado;
               self.CadastroCidade();

               self.cadastroBairro;
               self.cadastroEndereco();
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
