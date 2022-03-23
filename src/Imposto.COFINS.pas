//***********************************************************
//                                                         //
// A base de PIS e COFINS é sobre o valor que gera receita //
// Ex.: Frete por conta do destinatário                    //
//                                                         //
// Regimes de PIS e COFINS                                 //
// - Cumulativo (0,65% e 3%)                               //
// - Não cumulativo (1,65% e 7,6%)                         //
//                                                         //
//***********************************************************

unit Imposto.COFINS;

interface

uses
  Imposto.Utils,
  Imposto.Contract;

type
  TImpostoCOFINS = class(TInterfacedObject, iImpostoCOFINS)
    constructor Create(AImpostoItem: iImpostoItem);
    destructor Destroy; override;
    class function New(AImpostoItem: iImpostoItem): iImpostoCOFINS;
  private
    [weak]
    FImpostoItem: iImpostoItem;

    FCST           : TpcnCstCOFINS;
    FAliquotaPIS   : Extended;
  public
    function CST(const Value: TpcnCstCOFINS): iImpostoCOFINS;

    function AliquotaCOFINS(const Value: Extended): iImpostoCOFINS; overload;
    function AliquotaCOFINS: Extended; overload;

    function ValorCOFINS: Extended;

    function Retorno: iImpostoItem;
  end;

implementation

uses
  Imposto.COFINS.CST01,
  Imposto.COFINS.CST02,
  Imposto.COFINS.CST03;


{ TImpostoCOFINS }

constructor TImpostoCOFINS.Create(AImpostoItem: iImpostoItem);
begin
  FImpostoItem := AImpostoItem;
end;

destructor TImpostoCOFINS.Destroy;
begin

  inherited;
end;

class function TImpostoCOFINS.New(AImpostoItem: iImpostoItem): iImpostoCOFINS;
begin
  Result := Self.Create(AImpostoItem);
end;

function TImpostoCOFINS.CST(const Value: TpcnCstCOFINS): iImpostoCOFINS;
begin
  Result := Self;
  FCST := Value;
end;

function TImpostoCOFINS.AliquotaCOFINS(const Value: Extended): iImpostoCOFINS;
begin
  Result := Self;
  FAliquotaPIS := Value;
end;

function TImpostoCOFINS.AliquotaCOFINS: Extended;
begin
  Result := FAliquotaPIS;
end;

function TImpostoCOFINS.ValorCOFINS: Extended;
begin
  Result := 0;

  case FCST of
    TpcnCstCOFINS.cof01: Result := ValorCOFINS01(FImpostoItem);
    TpcnCstCOFINS.cof02: Result := ValorCOFINS02(FImpostoItem);
    TpcnCstCOFINS.cof03: Result := ValorCOFINS03(FImpostoItem);
  end;
end;

function TImpostoCOFINS.Retorno: iImpostoItem;
begin
  Result := FImpostoItem;
end;


end.
