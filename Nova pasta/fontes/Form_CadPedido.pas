unit Form_CadPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Unit_ControlePedido;

type
  Tfrm_Pedido = class(TForm)
    Panel2: TPanel;
    spButtonReturn: TSpeedButton;
    spSalvar: TSpeedButton;
    spDelete: TSpeedButton;
    edQuantidade: TPanel;
    spConsultaCep: TSpeedButton;
    Label1: TLabel;
    MaskCep: TMaskEdit;
    lbRua: TLabeledEdit;
    lbNumero: TLabeledEdit;
    lbCidade: TLabeledEdit;
    lbEstado: TLabeledEdit;
    lbUnidadeFederativa: TLabeledEdit;
    lbBairro: TLabeledEdit;
    lbComplemento: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    LabeledEdit1: TLabeledEdit;
    edValorFrete: TLabeledEdit;
    edValorTotal: TLabeledEdit;
    cbTipoPedido: TComboBox;
    Label3: TLabel;
    edTipoPedido: TEdit;
    CheckBox1: TCheckBox;
    edPeso: TLabeledEdit;
    procedure spSalvarClick(Sender: TObject);
    procedure spButtonReturnClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
    procedure cbTipoPedidoClick(Sender: TObject);
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
  ControlePedido:TControle_Pedido;
implementation

{$R *.dfm}

{ Tfrm_Pedido }

procedure Tfrm_Pedido.cbTipoPedidoClick(Sender: TObject);
begin
    ControlePedido := TControle_Pedido.Create;
    edTipoPedido.text:= cbTipoPedido.Text;
    ControlePedido.gerarPeso;
end;

function Tfrm_Pedido.getFuncao: byte;
begin
    result := self.funcao;
end;

procedure Tfrm_Pedido.limpartela;
begin
    ShowMessage(' << GIULIA >> ');
end;

procedure Tfrm_Pedido.setFuncao(funcao: byte);
begin
    self.funcao	 := funcao;
end;

procedure Tfrm_Pedido.spButtonReturnClick(Sender: TObject);
begin
    ModalResult := mrCancel;
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
