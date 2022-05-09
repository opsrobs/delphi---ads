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

end;

function CadBairro.getIdBairro: integer;
begin

end;

function CadBairro.getNome_Bairro: string;
begin

end;

procedure CadBairro.setCidade_idCidade(Cidade_idCidade: integer);
begin

end;

procedure CadBairro.setIdBairro(idBairro: integer);
begin

end;

procedure CadBairro.setNome_Bairro(nome_bairro: string);
begin

end;

end.
