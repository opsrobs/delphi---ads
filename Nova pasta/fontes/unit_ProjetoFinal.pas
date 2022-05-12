unit unit_ProjetoFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

 uses Unit_Dados, Form_CadPessoa;

procedure TFrm_Principal.Cliente1Click(Sender: TObject);
begin
   if (Cliente = nil) then
      Cliente := TCliente.Create(self);

      Cliente.ShowModal;
      FreeAndNil(Cliente);

end;

end.
