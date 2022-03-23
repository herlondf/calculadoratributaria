unit Imposto.PIS.CST01;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBasePIS01(AImpostoItem: iImpostoItem): Double;
  function ValorPIS01(AImpostoItem: iImpostoItem): Double;


implementation

function ValorBasePIS01(AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseICMS(AImpostoItem);
end;

function ValorPIS01(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.PIS.AliquotaPIS / 100 ) * ValorBasePIS01( AImpostoItem ), 2 );
end;

end.

