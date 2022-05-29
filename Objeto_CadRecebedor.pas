unit Objeto_CadRecebedor;

interface
 uses
    FireDAC.Comp.Client, Unit_Dados, System.SysUtils, Vcl.Dialogs;
  type CadRecebedor = class
    private
    idRecebedor:integer;
    pessoaIdPessoa:integer;

    public
      procedure setidRecebedor(idRecebedor: integer);
      function getidRecebedor: integer;
      procedure setPessoa_idPessoa (pessoaIdPessoa:integer);
      function getPessoa_idPessoa: integer;

      function insertDados:Boolean;
  end;

implementation

{ CadRecebedor }

function CadRecebedor.getidRecebedor: integer;
begin
   result := self.idRecebedor;
end;

function CadRecebedor.getPessoa_idPessoa: integer;
begin
    result := self.pessoaIdPessoa;
end;

function CadRecebedor.insertDados: Boolean;
var
    query:TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm_ProjetoFinal.FDFinal;

  query.SQL.Add('insert into recebedor values( 0, :pessoa_idPessoa)');

  query.ParamByName('pessoa_idPessoa').AsInteger := self.pessoaIdPessoa;

      try
        query.ExecSQL;  {Insert service}
        result := true;
      except
        on e:exception do
        begin
          Result := false;
          showMessage('Erro ao incluir Recebedor/Destinatario... : ' + IntToStr(self.pessoaIdPessoa)+'  '+ e.ToString);
        end;

      end;
      query.Close;
      query.Free;

end;

procedure CadRecebedor.setidRecebedor(idRecebedor: integer);
begin
    self.idRecebedor := idRecebedor;
end;

procedure CadRecebedor.setPessoa_idPessoa(pessoaIdPessoa: integer);
begin
    self.pessoaIdPessoa := pessoaIdPessoa;
end;

end.
