unit Cabeleleila.View.AgendamentosCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cabeleleila.View.TemplateCadastro,
  Vcl.StdCtrls, Vcl.ExtCtrls, RxSpin, Vcl.Mask, RxToolEdit, Cabeleleila.Model.Conexao,
  Cabeleleila.Model.Usuarios, Vcl.ComCtrls;

type
  TfrmAgendamentosCadastro = class(TfrmTemplateCadastro)
    Label2: TLabel;
    Label3: TLabel;
    edtServices: TEdit;
    Label4: TLabel;
    Label1: TLabel;
    edtNome: TEdit;
    edtDate: TDateEdit;
    rgStatus: TRadioGroup;
    edtTime: TDateTimePicker;
    procedure btnSalvarClick(Sender: TObject);
  private
    var
      FID: Integer;
      FUserID: Integer;
  public
    procedure LoadRecord(const aValueID: integer);
    procedure GetNewID(const aValueUserID: Integer);
  end;

var
  frmAgendamentosCadastro: TfrmAgendamentosCadastro;

implementation

uses
  Cabeleleila.View.EscolherCliente;

{$R *.dfm}

{ TfrmAgendamentosCadastro }

procedure TfrmAgendamentosCadastro.btnSalvarClick(Sender: TObject);
begin
  inherited;

  if FID = -1 then
  begin
    dmConexao.sqlAgendamentos.Close;
    dmConexao.sqlAgendamentos.SQL.Clear;
    dmConexao.sqlAgendamentos.SQL.Text := 'INSERT INTO APPOINTMENT (USER_ID, SERVICES, DATE, TIME, STATUS, CREATED_AT) ' +
                                          'VALUES (:USER_ID, :SERVICES, :DATE, :TIME, :STATUS, :CREATED_AT)';

    dmConexao.sqlAgendamentos.ParamByName('USER_ID').AsInteger := FUserID;
    dmConexao.sqlAgendamentos.ParamByName('SERVICES').AsString := Trim(edtServices.Text);
    dmConexao.sqlAgendamentos.ParamByName('DATE').AsDateTime := StrToDate(edtDate.Text);
    dmConexao.sqlAgendamentos.ParamByName('TIME').AsString := TimeToStr(edtTime.Time);

    case rgStatus.ItemIndex of
      0: dmConexao.sqlAgendamentos.ParamByName('STATUS').AsString := 'confirmado';
      1: dmConexao.sqlAgendamentos.ParamByName('STATUS').AsString := 'cancelado';
      2: dmConexao.sqlAgendamentos.ParamByName('STATUS').AsString := 'finalizado';
    end;

    dmConexao.sqlAgendamentos.ParamByName('CREATED_AT').AsDateTime := Now;

    dmConexao.sqlAgendamentos.ExecSQL;
    ModalResult := mrOk;
    Exit;
  end;

  dmConexao.sqlAgendamentos.Close;
  dmConexao.sqlAgendamentos.SQL.Clear;
  dmConexao.sqlAgendamentos.SQL.Text := 'UPDATE APPOINTMENT SET SERVICES = :SERVICES, ' +
                                        'DATE = :DATE, TIME = :TIME, STATUS = :STATUS ' +
                                        'WHERE ID = :ID';

  dmConexao.sqlAgendamentos.ParamByName('ID').AsInteger := FID;
  dmConexao.sqlAgendamentos.ParamByName('SERVICES').AsString := Trim(edtServices.Text);
  dmConexao.sqlAgendamentos.ParamByName('DATE').AsDateTime := StrToDate(edtDate.Text);
  dmConexao.sqlAgendamentos.ParamByName('TIME').AsString := TimeToStr(edtTime.Time);

  case rgStatus.ItemIndex of
    0: dmConexao.sqlAgendamentos.ParamByName('STATUS').AsString := 'confirmado';
    1: dmConexao.sqlAgendamentos.ParamByName('STATUS').AsString := 'cancelado';
    2: dmConexao.sqlAgendamentos.ParamByName('STATUS').AsString := 'finalizado';
  end;

  dmConexao.sqlAgendamentos.ExecSQL;
  ModalResult := mrOk;
end;

procedure TfrmAgendamentosCadastro.GetNewID(const aValueUserID: Integer);
begin
  FUserID := aValueUserID;
end;

procedure TfrmAgendamentosCadastro.LoadRecord(const aValueID: integer);
begin
  FID := aValueID;
  if not(aValueID = -1) then
  begin
    dmConexao.sqlAgendamentos.Close;
    dmConexao.sqlAgendamentos.SQL.Clear;
    dmConexao.sqlAgendamentos.SQL.Add('SELECT ' +
                                      'USER.NAME, APPOINTMENT.SERVICES, APPOINTMENT.DATE, '+
                                      'APPOINTMENT.TIME, APPOINTMENT.STATUS '+
                                      'FROM APPOINTMENT LEFT JOIN USER ON ' +
                                      'APPOINTMENT.USER_ID = USER.ID WHERE APPOINTMENT.ID = :VALUE');
    dmConexao.sqlAgendamentos.ParamByName('VALUE').AsInteger := aValueID;
    dmConexao.sqlAgendamentos.Open;

    edtNome.Text := dmConexao.sqlAgendamentos.FieldByName('NAME').AsString;
    edtServices.Text := dmConexao.sqlAgendamentos.FieldByName('SERVICES').AsString;
    edtDate.Text := dmConexao.sqlAgendamentos.FieldByName('DATE').AsString;
    edtTime.Time := dmConexao.sqlAgendamentos.FieldByName('TIME').AsDateTime;

    if dmConexao.sqlAgendamentos.FieldByName('STATUS').AsString = 'confirmado' then
      rgStatus.ItemIndex := 0;

    if dmConexao.sqlAgendamentos.FieldByName('STATUS').AsString = 'cancelado' then
      rgStatus.ItemIndex := 1;

    if dmConexao.sqlAgendamentos.FieldByName('STATUS').AsString = 'finalizado' then
      rgStatus.ItemIndex := 2;

    exit;
  end;

  frmEscolherCliente := TfrmEscolherCliente.Create(nil);
  try
    frmEscolherCliente.ShowModal;
  finally
    FreeAndNil(frmEscolherCliente);
    dmUsuarios.sqlUsuarios.Close;
    dmUsuarios.sqlUsuarios.SQL.Clear;
    dmUsuarios.sqlUsuarios.SQL.Add('SELECT * FROM USER WHERE ID = :VALUE');
    dmUsuarios.sqlUsuarios.ParamByName('VALUE').AsInteger := FUserID;
    dmUsuarios.sqlUsuarios.Open;

    edtNome.Text := dmUsuarios.sqlUsuarios.FieldByName('NAME').AsString;
  end;
end;

end.
