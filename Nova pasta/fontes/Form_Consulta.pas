unit Form_Consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Unit_ControleVeiculo, Vcl.CheckLst;

type
  Tfrm_Consulta = class(TForm)
    Panel1: TPanel;
    spSalvar: TSpeedButton;
    Panel3: TPanel;
    dbConsulta: TDBGrid;
    Panel2: TPanel;
    lbResult: TLabel;
    spDestinatario: TSpeedButton;
    edPesquisa: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    chStatus: TCheckBox;
    cbVeiculos: TComboBox;
    spButtonReturn: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure spButtonReturnClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure spDestinatarioClick(Sender: TObject);
    procedure cbVeiculosChange(Sender: TObject);
    procedure dbConsultaCellClick(Column: TColumn);
    procedure chConsultaVeiculosClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    scriptSql: string;
    procedure resetButton;
  public
    procedure setSelectSQL(scriptSql: string);
    function getSelectSql: string;
    procedure resetScreen;
  end;

var
  frm_Consulta: Tfrm_Consulta;
  controleVeiculo: TControle_Veiculo;

implementation

{$R *.dfm}

uses Unit_Dados, Objeto_Utilitario, Form_CadPedido, Form_CadFuncionario,
  Form_CadPessoa, Unit_ControleEdits, Form_CadVeiculos, Objeto_CadVeiculo;

{ Tfrm_Consulta }

procedure Tfrm_Consulta.cbVeiculosChange(Sender: TObject);
var
  edit: TControleEdit;
begin
  self.cbVeiculos.tag := 0;
  self.chStatus.Visible := false;
  //edit.setStatus(self.cbVeiculos.Text);
  ShowMessage(self.cbVeiculos.Text);
  edit.checkRadioStatus;
end;

procedure Tfrm_Consulta.chConsultaVeiculosClick(Sender: TObject);
begin
  // frm_Consulta.spSalvar.Enabled := false;
end;

procedure Tfrm_Consulta.dbConsultaCellClick(Column: TColumn);
var
  edit: TControleEdit;
begin
  if (cbVeiculos.Visible = true) and (self.tag <> 0) then
  begin
    self.cbVeiculos.tag := 10;
    self.spSalvar.Enabled := true;
    edit.getStatusVeiculo;
  end;

end;

procedure Tfrm_Consulta.FormActivate(Sender: TObject);
var
edit:TControleEdit;
begin
  if frm_Pedido <> nil then
  begin
    self.spDestinatario.Visible := true;
    exit
  end
  else if self.tag = 1 then
  begin

    edit.popularCombos;
    frm_Consulta.edPesquisa.Visible := false;
    self.resetScreen;
    exit
  end
  else
  begin
    self.Panel1.Height := 48;
    self.Panel2.Align := alTop;
    self.Panel1.Align := alTop;
    self.spSalvar.Width :=100;

    self.resetScreen;
  end;
end;

function Tfrm_Consulta.getSelectSql: string;
begin
  result := self.scriptSql;
end;

procedure Tfrm_Consulta.RadioGroup1Click(Sender: TObject);
var
  edit: TControleEdit;
begin
  edit.checkRadioStatus;
end;

procedure Tfrm_Consulta.resetButton;
begin
  if self.RadioGroup1.ItemIndex < 2 then
  begin
    self.spSalvar.Caption := 'Buscar';
    self.chStatus.Visible := false;
  end;
end;

procedure Tfrm_Consulta.resetScreen;
begin
  dm_ProjetoFinal.qrConsulta.Close;
  dm_ProjetoFinal.qrConsulta.SQL.Clear;
  dm_ProjetoFinal.qrConsulta.SQL.Add(self.getSelectSql);

  Try
    dm_ProjetoFinal.qrConsulta.Open;
    Tutilitario.ajustaTamnhoDbg(dbConsulta);
    lbResult.Caption := 'Resultados...  ' +
      IntToStr(dm_ProjetoFinal.qrConsulta.RecordCount);
  except
    on e: exception do
      ShowMessage('N?o foi possivel consultar os dados: ' + e.ToString);

  End;
  self.resetButton;
  utilitaria.statusButton;

end;

procedure Tfrm_Consulta.setSelectSQL(scriptSql: string);
begin
  self.scriptSql := scriptSql;
end;

procedure Tfrm_Consulta.spButtonReturnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrm_Consulta.spDestinatarioClick(Sender: TObject);
var
  frm_pessoa: Tfrm_Cliente;
begin
  frm_pessoa := Tfrm_Cliente.Create(nil);
  // Controle :=TControle.Create;
  Controle.getCadPessoa;
  frm_pessoa.chDestinatario.Checked := true;
end;

procedure Tfrm_Consulta.spSalvarClick(Sender: TObject);
begin
  ModalResult := mrok
end;

end.
