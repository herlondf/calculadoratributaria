unit Imposto.ICMS.CSOSN900;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS900(AImpostoItem: iImpostoItem): Double;
  function ValorICMS900(AImpostoItem: iImpostoItem): Double;

  function ValorBaseICMSST900(AImpostoItem: iImpostoItem): Double;
  function ValorICMSST900(AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS900(AImpostoItem: iImpostoItem): Double;
begin
  Result := ValorBaseICMS(AImpostoItem);
end;

function ValorICMS900(AImpostoItem: iImpostoItem): Double;
begin
//  Result := RoundABNT( ( AImpostoItem.Retorno.AliquotaSN / 100 ) * ValorBaseICMS900(AImpostoItem), 2 );
end;

function ValorBaseICMSST900(AImpostoItem: iImpostoItem): Double;
begin
//  Result := RoundABNT( ( AImpostoItem.ICMS.AliquotaICMS / 100 ) * ValorBaseICMS900( AImpostoItem ), 2 );
end;

function ValorICMSST900(AImpostoItem: iImpostoItem): Double;
begin
//  Result := RoundABNT( ( ValorBaseICMSST900(AImpostoItem) * ( AImpostoItem.ICMS.AliquotaICMSST / 100 ) ), 2 );
end;

end.
