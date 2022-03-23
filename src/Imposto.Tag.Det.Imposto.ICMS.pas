unit Imposto.Tag.Det.Imposto.ICMS;

interface

uses
  Imposto.ICMS.CST00,
  Imposto.ICMS.CST10,
  Imposto.ICMS.CST30,
  Imposto.ICMS.CST20,
  Imposto.ICMS.CST51,
  Imposto.ICMS.CST70,
  Imposto.ICMS.CSOSN101,
  Imposto.ICMS.CSOSN102,
  Imposto.ICMS.CSOSN103,
  Imposto.ICMS.CSOSN201,
  Imposto.ICMS.CSOSN202,
  Imposto.ICMS.CSOSN203,
  Imposto.ICMS.CSOSN300,
  Imposto.ICMS.CSOSN400,
  Imposto.ICMS.CSOSN500,
  Imposto.ICMS.CSOSN900,
  Imposto.Utils,
  Imposto.Aliquota,
  Imposto.Contract;

type
  TImpostoTagDetImpostoICMS = class(TInterfacedObject, iImpostoTagDetImpostoICMS)
    constructor Create(AImpostoItem: iImpostoItem);
    destructor Destroy; override;
    class function New(AImpostoItem: iImpostoItem): iImpostoTagDetImpostoICMS;
  private
    [weak]
    FImpostoItem     : iImpostoItem;
  public
    function vBC     : Double;
    function vICMS   : Double;
    function vICMSOp : Double;
    function vICMSDif: Double;
    function vCredSN : Double;
    function pCredSN : Double;
    function vBCST   : Double;
    function pICMSST : Double;
    function vICMSST : Double;
    function pMVAST  : Double;
  end;

implementation

{ TImpostoTagDetImpostoICMS }

constructor TImpostoTagDetImpostoICMS.Create(AImpostoItem: iImpostoItem);
begin
  FImpostoItem := AImpostoItem;
end;

destructor TImpostoTagDetImpostoICMS.Destroy;
begin

  inherited;
end;

class function TImpostoTagDetImpostoICMS.New(AImpostoItem: iImpostoItem): iImpostoTagDetImpostoICMS;
begin
  Result := Self.Create(AImpostoItem);
end;

function TImpostoTagDetImpostoICMS.vBC: Double;
begin
  Result := 0;

  if FImpostoItem.ICMS.CST <> TpcnCSTIcms.cstVazio  then
  begin
    case FImpostoItem.ICMS.CST of
      TpcnCSTIcms.cst00: Result := ValorBaseICMS00( FImpostoItem );
      TpcnCSTIcms.cst10: Result := ValorBaseICMS10( FImpostoItem );
      TpcnCSTIcms.cst20: Result := ValorBaseICMS20( FImpostoItem ); {Passivel de reducao na base}
      TpcnCSTIcms.cst30: Result := ValorBaseICMS30( FImpostoItem ); //0; {Isento nao destaca ICMS proprio na nota}
      TpcnCSTIcms.cst40: Result := 0; {Operacao isenta de ICMS}
      TpcnCSTIcms.cst41: Result := 0; {Operacao sem incidencia de ICMS - Ex.: Exportacao de mercadoria}
      TpcnCSTIcms.cst50: Result := 0; {Operacao passivel de tributacao, ams a legislacao permite o nao recolhimento de ICMS}
      TpcnCSTIcms.cst51: Result := ValorBaseICMS51( FImpostoItem ); {Passivel de reducao na base}
      TpcnCSTIcms.cst60: Result := 0; {ICMS cobrado anteriormente por ST}
      TpcnCSTIcms.cst70: Result := ValorBaseICMS70( FImpostoItem ); {Passivel de reducao na base}
      TpcnCSTIcms.cst90: ;
    end;
  end
  else
  if FImpostoItem.ICMS.CSOSN <> TpcnCSOSNIcms.csosnVazio then
  begin
    { Simples nacional não destava tributo próprio na nota }
    case FImpostoItem.ICMS.CSOSN of
      TpcnCSOSNIcms.csosn101: Result := ValorBaseICMS101( FImpostoItem ) {Não destaca vBC na nota};
      TpcnCSOSNIcms.csosn102: Result := 0;
      TpcnCSOSNIcms.csosn103: Result := 0;
      TpcnCSOSNIcms.csosn201: ;
      TpcnCSOSNIcms.csosn202: ;
      TpcnCSOSNIcms.csosn203: ;
      TpcnCSOSNIcms.csosn300: Result := 0;
      TpcnCSOSNIcms.csosn400: Result := 0;
      TpcnCSOSNIcms.csosn500: Result := 0;
      TpcnCSOSNIcms.csosn900: Result := ValorBaseICMS900(FImpostoItem);
    end;
  end;
end;

function TImpostoTagDetImpostoICMS.vICMS: Double;
begin
  Result := 0;

  if FImpostoItem.ICMS.CST <> TpcnCSTIcms.cstVazio  then
  begin
    case FImpostoItem.ICMS.CST of
      TpcnCSTIcms.cst00: Result := ValorICMS00(FImpostoItem);
      TpcnCSTIcms.cst10: Result := ValorICMS10(FImpostoItem);
      TpcnCSTIcms.cst20: Result := ValorICMS20(FImpostoItem);
      TpcnCSTIcms.cst30: Result := ValorICMS30(FImpostoItem);  //0;  {Isento, calcula ICMS próprio mas nao destaca}
      TpcnCSTIcms.cst40: Result := 0;  {Operacao isenta de ICMS}
      TpcnCSTIcms.cst41: Result := 0;  {Operacao sem incidencia de ICMS - Ex.: Exportacao de mercadoria}
      TpcnCSTIcms.cst50: Result := 0;  {Operacao passivel de tributacao, ams a legislacao permite o nao recolhimento de ICMS}
      TpcnCSTIcms.cst51: Result := ValorICMS51(FImpostoItem);
      TpcnCSTIcms.cst60: Result := 0;
      TpcnCSTIcms.cst70: Result := ValorICMS70(FImpostoItem);
      TpcnCSTIcms.cst90: Result := 0;
    end;
  end
  else
  if FImpostoItem.ICMS.CSOSN <> TpcnCSOSNIcms.csosnVazio then
  begin
    case FImpostoItem.ICMS.CSOSN of
      TpcnCSOSNIcms.csosn101: Result := 0;
      TpcnCSOSNIcms.csosn102: Result := 0;
      TpcnCSOSNIcms.csosn103: Result := 0;
      TpcnCSOSNIcms.csosn201: Result := 0;
      TpcnCSOSNIcms.csosn202: Result := 0;
      TpcnCSOSNIcms.csosn203: Result := 0;
      TpcnCSOSNIcms.csosn300: Result := 0;
      TpcnCSOSNIcms.csosn400: Result := 0;
      TpcnCSOSNIcms.csosn500: Result := 0;
      TpcnCSOSNIcms.csosn900: Result := ValorICMS900(FImpostoItem);
    end;
  end;
end;

function TImpostoTagDetImpostoICMS.vICMSOp: Double;
begin
  Result := 0;

  if FImpostoItem.ICMS.CST <> TpcnCSTIcms.cstVazio  then
  begin
    case FImpostoItem.ICMS.CST of
      TpcnCSTIcms.cst51: Result := ValorICMS51Op(FImpostoItem);
    end;
  end;
end;

function TImpostoTagDetImpostoICMS.vICMSDif: Double;
begin
  Result := 0;

  if FImpostoItem.ICMS.CST <> TpcnCSTIcms.cstVazio  then
  begin
    case FImpostoItem.ICMS.CST of
      TpcnCSTIcms.cst51: Result := ValorICMS51Diferido(FImpostoItem);
    end;
  end;
end;

function TImpostoTagDetImpostoICMS.vCredSN: Double;
begin
  Result := 0;

  case FImpostoItem.ICMS.CSOSN of
    TpcnCSOSNIcms.csosn101: Result := ValorCredSN101(FImpostoItem);
  end;
end;

function TImpostoTagDetImpostoICMS.pCredSN: Double;
begin
  Result := 0;

  case FImpostoItem.ICMS.CSOSN of
    TpcnCSOSNIcms.csosn101, TpcnCSOSNIcms.csosn201: Result := FImpostoItem.ICMS.AliquotaICMS;
  end;
end;

function TImpostoTagDetImpostoICMS.vBCST: Double;
begin
  Result := 0;

  if FImpostoItem.ICMS.CST <> TpcnCSTIcms.cstVazio  then
  begin
    case FImpostoItem.ICMS.CST of
      TpcnCSTIcms.cst10: Result := ValorBaseICMS10ST(FImpostoItem);
      TpcnCSTIcms.cst30: Result := ValorBaseICMS30ST(FImpostoItem);
      TpcnCSTIcms.cst70: Result := ValorBaseICMS70ST(FImpostoItem);
    end;
  end
  else
  if FImpostoItem.ICMS.CSOSN <> TpcnCSOSNIcms.csosnVazio then
  begin
    case FImpostoItem.ICMS.CSOSN of
      TpcnCSOSNIcms.csosn201: Result := ValorBaseICMS201ST(FImpostoItem);
      TpcnCSOSNIcms.csosn202: Result := ValorBaseICMS202ST(FImpostoItem);
      TpcnCSOSNIcms.csosn203: Result := ValorBaseICMS203ST(FImpostoItem);
      TpcnCSOSNIcms.csosn900: Result := ValorBaseICMSST900(FImpostoItem)
    end;
  end;
end;

function TImpostoTagDetImpostoICMS.pICMSST: Double;
begin

  if FImpostoItem.ICMS.AliquotaICMSST <> 0 then
    Result := FImpostoItem.ICMS.AliquotaICMSST
  else
    Result :=  BuscarAliquota( FImpostoItem.Retorno.UFOrigem, FImpostoItem.Retorno.UFDestino );
end;

function TImpostoTagDetImpostoICMS.vICMSST: Double;
begin
  Result := 0;

  if FImpostoItem.ICMS.CST <> TpcnCSTIcms.cstVazio  then
  begin
    case FImpostoItem.ICMS.CST of
      TpcnCSTIcms.cst10: Result := ValorICMS10ST(FImpostoItem);
      TpcnCSTIcms.cst30: Result := ValorICMS30ST(FImpostoItem);
      TpcnCSTIcms.cst70: Result := ValorICMS70ST(FImpostoItem);
    end;
  end
  else
  if FImpostoItem.ICMS.CSOSN <> TpcnCSOSNIcms.csosnVazio then
  begin
    case FImpostoItem.ICMS.CSOSN of
      TpcnCSOSNIcms.csosn201: Result := ValorICMS201ST(FImpostoItem);
      TpcnCSOSNIcms.csosn202: Result := ValorICMS202ST(FImpostoItem);
      TpcnCSOSNIcms.csosn203: Result := ValorICMS203ST(FImpostoItem);
      TpcnCSOSNIcms.csosn900: Result := ValorICMSST900(FImpostoItem)
    end
  end;
end;

function TImpostoTagDetImpostoICMS.pMVAST  : Double;
begin
  Result := FImpostoItem.ICMS.MVA;
end;

end.
