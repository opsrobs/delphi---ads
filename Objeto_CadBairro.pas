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
        function updateDados:boolean;
        function getIdentificadorBairro(bairro:string):integer;
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

function CadBairro.getIdentificadorBairro(bairro: string): integer;
var
    query:TFDQuery;
    querySelect:string;
    id:integer;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  querySelect:='SELECT idBairro,count(*) FROM logistica_ads.bairro where (nome_Bairro = "'+bairro+'" )';
  query.SQL.Add(querySelect);
      try
        query.open;
        if (not query.isEmpty) then
          begin
              id :=query.Fields[0].AsInteger;
              result :=id;
          end;
      except
        on e:exception do
        begin
          Result := 0;
          showMessage('Erro ao fazer consulta no bairro [<<<   Objeto_CadCadBairro>>>] : '+bairro+' ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

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
          showMessage('Erro ao incluir Bairro... : ' + e.ToString);
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

function CadBairro.updateDados: boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('update bairro set   nome_bairro= :nome_bairro where (idBairro= :idBairro)');

  query.ParamByName('nome_bairro').AsString := self.getNome_Bairro;
  query.ParamByName('idBairro').AsInteger := self.getIdBairro;
      {Ou passar 'query.Params[posicaoindice].AsString' no lugar do nome do campo}

      try
        query.ExecSQL;  {update service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao alterar dados da bairro [<<  Objeto_CadBairro  >>]: ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;
end.
