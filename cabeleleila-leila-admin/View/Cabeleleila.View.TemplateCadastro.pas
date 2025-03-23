unit Cabeleleila.View.TemplateCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmTemplateCadastro = class(TForm)
    CardCadastro: TPanel;
    Panel1: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemplateCadastro: TfrmTemplateCadastro;

implementation

{$R *.dfm}

procedure TfrmTemplateCadastro.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
