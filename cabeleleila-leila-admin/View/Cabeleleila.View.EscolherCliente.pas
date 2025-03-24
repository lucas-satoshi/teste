unit Cabeleleila.View.EscolherCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Cabeleleila.Model.Usuarios;

type
  TfrmEscolherCliente = class(TForm)
    DBGrid1: TDBGrid;
    btnEscolher: TButton;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnEscolherClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolherCliente: TfrmEscolherCliente;

implementation

uses
  Cabeleleila.View.AgendamentosCadastro;

{$R *.dfm}

procedure TfrmEscolherCliente.btnEscolherClick(Sender: TObject);
begin
  frmAgendamentosCadastro.GetNewID(dmUsuarios.sqlUsuarios.FieldByName('ID').AsInteger);
  ModalResult := mrOk;
end;

procedure TfrmEscolherCliente.FormCreate(Sender: TObject);
const
  FONT_SIZE = 10;
begin
  DBGrid1.Font.Size := FONT_SIZE;
  DBGrid1.Font.Name := 'Roboto';
  DBGrid1.Font.Color := $004B4B4B;

  DBGrid1.TitleFont.Name := 'Roboto';
  DBGrid1.TitleFont.Size := (FONT_SIZE  + 1);

  DBGrid1.Options := [dgTitles, dgIndicator, dgColumnResize,
              dgConfirmDelete, dgCancelOnExit, dgTitleClick];

  DBGrid1.DrawingStyle := gdsThemed;
end;

procedure TfrmEscolherCliente.FormShow(Sender: TObject);
begin
  dmUsuarios.sqlUsuarios.Close;
  dmUsuarios.sqlUsuarios.SQL.Clear;
  dmUsuarios.sqlUsuarios.SQL.Add('SELECT * FROM USER');
  dmUsuarios.sqlUsuarios.Open;
end;

end.
