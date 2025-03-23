unit Cabeleleila.Controller.Usuario;

interface

type
  TControllerUsuario = class
  private
    FLogin: String;
    FNome: String;
    FID: String;
    procedure SetID(const Value: String);
    procedure SetLogin(const Value: String);
    procedure SetNome(const Value: String);
  public
    property Nome : String read FNome write SetNome;
    property Login : String read FLogin write SetLogin;
    property ID : String read FID write SetID;
  end;

implementation

{ TControllerUsuario }

procedure TControllerUsuario.SetID(const Value: String);
begin
  FID := Value;
end;

procedure TControllerUsuario.SetLogin(const Value: String);
begin
  FLogin := Value;
end;

procedure TControllerUsuario.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
