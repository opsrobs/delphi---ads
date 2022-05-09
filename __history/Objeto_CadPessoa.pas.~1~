unit Objeto_CadPessoa;

interface

type CadPessoa = class

  private
         idPessoa:integer;
         nome:string[45];

  public
        procedure setidPessoa(idPessoa:integer);
        function getidPessoa:integer;
        procedure setnome (nome:string);
        function getnome:string;
end;

implementation

{ CadPessoa }

function CadPessoa.getidPessoa: integer;
begin
    result := self.idPessoa;
end;

function CadPessoa.getnome: string;
begin
      result := self.nome;
end;

procedure CadPessoa.setidPessoa(idPessoa: integer);
begin
     self.idPessoa := idPessoa;
end;

procedure CadPessoa.setnome(nome: string);
begin
      self.nome := nome;
end;

end.
