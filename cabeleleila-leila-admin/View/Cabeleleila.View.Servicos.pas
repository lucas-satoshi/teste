unit Cabeleleila.View.Servicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cabeleleila.View.TemplatePadrao,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Cabeleleila.Model.Conexao;

type
  TfrmServicos = class(TfrmTemplatePadrao)
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    procedure LoadRecord;
  public
    { Public declarations }
  end;

var
  frmServicos: TfrmServicos;

implementation

uses
  Cabeleleila.View.ServicosCadastro, Cabeleleila.Utilitarios;

{$R *.dfm}

procedure TfrmServicos.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if not(dmConexao.sqlServicos.Active) and dmConexao.sqlServicos.IsEmpty then exit;

  frmServicosCadastro := TfrmServicosCadastro.Create(nil);
  try
    frmServicosCadastro.LoadRecord(dmConexao.sqlServicos.FieldByName('ID').AsInteger);
    frmServicosCadastro.ShowModal;
  finally
    FreeAndNil(frmServicosCadastro);
    LoadRecord;
  end;
end;

procedure TfrmServicos.btnExcluirClick(Sender: TObject);
var
  SelectedID: Integer;
begin
  inherited;

  if not(dmConexao.sqlServicos.Active) and dmConexao.sqlServicos.IsEmpty then exit;

  if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  try
    SelectedID := dmConexao.sqlServicos.FieldByName('ID').AsInteger;

    dmConexao.sqlServicos.Close;
    dmConexao.sqlServicos.SQL.Clear;
    dmConexao.sqlServicos.SQL.Text := 'DELETE FROM SERVICE WHERE ID = :ID';
    dmConexao.sqlServicos.ParamByName('ID').AsInteger := SelectedID;
    dmConexao.sqlServicos.ExecSQL;

    LoadRecord;

    ShowMessage('Registro exclu�do com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao excluir o registro: ' + E.Message);
  end;
end;

procedure TfrmServicos.btnIncluirClick(Sender: TObject);
begin
  inherited;

  frmServicosCadastro := TfrmServicosCadastro.Create(nil);
  try
    frmServicosCadastro.LoadRecord(-1);
    frmServicosCadastro.ShowModal;
  finally
    FreeAndNil(frmServicosCadastro);
    LoadRecord;
  end;
end;

procedure TfrmServicos.btnPesquisarClick(Sender: TObject);
var
  FiltroPesquisa : string;
begin
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text, DBGrid1);

  dmConexao.sqlServicos.Close;
  dmConexao.sqlServicos.SQL.Clear;
  dmConexao.sqlServicos.SQL.Add('SELECT * FROM SERVICE WHERE 1 = 1' + FiltroPesquisa);
  dmConexao.sqlServicos.Open;
end;

procedure TfrmServicos.FormShow(Sender: TObject);
begin
  inherited;
  LoadRecord;
end;

procedure TfrmServicos.LoadRecord;
begin
  dmConexao.sqlServicos.Close;
  dmConexao.sqlServicos.SQL.Clear;
  dmConexao.sqlServicos.SQL.Add('SELECT * FROM SERVICE');
  dmConexao.sqlServicos.Open;
end;

end.
