unit Objeto_Funcionario_has_Veiculos;

interface
  uses FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

  type
    Funcionario_has_Veiculos = class
      private
        idFuncionarioVeiculo:integer;
        funcionario_idFuncionario:integer;
        veiculos_idVeiculos:integer;
      public
        procedure setFuncionario_idFuncionario(funcionario_idFuncionario:integer);
        function getFuncionario_idFuncionario:integer;
        procedure setVeiculos_idVeiculos(veiculos_idVeiculos:integer);
        function getveiculos_idVeiculos:integer;
        function getIdFuncionarioVeiculo:integer;

        function insertDados:boolean;
    end;

implementation

{ Funcionario_has_Veiculos }

function Funcionario_has_Veiculos.getFuncionario_idFuncionario: integer;
begin
    result := self.funcionario_idFuncionario ;
end;

function Funcionario_has_Veiculos.getIdFuncionarioVeiculo: integer;
begin
    result := self.IdFuncionarioVeiculo;
end;

function Funcionario_has_Veiculos.getveiculos_idVeiculos: integer;
begin
    result := self.veiculos_idVeiculos;
end;

function Funcionario_has_Veiculos.insertDados: boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  query.SQL.Add('insert into funcionario_has_veiculo values( 0, :veiculo_idveiculos, :funcionario_idfuncionario)');

  query.ParamByName('funcionario_idfuncionario').AsInteger := self.getFuncionario_idFuncionario;
  query.ParamByName('veiculo_idveiculos').AsInteger := self.getveiculos_idVeiculos;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir <<  funcionario_has_veiculo >>: ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;
procedure Funcionario_has_Veiculos.setFuncionario_idFuncionario(
  funcionario_idFuncionario: integer);
begin
    self.funcionario_idFuncionario := funcionario_idFuncionario;
end;

procedure Funcionario_has_Veiculos.setVeiculos_idVeiculos(
  veiculos_idVeiculos: integer);
begin
    self.veiculos_idVeiculos := veiculos_idVeiculos;
end;

end.
