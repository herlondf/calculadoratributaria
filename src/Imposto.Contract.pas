unit Imposto.Contract;

interface

uses
  Imposto.Utils,
  Imposto.Tag.Contract,
  System.Generics.Collections;

type
  iImpostoItem                    = interface;
  iImpostoICMS                    = interface;
  iImpostoIPI                     = interface;
  iImpostoPIS                     = interface;
  iImpostoCOFINS                  = interface;
  iImpostoValores                 = interface;

  iImpostoTagTotal                = Imposto.Tag.Contract.iImpostoTagTotal;
  iImpostoTagTotalICMSTot         = Imposto.Tag.Contract.iImpostoTagTotalICMSTot;
  iImpostoTagTotalISSQNtot        = Imposto.Tag.Contract.iImpostoTagTotalISSQNtot;
  iImpostoTagTotalretTrib         = Imposto.Tag.Contract.iImpostoTagTotalretTrib;

  iImpostoTagDet                  = Imposto.Tag.Contract.iImpostoTagDet;
  iImpostoTagDetProd              = Imposto.Tag.Contract.iImpostoTagDetProd;
  iImpostoTagDetImposto           = Imposto.Tag.Contract.iImpostoTagDetImposto;
  iImpostoTagDetImpostoICMS       = Imposto.Tag.Contract.iImpostoTagDetImpostoICMS;
  iImpostoTagDetImpostoIPI        = Imposto.Tag.Contract.iImpostoTagDetImpostoIPI;
  iImpostoTagDetImpostoII         = Imposto.Tag.Contract.iImpostoTagDetImpostoII;
  iImpostoTagDetImpostoPIS        = Imposto.Tag.Contract.iImpostoTagDetImpostoPIS;
  iImpostoTagDetImpostoPISST      = Imposto.Tag.Contract.iImpostoTagDetImpostoPISST;
  iImpostoTagDetImpostoCOFINS     = Imposto.Tag.Contract.iImpostoTagDetImpostoCOFINS;
  iImpostoTagDetImpostoCOFINSST   = Imposto.Tag.Contract.iImpostoTagDetImpostoCOFINSST;
  iImpostoTagDetImpostoISSQN      = Imposto.Tag.Contract.iImpostoTagDetImpostoISSQN;
  iImpostoTagDetImpostoICMSUFDest = Imposto.Tag.Contract.iImpostoTagDetImpostoICMSUFDest;

  TImpostoItens = TList<iImpostoItem>;

  TParamRateio = (prFrete, prSeg, prOutro, prDesc);

  TOnRecalcular = procedure of object;
  TOnChangeItem = procedure of object;

  iImposto = interface
    ['{884D4D7D-C2EC-42EA-8B2A-F5CBABDBB1FC}']
    function Clear: iImposto;

    function OnRecalcular(AOnRecalcular: TOnRecalcular): iImposto;

    function UF( AUF: TUF ) : iImposto; overload;
    function UF: TUF; overload;

    function CRT( ACRT : TCRT ) : iImposto; overload;
    function CRT: TCRT; overload;

    function IEDest( AIndIEDest : TIndIEDest ) : iImposto; overload;
    function IEDest: TIndIEDest; overload;

    function Frete     ( const Value: Extended ) : iImposto; overload;
    function Frete: Extended; overload;

    function Seguro    ( const Value: Extended ) : iImposto; overload;
    function Seguro: Extended; overload;

    function Despesas  ( const Value: Extended ) : iImposto; overload;
    function Despesas: Extended; overload;

    function Desconto  ( const Value: Extended ) : iImposto; overload;
    function Desconto: Extended; overload;

    ///<summary>Aliquota de ICMS no Simples Nacional <pCredSN> </summary>
    function AliquotaSN(const pCredSN: Extended): iImposto; overload;
    function AliquotaSN: Extended; overload;

    function Items      : TImpostoItens;
    function TryGetItem(AId: Double): iImpostoItem;

    function Total  : iImpostoTagTotal;
  end;

  iImpostoItem = interface
    ['{D51314C2-4F42-4DAC-8629-7EB9D170796A}']
    function OnChangeItem(const Value: TOnChangeItem): iImpostoItem;

    function Id(const Value: Double): iImpostoItem; overload;
    function Id: Double; overload;

    function Quantidade(const Value: Extended): iImpostoItem; overload;
    function Quantidade: Extended; overload;

    function ValorUnitario(const Value: Extended): iImpostoItem; overload;
    function ValorUnitario: Extended; overload;

    function DescontoUnitario(const Value: Extended): iImpostoItem; overload;
    function DescontoUnitario: Extended; overload;

    function DescontoTotal(const Value: Extended): iImpostoItem; overload;
    function DescontoTotal: Extended; overload;

    function ICMS   : iImpostoICMS;
    function IPI    : iImpostoIPI;
    function PIS    : iImpostoPIS;
    function COFINS : iImpostoCOFINS;

    function Det: IImpostoTagDet;

    function Recalcular: iImpostoItem;

    function Retorno: iImposto;
  end;

  iImpostoICMS = interface
    ['{97F60799-BC38-4E19-A129-A3EACD33AFFC}']
    function CST(const Value: TCSTIcms): iImpostoICMS; overload;
    function CST: TCSTIcms; overload;

    function CSOSN(const Value: TCSOSNIcms): iImpostoICMS; overload;
    function CSOSN: TCSOSNIcms; overload;

    ///<summary>
    ///  Aliquota de ICMS no Simples Nacional
    ///  Tag: <pCredSN>
    ///</summary>
    function AliquotaSN(const pCredSN: Extended): iImpostoICMS; overload;

    ///<summary>
    ///  Aliquota de ICMS Próprio
    ///  Tag: <pICMS>
    ///</summary>
    ///<returns> Teste2 </returns>
    function AliquotaICMS(const pICMS: Extended): iImpostoICMS; overload;

    ///<summary>
    ///  Aliquota de ICMS Próprio
    ///  Tag: <pICMS>
    ///</summary>
    ///<returns> Teste1 </returns>
    function AliquotaICMS: Extended; overload;

    ///<summary>
    ///  Aliquota de ICMS ST (Aliquota de ICMS INTERNA na UF de destino)
    ///  Obs.: Se a aliquota de icms st for igual a aliquota de icms, caracteriza uma operacao interna
    ///  Tag: <pICMSST>
    ///</summary>
    function AliquotaICMSST(const pICMSST: Extended): iImpostoICMS; overload;

    ///<summary>
    ///  Aliquota de ICMS ST (Aliquota de ICMS na UF de destino)
    ///  Tag: <pICMSST>
    ///</summary>
    function AliquotaICMSST: Extended; overload;

    ///<summary>
    ///  Aliquota de ST Cobrado anteriormente (ICMS Retido)
    ///  Tag: <pST>
    ///</summary>
    function AliquotaST(const pST: Extended): iImpostoICMS; overload;

    ///<summary>
    ///  Valor percentual para aplicar na reducao da base de calculo
    ///  Tag: <pRedBC>
    ///</summary>
    function ReducaoBC(const pRedBC: Extended): iImpostoICMS; overload;

    ///<summary>
    ///  Valor percentual para aplicar na reducao da base de calculo
    ///  Tag: <pRedBC>
    ///</summary>
    function ReducaoBC: Extended; overload;

    ///<summary>
    ///  Valor percentual para aplicar na reducao da base de calculo da substituicao
    ///  Tag: <pRedBCST>
    ///</summary>
    function ReducaoBCST(const pRedBCST: Extended): iImpostoICMS; overload;

    ///<summary>
    ///  Valor percentual para aplicar na reducao da base de calculo da substituicao
    ///  Tag: <pRedBCST>
    ///</summary>
    function ReducaoBCST: Extended; overload;

    ///<summary>
    ///  Valor percentual para aplicar o diferimento(desconto) no valor do icms
    ///  Tag: <pDif>
    ///</summary>
    function Diferimento(const pDif: Extended): iImpostoICMS; overload;

    ///<summary>
    ///  Valor percentual para aplicar o diferimento(desconto) no valor do icms
    ///  Tag: <pDif>
    ///</summary>
    function Diferimento: Extended; overload;

    ///<summary>
    ///  Valor percentual de "Margem de Valor Agregado" para calcular a "Base de ICMS ST"
    ///  Tag: <pMVAST>
    ///</summary>
    function MVA(const pMVAST: Extended): iImpostoICMS; overload;

    ///<summary>
    ///  Valor percentual de "Margem de Valor Agregado" para calcular a "Base de ICMS ST"
    ///  Tag: <pMVAST>
    ///</summary>
    function MVA: Extended; overload;

    ///<summary>
    ///  Valor da base de calculo do st retido na fonte
    ///  Tag: <vBCSTRet>
    ///</summary>
    function BCSTRet(const vBCSTRet: Extended): iImpostoICMS;

    ///<summary>
    ///  Valor do icms do st retido na fonte
    ///  Tag: <vICMSSTRet>
    ///</summary>
    function ICMSSTRet(const vICMSSTRet: Extended): iImpostoICMS;

    function Retorno: iImpostoItem;
  end;

  iImpostoIPI = interface
    ['{EE9B22BA-1079-4619-97BE-191FAECE4E0D}']
    function CST(const Value: TCSTIpi): iImpostoIPI;

    function AliquotaIPI(const Value: Extended): iImpostoIPI; overload;
    function AliquotaIPI: Extended; overload;

    function ValorIPI: Extended; overload;

    function Retorno: iImpostoItem;
  end;

  iImpostoPIS = interface
    ['{044D04A9-0D46-48E1-B51D-DA0003CD7EFD}']
    function Retorno: iImpostoItem;
  end;

  iImpostoCOFINS = interface
    ['{761CC2EB-179E-45CE-82D4-FFB5FB587FDC}']
    function Retorno: iImpostoItem;
  end;

  iImpostoValores = interface
    ['{B312367D-9E06-47FE-B019-32B759F8E28B}']

  end;

implementation

end.
