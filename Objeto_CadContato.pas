unit Objeto_CadContato;

interface
  uses Objeto_CadPessoa;

  type CadContato = class (CadPessoa)

  private
    idStatus_telefone:integer;
    status_contato:Boolean;
    contato:string[45];
    Pessoa_idPessoa:integer;
  public
    procedure setIdStatus_Telefone(idStatus_Telefone:integer);
    function getIdStatus_Telefone:Integer;
    procedure setStatus_contato(status_contato:Boolean);
    function getSattus_contato:Boolean;
    procedure setContato(contato:string);
    function getContato:string;
    procedure setPessoa_idPessoa(Pessoa_idPessoa:integer);
    function getPessoa_idPessoa:integer;
  end;


implementation

{ CadContato }

function CadContato.getContato: string;
begin
    result := Self.contato;
end;

function CadContato.getIdStatus_Telefone: Integer;
begin
    result := self.idStatus_telefone;
end;

function CadContato.getPessoa_idPessoa: integer;
begin
    result := self.Pessoa_idPessoa;
end;

function CadContato.getSattus_contato: Boolean;
begin
    result := self.status_contato;
end;

procedure CadContato.setContato(contato: string);
begin
    self.contato  := contato;
end;

procedure CadContato.setIdStatus_Telefone(idStatus_Telefone: integer);
begin
    self.idStatus_telefone :=idStatus_Telefone;
end;

procedure CadContato.setPessoa_idPessoa(Pessoa_idPessoa: integer);
begin
    self.Pessoa_idPessoa := Pessoa_idPessoa;
end;

procedure CadContato.setStatus_contato(status_contato: Boolean);
begin
    self.status_contato	:= status_contato;
end;

end.
