unit Imposto.BaseICMS;

interface

uses
  Imposto.Utils,
  Imposto.Contract;

  function ValorBaseICMS(AImpostoItem: iImpostoItem): Double;
  function ValorBaseIPI(AImpostoItem: iImpostoItem): Double;

implementation

function ValorBaseICMS(AImpostoItem: iImpostoItem): Double;
begin
  if ( AImpostoItem.Retorno.IEDest = TpcnindIEDest.inNaoContribuinte ) then
    Result := (
        AImpostoItem.IPI.ValorIPI          +
        (
          AImpostoItem.Det.tagProd.vProd   +
          AImpostoItem.Det.tagProd.vFrete  +
          AImpostoItem.Det.tagProd.vSeg    +
          AImpostoItem.Det.tagProd.vOutro
        )
      ) -
      AImpostoItem.Det.tagProd.vDesc
  else
    Result := (
      AImpostoItem.Det.tagProd.vProd   +
      AImpostoItem.Det.tagProd.vFrete  +
      AImpostoItem.Det.tagProd.vSeg    +
      AImpostoItem.Det.tagProd.vOutro
    ) -
    ( AImpostoItem.Det.tagProd.vDesc );
end;

function ValorBaseIPI(AImpostoItem: iImpostoItem): Double;
begin
  Result := (
      AImpostoItem.Det.tagProd.vProdComDescUnit  +
      AImpostoItem.Det.tagProd.vFrete            +
      AImpostoItem.Det.tagProd.vSeg              +
      AImpostoItem.Det.tagProd.vOutro
  );
end;

end.
