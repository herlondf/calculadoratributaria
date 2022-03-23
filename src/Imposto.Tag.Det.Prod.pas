unit Imposto.Tag.Det.Prod;

interface

uses
  Imposto.Utils,
  Imposto.Contract;

type
  TImpostoTagDetProd = class(TInterfacedObject, iImpostoTagDetProd)
    constructor Create(AImpostoItem: iImpostoItem);
    destructor Destroy; override;
    class function New(AImpostoItem: iImpostoItem): iImpostoTagDetProd;
  private
    [weak]
    FImpostoItem : iImpostoItem;

    FProporcao : Double;
    FvFrete    : Double;
    FvSeg      : Double;
    FvOutro    : Double;
    FvDesc     : Double;
  public
    procedure Recalcular(AImposto: iImposto; ATotalProd: Double);
    procedure CorrigeRateio(AParamRateio: TParamRateio; AValue: Double);

    function vProd : Extended;
    function vProdComDescUnit: Extended;
    function vFrete: Extended;
    function vSeg  : Extended;
    function vOutro: Extended;
    function vDesc : Extended;
  end;

implementation

{ TImpostoTagDetProd }

constructor TImpostoTagDetProd.Create(AImpostoItem: iImpostoItem);
begin
  FImpostoItem := AImpostoItem;
end;

destructor TImpostoTagDetProd.Destroy;
begin

  inherited;
end;

class function TImpostoTagDetProd.New(AImpostoItem: iImpostoItem): iImpostoTagDetProd;
begin
  Result := Self.Create(AImpostoItem);
end;

procedure TImpostoTagDetProd.Recalcular(AImposto: iImposto; ATotalProd: Double);
begin
  FProporcao := RoundABNT( ( vProdComDescUnit / ATotalProd ) * 100, 2 );

  FvFrete    := RoundABNT( ( ( FProporcao / 100 ) * AImposto.Frete    ), 2 );
  FvSeg      := RoundABNT( ( ( FProporcao / 100 ) * AImposto.Seguro   ), 2 );
  FvOutro    := RoundABNT( ( ( FProporcao / 100 ) * AImposto.Despesas ), 2 );
  FvDesc     := RoundABNT( ( ( FProporcao / 100 ) * AImposto.Desconto ), 2 );

  if FImpostoItem.DescontoUnitarioPerc > 0 then
    FImpostoItem.DescontoUnitario( CalcularPercentualValor( FImpostoItem.ValorUnitario, FImpostoItem.DescontoUnitarioPerc ) );

  if FImpostoItem.DescontoTotalPerc > 0 then
    FImpostoItem.DescontoTotal( CalcularPercentualValor( ( FImpostoItem.Quantidade * FImpostoItem.ValorUnitario ), FImpostoItem.DescontoTotalPerc ) );
end;

procedure TImpostoTagDetProd.CorrigeRateio(AParamRateio: TParamRateio; AValue: Double);
begin
  case AParamRateio of
    prFrete: FvFrete := FvFrete - AValue;
    prSeg  : FvSeg   := FvSeg   - AValue;
    prOutro: FvOutro := FvOutro - AValue;
    prDesc : FvDesc  := FvDesc  - AValue;
  end;
end;

function TImpostoTagDetProd.vProd: Extended;
begin
  Result := RoundABNT( ( FImpostoItem.Quantidade * FImpostoItem.ValorUnitario ), 2 );
end;

function TImpostoTagDetProd.vProdComDescUnit: Extended;
begin
  Result := RoundABNT( ( FImpostoItem.Quantidade * ( FImpostoItem.ValorUnitario - FImpostoItem.DescontoUnitario  ) - FImpostoItem.DescontoTotal ), 2 )
end;

function TImpostoTagDetProd.vFrete: Extended;
begin
  Result := FvFrete;
end;

function TImpostoTagDetProd.vSeg: Extended;
begin
  Result := FvSeg;
end;

function TImpostoTagDetProd.vOutro: Extended;
begin
  Result := FvOutro;
end;

function TImpostoTagDetProd.vDesc: Extended;
begin
  Result := FvDesc + FImpostoItem.DescontoUnitario + FImpostoItem.DescontoTotal;
end;

end.
