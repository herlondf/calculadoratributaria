unit Imposto.ICMS.CSOSN103;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS103(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
  function ValorValorICMS103(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;

implementation

function ValorBaseICMS103(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
begin
  Result := 0;
end;

function ValorValorICMS103(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
begin
  Result := 0;
end;

end.
