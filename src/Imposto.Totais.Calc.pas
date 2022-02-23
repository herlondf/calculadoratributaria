unit Imposto.Totais.Calc;

interface

uses
  Imposto.Utils,
  Imposto.Contract,
  Imposto.Calc.Contract;

type
  TImpostoTotaisCalc = class(TInterfacedObject, iImpostoCalcTotais)
    constructor Create(AImposto: iImposto);
    destructor Destroy; override;
    class function New(AImposto: iImposto): iImpostoCalcTotais;
  strict private
    FImposto         : iImposto;
  private
    FValorTotal      : Extended;
    FValorTotalICMS  : Extended;
  public
    function ValorTotal( const Value: Extended ) : iImpostoCalcTotais; overload;
    function ValorTotal: Extended; overload;

    function ValorTotalICMS: Extended; overload;
  end;

implementation

{ TImpostoTotaisCalc }

constructor TImpostoTotaisCalc.Create(AImposto: iImposto);
begin
  FImposto := AImposto;
end;

destructor TImpostoTotaisCalc.Destroy;
begin

  inherited;
end;

class function TImpostoTotaisCalc.New(AImposto: iImposto): iImpostoCalcTotais;
begin
  Result := Self.Create(AImposto);
end;

function TImpostoTotaisCalc.ValorTotal( const Value: Extended ): iImpostoCalcTotais;
begin
  Result := Self;
  FValorTotal := Value;
end;

function TImpostoTotaisCalc.ValorTotal: Extended;
begin
  Result := FValorTotal;
end;

function TImpostoTotaisCalc.ValorTotalICMS: Extended;
begin
  Result := FValorTotalICMS;
end;

end.