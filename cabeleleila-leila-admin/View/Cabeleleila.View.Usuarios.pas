unit Cabeleleila.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, Cabeleleila.Model.Usuarios,
  Cabeleleila.View.TemplatePadrao;

type
  TfrmUsuarios = class(TfrmTemplatePadrao)
    DataSource1: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

uses
  Cabeleleila.Utilitarios;

{$R *.dfm}

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
var
  FiltroPesquisa : string;
begin
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text, DBGrid1);

  dmUsuarios.sqlUsuarios.Close;
  dmUsuarios.sqlUsuarios.SQL.Clear;
  dmUsuarios.sqlUsuarios.SQL.Add('Select * from User where 1 = 1' + FiltroPesquisa);
  dmUsuarios.sqlUsuarios.Open;

//  dmUsuarios.cdsUsuarios.Close;
//  dmUsuarios.cdsUsuarios.CommandText := 'Select * from User where 1 = 1' + FiltroPesquisa;
//  dmUsuarios.cdsUsuarios.Open;
  inherited;
end;

end.
