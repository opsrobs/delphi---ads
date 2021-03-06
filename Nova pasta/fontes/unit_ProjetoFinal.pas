unit unit_ProjetoFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Unit_ControleFuncionario,
  Form_CadPessoa,
  Unit_Controle, Unit_ControlePedido, Unit_ControleVeiculo, Unit_ControleEdits,
  Form_Edits;

type
  TFrm_Principal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Pedidos1: TMenuItem;
    Funcionario1: TMenuItem;
    Cliente1: TMenuItem;
    Veiculo1: TMenuItem;
    Pendente1: TMenuItem;
    Pedido1: TMenuItem;
    Consultas1: TMenuItem;
    Carga1: TMenuItem;
    ConsultarClientes: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Funcionario1Click(Sender: TObject);
    procedure Veiculo1Click(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ConsultarClientesClick(Sender: TObject);
    procedure Carga1Click(Sender: TObject);
    procedure Pendente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Controle: TControle;
    ControleFuncionario: TControle_Funcionario;
    ControleVeiculo: TControle_Veiculo;
    ControlePedido: TControle_Pedido;
    ControleEdit: TControleEdit;
  end;

var
  Frm_Principal: TFrm_Principal;
  frm_edit: Tfrm_edits;
  frm_pessoa: Tfrm_Cliente;

implementation

{$R *.dfm}

uses Unit_Dados, Objeto_CadFuncionario, Form_CadPedido,
  Form_CadFuncionario, Form_CadVeiculos, Form_Consulta, Form_CadEntrega,
  Unit_Consultas;


procedure TFrm_Principal.Carga1Click(Sender: TObject);
begin
 ControlePedido.getCadEntrega;
end;

procedure TFrm_Principal.Cliente1Click(Sender: TObject);
begin
  Controle.getCadPessoa;
end;

procedure TFrm_Principal.ConsultarClientesClick(Sender: TObject);
begin
frm_Consulta := Tfrm_Consulta.Create(nil);
  frm_Pedido := nil;
  frm_Consulta.tag := 1;
  frm_Consulta.RadioGroup1.Visible :=true;
  Frm_Principal.ConsultarClientes.Tag := 1;
  ControleEdit.consultarPessoa;
    FreeAndNil(frm_Consulta);

end;

procedure TFrm_Principal.FormActivate(Sender: TObject);
begin
  // self.clearMemory;
  try
    //FreeAndNil(frm_Pedido);
    FreeAndNil(frm_Consulta);
   // FreeAndNil(frm_Funcionario);
   // FreeAndNil(frm_Cliente);
   // FreeAndNil(frm_Veiculos);
  finally

  end;

end;

procedure TFrm_Principal.FormCreate(Sender: TObject);
begin
  Controle := TControle.Create;
end;

procedure TFrm_Principal.FormDestroy(Sender: TObject);
begin
  {Controle.Free;
  ControleFuncionario.Free;
  ControleVeiculo.Free;
  ControlePedido.Free;  }
end;


procedure TFrm_Principal.Funcionario1Click(Sender: TObject);
begin
  ControleFuncionario.getCadFuncionario;
end;

procedure TFrm_Principal.Pedido1Click(Sender: TObject);
begin
frm_Pedido.tag := 1;
  ControlePedido.getCadPedido;
end;

procedure TFrm_Principal.Pendente1Click(Sender: TObject);
var
consulta:TConsulta;
begin
Consulta.getConsulta;
end;

procedure TFrm_Principal.Veiculo1Click(Sender: TObject);
begin
  ControleVeiculo.getCadVeiculo;
end;

end.
