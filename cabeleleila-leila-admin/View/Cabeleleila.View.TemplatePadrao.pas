unit Cabeleleila.View.TemplatePadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmTemplatePadrao = class(TForm)
    CardPesquisa: TPanel;
    pnlPesquisarBotoes: TPanel;
    btnFechar: TButton;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    PnlPesquisa: TPanel;
    Label1: TLabel;
    edtPesquisar: TEdit;
    btnPesquisar: TButton;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemplatePadrao: TfrmTemplatePadrao;

implementation

{$R *.dfm}

procedure TfrmTemplatePadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTemplatePadrao.FormCreate(Sender: TObject);
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

end.
