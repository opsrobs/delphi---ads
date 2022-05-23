unit Objeto_CadBairro;

interface

uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;

  type CadBairro = class

  private
    idBairro:integer;
    nome_bairro:string[45];
    Cidade_idCidade:integer;
  public
    procedure setIdBairro(idBairro:integer);
    function getIdBairro:integer;
    procedure setNome_Bairro(nome_bairro:string);
    function getNome_Bairro:string;
    procedure setCidade_idCidade(Cidade_idCidade:integer);
    function getCidade_idCidade:integer;

     {<--- CRUD --->}

        function insertDados:Boolean;
end;

implementation

{ CadBairro }

function CadBairro.getCidade_idCidade: integer;
begin
    result := self.Cidade_idCidade;
end;

function CadBairro.getIdBairro: integer;
begin
    result := self.idBairro	;
end;

function CadBairro.getNome_Bairro: string;
begin
    result := self.nome_bairro;
end;

function CadBairro.insertDados: Boolean;
  var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into bairro values( 0, :nome_Bairro, :cidade_idCidade)');

  query.ParamByName('nome_Bairro').AsString := self.getNome_Bairro;
  query.ParamByName('cidade_idCidade').AsInteger := self.getCidade_idCidade;

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

procedure CadBairro.setCidade_idCidade(Cidade_idCidade: integer);
begin
    self.Cidade_idCidade:= Cidade_idCidade;
end;

procedure CadBairro.setIdBairro(idBairro: integer);
begin
    self.idBairro := idBairro;
end;

procedure CadBairro.setNome_Bairro(nome_bairro: string);
begin
    self.nome_bairro := nome_bairro;
end;

end.
