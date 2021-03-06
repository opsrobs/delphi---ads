unit Form_Edits;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,Unit_Consultas,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_edits = class(TForm)
    pnConsulta: TPanel;
    dbConsulta: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbConsultaDblClick(Sender: TObject);
  private
  funcao:byte;
    { Private declarations }
  public
  procedure setFuncao(funcao:byte);
  function getFuncao:byte;
    { Public declarations }
  end;

var
  frm_edits: Tfrm_edits;
  consulta:TConsulta;


implementation

{$R *.dfm}

uses Unit_Controle, Unit_ControleEdits;

{ Tfrm_edits }

procedure Tfrm_edits.dbConsultaDblClick(Sender: TObject);
begin
consulta.screenConsulta(consulta.show);

end;

procedure Tfrm_edits.FormActivate(Sender: TObject);
var
  controleEdit:TControleEdit;
begin
consulta.resetScreen;
    //controleEdit.setTitle;

end;

procedure Tfrm_edits.FormCreate(Sender: TObject);
begin
  self.ScaleValue(self.dbConsulta.InstanceSize);
end;

function Tfrm_edits.getFuncao: byte;
begin

end;

procedure Tfrm_edits.setFuncao(funcao: byte);
begin

end;

end.
