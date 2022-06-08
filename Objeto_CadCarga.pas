unit Objeto_CadCarga;

interface
  uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

  type CadCarga = class

  private
    idCarga:integer;
    quantidade:integer;
    peso:Float64;
    idFuncionarioVeiculo:integer;
    function getIdVeiculoFuncionario: integer;
    procedure setIdVeiculoFuncionario(IdVeiculoFuncionario: integer);
  public
    procedure setIdCarga(idCarga:integer);
    function getIdCarga:integer;
    procedure setQuantidade(quantidade:integer);
    function getQuantidade:integer;
    procedure setPeso(peso:Float64);
    function getPeso:Float64;
    procedure setidFuncionarioVeiculo(idFuncionarioVeiculo:integer);
    function getidFuncionarioVeiculo:integer;



    function insertDados:boolean;

  end;

implementation

{ CadCarga }

function CadCarga.getIdCarga: integer;
begin
  result := self.idCarga ;
end;


function CadCarga.getIdFuncionarioVeiculo: integer;
begin
    result := self.idFuncionarioVeiculo;
end;

function CadCarga.getIdVeiculoFuncionario: integer;
begin
    result := self.getIdVeiculoFuncionario;
end;

function CadCarga.getPeso: Float64;
begin
     result := self.peso;
end;

function CadCarga.getQuantidade: integer;
begin
     result := self.quantidade;
end;

function CadCarga.insertDados: boolean;
  var
    query:TFDQuery;
begin
  ShowMessage(IntToStr(self.getQuantidade) +' '+ FloatToStr(self.getPeso)+' '+ IntToStr(self.getIdFuncionarioVeiculo));
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into carga values( 0, :quantidade, :peso , :funcionario_has_veiculo_idFuncionarioVeiculo)');

  query.ParamByName('quantidade').AsInteger := self.getQuantidade;
  query.ParamByName('peso').AsFloat := self.getPeso;
  query.ParamByName('funcionario_has_veiculo_idFuncionarioVeiculo').AsInteger := self.getIdFuncionarioVeiculo;

      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir <<   carga   >>> ... : ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

procedure CadCarga.setIdCarga(idCarga: integer);
begin
    self.idCarga := idCarga;
end;


procedure CadCarga.setIdFuncionarioVeiculo(idFuncionarioVeiculo: integer);
begin
    self.idFuncionarioVeiculo := idFuncionarioVeiculo;
end;

procedure CadCarga.setIdVeiculoFuncionario(IdVeiculoFuncionario: integer);
begin
    IdVeiculoFuncionario := self.idFuncionarioVeiculo;
end;

procedure CadCarga.setPeso(peso: Float64);
begin
    self.peso	 := peso;
end;

procedure CadCarga.setQuantidade(quantidade: integer);
begin
    self.quantidade	 := quantidade;
end;

end.
