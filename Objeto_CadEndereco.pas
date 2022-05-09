unit Objeto_CadEndereco;

interface
  uses Objeto_CadBairro, Objeto_CadPessoa;


  type CadEndereco = class(CadBairro) //Implementar CadPessoa como herança;

    private
      idEndereco:integer;
      cep:string[20];
      rua:string[50];
      complemento:string[20];
      numero:integer;
      Bairro_idBairro:integer;
      Pessoa_idPessoa:integer;
    public

      procedure setIdEndereco(idEndereco:integer);
      function getidEndereco:integer;
      procedure setCep(cep:string);
      function getCep:string;
      procedure setRua(rua:string);
      function getRua:string;
      procedure setComplemto(complemento:string);
      function getComplemento:string;
      procedure setnumero(numero:Integer);
      function getNumero: Integer;
      procedure setBairro_idBairro(Bairro_idBairro:integer);
      function getBairro_idBairro:integer;
      procedure setPessoa_idPessoa(Pessoa_idPessoa:integer);
      function getPessoa_idPessoa:integer;

  end;


implementation

{ CadEndereco }

function CadEndereco.getBairro_idBairro: integer;
begin

end;

function CadEndereco.getCep: string;
begin

end;

function CadEndereco.getComplemento: string;
begin

end;

function CadEndereco.getidEndereco: integer;
begin

end;

function CadEndereco.getNumero: Integer;
begin

end;

function CadEndereco.getPessoa_idPessoa: integer;
begin

end;

function CadEndereco.getRua: string;
begin

end;

procedure CadEndereco.setBairro_idBairro(Bairro_idBairro: integer);
begin

end;

procedure CadEndereco.setCep(cep: string);
begin

end;

procedure CadEndereco.setComplemto(complemento: string);
begin

end;

procedure CadEndereco.setIdEndereco(idEndereco: integer);
begin

end;

procedure CadEndereco.setnumero(numero: Integer);
begin

end;

procedure CadEndereco.setPessoa_idPessoa(Pessoa_idPessoa: integer);
begin

end;

procedure CadEndereco.setRua(rua: string);
begin

end;

end.
