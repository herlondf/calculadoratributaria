unit Imposto.ICMS.CSOSN202;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS202  (AImpostoItem: iImpostoItem): Double;
  function ValorICMS202      (AImpostoItem: iImpostoItem): Double;

  function ValorBaseICMS202ST(AImpostoItem: iImpostoItem): Double;
  function ValorICMS202ST    (AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS202(AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseICMS( AImpostoItem );
end;

function ValorICMS202(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.ICMS.AliquotaICMS / 100 ) * ValorBaseICMS202(AImpostoItem), 2 )
end;

function ValorBaseICMS202ST(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ValorBaseICMS( AImpostoItem ) * ( 1 + ( AImpostoItem.ICMS.MVA / 100 ) ), 2 );
end;

function ValorICMS202ST(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( ValorBaseICMS202ST(AImpostoItem) * ( AImpostoItem.ICMS.AliquotaICMSST / 100 ) ) - ValorICMS202(AImpostoItem), 2 );
end;

end.
