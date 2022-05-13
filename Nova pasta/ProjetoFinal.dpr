program ProjetoFinal;

uses
  Vcl.Forms,
  Unit_Dados in 'DAO\Unit_Dados.pas' {dm_ProjetoFinal: TDataModule},
  Objeto_CadPessoa in '..\Objeto_CadPessoa.pas',
  Objeto_CadPessoaFisica in '..\Objeto_CadPessoaFisica.pas',
  Objeto_CadPessoaJuridica in '..\Objeto_CadPessoaJuridica.pas',
  Objeto_CadCliente in '..\Objeto_CadCliente.pas',
  Objeto_CadEstado in '..\Objeto_CadEstado.pas',
  Objeto_CadCidade in '..\Objeto_CadCidade.pas',
  Objeto_CadBairro in '..\Objeto_CadBairro.pas',
  Objeto_CadEndereco in '..\Objeto_CadEndereco.pas',
  Objeto_CadContato in '..\Objeto_CadContato.pas',
  Objeto_CadFuncionario in '..\Objeto_CadFuncionario.pas',
  Objeto_CadMarcaVeiculo in '..\Objeto_CadMarcaVeiculo.pas',
  Objeto_CadVeiculo in '..\Objeto_CadVeiculo.pas',
  Objeto_Funcionario_has_Veiculos in '..\Objeto_Funcionario_has_Veiculos.pas',
  Objeto_CadCarga in '..\Objeto_CadCarga.pas',
  Objeto_CadPedido in '..\Objeto_CadPedido.pas',
  Objeto_CadEntrega in '..\Objeto_CadEntrega.pas',
  unit_ProjetoFinal in 'fontes\unit_ProjetoFinal.pas' {Frm_Principal},
  Form_CadPessoa in 'fontes\Form_CadPessoa.pas' {Cliente},
  Objeto_CadOrcamento in '..\Objeto_CadOrcamento.pas',
  Unit_Controle in 'Controle\Unit_Controle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm_ProjetoFinal, dm_ProjetoFinal);
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.Run;
end.