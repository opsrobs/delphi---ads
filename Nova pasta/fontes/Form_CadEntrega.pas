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
    Panel3: TPanel;
    listDados: TListView;
    cbMotoristaEntrega: TComboBox;
    cbVeiculoEntrega: TComboBox;
    nmConsultar: TSpeedButton;
    edPeso: TLabeledEdit;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure listDadosClick(Sender: TObject);
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
  frm_carga: Tfrm_carga;

implementation

{$R *.dfm}

uses Unit_ControlePedido, unit_ProjetoFinal, Unit_ControleVeiculo;



{ Tfrm_carga }


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

function Tfrm_carga.validarValores: boolean;
begin

end;

end.
