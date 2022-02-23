unit Imposto.ICMS.CST30;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS30  (AImpostoItem: iImpostoItem): Double;
  function ValorICMS30      (AImpostoItem: iImpostoItem): Double;

  function ValorBaseICMS30ST(AImpostoItem: iImpostoItem): Double;
  function ValorICMS30ST    (AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS30  (AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseICMS( AImpostoItem );
end;

function ValorICMS30(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.ICMS.AliquotaICMS / 100 ) * ValorBaseICMS30( AImpostoItem ), 2 )
end;

function ValorBaseICMS30ST(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ValorBaseICMS( AImpostoItem ) * ( ( 1 + AImpostoItem.ICMS.MVA ) / 100 )  , 2 );
end;

function ValorICMS30ST(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( ValorBaseICMS30ST(AImpostoItem ) * ( AImpostoItem.ICMS.AliquotaICMSST / 100 ) ) - ValorBaseICMS30( AImpostoItem ), 2 );
end;

end.
