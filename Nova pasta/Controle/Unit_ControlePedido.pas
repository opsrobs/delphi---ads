unit Unit_ControlePedido;

interface
    uses System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs,Vcl.Mask, REST.Types,StrUtils;

type
 TControle_Pedido = class
   private

   public
   procedure getCadPedido;
 end;

implementation

{ TControle_Pedido }

uses Form_CadPedido;

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
