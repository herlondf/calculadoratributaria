unit Imposto.PIS.CST02;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBasePIS02(AImpostoItem: iImpostoItem): Double;
  function ValorPIS02(AImpostoItem: iImpostoItem): Double;


implementation

function ValorBasePIS02(AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseICMS(AImpostoItem);
end;

function ValorPIS02(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.PIS.AliquotaPIS / 100 ) * ValorBasePIS02( AImpostoItem ), 2 );
end;

end.
