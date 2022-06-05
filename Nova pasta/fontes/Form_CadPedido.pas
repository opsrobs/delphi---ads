unit Form_CadPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Unit_Dados,Unit_Controle,Unit_ControlePedido;

type
  Tfrm_Pedido = class(TForm)
    Panel2: TPanel;
    spButtonReturn: TSpeedButton;
    spSalvar: TSpeedButton;
    spDelete: TSpeedButton;
    edQuantidade: TPanel;
    dtDataPedido: TDateTimePicker;
    Label2: TLabel;
    edValorPedido: TLabeledEdit;
    edValorFrete: TLabeledEdit;
    edValorTotal: TLabeledEdit;
    CheckBox1: TCheckBox;
    edPeso: TLabeledEdit;
    cbCliente: TComboBox;
    Button1: TButton;
    spDestinatario: TSpeedButton;
    edDestinatario: TLabeledEdit;
    nmConsultar: TSpeedButton;
    procedure spSalvarClick(Sender: TObject);
    procedure spButtonReturnClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
    procedure cbTipoPedidoClick(Sender: TObject);
    procedure cbClienteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure spConsultaCepClick(Sender: TObject);
    procedure nmConsultarClick(Sender: TObject);
    procedure edValorTotalChange(Sender: TObject);
    procedure edValorFreteExit(Sender: TObject);
  private
    funcao:byte; //1--salvar || 2 --Excluir
    function validarValores:boolean;
    procedure limpartela;

  public
    procedure setFuncao(funcao:byte);
    function getFuncao:byte;
    { Public declarations }
  end;

var
  frm_Pedido: Tfrm_Pedido;
  Controle:TControle;
  ControlePedido:TControle_Pedido;
implementation

{$R *.dfm}

uses Objeto_CadCliente, Unit_Utils, Form_CadPessoa,unit_ProjetoFinal,
  Form_Consulta;

{ Tfrm_Pedido }

procedure Tfrm_Pedido.cbClienteClick(Sender: TObject);
var
VCadCliente:CadCliente;
begin
VCadCliente := CadCliente.Create;

end;

procedure Tfrm_Pedido.cbTipoPedidoClick(Sender: TObject);
begin
    ControlePedido := TControle_Pedido.Create;
    ControlePedido.gerarPeso;
end;

procedure Tfrm_Pedido.edValorFreteExit(Sender: TObject);
var
  totalPedio:Float64;
begin
    totalPedio := StrToFloat(edValorPedido.Text) + StrToFloat(edValorFrete.Text);
    edValorTotal.Text := FloatToStr(totalPedio);
end;

procedure Tfrm_Pedido.edValorTotalChange(Sender: TObject);
var
  totalPedio:Float64;
begin
    totalPedio := StrToFloat(edValorPedido.Text) + StrToFloat(edValorFrete.Text);
    edValorTotal.Text := FloatToStr(totalPedio);
end;

procedure Tfrm_Pedido.FormActivate(Sender: TObject);
begin
    ControlePedido.populaCombo;
end;

function Tfrm_Pedido.getFuncao: byte;
begin
    result := self.funcao;
end;

procedure Tfrm_Pedido.limpartela;
begin
    ShowMessage(' <<  >> ');
end;

procedure Tfrm_Pedido.nmConsultarClick(Sender: TObject);
begin
self.nmConsultar.Tag := 1;
    Frm_Principal.ControleFuncionario.getConsultaPessoas;
end;

procedure Tfrm_Pedido.setFuncao(funcao: byte);
begin
    self.funcao	 := funcao;
end;

procedure Tfrm_Pedido.spButtonReturnClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure Tfrm_Pedido.spConsultaCepClick(Sender: TObject);
var
  utilitaria:Utils;
begin
utilitaria := Utils.Create;
utilitaria.loadingApiCep;
end;

procedure Tfrm_Pedido.spDeleteClick(Sender: TObject);
begin
    self.limpartela;
end;

procedure Tfrm_Pedido.spSalvarClick(Sender: TObject);
begin
        if (not self.validarValores) then
          exit;

        self.setFuncao(1);
        ModalResult := mrOk;
end;

function Tfrm_Pedido.validarValores: boolean;
begin

end;

end.