unit Form_CadVeiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls,Unit_Dados, Vcl.Buttons, Vcl.ComCtrls, Objeto_CadVeiculo;

type
  Tfrm_Veiculos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lbMarca: TLabeledEdit;
    lbModelo: TLabeledEdit;
    lbPlaca: TLabeledEdit;
    spButtonReturn: TSpeedButton;
    spDelete: TSpeedButton;
    spSalvar: TSpeedButton;
    cbVeiculos: TComboBox;
    procedure spSalvarClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbVeiculosChange(Sender: TObject);
  private
    scriptSql:string;
    funcao:byte;
    function validarValoresFuncionario:Boolean;
    procedure limparTela;


  public
  procedure setFuncao(funcao:byte);
  function getFuncao:byte;
  function getSelectSql:string;
  procedure setSelectSQL(scriptSql:string);
    { Public declarations }
  end;

var
  frm_Veiculos: Tfrm_Veiculos;
  OCadVeiculo:CadVeiculo;

implementation

{$R *.dfm}

uses unit_ProjetoFinal;

{ Tfrm_Veiculos }




procedure Tfrm_Veiculos.cbVeiculosChange(Sender: TObject);
begin
    frm_Veiculos.lbMarca.Text := frm_Veiculos.cbVeiculos.Text;
end;

procedure Tfrm_Veiculos.FormActivate(Sender: TObject);
begin
      Frm_Principal.ControleVeiculo.populaCombo;
end;

function Tfrm_Veiculos.getFuncao: byte;
begin
   result := self.funcao;
end;

function Tfrm_Veiculos.getSelectSql: string;
begin
    result := self.scriptSql;
end;

procedure Tfrm_Veiculos.limparTela;
begin
  lbModelo.Clear;
  lbMarca.Clear;
  lbPlaca.Clear;
  lbModelo.SetFocus;
end;

procedure Tfrm_Veiculos.setFuncao(funcao: byte);
begin
   self.funcao	 := funcao;
end;

procedure Tfrm_Veiculos.setSelectSQL(scriptSql: string);
begin
//s
end;

procedure Tfrm_Veiculos.spDeleteClick(Sender: TObject);
begin
    self.setFuncao(2);
    ModalResult := mrOk;
end;

procedure Tfrm_Veiculos.spSalvarClick(Sender: TObject);
begin
    if (not self.validarValoresFuncionario) then
       exit;

      self.setFuncao(1);
      ModalResult := mrOK;
end;

function Tfrm_Veiculos.validarValoresFuncionario: Boolean;
begin
    result := true;
    if (lbMarca.Text	= '') then
      begin
        result := false;
        ShowMessage('Informe a Marca do veiculo!!!');
        lbMarca.SetFocus;
        exit;
      end;

      if (lbModelo.Text	= '') then
      begin
        result := false;
        ShowMessage('Informe o modelo do veiculo!!!');
        lbModelo.SetFocus;
        exit;
      end;

      if (lbPlaca.Text	= '') then
      begin
        result := false;
        ShowMessage('Informe a placa do veiculo!!!');
        lbPlaca.SetFocus;
        exit;
      end;
end;

end.
