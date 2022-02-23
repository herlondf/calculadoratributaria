unit Imposto.ICMS.CST70;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS70  (AImpostoItem: iImpostoItem): Double;
  function ValorICMS70      (AImpostoItem: iImpostoItem): Double;

  function ValorBaseICMS70ST(AImpostoItem: iImpostoItem): Double;
  function ValorICMS70ST    (AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS70(AImpostoItem: iImpostoItem): Double;
var
  LBCICMS: Double;
begin
  //Calcula a base de icms
  LBCICMS := ValorBaseICMS( AImpostoItem );

  //Aplica a reducao na base de icms
  Result := RoundABNT( LBCICMS - ( ( AImpostoItem.ICMS.ReducaoBC / 100 ) * LBCICMS ), 2 );
end;

function ValorICMS70(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.ICMS.AliquotaICMS / 100 ) * ValorBaseICMS70(AImpostoItem), 2 )
end;

function ValorBaseICMS70ST(AImpostoItem: iImpostoItem): Double;
var
  LBCICMSST: Double;
begin
  //Calcula a base de icms st
  LBCICMSST := RoundABNT( ValorBaseICMS( AImpostoItem ) * ( ( 1 + AImpostoItem.ICMS.MVA ) / 100 )  , 2 );

  //Aplica a reducao na base de icms st
  Result := RoundABNT( LBCICMSST - ( ( AImpostoItem.ICMS.ReducaoBCST / 100 ) * LBCICMSST ), 2 );
end;

function ValorICMS70ST(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( ValorBaseICMS70ST(AImpostoItem) * ( AImpostoItem.ICMS.AliquotaICMSST / 100 ) ) - ValorBaseICMS70(AImpostoItem), 2 );
end;

end.
