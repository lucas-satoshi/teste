unit Cabeleleila.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnUser: TButton;
    btnAppointment: TButton;
    btnReport: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnAppointmentClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Cabeleleila.View.Login, Cabeleleila.Model.Usuarios,
  Cabeleleila.View.Usuarios, Cabeleleila.View.Agendamentos,
  Cabeleleila.View.RelatorioSemanal;

{$R *.dfm}

procedure TfrmPrincipal.btnAppointmentClick(Sender: TObject);
begin
  frmAgendamentos.Show;
end;

procedure TfrmPrincipal.btnReportClick(Sender: TObject);
begin
  frmRelatorioSemanal.Show;
end;

procedure TfrmPrincipal.btnUserClick(Sender: TObject);
begin
  frmUsuarios.Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create(nil);
  try
    frmLogin.ShowModal;
    if frmLogin.ModalResult <> mrOk then
      Application.Terminate;
  finally
    FreeAndNil(frmLogin);
  end;
  StatusBar1.Panels.Items[1].Text := 'Usu�rio: ' + dmUsuarios.GetUsuarioLogado.Nome;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(Now);
end;

end.
