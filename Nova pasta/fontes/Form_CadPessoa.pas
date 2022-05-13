unit Form_CadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask;

type
  TCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    spButtonReturn: TSpeedButton;
    spSalvar: TSpeedButton;
    spDelete: TSpeedButton;
    edNome: TLabeledEdit;
    nmConsultar: TSpeedButton;
    procedure spButtonReturnClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
  private
    funcao:byte; //1--salvar || 2 --Excluir
    function validarValores:boolean;
  public
    procedure setFuncao(funcao:byte);
    function getFuncao:byte;
  end;

var
  Cliente: TCliente;

implementation

{$R *.dfm}

uses Unit_Dados;

function TCliente.getFuncao: byte;
begin
    result := self.funcao;
end;

procedure TCliente.setFuncao(funcao: byte);
begin
    self.funcao	 := funcao;
end;

procedure TCliente.spButtonReturnClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TCliente.spDeleteClick(Sender: TObject);
begin
        self.setFuncao(2);
        ModalResult := mrOk;
end;

procedure TCliente.spSalvarClick(Sender: TObject);
begin
        if (not self.validarValores) then
          exit;

        self.setFuncao(1);
        ModalResult := mrOk;
end;

function TCliente.validarValores: boolean;
begin
    result := true;
    if (edNome.Text	= '') then
      begin
        result := false;
        ShowMessage('Entre com um nome');
        exit;
      end;

end;

end.
