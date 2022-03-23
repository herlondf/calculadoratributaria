unit Imposto.COFINS.CST01;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseCOFINS01(AImpostoItem: iImpostoItem): Double;
  function ValorCOFINS01(AImpostoItem: iImpostoItem): Double;


implementation

function ValorBaseCOFINS01(AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseICMS(AImpostoItem);
end;

function ValorCOFINS01(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.COFINS.AliquotaCOFINS / 100 ) * ValorBaseCOFINS01( AImpostoItem ), 2 );
end;

end.
