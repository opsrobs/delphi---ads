unit Form_CadFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask;

type
  TFuncionario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edCpfCnpj: TLabeledEdit;
    edNome: TLabeledEdit;
    nmConsultar: TSpeedButton;
    spButtonReturn: TSpeedButton;
    spDelete: TSpeedButton;
    spSalvar: TSpeedButton;
    procedure spButtonReturnClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
  funcao:byte;
  function validarValoresFuncionario:Boolean;
  procedure limpartela;
    { Private declarations }

  public
    procedure setFuncao(funcao:byte);
    function getFuncao:byte;
    { Public declarations }
  end;

var
  Funcionario: TFuncionario;

implementation

{$R *.dfm}

{ TFuncionario }

{ TFuncionario }

procedure TFuncionario.FormActivate(Sender: TObject);
begin
    self.limpartela;
end;

function TFuncionario.getFuncao: byte;
begin
    result := self.funcao;
end;

procedure TFuncionario.limpartela;
begin
    edCpfCnpj.Clear;
    edNome.Clear;
    spSalvar.Tag := 0;
    edNome.SetFocus;

end;

procedure TFuncionario.setFuncao(funcao: byte);
begin
    self.funcao	 := funcao;
end;

procedure TFuncionario.spButtonReturnClick(Sender: TObject);
begin
        ModalResult := mrCancel;
end;

procedure TFuncionario.spDeleteClick(Sender: TObject);
begin
    self.setFuncao(2);
    ModalResult := mrOk;
end;

procedure TFuncionario.spSalvarClick(Sender: TObject);
begin
    if (not self.validarValoresFuncionario) then
       exit;

      self.setFuncao(1);
      ModalResult := mrOK;
end;

function TFuncionario.validarValoresFuncionario: Boolean;
begin

end;

end.
