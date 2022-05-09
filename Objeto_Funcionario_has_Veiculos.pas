unit Objeto_Funcionario_has_Veiculos;

interface
  uses Objeto_CadMarcaVeiculo, Objeto_CadVeiculo;

  type
    Funcionario_has_Veiculos = class
      private
        funcionario_idFuncionario:integer;
        veiculos_idVeiculos:integer;
      public
        procedure setFuncionario_idFuncionario(funcionario_idFuncionario:integer);
        function getFuncionario_idFuncionario:integer;
        procedure setVeiculos_idVeiculos(veiculos_idVeiculos:integer);
        function getveiculos_idVeiculos:integer;
    end;

implementation

{ Funcionario_has_Veiculos }

function Funcionario_has_Veiculos.getFuncionario_idFuncionario: integer;
begin

end;

function Funcionario_has_Veiculos.getveiculos_idVeiculos: integer;
begin

end;

procedure Funcionario_has_Veiculos.setFuncionario_idFuncionario(
  funcionario_idFuncionario: integer);
begin

end;

procedure Funcionario_has_Veiculos.setVeiculos_idVeiculos(
  veiculos_idVeiculos: integer);
begin

end;

end.
