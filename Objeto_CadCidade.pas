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
