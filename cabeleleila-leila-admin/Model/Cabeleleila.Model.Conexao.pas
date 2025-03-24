unit Cabeleleila.Model.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBLiteDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TdmConexao = class(TDataModule)
    SQLConexao: TFDConnection;
    sqlAgendamentos: TFDQuery;
    sqlServicos: TFDQuery;
    sqlRelatorio: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    const ARQUIVOCONFIGURACAO = 'cabeleleila_admin.cfg';
  public
    procedure CarregarConfiguracoes;
    procedure Conectar;
    procedure Desconectar;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.CarregarConfiguracoes;
var
  ParametroNome : String;
  ParametroValor : String;
  Contador : Integer;
  ListaParametros : TStringList;
begin
  SQLConexao.Params.Clear;
  if not FileExists(ARQUIVOCONFIGURACAO) then
    raise Exception.Create('Arquivo de configuração não encontrado');
  ListaParametros := TStringList.Create;
  try
    ListaParametros.LoadFromFile(ARQUIVOCONFIGURACAO);
    for Contador := 0 to Pred(ListaParametros.Count) do
    begin
      if ListaParametros[Contador].IndexOf('=') > 0 then
      begin
        ParametroNome := ListaParametros[Contador].Split(['='])[0].Trim;
        ParametroValor := ListaParametros[Contador].Split(['='])[1].Trim;
        SQLConexao.Params.Add(ParametroNome + '=' + ParametroValor);
      end;
    end;
  finally
    ListaParametros.Free;
  end;
end;

procedure TdmConexao.Conectar;
begin
  SQLConexao.Connected;
end;

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  CarregarConfiguracoes;
  Conectar;
end;

procedure TdmConexao.Desconectar;
begin
  SQLConexao.Connected := False;
end;

end.
