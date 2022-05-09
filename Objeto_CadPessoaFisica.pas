unit Objeto_CadPessoaFisica;

interface

  uses
  Objeto_CadPessoa;

  type CadPessoaFisica = class (CadPessoa)

  private
        idPessoa_fisica: integer;
        cpf: string[45];
        Pessoa_idPessoa: integer;
  public
        procedure setidPessoa_fisica (idPessoa_fisica:integer);
        function getidPessoa_fisica: integer;
        procedure setcpf (cpf: string);
        function getcpf: string;
        procedure setPessoa_idPessoa (Pessoa_idPessoa:integer);
        function getPessoa_idPessoa: integer;

end;
implementation

{ CadPessoaFisica }

function CadPessoaFisica.getcpf: string;
begin
  result := self.cpf;
end;

function CadPessoaFisica.getidPessoa_fisica: integer;
begin
     result := self.idPessoa_Fisica;
end;

function CadPessoaFisica.getPessoa_idPessoa: integer;
begin
     result := self.Pessoa_idPessoa;
end;

procedure CadPessoaFisica.setcpf(cpf: string);
begin
     self.cpf := cpf;
end;

procedure CadPessoaFisica.setidPessoa_fisica(idPessoa_fisica: integer);
begin
     self.idPessoa_fisica := idPessoa_fisica;
end;

procedure CadPessoaFisica.setPessoa_idPessoa(Pessoa_idPessoa: integer);
begin
     self.Pessoa_idPessoa := Pessoa_idPessoa;
end;

end.
