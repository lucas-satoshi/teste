unit Cabeleleila.Utilitarios;

interface

uses
  Vcl.DBGrids, FireDAC.Stan.Param, Vcl.Grids, System.Types;
type
  TUtilitarios = class
    class function GetID : String;
    class function LikeFind(Pesquisa : string; Grid : TDBGrid) : string;
  end;

implementation

uses
  System.SysUtils, Vcl.StdCtrls, System.Math;

class function TUtilitarios.GetID: String;
begin

end;

class function TUtilitarios.LikeFind(Pesquisa: string; Grid: TDBGrid): string;
var
  LContador : Integer;
begin
  Result := '';
  if Pesquisa.Trim.IsEmpty then
    exit;
  for LContador := 0 to Pred(Grid.Columns.Count) do
    Result := Result + Grid.Columns.Items[LContador].FieldName +
      ' LIKE ' + QuotedStr('%' + Trim(Pesquisa) + '%') + ' OR ';
  Result := ' AND (' + Copy(Result, 1, Length(Result) - 4) + ')';
end;

end.
