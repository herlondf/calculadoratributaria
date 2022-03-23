//***********************************************************
//                                                         //
// Alíquota específica                                     //
//                                                         //
// Nesta modalidade de tributação a base de cálculo é a    //
// quantia por unidade da mercadoria.                      //
//                                                         //
// O valor do tributo é um valor fixo para esta quantia,   //
// o valor total do tributo neste caso é o produto do      //
// do valor do tributo pela quantidade.                    //
//                                                         //
//***********************************************************


unit Imposto.COFINS.CST03;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorCOFINS03(AImpostoItem: iImpostoItem): Double;


implementation

function ValorCOFINS03(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( AImpostoItem.COFINS.AliquotaCOFINS  * AImpostoItem.Quantidade, 2 );
end;

end.
