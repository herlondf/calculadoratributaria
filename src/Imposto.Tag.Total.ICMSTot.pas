unit Imposto.Tag.Total.ICMSTot;

interface

uses
  Imposto.Utils,
  Imposto.Contract,
  Imposto.Tag.Contract;

type
  TImpostoTagTotalICMSTot = class(TinterfacedObject, iImpostoTagTotalICMSTot)
    constructor Create(AImpostoTagTotal: iImpostoTagTotal);
    destructor Destroy; override;
    class function New(AImpostoTagTotal: iImpostoTagTotal): iImpostoTagTotalICMSTot;
  private
    [weak]
    FImpostoTagTotal: iImpostoTagTotal;

    FvBC              : Double;
    FvICMS            : Double;
    FvBCST            : Double;
    FvST              : Double;
    FvProd            : Double;
    FvFrete           : Double;
    FvSeg             : Double;
    FvDesc            : Double;
    FvII              : Double;
    FvIPI             : Double;
    FvPIS             : Double;
    FvCOFINS          : Double;
    FvOutro           : Double;
    FvNF              : Double;
    FvTotTrib         : Double;
    FvICMSDeson       : Double;
    FvICMSUFDest_Opc  : Double;
    FvICMSUFRemet_Opc : Double;
    FvFCPUFDest_Opc   : Double;
    FvFCP             : Double;
    FvFCPST           : Double;
    FvFCPSTRet        : Double;
    FvIPIDevol        : Double;
    procedure ZerarValores;
  public
    procedure Recalcular(AImposto: iImposto; ATotalProd: Double);

    function vBC              : Double;
    function vICMS            : Double;
    function vBCST            : Double;
    function vST              : Double;
    function vProd            : Double;
    function vFrete           : Double;
    function vSeg             : Double;
    function vDesc            : Double;
    function vII              : Double;
    function vIPI             : Double;
    function vPIS             : Double;
    function vCOFINS          : Double;
    function vOutro           : Double;
    function vNF              : Double;
    function vTotTrib         : Double;
    function vICMSDeson       : Double;
    function vICMSUFDest_Opc  : Double;
    function vICMSUFRemet_Opc : Double;
    function vFCPUFDest_Opc   : Double;
    function vFCP             : Double;
    function vFCPST           : Double;
    function vFCPSTRet        : Double;
    function vIPIDevol        : Double;
  end;

implementation

uses
  Imposto.Tag.Det.Prod;

{ TImpostoTagTotalICMSTot }

constructor TImpostoTagTotalICMSTot.Create(AImpostoTagTotal: iImpostoTagTotal);
begin
  ZerarValores;
  FImpostoTagTotal := AImpostoTagTotal;
end;

destructor TImpostoTagTotalICMSTot.Destroy;
begin

  inherited;
end;

class function TImpostoTagTotalICMSTot.New(AImpostoTagTotal: iImpostoTagTotal): iImpostoTagTotalICMSTot;
begin
  Result := Self.Create(AImpostoTagTotal);
end;

procedure TImpostoTagTotalICMSTot.ZerarValores;
begin
  FvBC              := 0;
  FvICMS            := 0;
  FvBCST            := 0;
  FvST              := 0;
  FvProd            := 0;
  FvFrete           := 0;
  FvSeg             := 0;
  FvDesc            := 0;
  FvII              := 0;
  FvIPI             := 0;
  FvPIS             := 0;
  FvCOFINS          := 0;
  FvOutro           := 0;
  FvNF              := 0;
  FvTotTrib         := 0;
  FvICMSDeson       := 0;
  FvICMSUFDest_Opc  := 0;
  FvICMSUFRemet_Opc := 0;
  FvFCPUFDest_Opc   := 0;
  FvFCP             := 0;
  FvFCPST           := 0;
  FvFCPSTRet        := 0;
  FvIPIDevol        := 0;
end;

procedure TImpostoTagTotalICMSTot.Recalcular(AImposto: iImposto; ATotalProd: Double);
var
  LImpostoItem: iImpostoItem;
  LvDescConf, LvFreteConf, LvSegConf, LvOutroConf: Double;
begin
  LvFreteConf  := 0;
  LvSegConf    := 0;
  LvOutroConf  := 0;
  LvDescConf   := 0;

  ZerarValores;

  FvProd := FvProd + ATotalProd;

  for LImpostoItem in AImposto.Items do
  begin
    FvBC              := FvBC               + LImpostoItem.Det.tagImposto.ICMS.vBC;
    FvICMS            := FvICMS             + LImpostoItem.Det.tagImposto.ICMS.vICMS;
    FvBCST            := FvBCST             + LImpostoItem.Det.tagImposto.ICMS.vBCST;
    FvST              := FvST               + LImpostoItem.Det.tagImposto.ICMS.vICMSST;

    { Para os rateios, é feito uma etapa de correção no término,
      porque pode haver divergencia no arredondamento }
    FvFrete           := FvFrete            + LImpostoItem.Det.tagProd.vFrete;
    LvFreteConf       := LvFreteConf        + RoundABNT( LImpostoItem.Det.tagProd.vFrete, 2 );

    FvSeg             := FvSeg              + LImpostoItem.Det.tagProd.vSeg;
    LvSegConf         := LvSegConf          + RoundABNT( LImpostoItem.Det.tagProd.vSeg  , 2 );

    FvOutro           := FvOutro            + LImpostoItem.Det.tagProd.vOutro;
    LvOutroConf       := LvOutroConf        + RoundABNT( LImpostoItem.Det.tagProd.vOutro, 2 );


    FvDesc            := FvDesc             + LImpostoItem.Det.tagProd.vDesc;
    LvDescConf        := LvDescConf         + RoundABNT( LImpostoItem.Det.tagProd.vDesc , 2 );


    FvNF              := FvNF               + (
                                                LImpostoItem.Det.tagProd.vProdComDescUnit +
                                                LImpostoItem.Det.tagProd.vFrete           +
                                                LImpostoItem.Det.tagProd.vSeg             +
                                                LImpostoItem.Det.tagProd.vOutro
                                              ) -
                                                LImpostoItem.Det.tagProd.vDesc;


    { Corrige a divergencia do rateio no ultimo item }
    if LImpostoItem = AImposto.Items.Last then
    begin
      if LvFreteConf > FvFrete then
         TImpostoTagDetProd( LImpostoItem.Det.tagProd ).CorrigeRateio( prFrete, LvFreteConf - FvFrete );

      if LvSegConf > FvSeg then
         TImpostoTagDetProd( LImpostoItem.Det.tagProd ).CorrigeRateio( prSeg, LvSegConf - FvSeg       );

      if LvOutroConf > FvOutro then
         TImpostoTagDetProd( LImpostoItem.Det.tagProd ).CorrigeRateio( prOutro, LvOutroConf - FvOutro );

      if LvDescConf > FvDesc then
         TImpostoTagDetProd( LImpostoItem.Det.tagProd ).CorrigeRateio( prDesc, LvDescConf - FvDesc    );
    end;
  end;
end;

function TImpostoTagTotalICMSTot.vBC: Double;
begin
  Result := FvBC;
end;

function TImpostoTagTotalICMSTot.vICMS: Double;
begin
  Result := FvICMS;
end;

function TImpostoTagTotalICMSTot.vBCST: Double;
begin
  Result := FvBCST;
end;

function TImpostoTagTotalICMSTot.vST: Double;
begin
  Result := FvST;
end;

function TImpostoTagTotalICMSTot.vProd: Double;
begin
  Result := FvProd;
end;

function TImpostoTagTotalICMSTot.vFrete: Double;
begin
  Result := FvFrete;
end;

function TImpostoTagTotalICMSTot.vSeg: Double;
begin
  Result := FvSeg;
end;

function TImpostoTagTotalICMSTot.vDesc: Double;
begin
  Result := FvDesc;
end;

function TImpostoTagTotalICMSTot.vII: Double;
begin
  Result := FvII;
end;

function TImpostoTagTotalICMSTot.vIPI: Double;
begin
  Result := FvIPI;
end;

function TImpostoTagTotalICMSTot.vPIS: Double;
begin
  Result := FvPIS;
end;

function TImpostoTagTotalICMSTot.vCOFINS: Double;
begin
  Result := FvCOFINS;
end;

function TImpostoTagTotalICMSTot.vOutro: Double;
begin
  Result := FvOutro;
end;

function TImpostoTagTotalICMSTot.vNF: Double;
begin
  Result := FvNF;
end;

function TImpostoTagTotalICMSTot.vTotTrib: Double;
begin
  Result := FvTotTrib;
end;

function TImpostoTagTotalICMSTot.vICMSDeson: Double;
begin
  Result := FvICMSDeson;
end;

function TImpostoTagTotalICMSTot.vICMSUFDest_Opc: Double;
begin
  Result := FvICMSUFDest_Opc;
end;

function TImpostoTagTotalICMSTot.vICMSUFRemet_Opc: Double;
begin
  Result := FvICMSUFRemet_Opc;
end;

function TImpostoTagTotalICMSTot.vFCPUFDest_Opc: Double;
begin
  Result := FvFCPUFDest_Opc;
end;

function TImpostoTagTotalICMSTot.vFCP: Double;
begin
  Result := FvFCP;
end;

function TImpostoTagTotalICMSTot.vFCPST: Double;
begin
  Result := FvFCPST;
end;

function TImpostoTagTotalICMSTot.vFCPSTRet: Double;
begin
  Result := FvFCPSTRet;
end;

function TImpostoTagTotalICMSTot.vIPIDevol: Double;
begin
  Result := FvIPIDevol;
end;

end.
