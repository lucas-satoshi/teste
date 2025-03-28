unit Cabeleleila.View.ServicosCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cabeleleila.View.TemplateCadastro,
  Vcl.StdCtrls, Vcl.ExtCtrls, Cabeleleila.Model.Conexao;

type
  TfrmServicosCadastro = class(TfrmTemplateCadastro)
    Label2: TLabel;
    edtName: TEdit;
    Label3: TLabel;
    edtDuration: TEdit;
    procedure btnSalvarClick(Sender: TObject);
  private
    var
      FID: Integer;
  public
    procedure LoadRecord(const aValueID: integer);
  end;

var
  frmServicosCadastro: TfrmServicosCadastro;

implementation

{$R *.dfm}

uses Cabeleleila.Model.Usuarios;

{ TfrmServicosCadastro }

procedure TfrmServicosCadastro.btnSalvarClick(Sender: TObject);
begin
  inherited;

  if FID = -1 then
  begin
    dmConexao.sqlServicos.Close;
    dmConexao.sqlServicos.SQL.Clear;
    dmConexao.sqlServicos.SQL.Text := 'INSERT INTO SERVICE (NAME, DURATION) ' +
                                        'VALUES (:NAME, :DURATION)';

    dmConexao.sqlServicos.ParamByName('NAME').AsString := Trim(edtName.Text);
    dmConexao.sqlServicos.ParamByName('DURATION').AsInteger := StrToInt(edtDuration.Text);

    dmConexao.sqlServicos.ExecSQL;
    ModalResult := mrOk;
    Exit;
  end;

  dmConexao.sqlServicos.Close;
  dmConexao.sqlServicos.SQL.Clear;
  dmConexao.sqlServicos.SQL.Text := 'UPDATE SERVICE SET NAME = :NAME, DURATION = :DURATION ' +
                                      'WHERE ID = :ID';

  dmConexao.sqlServicos.ParamByName('ID').AsInteger := FID;
  dmConexao.sqlServicos.ParamByName('NAME').AsString := Trim(edtName.Text);
  dmConexao.sqlServicos.ParamByName('DURATION').AsInteger := StrToInt(edtDuration.Text);

  dmConexao.sqlServicos.ExecSQL;
  ModalResult := mrOk;
end;

procedure TfrmServicosCadastro.LoadRecord(const aValueID: integer);
begin
  FID := aValueID;
  if not(aValueID = -1) then
  begin
    dmConexao.sqlServicos.Close;
    dmConexao.sqlServicos.SQL.Clear;
    dmConexao.sqlServicos.SQL.Add('SELECT * FROM SERVICE WHERE ID = :VALUE');
    dmConexao.sqlServicos.ParamByName('VALUE').AsInteger := aValueID;
    dmConexao.sqlServicos.Open;

    edtName.Text := dmConexao.sqlServicos.FieldByName('NAME').AsString;
    edtDuration.Text := dmConexao.sqlServicos.FieldByName('DURATION').AsString;
  end;
end;

end.
