unit Imposto.ICMS.CST20;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS20(AImpostoItem: iImpostoItem): Double;
  function ValorICMS20(AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS20(AImpostoItem: iImpostoItem): Double;
var
  LBCICMS: Double;
begin
  //Calcula a base de icms cheia
  LBCICMS := ValorBaseICMS(AImpostoItem);

  //Aplica a reducao na base de icms
  if AImpostoItem.ICMS.ReducaoBC > 0 then
    Result := RoundABNT( LBCICMS - ( ( AImpostoItem.ICMS.ReducaoBC / 100 ) * LBCICMS ), 2 )
  else
    Result := LBCICMS;
end;

function ValorICMS20(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.ICMS.AliquotaICMS / 100 ) * ValorBaseICMS20(AImpostoItem), 2 );
end;

end.

