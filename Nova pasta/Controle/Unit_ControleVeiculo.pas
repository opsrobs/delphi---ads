unit Unit_ControleVeiculo;

interface
uses
  System.SysUtils,Winapi.Messages,Vcl.Controls,Vcl.Dialogs,Vcl.Mask,Objeto_CadVeiculo,Objeto_CadMarcaVeiculo, Datasnap.DBClient,
  Data.DB;

type
TControle_Veiculo = class
  private
    procedure cadastroMarca;
    procedure cadastroVeiculo(id:integer);         //ctrl + shift + a
    procedure updateMarca;
    procedure updateVeiculo;
    function setScript:string;

    public
    procedure populaCombo;
    procedure getCadVeiculo;

end;
var
  VCadVeiculo:CadVeiculo;
  VCadMarca:CadMarcaVeiculo;

implementation

uses
Form_CadVeiculos, Unit_Dados, Objeto_CadPessoa;

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
    VCadVeiculo.setPlaca(AnsiUpperCase(frm_Veiculos.lbPlaca.Text));
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
          Self.updateMarca;
          self.cadastroVeiculo(VCadMarca.IdentificadorMarca(frm_Veiculos.lbMarca.Text));
        end;
      2:begin

      end;
      end;


end;

function TControle_Veiculo.setScript: string;
begin
    result := 'SELECT * FROM logistica_ads.marca_veiculo order by nome_marca asc';
end;

procedure TControle_Veiculo.populaCombo;
begin
    //frm_Veiculos.cbVeiculos.Style:=
    dm_ProjetoFinal.qrVeiculo.Close;
    dm_ProjetoFinal.qrVeiculo.SQL.Clear;
    dm_ProjetoFinal.qrVeiculo.SQL.Add(self.setScript);
    try
      dm_ProjetoFinal.qrVeiculo.Open;
      dm_ProjetoFinal.qrVeiculo.First;
      while not dm_ProjetoFinal.qrVeiculo.Eof  do
    begin
      //frm_Veiculos.cbVeiculos.Items.Add(dm_ProjetoFinal.qrVeiculonome_marca.Value);
      frm_Veiculos.cbVeiculos.Items.Add(dm_ProjetoFinal.qrVeiculo.FieldByName('nome_marca').AsString);
      dm_ProjetoFinal.qrVeiculo.Next;
    end;
    finally

    end;
    frm_Veiculos.lbMarca.Text := frm_Veiculos.cbVeiculos.Text;

end;

procedure TControle_Veiculo.updateMarca;
var
marca:string;
id:integer;
begin
  VCadMarca := CadMarcaVeiculo.Create;
  marca := frm_Veiculos.lbMarca.Text;
  id :=VCadMarca.IdentificadorMarca(marca);
  if (id <= 0) then
  begin
  ShowMessage('x');
    self.cadastroMarca;
  end
    else
    begin
      VCadMarca.setNome_marca(marca);
      VCadMarca.setIdMarca_veiculo(id);
      VCadMarca.updadteDados;
    end;


end;

procedure TControle_Veiculo.updateVeiculo;
var
id,id_marca:integer;
veiculo:string;
begin
    VCadVeiculo := CadVeiculo.Create;
    veiculo := frm_Veiculos.lbModelo.Text;
    id := VCadVeiculo.IdentificadorVeiculo(veiculo);
    id_marca := VCadMarca.IdentificadorMarca(frm_Veiculos.lbMarca.Text);
    if id <=0 then
      begin
        id_marca := VCadMarca.IdentificadorMarca(frm_Veiculos.lbMarca.Text);
        ShowMessage('insert');
        self.cadastroVeiculo(id);
      end
        else
        begin
        VCadVeiculo.setModelo(frm_Veiculos.lbModelo.Text);
        VCadVeiculo.setPlaca(frm_Veiculos.lbPlaca.Text);
        id_marca := VCadMarca.IdentificadorMarca(frm_Veiculos.lbMarca.Text);
        VCadVeiculo.setMarca_Veiculo_idMarca(id);
        ShowMessage('update')
        //VCadVeiculo.updadteDados;
        end;
end;

end.
