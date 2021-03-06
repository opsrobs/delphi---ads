unit Unit_ControleVeiculo;

interface

uses
  System.SysUtils, Winapi.Messages, Vcl.Controls, Vcl.Dialogs, Vcl.Mask,
  Objeto_CadVeiculo, Objeto_CadMarcaVeiculo, Datasnap.DBClient,
  Data.DB, System.Generics.Collections;

type
  TControle_Veiculo = class
  private
    procedure cadastroMarca;
    procedure cadastroVeiculo(id: integer);
    procedure updateMarca;
    procedure updateVeiculo;
    function setScript: string;
    function setScriptCbVeiculo: string;
    function setSpace(text: string): string;


  public
    procedure populaCombo;
    procedure getCadVeiculo;
    procedure populaComboCbVeiculo;
    function getIdMotorista(index: integer): integer;
    procedure cleanArrayMemory;

  end;

var
  VCadVeiculo: CadVeiculo;
  VCadMarca: CadMarcaVeiculo;
  arrayVeicuos: array of integer;

implementation

uses
  Form_CadVeiculos, Unit_Dados, Objeto_CadPessoa, Form_CadEntrega,
  Form_Consulta;

{ TControle_Veiculo }

procedure TControle_Veiculo.cadastroMarca;
begin
  VCadMarca := CadMarcaVeiculo.Create;
  VCadMarca.setNome_marca(frm_Veiculos.lbMarca.Text);

  VCadMarca.insertDados;
end;

procedure TControle_Veiculo.cadastroVeiculo(id: integer);
begin
  VCadVeiculo := CadVeiculo.Create;
  VCadVeiculo.setModelo(frm_Veiculos.lbModelo.Text);
  VCadVeiculo.setPlaca(AnsiUpperCase(frm_Veiculos.lbPlaca.Text));
  VCadVeiculo.setMarca_Veiculo_idMarca(id);

  VCadVeiculo.insertDados;
end;

procedure TControle_Veiculo.cleanArrayMemory;
begin
  SetLength(arrayVeicuos, 0);
end;

procedure TControle_Veiculo.getCadVeiculo;
var
  id: integer;
begin
  if (frm_Veiculos = nil) then
  begin
    frm_Veiculos := Tfrm_Veiculos.Create(nil);

    if (frm_Veiculos.ShowModal = mrok) then
      VCadVeiculo := CadVeiculo.Create;
    case (frm_Veiculos.getFuncao) of
      1:
        begin
          Self.updateMarca;
          Self.cadastroVeiculo
            (VCadMarca.IdentificadorMarca(frm_Veiculos.lbMarca.Text));
        end;
      2:
        begin

        end;
    end;
    VCadVeiculo.Free;
    VCadMarca.Free;
  end;
  FreeAndNil(frm_Veiculos)

end;

function TControle_Veiculo.setScript: string;
begin
  result := 'SELECT * FROM logistica_ads.marca_veiculo order by nome_marca asc';
end;

function TControle_Veiculo.setScriptCbVeiculo: string;
begin
  result := 'SELECT * FROM logistica_ads.veiculo order by modelo asc;';
end;

function TControle_Veiculo.getIdMotorista(index: integer): integer;
begin
  result := arrayVeicuos[index]
end;

procedure TControle_Veiculo.populaCombo;
begin
  dm_ProjetoFinal.qrVeiculo.Close;
  dm_ProjetoFinal.qrVeiculo.SQL.Clear;
  dm_ProjetoFinal.qrVeiculo.SQL.Add(Self.setScript);
  try
    dm_ProjetoFinal.qrVeiculo.Open;
    dm_ProjetoFinal.qrVeiculo.First;
    while not dm_ProjetoFinal.qrVeiculo.Eof do
    begin
      frm_Veiculos.cbVeiculos.Items.Add
        (dm_ProjetoFinal.qrVeiculo.FieldByName('nome_marca').AsString);
      dm_ProjetoFinal.qrVeiculo.Next;
    end;
  finally

  end;
  dm_ProjetoFinal.qrVeiculo.Close;

end;

function TControle_Veiculo.setSpace(text: string): string;
var
  aux: string;
  lenght, i: integer;
begin
  lenght := text.Length;
  aux := '';
  for i := text.Length to 20 do
  begin
    if i > lenght then
      aux := aux + ' ';
  end;
  text := text + aux;
  ShowMessage(IntToStr(text.Length));
  result := text;

end;

procedure TControle_Veiculo.populaComboCbVeiculo;
var
  i: integer;
begin
  i := 1;
  dm_ProjetoFinal.qrVeiculo.Close;
  dm_ProjetoFinal.qrVeiculo.SQL.Clear;
  dm_ProjetoFinal.qrVeiculo.SQL.Add(Self.setScriptCbVeiculo);
  try
    dm_ProjetoFinal.qrVeiculo.Open;
    dm_ProjetoFinal.qrVeiculo.First;

    while not dm_ProjetoFinal.qrVeiculo.Eof do
    begin
      frm_carga.cbVeiculoEntrega.Items.Add
      (self.setSpace(dm_ProjetoFinal.qrVeiculo.FieldByName('modelo').AsString).ToUpper +' | ' + dm_ProjetoFinal.qrVeiculo.FieldByName
      ('placa').AsString);
    inc(i);
    dm_ProjetoFinal.qrVeiculo.Next;
    end;
  finally


  end;

end;

procedure TControle_Veiculo.updateMarca;
var
  marca: string;
  id: integer;
begin
  VCadMarca := CadMarcaVeiculo.Create;
  marca := frm_Veiculos.lbMarca.Text;
  id := VCadMarca.IdentificadorMarca(marca);
  if (id <= 0) then
  begin
    Self.cadastroMarca;
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
  id, id_marca: integer;
  veiculo: string;
begin
  VCadVeiculo := CadVeiculo.Create;
  veiculo := frm_Veiculos.lbModelo.Text;
  id := VCadVeiculo.IdentificadorVeiculo(veiculo);
  id_marca := VCadMarca.IdentificadorMarca(frm_Veiculos.lbMarca.Text);
  if id <= 0 then
  begin
    id_marca := VCadMarca.IdentificadorMarca(frm_Veiculos.lbMarca.Text);
    Self.cadastroVeiculo(id);
  end
  else
  begin
    VCadVeiculo.setModelo(frm_Veiculos.lbModelo.Text);
    VCadVeiculo.setPlaca(frm_Veiculos.lbPlaca.Text);
    id_marca := VCadMarca.IdentificadorMarca(frm_Veiculos.lbMarca.Text);
    VCadVeiculo.setMarca_Veiculo_idMarca(id);
    // VCadVeiculo.updadteDados;
  end;
end;

end.
