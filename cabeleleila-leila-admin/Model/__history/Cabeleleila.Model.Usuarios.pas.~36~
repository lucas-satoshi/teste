unit Cabeleleila.Model.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Cabeleleila.Model.Conexao, Cabeleleila.Controller.Usuario;

type
  TdmUsuarios = class(TDataModule)
    sqlUsuarios: TFDQuery;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    cdsUsuariosid: TIntegerField;
    cdsUsuariosname: TStringField;
    cdsUsuariosusername: TStringField;
    cdsUsuariosemail: TStringField;
    cdsUsuariosphone: TStringField;
    cdsUsuariospassword: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FEntidadeUsuario : TControllerUsuario;
  public
    function TemLoginCadastrado(Login : String; ID : String) : Boolean;
    procedure EfetuarLogin(Login : String; Senha : String);
    function GetUsuarioLogado : TControllerUsuario;
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmUsuarios }

procedure TdmUsuarios.DataModuleCreate(Sender: TObject);
begin
  FEntidadeUsuario := TControllerUsuario.Create;
end;

procedure TdmUsuarios.DataModuleDestroy(Sender: TObject);
begin
  FEntidadeUsuario.Free;
end;

procedure TdmUsuarios.EfetuarLogin(Login, Senha: String);
var
  SQLConsulta : TFDQuery;
begin
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT * FROM USER WHERE USERNAME = :LOGIN AND PASSWORD = :SENHA');
    SQLConsulta.ParamByName('LOGIN').AsString := Login;
    SQLConsulta.ParamByName('SENHA').AsString := Senha;
    SQLConsulta.Open;

    if SQLConsulta.IsEmpty then
      raise Exception.Create('Usuário e/ou senha inválidos');

    FEntidadeUsuario.ID := SQLConsulta.FieldByName('ID').AsString;
    FEntidadeUsuario.Nome := SQLConsulta.FieldByName('NAME').AsString;
    FEntidadeUsuario.Login := SQLConsulta.FieldByName('USERNAME').AsString;
  finally
    SQLConsulta.Close;
    SQLConsulta.Free;
  end;
end;

function TdmUsuarios.GetUsuarioLogado: TControllerUsuario;
begin
  Result := FEntidadeUsuario;
end;

function TdmUsuarios.TemLoginCadastrado(Login, ID: String): Boolean;
var
  SQLConsulta : TFDQuery;
begin
  Result := false;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT ID FROM USER WHERE USERNAME = :LOGIN');
    SQLConsulta.ParamByName('LOGIN').AsString := Login;
    SQLConsulta.Open;
    if not SQLConsulta.IsEmpty then
      Result := SQLConsulta.FieldByName('ID').AsString <> ID;
  finally
    SQLConsulta.Close;
    SQLConsulta.Free;
  end;
end;

end.
