unit Imposto.ICMS.CSOSN400;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS400(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
  function ValorValorICMS400(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;

implementation

function ValorBaseICMS400(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
begin
  Result := 0;
end;

function ValorValorICMS400(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
begin
  Result := 0;
end;

end.
