unit Imposto.Tag.Contract;

interface

type
  iImpostoTagTotal                    = interface;
    iImpostoTagTotalICMSTot           = interface;
    iImpostoTagTotalISSQNtot          = interface;
    iImpostoTagTotalretTrib           = interface;

  iImpostoTagDet                      = interface;
    iImpostoTagDetProd                = interface;
    iImpostoTagDetImposto             = interface;
      iImpostoTagDetImpostoICMS       = interface;
      iImpostoTagDetImpostoIPI        = interface;
      iImpostoTagDetImpostoII         = interface;
      iImpostoTagDetImpostoPIS        = interface;
      iImpostoTagDetImpostoPISST      = interface;
      iImpostoTagDetImpostoCOFINS     = interface;
      iImpostoTagDetImpostoCOFINSST   = interface;
      iImpostoTagDetImpostoISSQN      = interface;
      iImpostoTagDetImpostoICMSUFDest = interface;

  {DET}

  iImpostoTagDet = interface
    ['{6893D274-8B68-49C8-AC6B-373EEB99D3FE}']
    function tagProd    : iImpostoTagDetProd;
    function tagImposto : iImpostoTagDetImposto;
  end;

  iImpostoTagDetProd = interface
    ['{18AC50C7-F610-4F5F-AF7C-760EAF22A41B}']
    function vProd : Extended;
    function vFrete: Extended;
    function vSeg  : Extended;
    function vOutro: Extended;
    function vDesc : Extended;
  end;

  iImpostoTagDetImposto = interface
    ['{B4339123-670C-41D8-AF57-7C92B0EB3EA1}']
    //informar o valor total aproximado dos tributos em vendas para consumidor final.
    function vTotTrib: Double;
    //informar o grupo XML ICMS com o grupo de tributos do ICMS. Obs: Informar “” se o item for sujeito ao ISSQN.
    function ICMS: iImpostoTagDetImpostoICMS;
    //informar o grupo XML IPI com o grupo de tributos do IPI. Obs: 1.Se a operação não for sujeita ao IPI omita o grupo informando “” 2.Informar “” se o item for sujeito ao ISSQN.
    function IPI: iImpostoTagDetImpostoIPI;
    //informar o grupo XML II com o grupo de tributos do II. Obs: Informar apenas quando se tratar de operação de importação, nos demais casos informe “”.
    function II: iImpostoTagDetImpostoII;
    //informar o grupo XML PIS com o grupo de tributos do PIS.
    function PIS: iImpostoTagDetImpostoPIS;
    //informar o grupo XML PISST com o grupo de tributos do PISST. Obs: Informar “” se não existir PISST.
    function PISST: iImpostoTagDetImpostoPISST;
    //informar o grupo XML COFINS com o grupo de tributos do COFINS.
    function COFINS: iImpostoTagDetImpostoCOFINS;
    //informar o grupo XML COFINSST com o grupo de tributos do COFINSST. Obs: Informar “” se não existir COFINSST.
    function COFINSST: iImpostoTagDetImpostoCOFINSST;
    //informar o grupo XML ISSQN310 com o grupo de tributos do ISSQN. Obs: Informar “” se o item for sujeito ao ICMS.
    function ISSQN: iImpostoTagDetImpostoISSQN;
    //informar o grupo XML ICMSUFDest com o grupo de Tributação do ICMS para a UF de destino das operações interestaduais para consumidor final. (campo novo)
    function ICMSUFDest: iImpostoTagDetImpostoICMSUFDest;
  end;

  iImpostoTagDetImpostoICMS = interface
    ['{C03C96AE-C746-4B76-A728-4C5024C3C64A}']
    function pRedBC  : Double;
    function vBC     : Double;
    function pICMS   : Double;
    function vICMS   : Double;

    function vICMSOp : Double;
    function vICMSDif: Double;
    function pCredSN : Double;
    function vCredSN : Double;

    function pMVAST  : Double;
    function pRedBCST: Double;
    function vBCST   : Double;
    function pICMSST : Double;
    function vICMSST : Double;
  end;

  iImpostoTagDetImpostoIPI = interface
    ['{D79B7D45-2C8B-4B09-9301-D17927FA99E7}']

  end;

  iImpostoTagDetImpostoII = interface
    ['{418AC70F-57A2-4488-96A9-EC6B4EB929A9}']

  end;

  iImpostoTagDetImpostoPIS = interface
    ['{16B803FA-A8C4-4BAF-9E68-CA6781233FCE}']

  end;

  iImpostoTagDetImpostoPISST = interface
    ['{03E0BD00-DD73-4404-B048-0F4928807E4F}']

  end;

  iImpostoTagDetImpostoCOFINS = interface
    ['{503D317B-18A5-450A-807D-F6B4B5B8EC36}']

  end;

  iImpostoTagDetImpostoCOFINSST = interface
    ['{1A8483F4-BAAE-402A-94AB-CB02209FB7FA}']

  end;

  iImpostoTagDetImpostoISSQN = interface
    ['{209967AD-C309-4C0D-B604-CCAD835AE983}']

  end;

  iImpostoTagDetImpostoICMSUFDest = interface
    ['{B31E18FE-4B07-44AF-ACD6-5273018160E8}']

  end;


  {TOTAL}

  iImpostoTagTotal = interface
    ['{8C19DCD2-889D-4D7A-863B-B625163038EC}']
    function ICMSTot  : iImpostoTagTotalICMSTot;
    function ISSQNtot : iImpostoTagTotalISSQNtot;
    function retTrib  : iImpostoTagTotalretTrib;
  end;

  iImpostoTagTotalICMSTot  = interface
    ['{2F929846-FA3E-4565-BBFA-847E3DF4D6E6}']
    ///<summary>informar o somatório da BC do ICMS (vBC) informado nos itens</summary>
    function vBC: Double;
    ///<summary>informar o somatório de ICMS (vICMS) informado nos itens</summary>
    function vICMS: Double;
    ///<summary>informar o somatório da BC ST (vBCST) informado nos itens</summary>
    function vBCST: Double;
    ///<summary>informar o somatório do ICMS ST (vICMSST)informado nos itens</summary>
    function vST: Double;
    ///<summary>informar o somatório de valor dos produtos (vProd) dos itens que tenham indicador de totalização = 1 (indTot) Os valores dos itens sujeitos ao ISSQN não devem ser acumulados neste campo.  </summary>
    function vProd: Double;
    //<summary>informar o somatório de valor do Frete (vFrete) informado nos itens</summary>
    function vFrete: Double;
    ///<summary>informar o somatório valor do Seguro (vSeg) informado nos itens</summary>
    function vSeg: Double;
    ///<summary>informar o somatório do Desconto (vDesc) informado nos itens</summary>
    function vDesc: Double;
    ///<summary>informar o somatório de II (vII) informado nos itens</summary>
    function vII: Double;
    ///<summary>informar o somatório de IPI (vIPI) informado nos itens</summary>
    function vIPI: Double;
    ///<summary>informar o somatório de PIS (vPIS) informado nos itens sujeitos ao ICMS</summary>
    function vPIS: Double;
    ///<summary>informar o somatório de COFINS (vCOFINS) informado nos itens sujeitos ao ICMS</summary>
    function vCOFINS: Double;
    ///<summary>informar o somatório de vOutro (vOutro) informado nos itens</summary>
    function vOutro: Double;
    ///<summary>informar o valor total a NF. Acrescentar o valor dos Serviços informados no grupo do ISSQN</summary>
    function vNF: Double;
    ///<summary>informar o somatório do valor total aproximado dos tributos (vTotTrib) informado nos itens, deve considerar valor de itens sujeitos ao ISSQN também.</summary>
    function vTotTrib: Double;
    ///<summary>informar o somatório do Valor do ICMS desonerado (vICMSDeson) informado nos itens.</summary>
    function vICMSDeson: Double;
    ///<summary>informar o somatório do Valor do ICMS Interestadual para a UF de destino (vICMSUFDest) informado nos itens.</summary>
    function vICMSUFDest_Opc: Double;
    ///<summary>informar o somatório do Valor total do ICMS Interestadual para a UF do remetente vICMSUFRemet) informado nos itens. Nota: A partir de 2019, este valor será zero.</summary>
    function vICMSUFRemet_Opc: Double;
    ///<summary>informar o somatório do Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP) da UF de destino. Corresponde ao total da soma dos campos vFCP informado nos itens.</summary>
    function vFCPUFDest_Opc: Double;
    ///<summary>informar o somatório do Valor do FCP (Fundo de Combate à Pobreza) (vFCP) informado nos itens.</summary>
    function vFCP: Double;
    ///<summary>informar o somatório do Valor do FCP retido anteriormente por Substituição. Corresponde ao total da soma dos campos vFCPST informado nos itens.</summary>
    function vFCPST: Double;
    ///<summary>informar o somatório do Valor do FCP retido anteriormente por Substituição. Corresponde ao total da soma dos campos vFCPSTRet informado nos itens.</summary>
    function vFCPSTRet: Double;
    ///<summary>informar o somatório do Valor do IPI devolvido. Deve ser informado quando preenchido o Grupo Tributos Devolvidos na emissão de nota finNFe=4 (devolução) nas operações com não contribuintes do IPI. Corresponde ao total da soma dos campos vIIPIDevol do item.</summary>
    function vIPIDevol: Double;
  end;

  iImpostoTagTotalISSQNtot = interface
    ['{784EC579-C7C0-4B60-AB6E-238E85D9E2CC}']
  end;

  iImpostoTagTotalretTrib  = interface
    ['{DF585C93-E36B-48DF-9873-E6C9A93F8703}']

  end;

implementation

end.
