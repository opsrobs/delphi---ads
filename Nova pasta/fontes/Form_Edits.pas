unit Form_Edits;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,Unit_Consultas;

type
  Tfrm_edits = class(TForm)
    listDados: TListView;
    procedure FormActivate(Sender: TObject);
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

procedure Tfrm_edits.FormActivate(Sender: TObject);
var
  controleEdit:TControleEdit;
begin
consulta.fields;
consulta.rows;
    //controleEdit.setTitle;

end;

function Tfrm_edits.getFuncao: byte;
begin
ShowMessage('')
end;

procedure Tfrm_edits.setFuncao(funcao: byte);
begin
ShowMessage('')
end;

end.
