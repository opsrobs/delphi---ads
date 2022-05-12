unit Objeto_CadEntrega;

interface
  uses Objeto_CadFuncionario;

  type CadEntrege = class(CadFuncionario)
    private
      idEntrega:integer;
      status:Boolean;
      funcionario_idFuncionario:integer;
      funcionario_idFuncionaio_idVeiculo:integer;
    public
      procedure setIdEntrega(idEntrega:integer);
      function getidEntrega:integer;
      procedure setStatus(status:Boolean);
      function getStatus:Boolean;
      procedure setFuncionario_idFuncionario(funcionario_idFuncionario:integer);
      function getFuncionario_idFuncionario:integer;
      procedure setFuncionario_idFuncionaio_idVeiculo(funcionario_idFuncionaio_idVeiculo:integer);
      function getFuncionario_idFuncionaio_idVeiculo:integer;
  end;

implementation

{ CadEntrege }

function CadEntrege.getFuncionario_idFuncionaio_idVeiculo: integer;
begin
  result := self.funcionario_idFuncionaio_idVeiculo;
end;

function CadEntrege.getFuncionario_idFuncionario: integer;
begin
  result := self.funcionario_idFuncionario;
end;

function CadEntrege.getidEntrega: integer;
begin
  result := self.idEntrega ;
end;

function CadEntrege.getStatus: Boolean;
begin
  result := self.status;
end;

procedure CadEntrege.setFuncionario_idFuncionaio_idVeiculo(
  funcionario_idFuncionaio_idVeiculo: integer);
begin
  self.funcionario_idFuncionaio_idVeiculo := funcionario_idFuncionaio_idVeiculo;
end;

procedure CadEntrege.setFuncionario_idFuncionario(
  funcionario_idFuncionario: integer);
begin
  self.funcionario_idFuncionario := funcionario_idFuncionario;
end;

procedure CadEntrege.setIdEntrega(idEntrega: integer);
begin
  self.idEntrega := idEntrega;
end;

procedure CadEntrege.setStatus(status: Boolean);
begin
  self.status := status;
end;

end.
