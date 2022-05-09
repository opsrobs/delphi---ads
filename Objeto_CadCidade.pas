unit Objeto_CadCidade;

interface
  uses
  Objeto_CadEstado;

type CadCidade = class(CadEstado)
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
end;



implementation

{ CadCidade }

function CadCidade.getEstado_idEstado: integer;
begin

end;

function CadCidade.getIdCidade: integer;
begin

end;

function CadCidade.getNome_ciade: string;
begin

end;

procedure CadCidade.setEstado_idEstado(Estado_idEstado: integer);
begin

end;

procedure CadCidade.setIdCidade(idCidade: integer);
begin

end;

procedure CadCidade.setNome_cidade(nome_cidade: string);
begin

end;

end.
