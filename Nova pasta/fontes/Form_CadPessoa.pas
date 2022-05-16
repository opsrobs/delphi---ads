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
    edCpfCnpj: TLabeledEdit;
    rdCNPJ: TRadioButton;
    procedure spButtonReturnClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
  private
    funcao:byte; //1--salvar || 2 --Excluir
    function validarValores:boolean;
    function validarCpf(cpf:string):boolean;
    function validarCnpj(cnpj:string):boolean;
  public
    procedure setFuncao(funcao:byte);
    function getFuncao:byte;
    function teste:string;
  end;

var
  Cliente: TCliente;

implementation

{$R *.dfm}

uses Unit_Dados, Objeto_CadPessoa, Objeto_CadPessoaFisica;

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

function TCliente.teste: string;
begin
  ShowMessage(rdCNPJ.Checked.ToString());
end;

function TCliente.validarCnpj(cnpj:string): boolean;
begin
     result := true;
    if (not cnpj.Length = 14) or (not cnpj.Length = 18) then
      begin
        result := false;
      end;
end;

function TCliente.validarCpf(cpf: string):boolean;

begin
  result := true;
    if (not cpf.Length < 11) or (not cpf.Length > 14) then
      begin
        result := false;
      end;

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

      if (self.validarCpf(edCpfCnpj.Text)) then     
      begin
        result := false;
        ShowMessage('Verifique o CPF/CNPJ informado ');
        exit
      end;
  {if (self.validarCnpj(edCpfCnpj.Text))and (rdCNPJ.Checked.ToString() <> '0') then
      begin
        result := false;
        ShowMessage('Informe um CNPJ v�lido');
        exit
      end;    }


end;

end.
