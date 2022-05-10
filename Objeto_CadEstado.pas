unit Objeto_CadEstado;

interface

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
