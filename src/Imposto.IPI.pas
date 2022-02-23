unit Imposto.IPI;

interface

uses
  Imposto.Utils,
  Imposto.Contract,
  Imposto.IPI.IPI50;

type
  TImpostoIPI = class(TInterfacedObject, iImpostoIPI)
    constructor Create(AImpostoItem: iImpostoItem);
    destructor Destroy; override;
    class function New(AImpostoItem: iImpostoItem): iImpostoIPI;
  private
    [weak]
    FImpostoItem: iImpostoItem;

    FCST           : TCSTIpi;
    FAliquotaIPI   : Extended;
  public
    function CST(const Value: TCSTIpi): iImpostoIPI;

    function AliquotaIPI(const Value: Extended): iImpostoIPI; overload;
    function AliquotaIPI: Extended; overload;

    function ValorIPI: Extended; overload;

    function Retorno: iImpostoItem;
  end;

implementation

{ TImpostoIPI }

constructor TImpostoIPI.Create(AImpostoItem: iImpostoItem);
begin
  FImpostoItem := AImpostoItem;

  FAliquotaIPI  := 0;
end;

destructor TImpostoIPI.Destroy;
begin

  inherited;
end;

class function TImpostoIPI.New(AImpostoItem: iImpostoItem): iImpostoIPI;
begin
  Result := Self.Create(AImpostoItem);
end;

function TImpostoIPI.CST(const Value: TCSTIpi): iImpostoIPI;
begin
  Result := Self;
  FCST  := Value;

  if FImpostoItem.Retorno.CRT in [crtSimplesNacional] then
    FCST := ipiVazio;
end;

function TImpostoIPI.AliquotaIPI(const Value: Extended): iImpostoIPI;
begin
  Result := Self;
  FAliquotaIPI := Value;
end;

function TImpostoIPI.AliquotaIPI: Extended;
begin
  Result := FAliquotaIPI;
end;

function TImpostoIPI.ValorIPI: Extended;
begin
  Result := 0;

  case FCST of
    ipi50: Result := ValorIPI50(FImpostoItem);
  end;
end;

function TImpostoIPI.Retorno: iImpostoItem;
begin
  Result := FImpostoItem;
end;

end.
