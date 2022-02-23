unit Imposto.Tag.Det.Imposto;

interface

uses
  Imposto.Contract;

type
  TImpostoTagDetImposto = class(TInterfacedObject, iImpostoTagDetImposto)
    constructor Create(AImpostoItem: iImpostoItem);
    destructor Destroy; override;
    class function New(AImpostoItem: iImpostoItem): iImpostoTagDetImposto;
  private
    [weak]
    FImpostoItem : iImpostoItem;

    FvTotTrib    : Double;
    FICMS        : iImpostoTagDetImpostoICMS;
    FIPI         : iImpostoTagDetImpostoIPI;
    FII          : iImpostoTagDetImpostoII;
    FPIS         : iImpostoTagDetImpostoPIS;
    FPISST       : iImpostoTagDetImpostoPISST;
    FCOFINS      : iImpostoTagDetImpostoCOFINS;
    FCOFINSST    : iImpostoTagDetImpostoCOFINSST;
    FISSQN       : iImpostoTagDetImpostoISSQN;
    FICMSUFDest  : iImpostoTagDetImpostoICMSUFDest;
  public
    function vTotTrib   : Double;

    function ICMS       : iImpostoTagDetImpostoICMS;
    function IPI        : iImpostoTagDetImpostoIPI;
    function II         : iImpostoTagDetImpostoII;
    function PIS        : iImpostoTagDetImpostoPIS;
    function PISST      : iImpostoTagDetImpostoPISST;
    function COFINS     : iImpostoTagDetImpostoCOFINS;
    function COFINSST   : iImpostoTagDetImpostoCOFINSST;
    function ISSQN      : iImpostoTagDetImpostoISSQN;
    function ICMSUFDest : iImpostoTagDetImpostoICMSUFDest;
  end;

implementation

uses
  Imposto.Tag.Det.Imposto.ICMS;

{ TImpostoTagDetImposto }

constructor TImpostoTagDetImposto.Create(AImpostoItem: iImpostoItem);
begin
  FImpostoItem := AImpostoItem;
end;

destructor TImpostoTagDetImposto.Destroy;
begin

  inherited;
end;

class function TImpostoTagDetImposto.New(AImpostoItem: iImpostoItem): iImpostoTagDetImposto;
begin
  Result := Self.Create(AImpostoItem);
end;

function TImpostoTagDetImposto.vTotTrib: Double;
begin
  Result := FvTotTrib;
end;

function TImpostoTagDetImposto.ICMS: iImpostoTagDetImpostoICMS;
begin
  if not Assigned(FICMS) then
    FICMS := TImpostoTagDetImpostoICMS.New(FImpostoItem);
  Result := FICMS;
end;

function TImpostoTagDetImposto.IPI: iImpostoTagDetImpostoIPI;
begin
//  if not Assigned(FIPI) then
//    FIPI := TImpostoTagDetImpostoIPI.New;
//  Result := FIPI;
end;

function TImpostoTagDetImposto.II : iImpostoTagDetImpostoII;
begin
//  if not Assigned(FII) then
//    FII := TImpostoTagDetImpostoII.New;
//  Result := FII;
end;

function TImpostoTagDetImposto.PIS: iImpostoTagDetImpostoPIS;
begin
//  if not Assigned(FPIS) then
//    FPIS := TImpostoTagDetImpostoPIS.New;
//  Result := FPIS;
end;

function TImpostoTagDetImposto.PISST: iImpostoTagDetImpostoPISST;
begin
//  if not Assigned(FPISST) then
//    FPISST := TImpostoTagDetImpostoPISST.New;
//  Result := FPISST;
end;

function TImpostoTagDetImposto.COFINS : iImpostoTagDetImpostoCOFINS;
begin
//  if not Assigned(FCOFINS) then
//    FCOFINS := TImpostoTagDetImpostoCOFINS.New;
//  Result := FCOFINS;
end;

function TImpostoTagDetImposto.COFINSST : iImpostoTagDetImpostoCOFINSST;
begin
//  if not Assigned(FCOFINSST) then
//    FCOFINSST := TImpostoTagDetImpostoCOFINSST.New;
//  Result := FCOFINSST;
end;

function TImpostoTagDetImposto.ISSQN: iImpostoTagDetImpostoISSQN;
begin
//  if not Assigned(FISSQN) then
//    FISSQN := TImpostoTagDetImpostoISSQN.New;
//  Result := FISSQN;
end;

function TImpostoTagDetImposto.ICMSUFDest: iImpostoTagDetImpostoICMSUFDest;
begin
//  if not Assigned(FICMSUFDest) then
//    FICMSUFDest := TImpostoTagDetImpostoICMSUFDest.New;
//  Result := FICMSUFDest;
end;


end.

