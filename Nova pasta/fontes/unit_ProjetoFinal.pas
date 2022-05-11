unit unit_ProjetoFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Pedidos1: TMenuItem;
    Funcionario1: TMenuItem;
    Cliente1: TMenuItem;
    Veiculo1: TMenuItem;
    Pendente1: TMenuItem;
    Aprovados1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
