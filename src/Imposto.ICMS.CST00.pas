unit Imposto.ICMS.CST00;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS00(AImpostoItem: iImpostoItem): Double;
  function ValorICMS00(AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS00(AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseICMS(AImpostoItem);
end;

function ValorICMS00(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.ICMS.AliquotaICMS / 100 ) * ValorBaseICMS00(AImpostoItem), 2 );
end;

end.
