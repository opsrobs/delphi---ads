unit unit_ProjetoFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Unit_ControleFuncionario, Unit_Controle;

type
  TFrm_Principal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Pedidos1: TMenuItem;
    Funcionario1: TMenuItem;
    Cliente1: TMenuItem;
    Veiculo1: TMenuItem;
    Pendente1: TMenuItem;
    Aprovados1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Funcionario1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Controle:TControle;
    ControleFuncionario:TControle_Funcionario;
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

 uses Unit_Dados, Form_CadPessoa, Objeto_CadFuncionario;

procedure TFrm_Principal.Cliente1Click(Sender: TObject);
begin
    Controle.getCadPessoa;
end;

procedure TFrm_Principal.FormCreate(Sender: TObject);
begin
    Controle := TControle.Create;
end;

procedure TFrm_Principal.FormDestroy(Sender: TObject);
begin
    Controle.Free;
end;

procedure TFrm_Principal.Funcionario1Click(Sender: TObject);
begin
    ControleFuncionario.getCadFuncionario;
end;

end.
