unit Form_CadFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, Unit_Utils,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.DBCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, System.JSON, Vcl.ComCtrls;

type
  Tfrm_Funcionario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edCpfCnpj: TLabeledEdit;
    edNome: TLabeledEdit;
    nmConsultar: TSpeedButton;
    spButtonReturn: TSpeedButton;
    spDelete: TSpeedButton;
    spSalvar: TSpeedButton;
    edPis: TLabeledEdit;
    edCnh: TLabeledEdit;
    generate: TSpeedButton;
    procedure spButtonReturnClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure nmConsultarClick(Sender: TObject);
    procedure generateClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    funcao: byte;
    function validarValoresFuncionario: Boolean;
    procedure limpartela;

    { Private declarations }

  public
    procedure setFuncao(funcao: byte);
    function getFuncao: byte;

    { Public declarations }
  end;

var
  frm_Funcionario: Tfrm_Funcionario;
  utilitaria: Utils;

implementation

{$R *.dfm}

uses unit_ProjetoFinal, Unit_Dados, Form_Consulta;

{ TFuncionario }

procedure Tfrm_Funcionario.FormActivate(Sender: TObject);
begin
  self.limpartela;
end;

procedure Tfrm_Funcionario.FormDestroy(Sender: TObject);
begin
  Frm_Principal.ControleFuncionario.Free;
end;

function Tfrm_Funcionario.getFuncao: byte;
begin
  result := self.funcao;
end;

procedure Tfrm_Funcionario.limpartela;
begin
  edCpfCnpj.Clear;
  edNome.Clear;
  spSalvar.Tag := 0;
  edNome.SetFocus;

end;

procedure Tfrm_Funcionario.nmConsultarClick(Sender: TObject);
var
  frm_Consulta: Tfrm_Consulta;
begin

  frm_Consulta.Tag := 0;
  Frm_Principal.ControleFuncionario.getConsultaPessoas;
  frm_Consulta.Free; // ????
end;

procedure Tfrm_Funcionario.setFuncao(funcao: byte);
begin
  self.funcao := funcao;
end;

procedure Tfrm_Funcionario.spButtonReturnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrm_Funcionario.spDeleteClick(Sender: TObject);
begin
  self.setFuncao(2);
  ModalResult := mrOk;
end;

procedure Tfrm_Funcionario.generateClick(Sender: TObject);
begin
  self.generate.Tag := 2;
  utilitaria := Utils.Create;
  utilitaria.loadingApiPessoa;
end;

procedure Tfrm_Funcionario.spSalvarClick(Sender: TObject);
begin
  if (not self.validarValoresFuncionario) then
    exit;

  if utilitaria.confirmardados(utilitaria.confirmarFuncionario) then
  begin

    self.setFuncao(1);
    ModalResult := mrOk;

  end;

end;

function Tfrm_Funcionario.validarValoresFuncionario: Boolean;
begin
  result := true;
  if (edNome.Text = '') then
  begin
    result := false;
    ShowMessage('Entre com um nome');
    exit;
  end;
  if self.edCpfCnpj.Text = '' then
  begin
    result := false;
    ShowMessage('Informe um CPF/CNPJ v?lido');
    exit
  end;
  if self.edPis.Text = '' then
  begin
    result := false;
    ShowMessage('Informe um PIS v?lido');
    exit
  end;
  if self.edCnh.Text = '' then
  begin
    result := false;
    ShowMessage('Informe uma certid?o nacional de hailita??o v?lida');
    exit
  end;

end;

end.
