unit Imposto.ICMS.CSOSN300;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS300(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
  function ValorValorICMS300(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;

implementation

function ValorBaseICMS300(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
begin
  Result := 0;
end;

function ValorValorICMS300(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
begin
  Result := 0;
end;

end.
