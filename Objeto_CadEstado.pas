unit Objeto_CadEstado;

interface
uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

  type CadEstado = class
  private
    idEstado: integer;
    nome_estado: string[45];
    uf: string[2];
  public
    procedure setidEstado (idEstado:integer);
    function getidEstado: integer;
    procedure setNome_estado(nome_estado: string);
    function getNome_estado: string;
    procedure setuf (uf: string);
    function getuf: string;

     {<--- CRUD --->}

        function insertDados:Boolean;

  end;

implementation

{ CadEstado }

function CadEstado.getidEstado: integer;
begin
    result := self.idEstado;
end;

function CadEstado.getNome_estado: string;
begin
    result := Self.nome_estado;
end;

function CadEstado.getuf: string;
begin
    result := self.uf;
end;

function CadEstado.insertDados: Boolean;
  var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into estado values( 0, :nome_estado, :uf)');

  query.ParamByName('nome_estado').AsString := self.getNome_estado;
  query.ParamByName('uf').AsString := self.getuf;

      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir Estado... : ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;


procedure CadEstado.setidEstado(idEstado: integer);
begin
    self.idEstado	 := idEstado;
end;

procedure CadEstado.setNome_estado(nome_estado: string);
begin
    self.nome_estado := nome_estado;
end;

procedure CadEstado.setuf(uf: string);
begin
    self.uf := uf;
end;

end.
