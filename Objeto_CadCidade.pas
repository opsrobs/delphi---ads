unit Objeto_CadCidade;

interface
  uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

type CadCidade = class
  private
    idCidade: integer;
    nome_cidade: string[45];
    Estado_idEstado: integer;
  public
    procedure setIdCidade(idCidade:integer);
    function getIdCidade:integer;
    procedure setNome_cidade(nome_cidade:string);
    function getNome_ciade:string;
    procedure setEstado_idEstado(Estado_idEstado:integer);
    function getEstado_idEstado:integer;
                                 {<<< CRUD >>>}

    function insertDados:boolean;
end;



implementation

{ CadCidade }

function CadCidade.getEstado_idEstado: integer;
begin
    result := self.Estado_idEstado ;
end;

function CadCidade.getIdCidade: integer;
begin
    result := self.idCidade
end;

function CadCidade.getNome_ciade: string;
begin
    result := self.nome_cidade;
end;

function CadCidade.insertDados: boolean;
  var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into cidade values( 0, :nome_cidade, :estado_idEstado)');

  query.ParamByName('nome_cidade').AsString := self.getNome_ciade;
  query.ParamByName('estado_idEstado').AsInteger := self.getEstado_idEstado;

      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir Cidade... : ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;
procedure CadCidade.setEstado_idEstado(Estado_idEstado: integer);
begin
    self.Estado_idEstado := Estado_idEstado;
end;

procedure CadCidade.setIdCidade(idCidade: integer);
begin
    self.idCidade	 :=idCidade;
end;

procedure CadCidade.setNome_cidade(nome_cidade: string);
begin
    self.nome_cidade := nome_cidade;
end;

end.
