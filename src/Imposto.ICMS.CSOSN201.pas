unit Imposto.ICMS.CSOSN201;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS201  (AImpostoItem: iImpostoItem): Double;
  function ValorICMS201      (AImpostoItem: iImpostoItem): Double;

  function ValorBaseICMS201ST(AImpostoItem: iImpostoItem): Double;
  function ValorICMS201ST    (AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS201(AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseICMS( AImpostoItem );
end;

function ValorICMS201(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.ICMS.AliquotaICMS / 100 ) * ValorBaseICMS201(AImpostoItem), 2 )
end;

function ValorBaseICMS201ST(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ValorBaseICMS( AImpostoItem ) * ( 1 + ( AImpostoItem.ICMS.MVA / 100 ) ), 2 );
end;

function ValorICMS201ST(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( ValorBaseICMS201ST(AImpostoItem) * ( AImpostoItem.ICMS.AliquotaICMSST / 100 ) ) - ValorICMS201(AImpostoItem), 2 );
end;

end.
