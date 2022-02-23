unit Imposto.ICMS.CSOSN500;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorBaseICMS500(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
  function ValorValorICMS500(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;

implementation

function ValorBaseICMS500(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
begin
  Result := 0;
end;

function ValorValorICMS500(AImpostoItem: iImpostoItem; AImpostoItemICMS: iImpostoICMS): Double;
begin
  Result := 0;
end;

end.
