unit Form_CadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,REST.Response.Adapter,System.JSON, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, REST.Types, Unit_Controle, Unit_Utils;

type
  Tfrm_Cliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    spButtonReturn: TSpeedButton;
    spSalvar: TSpeedButton;
    edNome: TLabeledEdit;
    edCpfCnpj: TLabeledEdit;
    MaskCep: TMaskEdit;
    spConsultaCep: TSpeedButton;
    Label1: TLabel;
    lbRua: TLabeledEdit;
    lbNumero: TLabeledEdit;
    lbCidade: TLabeledEdit;
    lbEstado: TLabeledEdit;
    lbUnidadeFederativa: TLabeledEdit;
    lbBairro: TLabeledEdit;
    lbComplemento: TLabeledEdit;
    spDelete: TSpeedButton;
    SpeedButton1: TSpeedButton;
    lbContato: TLabeledEdit;
    chStatus: TCheckBox;
    rdCNPJ: TCheckBox;
    chDestinatario: TCheckBox;
    procedure spButtonReturnClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure spConsultaCepClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private

    funcao:byte; //1--salvar || 2 --Excluir
    function validarValores:boolean;
    function validarCpf(cpf:string):boolean;
    function validarCnpj(cnpj:string):boolean;
    procedure limpartela;


  public
    procedure setFuncao(funcao:byte);
    function getFuncao:byte;
  end;

var
  frm_Cliente: Tfrm_Cliente;
  Controle:TControle;
  utilitaria:Utils;

implementation

{$R *.dfm}

uses Unit_Dados, unit_ProjetoFinal, Form_CadPedido, Form_Edits,
  Unit_ControleEdits;

procedure Tfrm_Cliente.FormActivate(Sender: TObject);
begin
if self.tag = 10 then
begin
  self.tag := 0;
  utilitaria.bloquearDados;
  exit
end;
self.limpartela;
    if frm_Pedido <> nil then
    begin
      self.Caption:= 'Cadastro de Destinatarios...';
      self.chDestinatario.Checked := true;
    end;



end;

function Tfrm_Cliente.getFuncao: byte;
begin
    result := self.funcao;
end;

procedure Tfrm_Cliente.limpartela;
begin
    edNome.SetFocus;
    edCpfCnpj.Clear;
    edNome.Clear;
    spSalvar.Tag := 0;
    lbContato.Clear;
    chStatus.Checked:=true;
    rdCNPJ.Checked := false;
    MaskCep.Clear;
    lbEstado.Clear;
    lbCidade.Clear;
    lbBairro.Clear;
    lbRua.Clear;
    lbUnidadeFederativa.Clear;
    lbNumero.Clear;
    lbComplemento.Clear;

end;



procedure Tfrm_Cliente.setFuncao(funcao: byte);
begin
    self.funcao	 := funcao;
end;


procedure Tfrm_Cliente.spButtonReturnClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure Tfrm_Cliente.spConsultaCepClick(Sender: TObject);

begin
//Controle:=TControle.Create;
  utilitaria.loadingApiCep;

  //Controle.loadingApiCep;
end;

procedure Tfrm_Cliente.spDeleteClick(Sender: TObject);
begin
        self.limpartela;
end;


procedure Tfrm_Cliente.SpeedButton1Click(Sender: TObject);
begin
    utilitaria:=Utils.Create;
    utilitaria.loadingApiPessoa;
end;

procedure Tfrm_Cliente.SpeedButton2Click(Sender: TObject);
var
controledit:TControleEdit;
begin
 controledit.consultarPessoa;
end;

procedure Tfrm_Cliente.spSalvarClick(Sender: TObject);
begin
        if (not self.validarValores) then
          exit;

        self.setFuncao(1);
        ModalResult := mrOk;
end;

function Tfrm_Cliente.validarCnpj(cnpj:string): boolean;
begin
     result := true;
    if (not cnpj.Length = 14) or (not cnpj.Length = 18) then
      begin
        result := false;
      end;
end;

function Tfrm_Cliente.validarCpf(cpf: string):boolean;

begin
  result := true;
    if (not cpf.Length < 11) or (not cpf.Length > 14) then
      begin
        result := false;
      end;

end;

function Tfrm_Cliente.validarValores: boolean;
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

      if (lbContato.Text = '') then
      begin
        result := false;
        ShowMessage('Informe um Contato (TELEFONE/EMAIL) ');
        exit
      end;

      if (self.MaskCep.Text= '') then
      begin
        result := false;
        ShowMessage('Verifique o CEP informado ');
        exit
      end;

      if (self.lbUnidadeFederativa.Text= '') then
      begin
        result := false;
        ShowMessage('Informe um UF informado ');
        exit
      end;

      if (self.lbEstado.Text = '') then
      begin
        result := false;
        ShowMessage('Entre com o Estado ');
        exit
      end;

      if (self.lbCidade.Text = '') then
      begin
        result := false;
        ShowMessage('Entre com uma Cidade');
        exit
      end;

      if self.lbBairro.Text = '' then
      begin
        result := false;
        ShowMessage('Entre com um Bairro');
        exit
      end;

      if self.lbrua.text = '' then
      begin
        result := false;
        ShowMessage('Entre com uma Rua');
        exit
      end;




end;

end.
