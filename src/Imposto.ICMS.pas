{TODO -oHerlon -cImposto.ICMS : Implementar opcao de calculo de frete calculando a proporcao pelo volume (FQuantidade)}
{TODO -oHerlon -cImposto.ICMS : Organizar os comentarios igual ao da ReducaoBC }
{TODO -oHerlon -cImposto.ICMS : Analisar possibilidade de adicionar a logica da tabela de aliquota de icms para retirar o atributo }
{TODO -oHerlon -cImposto.ICMS : Adicionar segundo parametro no ValorICMS que seria vICMS e vICMSOp em caso de CST51 }

unit Imposto.ICMS;

interface

uses
  System.SysUtils,
  Imposto.Utils,
  Imposto.Contract;

type
  TImpostoICMS = class(TInterfacedObject, iImpostoICMS)
    constructor Create(AImpostoItem: iImpostoItem);
    destructor Destroy; override;
    class function New(AImpostoItem: iImpostoItem): iImpostoICMS;
  private
    [weak]
    FImpostoItem   : iImpostoItem;

    FAliquotaICMS  : Extended;
    FAliquotaICMSST: Extended;
    FCST           : TCSTIcms;
    FCSOSN         : TCSOSNIcms;
    FReducaoBC     : Extended;
    FReducaoBCST   : Extended;
    FDiferimento   : Extended;
    FMVAST         : Extended;
    FBCSTRet       : Extended;
    FST            : Extended;
    FICMSSTRet     : Extended;
  public
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

implementation

{ TImpostoICMS }

constructor TImpostoICMS.Create(AImpostoItem: iImpostoItem);
begin
  FImpostoItem := AImpostoItem;

  FCST          := cstVazio;
  FCSOSN        := csosnVazio;
  FAliquotaICMS := 0;
  FReducaoBC    := 0;
  FDiferimento  := 0;
  FMVAST        := 0;
  FBCSTRet      := 0;
  FST           := 0;
  FICMSSTRet    := 0;
end;

destructor TImpostoICMS.Destroy;
begin

  inherited;
end;

class function TImpostoICMS.New(AImpostoItem: iImpostoItem): iImpostoICMS;
begin
  Result := Self.Create(AImpostoItem);
end;

function TImpostoICMS.CST(const Value: TCSTIcms): iImpostoICMS;
begin
  Result := Self;
  FCST := Value;

  if FImpostoItem.Retorno.CRT in [crtSimplesNacional] then
    FCST := cstVazio;
end;

function TImpostoICMS.CST:TCSTIcms;
begin
  Result := FCST;
end;

function TImpostoICMS.CSOSN(const Value: TCSOSNIcms): iImpostoICMS;
begin
  Result := Self;
  FCSOSN := Value;

  if FImpostoItem.Retorno.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
    FCSOSN := csosnVazio;
end;

function TImpostoICMS.CSOSN: TCSOSNIcms;
begin
  Result := FCSOSN;
end;

function TImpostoICMS.AliquotaSN(const pCredSN: Extended): iImpostoICMS;
begin
  { Por uma regra estadual, pode ser adicionado aliquotasn por item }
  Result := Self;
  FImpostoItem.Retorno.AliquotaSN(pCredSN);
end;

function TImpostoICMS.AliquotaICMS(const pICMS: Extended): iImpostoICMS;
begin
  Result := Self;
  FAliquotaICMS := pICMS;
end;

function TImpostoICMS.AliquotaICMS: Extended;
begin
  Result := 0;
  if FCST <> cstVazio then
  begin
    case FCST of
      cst30: ;
    else
      Result := FAliquotaICMS;
    end;
  end;
end;

function TImpostoICMS.AliquotaICMSST(const pICMSST: Extended): iImpostoICMS;
begin
  Result := Self;
  FAliquotaICMSST := pICMSST;
end;

function TImpostoICMS.AliquotaICMSST: Extended;
begin
  Result := FAliquotaICMSST;
end;

function TImpostoICMS.AliquotaST(const pST: Extended): iImpostoICMS;
begin
  Result := Self;
  FST := pST;
end;

function TImpostoICMS.ReducaoBC(const pRedBC: Extended): iImpostoICMS;
begin
  Result := Self;
  FReducaoBC := pRedBC;
end;

function TImpostoICMS.ReducaoBC: Extended;
begin
  Result := FReducaoBC;
end;

function TImpostoICMS.ReducaoBCST(const pRedBCST: Extended): iImpostoICMS;
begin
  Result := Self;
  FReducaoBCST := pRedBCST;
end;

function TImpostoICMS.ReducaoBCST: Extended;
begin
  Result := FReducaoBCST;
end;

function TImpostoICMS.Diferimento(const pDif: Extended): iImpostoICMS;
begin
  Result := Self;
  FDiferimento := pDif;
end;

function TImpostoICMS.Diferimento: Extended;
begin
  Result := FDiferimento;
end;

function TImpostoICMS.MVA(const pMVAST: Extended): iImpostoICMS;
begin
  Result := Self;
  FMVAST := pMVAST;
end;

function TImpostoICMS.MVA: Extended;
begin
  Result := FMVAST;
end;

function TImpostoICMS.BCSTRet(const vBCSTRet: Extended): iImpostoICMS;
begin
  Result := Self;
  FBCSTRet := vBCSTRet;
end;

function TImpostoICMS.ICMSSTRet(const vICMSSTRet: Extended): iImpostoICMS;
begin
  Result := Self;
  FICMSSTRet := vICMSSTRet;
end;

function TImpostoICMS.Retorno: iImpostoItem;
begin
  Result := FImpostoItem;
end;

end.
