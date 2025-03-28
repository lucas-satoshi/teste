unit Cabeleleila.View.UsuariosCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cabeleleila.View.TemplateCadastro,
  Vcl.StdCtrls, Vcl.ExtCtrls, Cabeleleila.Model.Usuarios;

type
  TfrmUsuariosCadastro = class(TfrmTemplateCadastro)
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtLogin: TEdit;
    Label4: TLabel;
    edtEmail: TEdit;
    Label1: TLabel;
    edtPhone: TEdit;
    Label5: TLabel;
    edtPassword: TEdit;
    procedure btnSalvarClick(Sender: TObject);
  private
    var
      FID: Integer;
  public
    procedure LoadRecord(const aValueID: integer);
  end;

var
  frmUsuariosCadastro: TfrmUsuariosCadastro;

implementation

{$R *.dfm}

{ TfrmUsuariosCadastro }

procedure TfrmUsuariosCadastro.btnSalvarClick(Sender: TObject);
begin
  inherited;

  if FID = -1 then
  begin
    dmUsuarios.sqlUsuarios.Close;
    dmUsuarios.sqlUsuarios.SQL.Clear;
    dmUsuarios.sqlUsuarios.SQL.Text := 'INSERT INTO USER (NAME, USERNAME, EMAIL, PHONE, PASSWORD) ' +
                                        'VALUES (:NAME, :USERNAME, :EMAIL, :PHONE, :PASSWORD)';

    dmUsuarios.sqlUsuarios.ParamByName('NAME').AsString := Trim(edtNome.Text);
    dmUsuarios.sqlUsuarios.ParamByName('USERNAME').AsString := Trim(edtLogin.Text);
    dmUsuarios.sqlUsuarios.ParamByName('EMAIL').AsString := Trim(edtEmail.Text);
    dmUsuarios.sqlUsuarios.ParamByName('PHONE').AsString := Trim(edtPhone.Text);
    dmUsuarios.sqlUsuarios.ParamByName('PASSWORD').AsString := Trim(edtPassword.Text);

    dmUsuarios.sqlUsuarios.ExecSQL;
    ModalResult := mrOk;
    Exit;
  end;

  dmUsuarios.sqlUsuarios.Close;
  dmUsuarios.sqlUsuarios.SQL.Clear;
  dmUsuarios.sqlUsuarios.SQL.Text := 'UPDATE USER SET NAME = :NAME, USERNAME = :USERNAME, ' +
                                      'EMAIL = :EMAIL, PHONE = :PHONE, PASSWORD = :PASSWORD ' +
                                      'WHERE ID = :ID';

  dmUsuarios.sqlUsuarios.ParamByName('ID').AsInteger := FID;
  dmUsuarios.sqlUsuarios.ParamByName('NAME').AsString := Trim(edtNome.Text);
  dmUsuarios.sqlUsuarios.ParamByName('USERNAME').AsString := Trim(edtLogin.Text);
  dmUsuarios.sqlUsuarios.ParamByName('EMAIL').AsString := Trim(edtEmail.Text);
  dmUsuarios.sqlUsuarios.ParamByName('PHONE').AsString := Trim(edtPhone.Text);
  dmUsuarios.sqlUsuarios.ParamByName('PASSWORD').AsString := Trim(edtPassword.Text);

  dmUsuarios.sqlUsuarios.ExecSQL;
  ModalResult := mrOk;
end;

procedure TfrmUsuariosCadastro.LoadRecord(const aValueID: Integer);
begin
  FID := aValueID;
  if not(aValueID = -1) then
  begin
    dmUsuarios.sqlUsuarios.Close;
    dmUsuarios.sqlUsuarios.SQL.Clear;
    dmUsuarios.sqlUsuarios.SQL.Add('SELECT * FROM USER WHERE ID = :VALUE');
    dmUsuarios.sqlUsuarios.ParamByName('VALUE').AsInteger := aValueID;
    dmUsuarios.sqlUsuarios.Open;

    edtNome.Text := dmUsuarios.sqlUsuarios.FieldByName('NAME').AsString;
    edtLogin.Text := dmUsuarios.sqlUsuarios.FieldByName('USERNAME').AsString;
    edtEmail.Text := dmUsuarios.sqlUsuarios.FieldByName('EMAIL').AsString;
    edtPhone.Text := dmUsuarios.sqlUsuarios.FieldByName('PHONE').AsString;
    edtPassword.Text := dmUsuarios.sqlUsuarios.FieldByName('PASSWORD').AsString;
  end;
end;

end.
