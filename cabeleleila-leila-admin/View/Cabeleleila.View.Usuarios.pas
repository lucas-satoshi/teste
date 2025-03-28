unit Cabeleleila.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, Cabeleleila.Model.Usuarios,
  Cabeleleila.View.TemplatePadrao;

type
  TfrmUsuarios = class(TfrmTemplatePadrao)
    DataSource1: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure LoadRecord;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

uses
  Cabeleleila.Utilitarios, Cabeleleila.View.UsuariosCadastro;

{$R *.dfm}

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if not(dmUsuarios.sqlUsuarios.Active) and dmUsuarios.sqlUsuarios.IsEmpty then exit;

  frmUsuariosCadastro := TfrmUsuariosCadastro.Create(nil);
  try
    frmUsuariosCadastro.LoadRecord(dmUsuarios.sqlUsuarios.FieldByName('ID').AsInteger);
    frmUsuariosCadastro.ShowModal;
  finally
    FreeAndNil(frmUsuariosCadastro);
    LoadRecord;
  end;
end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
var
  SelectedID: Integer;
begin
  inherited;

  if not(dmUsuarios.sqlUsuarios.Active) and dmUsuarios.sqlUsuarios.IsEmpty then exit;

  if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  try
    SelectedID := dmUsuarios.sqlUsuarios.FieldByName('ID').AsInteger;

    dmUsuarios.sqlUsuarios.Close;
    dmUsuarios.sqlUsuarios.SQL.Clear;
    dmUsuarios.sqlUsuarios.SQL.Text := 'DELETE FROM USER WHERE ID = :ID';
    dmUsuarios.sqlUsuarios.ParamByName('ID').AsInteger := SelectedID;
    dmUsuarios.sqlUsuarios.ExecSQL;

    LoadRecord;

    ShowMessage('Registro exclu�do com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao excluir o registro: ' + E.Message);
  end;
end;

procedure TfrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;
  frmUsuariosCadastro := TfrmUsuariosCadastro.Create(nil);
  try
    frmUsuariosCadastro.LoadRecord(-1);
    frmUsuariosCadastro.ShowModal;
  finally
    FreeAndNil(frmUsuariosCadastro);
    LoadRecord;
  end;
end;

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
var
  FiltroPesquisa : string;
begin
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text, DBGrid1);

  dmUsuarios.sqlUsuarios.Close;
  dmUsuarios.sqlUsuarios.SQL.Clear;
  dmUsuarios.sqlUsuarios.SQL.Add('SELECT * FROM USER WHERE 1 = 1' + FiltroPesquisa);
  dmUsuarios.sqlUsuarios.Open;
  inherited;
end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  LoadRecord;
end;

procedure TfrmUsuarios.LoadRecord;
begin
  dmUsuarios.sqlUsuarios.Close;
  dmUsuarios.sqlUsuarios.SQL.Clear;
  dmUsuarios.sqlUsuarios.SQL.Add('SELECT * FROM USER');
  dmUsuarios.sqlUsuarios.Open;
end;

end.
