unit Imposto.COFINS.CST02;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseCOFINS02(AImpostoItem: iImpostoItem): Double;
  function ValorCOFINS02(AImpostoItem: iImpostoItem): Double;


implementation

function ValorBaseCOFINS02(AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseICMS(AImpostoItem);
end;

function ValorCOFINS02(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.COFINS.AliquotaCOFINS / 100 ) * ValorBaseCOFINS02( AImpostoItem ), 2 );
end;

end.
