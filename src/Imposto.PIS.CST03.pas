//***********************************************************
//                                                         //
// Al�quota espec�fica                                     //
//                                                         //
// Nesta modalidade de tributa��o a base de c�lculo � a    //
// quantia por unidade da mercadoria.                      //
//                                                         //
// O valor do tributo � um valor fixo para esta quantia,   //
// o valor total do tributo neste caso � o produto do      //
// do valor do tributo pela quantidade.                    //
//                                                         //
//***********************************************************

unit Imposto.PIS.CST03;

interface

uses
  Imposto.Utils,
  Imposto.BaseICMS,
  Imposto.Contract;

  function ValorPIS03(AImpostoItem: iImpostoItem): Double;


implementation

function ValorPIS03(AImpostoItem: iImpostoItem): Double;
begin
  Result := RoundABNT( AImpostoItem.PIS.AliquotaPIS  * AImpostoItem.Quantidade, 2 );
end;

end.
