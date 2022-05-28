unit Unit_ControlePedido;

interface
    uses System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs,Vcl.Mask, REST.Types, Objeto_CadPedido, StrUtils;

type
 TControle_Pedido = class
   private
    procedure cadastroPedido;


   public
   procedure getCadPedido;
   procedure gerarPeso;

 end;
 var
  pesor:single;
  VCadPedido:CadPedido;

implementation

{ TControle_Pedido }

uses Form_CadPedido;

procedure TControle_Pedido.cadastroPedido;
begin
  VCadPedido := CadPedido.Create;

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

            end;
            2: begin

               end;
         end;

      end;

      FreeAndNil(frm_Pedido);
end;

end.
