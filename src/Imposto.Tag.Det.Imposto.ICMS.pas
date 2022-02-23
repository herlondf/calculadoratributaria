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
    function vCredSN : Double;
    function vBCST   : Double;
    function vICMSST : Double;
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

  if FImpostoItem.ICMS.CST <> cstVazio then
  begin
    case FImpostoItem.ICMS.CST of
      cst00: Result := ValorBaseICMS00( FImpostoItem );
      cst10: Result := ValorBaseICMS10( FImpostoItem );
      cst20: Result := ValorBaseICMS20( FImpostoItem ); {Passivel de reducao na base}
      cst30: Result := 0; {Isento nao destaca ICMS proprio na nota}
      cst40: Result := 0; {Operacao isenta de ICMS}
      cst41: Result := 0; {Operacao sem incidencia de ICMS - Ex.: Exportacao de mercadoria}
      cst50: Result := 0; {Operacao passivel de tributacao, ams a legislacao permite o nao recolhimento de ICMS}
      cst51: Result := ValorBaseICMS51( FImpostoItem ); {Passivel de reducao na base}
      cst60: Result := 0; {ICMS cobrado anteriormente por ST}
      cst70: Result := ValorBaseICMS70( FImpostoItem ); {Passivel de reducao na base}
      cst90: ;
      cstVazio: ;
    end;
  end
  else
  if FImpostoItem.ICMS.CSOSN <> csosnVazio then
  begin
    { Simples nacional não destava tributo próprio na nota }
    case FImpostoItem.ICMS.CSOSN of
      csosnVazio: ;
      csosn101: Result := ValorBaseICMS101( FImpostoItem ) {Não destaca vBC na nota};
      csosn102: Result := 0;
      csosn103: Result := 0;
      csosn201: ;
      csosn202: ;
      csosn203: ;
      csosn300: Result := 0;
      csosn400: Result := 0;
      csosn500: Result := 0;
      csosn900: Result := ValorBaseICMS900(FImpostoItem);
    end;
  end;
end;

function TImpostoTagDetImpostoICMS.vICMS: Double;
begin
  Result := 0;

  if FImpostoItem.ICMS.CST <> cstVazio then
  begin
    case FImpostoItem.ICMS.CST of
      cst00: Result := ValorICMS00(FImpostoItem);
      cst10: Result := ValorICMS10(FImpostoItem);
      cst20: Result := ValorICMS20(FImpostoItem);
      cst30: Result := 0;  {Isento, calcula ICMS próprio mas nao destaca}
      cst40: Result := 0;  {Operacao isenta de ICMS}
      cst41: Result := 0;  {Operacao sem incidencia de ICMS - Ex.: Exportacao de mercadoria}
      cst50: Result := 0;  {Operacao passivel de tributacao, ams a legislacao permite o nao recolhimento de ICMS}
      cst51: Result := ValorICMS51Diferido(FImpostoItem);
      cst60: Result := 0;
      cst70: Result := ValorICMS70(FImpostoItem);
      cst90: Result := 0;
      cstVazio: Result := 0;
    end;
  end
  else
  if FImpostoItem.ICMS.CSOSN <> csosnVazio then
  begin
    case FImpostoItem.ICMS.CSOSN of
      csosn101: Result := 0;
      csosn102: Result := 0;
      csosn103: Result := 0;
      csosn201: Result := 0;
      csosn202: Result := 0;
      csosn203: Result := 0;
      csosn300: Result := 0;
      csosn400: Result := 0;
      csosn500: Result := 0;
      csosn900: Result := ValorICMS900(FImpostoItem);
      csosnVazio: Result := 0;
    end;
  end;
end;

function TImpostoTagDetImpostoICMS.vICMSOp: Double;
begin
  Result := 0;

  if FImpostoItem.ICMS.CST <> cstVazio then
  begin
    case FImpostoItem.ICMS.CST of
      cst00: Result := 0;
      cst10: Result := 0;
      cst20: Result := 0;
      cst30: Result := 0; {Isento nao destaca ICMS proprio na nota}
      cst40: Result := 0; {Operacao isenta de ICMS}
      cst41: Result := 0; {Operacao sem incidencia de ICMS - Ex.: Exportacao de mercadoria}
      cst50: Result := 0; {Operacao passivel de tributacao, ams a legislacao permite o nao recolhimento de ICMS}
      cst51: Result := ValorICMS51(FImpostoItem);
      cst60: Result := 0;
      cst70: Result := 0;
      cst90: Result := 0;
      cstVazio: Result := 0;
    end;
  end
  else
  if FImpostoItem.ICMS.CSOSN <> csosnVazio then
  begin
    case FImpostoItem.ICMS.CSOSN of
      csosn101: Result := 0;
      csosn102: Result := 0;
      csosn103: Result := 0;
      csosn201: Result := 0;
      csosn202: Result := 0;
      csosn203: Result := 0;
      csosn300: Result := 0;
      csosn400: Result := 0;
      csosn500: Result := 0;
      csosn900: Result := 0;
      csosnVazio: Result := 0;
    end;
  end;
end;

function TImpostoTagDetImpostoICMS.vCredSN: Double;
begin
  Result := 0;

  if FImpostoItem.ICMS.CSOSN <> csosnVazio then
  begin
    case FImpostoItem.ICMS.CSOSN of
      csosn101: Result := ValorCredSN101(FImpostoItem);
      //csosn201: Result := ValorCredSN;
      else
        Result := 0;
    end;
  end;
end;

function TImpostoTagDetImpostoICMS.vBCST: Double;
begin
  Result := 0;

  if FImpostoItem.ICMS.CST <> cstVazio then
  begin
    case FImpostoItem.ICMS.CST of
      cst10: Result := ValorBaseICMS10ST(FImpostoItem);
      cst30: Result := ValorBaseICMS30ST(FImpostoItem);
      cst70: Result := ValorBaseICMS70ST(FImpostoItem);
      else
        Result := 0;
    end;
  end
  else
  if FImpostoItem.ICMS.CSOSN <> csosnVazio then
  begin
    case FImpostoItem.ICMS.CSOSN of
      csosn201: Result := ValorBaseICMS201ST(FImpostoItem);
      csosn202: Result := ValorBaseICMS202ST(FImpostoItem);
      csosn203: Result := ValorBaseICMS203ST(FImpostoItem);
      csosn900: Result := ValorBaseICMSST900(FImpostoItem)
      else
        Result := 0;
    end;
  end;
end;

function TImpostoTagDetImpostoICMS.vICMSST: Double;
begin
  Result := 0;

  if FImpostoItem.ICMS.CST <> cstVazio then
  begin
    case FImpostoItem.ICMS.CST of
      cst10: Result := ValorICMS10ST(FImpostoItem);
      cst30: Result := ValorICMS30ST(FImpostoItem);
      cst70: Result := ValorICMS70ST(FImpostoItem);
      else
        Result := 0;
    end;
  end
  else
  if FImpostoItem.ICMS.CSOSN <> csosnVazio then
  begin
    case FImpostoItem.ICMS.CSOSN of
      csosn201: Result := ValorICMS201ST(FImpostoItem);
      csosn202: Result := ValorICMS202ST(FImpostoItem);
      csosn203: Result := ValorICMS203ST(FImpostoItem);
      csosn900: Result := ValorICMSST900(FImpostoItem)
      else
        Result := 0;
    end;
  end;
end;

end.
