unit Objeto_CadEndereco;

interface
  uses
        FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;


  type CadEndereco = class

    private
      idEndereco:integer;
      cep:string[20];
      rua:string[50];
      complemento:string[20];
      numero:integer;
      Bairro_idBairro:integer;
      Pessoa_idPessoa:integer;
      ativo:boolean;
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
      procedure setAtivo(ativo:boolean);
      function getAtivo:boolean;

                          {<--- CRUD --->}

        function insertDados:Boolean;
        function updateEspecifyAddress(idAddress: integer): Boolean;

  end;


implementation

{ CadEndereco }

function CadEndereco.insertDados: Boolean;
  var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into endereco values( 0, :cep, :rua, :complemento, :numero, :bairro_idBairro, :pessoa_idPessoa, :ativo)');

  query.ParamByName('cep').AsString := self.getCep;
  query.ParamByName('rua').AsString:= self.getRua;
  query.ParamByName('complemento').AsString := self.getComplemento;
  query.ParamByName('numero').AsInteger := self.getNumero;
  query.ParamByName('bairro_idBairro').AsInteger := self.getBairro_idBairro;
  query.ParamByName('pessoa_idPessoa').AsInteger  := self.getPessoa_idPessoa;
  query.ParamByName('ativo').AsBoolean  := self.getAtivo;


      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir Endereco... : ' + e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

function CadEndereco.getAtivo: boolean;
begin
  result := self.ativo;
end;

function CadEndereco.getBairro_idBairro: integer;
begin
    result := Self.Bairro_idBairro;
end;

function CadEndereco.getCep: string;
begin
    result := self.cep;
end;

function CadEndereco.getComplemento: string;
begin
    result := self.complemento;
end;

function CadEndereco.getidEndereco: integer;
begin
    result := self.idEndereco;
end;

function CadEndereco.getNumero: Integer;
begin
    result := self.numero;
end;

function CadEndereco.getPessoa_idPessoa: integer;
begin
    result := self.Pessoa_idPessoa;
end;

function CadEndereco.getRua: string;
begin
    result := self.rua;
end;

procedure CadEndereco.setAtivo(ativo: boolean);
begin
    self.ativo := ativo;
end;

procedure CadEndereco.setBairro_idBairro(Bairro_idBairro: integer);
begin
    self.Bairro_idBairro := Bairro_idBairro;
end;

procedure CadEndereco.setCep(cep: string);
begin
    self.cep := cep	;
end;

procedure CadEndereco.setComplemto(complemento: string);
begin
    self.complemento := complemento;
end;

procedure CadEndereco.setIdEndereco(idEndereco: integer);
begin
    self.idEndereco:= idEndereco;
end;

procedure CadEndereco.setnumero(numero: Integer);
begin
    self.numero := numero;
end;

procedure CadEndereco.setPessoa_idPessoa(Pessoa_idPessoa: integer);
begin
    self.Pessoa_idPessoa := Pessoa_idPessoa;
end;

procedure CadEndereco.setRua(rua: string);
begin
    self.rua:= rua;
end;

function CadEndereco.updateEspecifyAddress(idAddress: integer): Boolean;
var
  script: string;
  query: TFDQuery;
begin
  script := 'update endereco set ativo =:ativo where (pessoa_idPessoa = '+IntToStr(self.getPessoa_idPessoa)+' and idEndereco = '+IntToStr(idAddress)+' )';
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;
  query.SQL.Add(script);

  query.ParamByName('ativo').AsBoolean := Self.getAtivo;
  try
    query.ExecSQL; { update service }
    result := true;
    MessageDlg('Alteração do Endereço ligado ao CEP [ '+self.getCep+' ] '+#12+'realizada com sucesso!!!', TMsgDlgType.mtInformation,
    [TMsgDlgBtn.mbYes], 0)
  except
    on e: exception do
    begin
      result := false;
      showMessage('Erro ao alterar dados do contato: ' + Self.getCep + '  ' +
        e.ToString);
    end;

  end;
  query.Close;
  query.Free;
end;

end.
