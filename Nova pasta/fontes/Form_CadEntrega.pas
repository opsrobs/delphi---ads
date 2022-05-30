unit Form_CadEntrega;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons;

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
    procedure FormActivate(Sender: TObject);
    procedure listDadosSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);

  private
    { Private declarations }
    funcao:byte;

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

uses Unit_ControlePedido;



{ Tfrm_carga }


procedure Tfrm_carga.FormActivate(Sender: TObject);
var
  ControlePedido:TControle_Pedido;
begin
    ControlePedido.buscarPedidos;
end;

function Tfrm_carga.getFuncao: byte;
begin
    result := self.funcao;
end;

procedure Tfrm_carga.listDadosSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
    //ShowMessage(listDados.Selected.Caption);
end;

procedure Tfrm_carga.setFuncao(funcao: byte);
begin
    self.funcao	 := funcao;
end;

end.
