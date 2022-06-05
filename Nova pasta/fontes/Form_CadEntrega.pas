unit Form_CadEntrega;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons,CommCtrl, Vcl.CheckLst;

type
  Tfrm_carga = class(TForm)
    Panel2: TPanel;
    spButtonReturn: TSpeedButton;
    spSalvar: TSpeedButton;
    spDelete: TSpeedButton;
    Panel1: TPanel;
    nmConsultar: TSpeedButton;
    cbCliente: TComboBox;
    edPeso: TLabeledEdit;
    Panel3: TPanel;
    listDados: TListView;
    SpeedButton1: TSpeedButton;
    cbMotoristaEntrega: TComboBox;
    cbVeiculoEntrega: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure listDadosClick(Sender: TObject);
    procedure cbVeiculoEntregaChange(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);

  private
    funcao:byte;
    function validarValores:boolean;

  public

    procedure setFuncao(funcao:byte);
    function getFuncao:byte;
    { Public declarations }
  end;

var
  B: TButton;
  frm_carga: Tfrm_carga;

implementation

{$R *.dfm}

uses Unit_ControlePedido, unit_ProjetoFinal, Unit_ControleVeiculo;



{ Tfrm_carga }


procedure Tfrm_carga.cbVeiculoEntregaChange(Sender: TObject);
begin
    ShowMessage(self.cbVeiculoEntrega.ItemIndex.ToString + '   '
     + Frm_Principal.ControleVeiculo.getIdMotorista(self.cbVeiculoEntrega.ItemIndex +1).ToString);
end;

procedure Tfrm_carga.FormActivate(Sender: TObject);
var
  ControlePedido:TControle_Pedido;
begin
    ControlePedido.buscarPedidos;
    Frm_Principal.ControleVeiculo.populaComboCbVeiculo;
    Frm_Principal.ControleFuncionario.populaComboCbPessoa;
end;



function Tfrm_carga.getFuncao: byte;
begin
    result := self.funcao;
end;


procedure Tfrm_carga.listDadosClick(Sender: TObject);
begin
    Frm_Principal.ControlePedido.verifyValue;
end;

procedure Tfrm_carga.setFuncao(funcao: byte);
begin
    self.funcao	 := funcao;
end;



procedure Tfrm_carga.SpeedButton1Click(Sender: TObject);
begin
  Frm_Principal.ControlePedido.verifyValue;
end;

procedure Tfrm_carga.spSalvarClick(Sender: TObject);
begin
if (not self.validarValores) then
          exit;

        self.setFuncao(1);
        ModalResult := mrOk;
end;

end.
