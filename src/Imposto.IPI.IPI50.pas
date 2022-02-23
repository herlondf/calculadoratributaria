unit Imposto.IPI.IPI50;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseIPI50(AImpostoItem: iImpostoItem): Double;
  function ValorIPI50(AImpostoItem: iImpostoItem): Double;


implementation

function ValorBaseIPI50(AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseIPI(AImpostoItem);
end;

function ValorIPI50(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( ( AImpostoItem.IPI.AliquotaIPI / 100 ) * ValorBaseIPI50( AImpostoItem ), 2 );
end;

end.

