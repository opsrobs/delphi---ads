unit Objeto_Utilitario;

interface
uses
    Vcl.DBGrids, System.SysUtils, System.Classes, Vcl.StdCtrls,
    System.Variants, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls;

type
    Tutilitario = class
      public
         class procedure ajustaTamnhoDbg(var Dbg: TDBGrid);
         class procedure LimpaTela(var Form);

    end;

implementation

class procedure TUtilitario.ajustaTamnhoDbg(var Dbg: TDBGrid);
var
   i, tmCol, tamanho: Integer;
   slPercent: TStringList;
   saux: String;

begin
     slPercent := TStringList.Create;
     slPercent.Clear;
     tmCol := 0;
     tamanho := Dbg.Width - 39;

     for i := 0 to Dbg.Columns.Count - 1 do
        if (Dbg.Columns[i].Width > 0) then
          tmCol := tmCol + Dbg.Columns[i].Width;

     for i := 0 to Dbg.Columns.Count - 1 do
       begin
            if (Dbg.Columns[i].Width > 0) then
              slPercent.Add(FloatToStr((Dbg.Columns[i].Width * 100) / tmCol))
            else
                slPercent.Add('0');
       end;

     for i := 0 to slPercent.Count - 1 do
        begin
             try
                if (StrToFloat(slPercent.Strings[i]) > 0) then
                  begin
                       saux := FormatFloat('##0.00',  (StrToFloat(slPercent.Strings[i]) * tamanho) / 100);
                       Dbg.Columns[i].Width := StrToInt(Copy(saux, 1, pos(',', saux) -1));
                  end;
             except
             end;
        end;

     slPercent.Free;
end;

class procedure TUtilitario.LimpaTela(var Form);
var
  Temp:TCustomForm;
  i: longint;
begin
     Temp:=TCustomForm(form);

     for i := 0 to (Temp.ComponentCount - 1) do
         begin
              if (Temp.Components[i] is TEdit) then
                begin
                     TEdit(Temp.Components[i]).Clear;
                end
              else
              if (Temp.Components[i] is TMemo) then
                begin
                     TMemo(Temp.Components[i]).clear;
                end
              else
              if (Temp.Components[i] is TLabeledEdit) then
                begin
                     TLabeledEdit(Temp.Components[i]).clear;
                end
         end;
end;

end.

