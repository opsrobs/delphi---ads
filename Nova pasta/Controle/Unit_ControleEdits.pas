unit Unit_ControleEdits;

interface

uses Form_Edits,Vcl.Controls;
type TControleEdit = class
  public
  procedure getEdits;

  private
end;

implementation



{ TControleEdit }

procedure TControleEdit.getEdits;
begin
    if frm_edits = nil then
    frm_edits:= Tfrm_edits.Create(nil);

    if (frm_edits.ShowModal = mrOk) then
      begin

         case(frm_edits.getFuncao) of
            1: begin
                //self.cadastroEntrega;
            end;
            2: begin

               end;
         end;


      end;

end;

end.
