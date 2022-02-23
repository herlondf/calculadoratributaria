unit Imposto.ICMS.CSOSN102;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS102(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
  function ValorValorICMS102(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;

implementation

function ValorBaseICMS102(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
begin
  Result := 0;
end;

function ValorValorICMS102(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
begin
  Result := 0;
end;

end.
