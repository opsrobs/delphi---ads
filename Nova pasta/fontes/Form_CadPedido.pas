unit Form_CadPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  Tfrm_Pedido = class(TForm)
  private
    funcao:byte; //1--salvar || 2 --Excluir
    { Private declarations }
  public
    procedure setFuncao(funcao:byte);
    function getFuncao:byte;
    { Public declarations }
  end;

var
  frm_Pedido: Tfrm_Pedido;

implementation

{$R *.dfm}

{ Tfrm_Pedido }

function Tfrm_Pedido.getFuncao: byte;
begin
    result := self.funcao;
end;

procedure Tfrm_Pedido.setFuncao(funcao: byte);
begin
    self.funcao	 := funcao;
end;

end.
