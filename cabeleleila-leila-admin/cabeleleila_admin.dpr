program cabeleleila_admin;

uses
  Vcl.Forms,
  Cabeleleila.View.Principal in 'View\Cabeleleila.View.Principal.pas' {frmPrincipal},
  Cabeleleila.View.Login in 'View\Cabeleleila.View.Login.pas' {frmLogin},
  Cabeleleila.Model.Conexao in 'Model\Cabeleleila.Model.Conexao.pas' {dmConexao: TDataModule},
  Cabeleleila.Model.Sistema in 'Model\Cabeleleila.Model.Sistema.pas' {dmSistema: TDataModule},
  Cabeleleila.Model.Usuarios in 'Model\Cabeleleila.Model.Usuarios.pas' {dmUsuarios: TDataModule},
  Cabeleleila.Controller.Usuario in 'Controller\Cabeleleila.Controller.Usuario.pas',
  Cabeleleila.View.TemplatePadrao in 'View\Cabeleleila.View.TemplatePadrao.pas' {frmTemplatePadrao},
  Cabeleleila.View.TemplateCadastro in 'View\Cabeleleila.View.TemplateCadastro.pas' {frmTemplateCadastro},
  Cabeleleila.View.Usuarios in 'View\Cabeleleila.View.Usuarios.pas' {frmUsuarios},
  Cabeleleila.Utilitarios in 'Utils\Cabeleleila.Utilitarios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TdmSistema, dmSistema);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmTemplatePadrao, frmTemplatePadrao);
  Application.CreateForm(TfrmTemplateCadastro, frmTemplateCadastro);
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.Run;
end.
