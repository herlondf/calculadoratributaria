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
  FProporcao := RoundABNT( ( vProdComDescUnit / ATotalProd ) * 100, 6 );

  FvFrete    := RoundABNT( ( ( FProporcao / 100 ) * AImposto.Frete    ), 4 );
  FvSeg      := RoundABNT( ( ( FProporcao / 100 ) * AImposto.Seguro   ), 4 );
  FvOutro    := RoundABNT( ( ( FProporcao / 100 ) * AImposto.Despesas ), 4 );
  FvDesc     := RoundABNT( ( ( FProporcao / 100 ) * AImposto.Desconto ), 4 );
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
  Result := RoundABNT( ( FImpostoItem.Quantidade * FImpostoItem.ValorUnitario ), 4 );
end;

function TImpostoTagDetProd.vProdComDescUnit: Extended;
begin
  Result := RoundABNT( ( FImpostoItem.Quantidade *  ( FImpostoItem.ValorUnitario - FImpostoItem.DescontoUnitario  ) - FImpostoItem.DescontoTotal ), 4 )
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
