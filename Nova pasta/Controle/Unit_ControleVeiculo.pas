unit Unit_ControleVeiculo;

interface
uses
  System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs,Vcl.Mask,Objeto_CadVeiculo,Objeto_CadMarcaVeiculo;

type
TControle_Veiculo = class
  private
    procedure cadastroMarca;
    procedure cadastroVeiculo(id:integer);
    procedure getConsultaVeiculo;

  public

  procedure getCadVeiculo;
  procedure getList;

end;
var
  VCadVeiculo:CadVeiculo;
  VCadMarca:CadMarcaVeiculo;

implementation

uses
Form_CadVeiculos;

{ TControle_Veiculo }

procedure TControle_Veiculo.cadastroMarca;
begin
    VCadMarca:= CadMarcaVeiculo.Create;
    VCadMarca.setNome_marca(frm_Veiculos.lbMarca.Text);

    VCadMarca.insertDados;
end;

procedure TControle_Veiculo.cadastroVeiculo(id:integer);
begin
    VCadVeiculo := CadVeiculo.Create;
    VCadVeiculo.setModelo(frm_Veiculos.lbModelo.Text);
    VCadVeiculo.setPlaca(frm_Veiculos.lbPlaca.Text);
    VCadVeiculo.setMarca_Veiculo_idMarca(id);

    VCadVeiculo.insertDados;
end;

procedure TControle_Veiculo.getCadVeiculo;
var
  id:integer;
begin
    if (frm_Veiculos = nil) then
      frm_Veiculos := Tfrm_Veiculos.Create(nil);

      if (frm_Veiculos.ShowModal = mrok) then
      VCadVeiculo :=CadVeiculo.Create;
      case (frm_Veiculos.getFuncao) of
      1:begin
      self.cadastroMarca;
      id := VCadVeiculo.getLastid;

      self.cadastroVeiculo(id);
      
      end;
      2:begin
      
      end;
      end;


end;

procedure TControle_Veiculo.getConsultaVeiculo;
begin

end;

procedure TControle_Veiculo.getList;
begin
    frm_Veiculos.setSelectSQL('SELECT nome_marca as "Marca" FROM logistica_ads.marca_veiculo');
end;

end.
