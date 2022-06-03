unit Unit_ControleFuncionario;

interface
uses System.SysUtils,Winapi.Messages,Objeto_CadFuncionario,Vcl.Controls,Vcl.Dialogs,
     Objeto_CadPessoa,Unit_Controle,Form_CadPedido;
  type
  TControle_Funcionario = class
    public
    procedure getCadFuncionario;
    procedure getConsultaPessoas;
    procedure cadastrarPessoa;
    procedure cadastrarPessoaFisica(id:integer);    //>>
    procedure alterarPessoaFisica(id:integer);
    procedure cadastrarFuncionario(id:integer);
    procedure populaComboCbPessoa;

    private
        function verifyValueOfId(lastId, tag:integer):integer;
        function setScriptCbMotorista: String;
  end;
  var
  VCadPessoa:CadPessoa;
  VCadFuncionario: CadFuncionario;
  id_pessoaFisica:integer;



implementation

{ TControle_Funcionario }

uses Form_CadPessoa,
     Objeto_CadPessoaFisica,
     Objeto_CadPessoaJuridica,
     Objeto_CadCliente, Form_Consulta, Form_CadFuncionario, Unit_Dados,
  Form_CadEntrega;

     var
       VCadPessoaFisica:CadPessoaFisica;

procedure TControle_Funcionario.alterarPessoaFisica(id: integer);
begin
    VCadPessoaFisica:=CadPessoaFisica.Create;

    VCadPessoaFisica.setcpf(frm_Funcionario.edCpfCnpj.Text);
    VCadPessoaFisica.setPessoa_idPessoa(id);

    VCadPessoaFisica.updateDados;

end;

procedure TControle_Funcionario.cadastrarFuncionario(id:integer);
begin
    VCadFuncionario := CadFuncionario.Create;
    VCadFuncionario.setPis(frm_Funcionario.edPis.Text);
    VCadFuncionario.setCnh(frm_Funcionario.edCnh.Text);
    VCadFuncionario.setpessoa_fisica_idPessoa(id);
    VCadFuncionario.insertDados;
    ShowMessage('Cadastro reaalizado com sucesso!!!');
end;

procedure TControle_Funcionario.cadastrarPessoa;
begin

VCadPessoa := CadPessoa.Create;
    VCadPessoa.setnome(frm_Funcionario.edNome.Text);
      if (frm_Funcionario.spSalvar.Tag <> 0) then
        begin
          VCadPessoa.setidPessoa(frm_Funcionario.spSalvar.Tag);
          VCadPessoa.updateDados;
        end
        else
          VCadPessoa.insertDados;
end;

procedure TControle_Funcionario.cadastrarPessoaFisica(id:integer);
begin
    VCadPessoaFisica:=CadPessoaFisica.Create;
    VCadPessoaFisica.setcpf(frm_Funcionario.edCpfCnpj.Text);
    VCadPessoaFisica.setPessoa_idPessoa(id);

    VCadPessoaFisica.insertDados;

end;

procedure TControle_Funcionario.getCadFuncionario;
var
    idTemp:integer;
    tagId:integer;
begin
  if (frm_Funcionario = nil) then
     frm_Funcionario := Tfrm_Funcionario.Create(nil);

     if (frm_Funcionario.ShowModal = mrOk) then
     begin

        case(frm_Funcionario.getFuncao)of
          1:begin
          tagId:=frm_Funcionario.spSalvar.Tag;
              self.cadastrarPessoa;
              if (tagId <> 0) then
              begin
                 self.alterarPessoaFisica(tagId);
                 self.cadastrarFuncionario(VCadPessoaFisica.verifyCadPerson(tagId))
              end
                else
                  begin
                     self.cadastrarPessoaFisica(VCadPessoa.getLastId);
                     self.cadastrarFuncionario(VCadPessoaFisica.getLastId());
                  end;



          end;
          2:begin

          end;
        end;
        VCadFuncionario.Free;
        VCadPessoa.Free;
        VCadFuncionario.Free;
        VCadPessoaFisica.Free;
        VCadEstado.Free;
        VCadCidade.Free;
        VCadBairro.Free;
        VCadEndereco.Free;
     end;
     FreeAndNil(frm_Funcionario)



end;

procedure TControle_Funcionario.getConsultaPessoas;
begin
   if frm_Consulta = nil then
      frm_Consulta := Tfrm_Consulta.Create(nil);
  if frm_Pedido <> nil then
    begin
    frm_Consulta.setSelectSQL('SELECT p.idPessoa as "N� Registro", p.nome as "Nome", e.cep as "CEP", e.rua as "Rua" ' +
    ' FROM logistica_ads.pessoa p, logistica_ads.endereco e where p.idPessoa = e.pessoa_idPessoa;');
        if frm_Consulta.ShowModal = mrOk then
        begin
          frm_Pedido.edDestinatario.Text := dm_ProjetoFinal.qrConsulta.Fields[1].AsString;
        end;
    end
    else
    begin
        frm_Consulta.setSelectSQL('SELECT p.idPessoa as "N� de Registro", nome, cpf as CPF FROM pessoa p ,'+
        ' pessoa_fisica pf where pf.pessoa_idPessoa = p.idPessoa order by idPessoa asc');
        if frm_Consulta.ShowModal = mrOk then
         if frm_Consulta.ShowModal = mrOk then
            begin
              frm_Funcionario.spSalvar.Tag :=dm_ProjetoFinal.qrConsulta.Fields[0].AsInteger;
              frm_Funcionario.edNome.Text := dm_ProjetoFinal.qrConsulta.Fields[1].AsString;
              frm_Funcionario.edCpfCnpj.Text := dm_ProjetoFinal.qrConsulta.Fields[2].AsString;
              FreeAndNil(frm_Consulta);
            end
    end;

    dm_ProjetoFinal.qrConsulta.Close;
    dm_ProjetoFinal.qrConsulta.SQL.Clear;






end;

procedure TControle_Funcionario.populaComboCbPessoa;
begin
    dm_ProjetoFinal.qrConsulta.Close;
    dm_ProjetoFinal.qrConsulta.SQL.Clear;
    dm_ProjetoFinal.qrConsulta.SQL.Add(self.setScriptCbMotorista);
       ShowMessage(self.setScriptCbMotorista);
    try
      dm_ProjetoFinal.qrConsulta.Open;
      dm_ProjetoFinal.qrConsulta.First;

      while not dm_ProjetoFinal.qrConsulta.Eof  do
    begin
      frm_carga.cbMotoristaEntrega.Items.Add(dm_ProjetoFinal.qrConsulta.FieldByName('nome').AsString);
      dm_ProjetoFinal.qrConsulta.Next;
    end;
    finally

    end;
    dm_ProjetoFinal.qrConsulta.Close;
end;

function TControle_Funcionario.setScriptCbMotorista: String;
begin
     result := 'SELECT * FROM logistica_ads.funcionario f, pessoa p, pessoa_fisica pf where pf.pessoa_idPessoa = p.idPessoa and f.pessoa_fisica_idpessoa_fisica = pf.pessoa_idPessoa order by p.nome';
end;

function TControle_Funcionario.verifyValueOfId(lastId, tag: integer): integer;
begin

  if(tag <> 0)then
    result := tag
  else
    result:=lastid;
end;

end.
