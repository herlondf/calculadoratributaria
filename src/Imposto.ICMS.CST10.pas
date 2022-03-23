unit Imposto.ICMS.CST10;

interface

uses
  Imposto.Utils,
  Imposto.Aliquota,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS10  (AImpostoItem: iImpostoItem): Double;
  function ValorICMS10      (AImpostoItem: iImpostoItem): Double;

  function ValorBaseICMS10ST(AImpostoItem: iImpostoItem): Double;
  function ValorICMS10ST    (AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS10(AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseICMS( AImpostoItem );
end;

function ValorICMS10(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.ICMS.AliquotaICMS / 100 ) * ValorBaseICMS10( AImpostoItem ), 2 )
end;

function ValorBaseICMS10ST(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ValorBaseICMS( AImpostoItem ) * ( 1 + ( AImpostoItem.ICMS.MVA / 100 ) ), 2 );
end;

function ValorICMS10ST(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( ValorBaseICMS10ST(AImpostoItem) * ( AImpostoItem.ICMS.AliquotaICMSST / 100 ) ) - ValorICMS10(AImpostoItem), 2 );
end;

end.
