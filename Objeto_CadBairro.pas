unit Objeto_CadBairro;

interface

uses
 Objeto_CadCidade;

  type CadBairro = class(CadCidade)

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
