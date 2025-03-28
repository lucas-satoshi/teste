unit Cabeleleila.View.RelatorioSemanal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cabeleleila.View.TemplatePadrao,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Cabeleleila.Model.Conexao;

type
  TfrmRelatorioSemanal = class(TfrmTemplatePadrao)
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioSemanal: TfrmRelatorioSemanal;

implementation

uses
  Cabeleleila.Utilitarios;

{$R *.dfm}

procedure TfrmRelatorioSemanal.btnPesquisarClick(Sender: TObject);
var
  FiltroPesquisa : string;
begin
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text, DBGrid1);

  dmConexao.sqlRelatorio.Close;
  dmConexao.sqlRelatorio.SQL.Clear;
  dmConexao.sqlRelatorio.SQL.Add('SELECT STRFTIME(''%Y-%m-%d'', DATE, ''-'' || (STRFTIME(''%w'', DATE) - 1) || '' days'') AS SEMANA, ' +
                                    'COUNT(ID) AS TOTAL_AGENDAMENTOS, '+
                                    'SUM(CASE WHEN STATUS = ''aguardando'' THEN 1 ELSE 0 END) AS TOTAL_AGUARDANDO, ' +
                                    'SUM(CASE WHEN STATUS = ''confirmado'' THEN 1 ELSE 0 END) AS TOTAL_CONFIRMADO, ' +
                                    'SUM(CASE WHEN STATUS = ''finalizado'' THEN 1 ELSE 0 END) AS TOTAL_FINALIZADO, ' +
                                    'SUM(CASE WHEN STATUS = ''cancelado'' THEN 1 ELSE 0 END) AS TOTAL_CANCELADO ' +
                                    'FROM APPOINTMENT WHERE 1 = 1' + FiltroPesquisa +
                                    ' GROUP BY STRFTIME(''%Y-%m-%d'', DATE, ''-'' || (STRFTIME(''%w'', DATE) - 1) || '' days'') ORDER BY SEMANA DESC');

  dmConexao.sqlRelatorio.Open;
  inherited;
end;

procedure TfrmRelatorioSemanal.FormShow(Sender: TObject);
begin
  inherited;
  dmConexao.sqlRelatorio.Close;
  dmConexao.sqlRelatorio.SQL.Clear;
  dmConexao.sqlRelatorio.SQL.Add('SELECT STRFTIME(''%Y-%m-%d'', DATE, ''-'' || (STRFTIME(''%w'', DATE) - 1) || '' days'') AS SEMANA, ' +
                                    'COUNT(ID) AS TOTAL_AGENDAMENTOS, '+
                                    'SUM(CASE WHEN STATUS = ''aguardando'' THEN 1 ELSE 0 END) AS TOTAL_AGUARDANDO, ' +
                                    'SUM(CASE WHEN STATUS = ''confirmado'' THEN 1 ELSE 0 END) AS TOTAL_CONFIRMADO, ' +
                                    'SUM(CASE WHEN STATUS = ''finalizado'' THEN 1 ELSE 0 END) AS TOTAL_FINALIZADO, ' +
                                    'SUM(CASE WHEN STATUS = ''cancelado'' THEN 1 ELSE 0 END) AS TOTAL_CANCELADO ' +
                                    'FROM APPOINTMENT GROUP BY ' +
                                    'STRFTIME(''%Y-%m-%d'', DATE, ''-'' || (STRFTIME(''%w'', DATE) - 1) || '' days'') ORDER BY SEMANA DESC');
  dmConexao.sqlRelatorio.Open;
end;

end.
