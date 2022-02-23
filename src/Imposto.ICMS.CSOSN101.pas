unit Imposto.ICMS.CSOSN101;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS101(AImpostoItem: iImpostoItem): Double;
  function ValorCredSN101(AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS101(AImpostoItem: iImpostoItem): Double;
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

function ValorCredSN101(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.Retorno.AliquotaSN / 100 ) * ValorBaseICMS101(AImpostoItem), 2 );
end;

end.
