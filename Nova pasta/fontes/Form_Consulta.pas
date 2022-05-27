unit Form_Consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_Consulta = class(TForm)
    Panel1: TPanel;
    spButtonReturn: TSpeedButton;
    spSalvar: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    edPesquisa: TLabeledEdit;
    lbResult: TLabel;
    dbConsulta: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure spButtonReturnClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
  private
    scriptSql:string;
  public
    procedure setSelectSQL(scriptSql:string);
    function getSelectSql:string;
  end;

var
  frm_Consulta: Tfrm_Consulta;

implementation

{$R *.dfm}

uses Unit_Dados,Objeto_Utilitario;


{ Tfrm_Consulta }

procedure Tfrm_Consulta.FormActivate(Sender: TObject);
begin
    dm_ProjetoFinal.qrConsulta.Close;
    dm_ProjetoFinal.qrConsulta.SQL.Clear;
    dm_ProjetoFinal.qrConsulta.SQL.Add(self.getSelectSql);

    Try
      dm_ProjetoFinal.qrConsulta.Open;
      Tutilitario.ajustaTamnhoDbg(dbConsulta);
      lbResult.Caption :='Resultados...  ' + IntToStr(dm_ProjetoFinal.qrConsulta.RecordCount);
    except
      on e:exception do
      ShowMessage('N�o foi possivel consultar os dados: '+e.ToString);

    End;
end;

function Tfrm_Consulta.getSelectSql: string;
begin
    result := self.scriptSql;
end;

procedure Tfrm_Consulta.setSelectSQL(scriptSql: string);
begin
    self.scriptSql := scriptSql;
end;

procedure Tfrm_Consulta.spButtonReturnClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure Tfrm_Consulta.spSalvarClick(Sender: TObject);
begin
    ModalResult := mrok;
end;

end.
