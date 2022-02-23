unit Imposto.Log;

interface

type
  TOnImpostoLog = procedure(Value: Variant) of object;

  TImpostoLog = class
  private
    FOnImpostoLog: TOnImpostoLog;
  public
    procedure OnImpostoLog(Value: TOnImpostoLog);
    procedure Logar(Value: Variant);
  end;

  function ImpostoLog: TImpostoLog;

var
  FInstance: TImpostoLog;

implementation

function ImpostoLog: TImpostoLog;
begin
  if not Assigned(FInstance) then
    FInstance := TImpostoLog.Create;
  Result := FInstance;
end;

{ TImpostoLog }

procedure TImpostoLog.Logar(Value: Variant);
begin
  if Assigned(FOnImpostoLog) then
    FOnImpostoLog(Value);
end;

procedure TImpostoLog.OnImpostoLog(Value: TOnImpostoLog);
begin
  FOnImpostoLog := Value;
end;

initialization

finalization
  if Assigned(FInstance) then
    FInstance.Free;

end.
