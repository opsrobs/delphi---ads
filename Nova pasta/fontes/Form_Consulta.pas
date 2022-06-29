unit Form_Consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_Consulta = class(TForm)
    Panel1: TPanel;
    spButtonReturn: TSpeedButton;
    spSalvar: TSpeedButton;
    Panel3: TPanel;
    dbConsulta: TDBGrid;
    chPf: TCheckBox;
    chPj: TCheckBox;
    Panel2: TPanel;
    lbResult: TLabel;
    spDestinatario: TSpeedButton;
    edPesquisa: TLabeledEdit;
    procedure FormActivate(Sender: TObject);
    procedure spButtonReturnClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure spDestinatarioClick(Sender: TObject);
    procedure chPfClick(Sender: TObject);
    procedure chPjClick(Sender: TObject);
  private
    scriptSql: string;
  public
    procedure setSelectSQL(scriptSql: string);
    function getSelectSql: string;
    procedure resetScreen;
  end;

var
  frm_Consulta: Tfrm_Consulta;

implementation

{$R *.dfm}

uses Unit_Dados, Objeto_Utilitario, Form_CadPedido, Form_CadFuncionario,
  Form_CadPessoa, Unit_ControleEdits;

{ Tfrm_Consulta }

procedure Tfrm_Consulta.chPfClick(Sender: TObject);
var
  edit: TControleEdit;
begin
  self.chPj.Checked := false;
  edit.setPersonType;

end;

procedure Tfrm_Consulta.chPjClick(Sender: TObject);
var
  edit: TControleEdit;
begin
  self.chPf.Checked := false;
  edit.setPersonType;
end;

procedure Tfrm_Consulta.FormActivate(Sender: TObject);
begin
  if frm_Pedido <> nil then
  begin
    self.spDestinatario.Visible := true;
  end
  else if self.tag = 1 then
  begin

    self.resetScreen;
    utilitaria.bloquearConsulta;
    frm_Consulta.edPesquisa.Visible := false;
  end
  else
  begin
    self.Panel2.Align := alTop;
    self.Panel1.Height := 48;
    self.resetScreen;
  end;
end;

function Tfrm_Consulta.getSelectSql: string;
begin
  result := self.scriptSql;
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
      ShowMessage('N�o foi possivel consultar os dados: ' + e.ToString);

  End;
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
  ModalResult := mrok;
end;

end.
