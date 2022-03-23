unit Imposto.PIS;

interface

uses
  Imposto.Utils,
  Imposto.Contract;

type
  TImpostoPIS = class(TInterfacedObject, iImpostoPIS)
    constructor Create(AImpostoItem: iImpostoItem);
    destructor Destroy; override;
    class function New(AImpostoItem: iImpostoItem): iImpostoPIS;
  private
    [weak]
    FImpostoItem: iImpostoItem;

    FCST           : TpcnCstPis;
    FAliquotaPIS   : Extended;
  public
    function CST(const Value: TpcnCstPis): iImpostoPIS;

    function AliquotaPIS(const Value: Extended): iImpostoPIS; overload;
    function AliquotaPIS: Extended; overload;

    function ValorPIS: Extended;

    function Retorno: iImpostoItem;
  end;

implementation

uses
  Imposto.PIS.CST01,
  Imposto.PIS.CST02,
  Imposto.PIS.CST03;

{ TImpostoPIS }

constructor TImpostoPIS.Create(AImpostoItem: iImpostoItem);
begin
  FImpostoItem := AImpostoItem;
end;

destructor TImpostoPIS.Destroy;
begin

  inherited;
end;

class function TImpostoPIS.New(AImpostoItem: iImpostoItem): iImpostoPIS;
begin
  Result := Self.Create(AImpostoItem);
end;

function TImpostoPIS.CST(const Value: TpcnCstPis): iImpostoPIS;
begin
  Result := Self;
  FCST := Value;
end;

function TImpostoPIS.AliquotaPIS(const Value: Extended): iImpostoPIS;
begin
  Result := Self;
  FAliquotaPIS := Value;
end;

function TImpostoPIS.AliquotaPIS: Extended;
begin
  Result := FAliquotaPIS;
end;

function TImpostoPIS.ValorPIS: Extended;
begin
  Result := 0;

  case FCST of
    TpcnCstPis.pis01: Result := ValorPIS01(FImpostoItem);
    TpcnCstPis.pis02: Result := ValorPIS02(FImpostoItem);
    TpcnCstPis.pis03: Result := ValorPIS03(FImpostoItem);
  end;
end;

function TImpostoPIS.Retorno: iImpostoItem;
begin
  Result := FImpostoItem;
end;

end.
