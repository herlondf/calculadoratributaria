unit Imposto.ICMS.CSOSN203;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS203  (AImpostoItem: iImpostoItem): Double;
  function ValorICMS203      (AImpostoItem: iImpostoItem): Double;

  function ValorBaseICMS203ST(AImpostoItem: iImpostoItem): Double;
  function ValorICMS203ST    (AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS203(AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseICMS( AImpostoItem );
end;

function ValorICMS203(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.ICMS.AliquotaICMS / 100 ) * ValorBaseICMS203(AImpostoItem), 2 )
end;

function ValorBaseICMS203ST(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ValorBaseICMS( AImpostoItem ) * ( 1 + ( AImpostoItem.ICMS.MVA / 100 ) ), 2 );
end;

function ValorICMS203ST(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( ValorBaseICMS203ST(AImpostoItem) * ( AImpostoItem.ICMS.AliquotaICMSST / 100 ) ) - ValorICMS203(AImpostoItem), 2 );
end;

end.
