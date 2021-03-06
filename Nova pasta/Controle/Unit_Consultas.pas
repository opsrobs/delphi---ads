unit Unit_Consultas;

interface

uses
  System.SysUtils, Winapi.Messages, Vcl.Controls, Vcl.Dialogs, Vcl.Mask,
  Objeto_CadVeiculo, Objeto_CadMarcaVeiculo, Datasnap.DBClient,
  Data.DB, System.Generics.Collections, System.Classes, Vcl.ComCtrls;

type
  TConsulta = class
  public
  scritp:string;
    procedure getConsulta;
    procedure getConsultaPedido;
    procedure resetScreen;
    procedure screenConsulta(entrega:integer);
    function show:integer;


  private

    function getScript:string;
    procedure setScript(script:string);


  end;

implementation

uses Form_Edits, Unit_Dados, Objeto_Utilitario;

procedure TConsulta.getConsultaPedido;
var
  id: integer;
begin
  if (frm_edits = nil) then
    frm_edits := frm_edits.Create(nil);

  if (frm_edits.ShowModal = mrok) then
  begin

    { VCadVeiculo := CadVeiculo.Create;
      case (frm_Veiculos.getFuncao) of
      1:
      begin
      Self.updateMarca;
      Self.cadastroVeiculo
      (VCadMarca.IdentificadorMarca(frm_Veiculos.lbMarca.Text));
      end;
      2:
      begin

      end; }
  end;
end;

function TConsulta.getScript: string;
begin
result := self.scritp;
end;

procedure TConsulta.resetScreen;
begin
  dm_ProjetoFinal.qrConsulta.Close;
  dm_ProjetoFinal.qrConsulta.SQL.Clear;
  dm_ProjetoFinal.qrConsulta.SQL.Add('SELECT * FROM logistica_ads.coonsulta_entrega order by idCarga;');

  Try
    dm_ProjetoFinal.qrConsulta.Open;
    Tutilitario.ajustaTamnhoDbg(frm_edits.dbConsulta);
  except
    on e: exception do
      ShowMessage('N?o foi possivel consultar os dados: ' + e.ToString);

  End;

end;




procedure TConsulta.screenConsulta(entrega:integer);
var
script : string;
begin
script:= 'SELECT dp.numero_pedido,dp.nome, dp.data_pedido, pe.nome, dp.cep, dp.rua, dp.complemento, dp.peso_pedido, dp.valor_total, dp.Status_Endereco, dp.endereco_pedido '+'FROM logistica_ads.carga_pedido cp, logistica_ads.getdadospedido_end dp, logistica_ads.recebedor re, logistica_ads.pessoa pe, logistica_ads.endereco en '+'where dp.idrecebedor = re.idrecebedor and re.pessoa_idPessoa = pe.idPessoa and  cp.pedido_numero_pedido = dp.numero_pedido and dp.endereco_pedido = en.idEndereco and cp.carga_IdCarga = "'+IntToStr(entrega)+'" group by dp.numero_pedido';

     dm_ProjetoFinal.qrConsulta.Close;
  dm_ProjetoFinal.qrConsulta.SQL.Clear;
  dm_ProjetoFinal.qrConsulta.SQL.Add(script);

  Try
    dm_ProjetoFinal.qrConsulta.Open;
    Tutilitario.ajustaTamnhoDbg(frm_edits.dbConsulta);
  except
    on e: exception do
      ShowMessage('N?o foi possivel consultar os dados: ' + e.ToString);

  End;
end;

procedure TConsulta.setScript(script: string);
begin
  scritp := self.scritp;
end;

function TConsulta.show:integer;
begin
result := StrToInt(frm_edits.dbConsulta.SelectedField.Text);
end;

procedure TConsulta.getConsulta;
var
  id: integer;
begin
  if (frm_edits = nil) then
    frm_edits := frm_edits.Create(nil);

  if (frm_edits.ShowModal = mrok) then
  begin
    { VCadVeiculo := CadVeiculo.Create;
      case (frm_Veiculos.getFuncao) of
      1:
      begin
      Self.updateMarca;
      Self.cadastroVeiculo
      (VCadMarca.IdentificadorMarca(frm_Veiculos.lbMarca.Text));
      end;
      2:
      begin

      end; }
  end;

end;


end.
