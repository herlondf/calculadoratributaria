unit Imposto.ICMS.CST51;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS51(AImpostoItem: iImpostoItem): Double;
  function ValorICMS51(AImpostoItem: iImpostoItem): Double;
  function ValorICMS51Op(AImpostoItem: iImpostoItem): Double;
  function ValorICMS51Diferido(AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS51(AImpostoItem: iImpostoItem): Double;
var
  LBCICMS: Double;
begin
  //Calcula a base de icms cheia
  LBCICMS := ValorBaseICMS(AImpostoItem);

  //Aplica a reducao na base de icms
  Result := RoundABNT( LBCICMS - ( ( AImpostoItem.ICMS.ReducaoBC / 100 ) * LBCICMS ), 2 );
end;

function ValorICMS51(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ValorICMS51Op(AImpostoItem) - ValorICMS51Diferido(AImpostoItem), 2 );
end;

function ValorICMS51Op(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.ICMS.AliquotaICMS / 100 ) * ValorBaseICMS51( AImpostoItem ), 2 );
end;

function ValorICMS51Diferido(AImpostoItem: iImpostoItem): Double;
begin
  if AImpostoItem.ICMS.Diferimento > 0 then
    Result := RoundABNT( ( AImpostoItem.ICMS.Diferimento / 100 ) * ValorICMS51Op( AImpostoItem ), 2 )
  else
    Result := 0;
end;

end.

