unit Cabeleleila.View.Agendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cabeleleila.View.TemplatePadrao,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Cabeleleila.Model.Conexao,
  Cabeleleila.View.Servicos;

type
  TfrmAgendamentos = class(TfrmTemplatePadrao)
    DataSource1: TDataSource;
    btnServicos: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnServicosClick(Sender: TObject);
  private
    procedure LoadRecord;
  public
    { Public declarations }
  end;

var
  frmAgendamentos: TfrmAgendamentos;

implementation

uses
  Cabeleleila.Utilitarios, Cabeleleila.View.AgendamentosCadastro;

{$R *.dfm}

{ TfrmAgendamentos }

procedure TfrmAgendamentos.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if not(dmConexao.sqlAgendamentos.Active) and dmConexao.sqlAgendamentos.IsEmpty then exit;

  frmAgendamentosCadastro := TfrmAgendamentosCadastro.Create(nil);
  try
    frmAgendamentosCadastro.LoadRecord(dmConexao.sqlAgendamentos.FieldByName('ID').AsInteger);
    frmAgendamentosCadastro.ShowModal;
  finally
    FreeAndNil(frmAgendamentosCadastro);
    LoadRecord;
  end;
end;

procedure TfrmAgendamentos.btnExcluirClick(Sender: TObject);
var
  SelectedID: Integer;
begin
  inherited;

  if not(dmConexao.sqlAgendamentos.Active) and dmConexao.sqlAgendamentos.IsEmpty then exit;

  if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  try
    SelectedID := dmConexao.sqlAgendamentos.FieldByName('ID').AsInteger;

    dmConexao.sqlAgendamentos.Close;
    dmConexao.sqlAgendamentos.SQL.Clear;
    dmConexao.sqlAgendamentos.SQL.Text := 'DELETE FROM APPOINTMENT WHERE ID = :ID';
    dmConexao.sqlAgendamentos.ParamByName('ID').AsInteger := SelectedID;
    dmConexao.sqlAgendamentos.ExecSQL;

    LoadRecord;

    ShowMessage('Registro exclu�do com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao excluir o registro: ' + E.Message);
  end;
end;

procedure TfrmAgendamentos.btnIncluirClick(Sender: TObject);
begin
  inherited;
  frmAgendamentosCadastro := TfrmAgendamentosCadastro.Create(nil);
  try
    frmAgendamentosCadastro.LoadRecord(-1);
    frmAgendamentosCadastro.ShowModal;
  finally
    FreeAndNil(frmAgendamentosCadastro);
    LoadRecord;
  end;
end;

procedure TfrmAgendamentos.btnPesquisarClick(Sender: TObject);
var
  FiltroPesquisa : string;
begin
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text, DBGrid1);

  dmConexao.sqlAgendamentos.Close;
  dmConexao.sqlAgendamentos.SQL.Clear;
  dmConexao.sqlAgendamentos.SQL.Add('SELECT APPOINTMENT.ID, APPOINTMENT.USER_ID, ' +
                                    'USER.NAME, APPOINTMENT.SERVICES, APPOINTMENT.DATE, '+
                                    'APPOINTMENT.TIME, APPOINTMENT.STATUS, APPOINTMENT.CREATED_AT '+
                                    'FROM APPOINTMENT LEFT JOIN USER ON ' +
                                    'APPOINTMENT.USER_ID = USER.ID WHERE 1 = 1' + FiltroPesquisa);
  dmConexao.sqlAgendamentos.Open;
  inherited;
end;

procedure TfrmAgendamentos.btnServicosClick(Sender: TObject);
begin
  inherited;
  frmServicos.Show;
end;

procedure TfrmAgendamentos.FormShow(Sender: TObject);
begin
  inherited;
  LoadRecord;
end;

procedure TfrmAgendamentos.LoadRecord;
begin
  dmConexao.sqlAgendamentos.Close;
  dmConexao.sqlAgendamentos.SQL.Clear;
  dmConexao.sqlAgendamentos.SQL.Add('SELECT APPOINTMENT.ID, APPOINTMENT.USER_ID, ' +
                                    'USER.NAME, APPOINTMENT.SERVICES, APPOINTMENT.DATE, '+
                                    'APPOINTMENT.TIME, APPOINTMENT.STATUS, APPOINTMENT.CREATED_AT '+
                                    'FROM APPOINTMENT LEFT JOIN USER ON ' +
                                    'APPOINTMENT.USER_ID = USER.ID');
  dmConexao.sqlAgendamentos.Open;
end;

end.
