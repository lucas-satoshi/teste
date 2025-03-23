unit Cabeleleila.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmLogin = class(TForm)
    pnlEsquerda: TPanel;
    pnlPrincipal: TPanel;
    Panel1: TPanel;
    lblNomeAplicacao: TLabel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    edtSenha: TEdit;
    Panel4: TPanel;
    Label3: TLabel;
    edtLogin: TEdit;
    btnEntrar: TButton;
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  Cabeleleila.Model.Usuarios, Cabeleleila.Model.Sistema;

{$R *.dfm}

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('Informe o seu usu�rio.', 'Aten��o', MB_Ok + MB_ICONWARNING);
    Abort;
  end;
  if Trim(edtSenha.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('Informe a sua senha.', 'Aten��o', MB_Ok + MB_ICONWARNING);
    Abort;
  end;
  try
    dmUsuarios.EfetuarLogin(Trim(edtLogin.Text), Trim(edtSenha.Text));
    dmSistema.DataUltimoAcesso(Now);
    dmSistema.UsuarioUltimoAcesso(dmUsuarios.GetUsuarioLogado.Login);
    ModalResult := mrOk;
  except
    on Erro: Exception do
    begin
      Application.MessageBox(PWideChar(Erro.Message), 'Aten��o', MB_Ok + MB_ICONWARNING);
      edtLogin.SetFocus;
    end;
  end;
end;

end.
