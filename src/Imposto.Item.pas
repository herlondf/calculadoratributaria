unit Imposto.Item;

interface

uses
  Imposto.Utils,
  Imposto.Contract,
  Imposto.ICMS,
  Imposto.IPI,
  Imposto.PIS,
  Imposto.COFINS,
  System.SysUtils,
  System.Generics.Collections;

type
  TImpostoItem = class(TInterfacedObject, iImpostoItem)
    constructor Create(AImpostoCalc: iImposto);
    destructor Destroy; override;
    class function New(AImpostoCalc: iImposto): iImpostoItem;
  private
    [weak]
    FImpostoCalc          : iImposto;

    FOnChangeItem         : TOnChangeItem;

    FId                   : Integer;
    FCFOP                 : Integer;
    FQuantidade           : Double;
    FValorUnitario        : Double;
    FDescontoUnitario     : Double;
    FDescontoUnitarioPerc : Double;
    FDescontoTotal        : Double;
    FDescontoTotalPerc    : Double;

    FImpostoICMS          : iImpostoICMS;
    FImpostoIPI           : iImpostoIPI;
    FImpostoPIS           : iImpostoPIS;
    FImpostoCOFINS        : iImpostoCOFINS;

    FImpostoTagDet        : IImpostoTagDet;

    procedure ZerarValores;
    procedure ZerarDescontos;
  public
    function OnChangeItem(const Value: TOnChangeItem): iImpostoItem;

    function Id(const Value: Integer): iImpostoItem; overload;
    function Id: Integer; overload;

    function CFOP(const Value: Integer): iImpostoItem; overload;
    function CFOP(const Value: String): iImpostoItem; overload;
    function CFOP: Integer; overload;

    function Quantidade(const Value: Double): iImpostoItem; overload;
    function Quantidade: Double; overload;

    function ValorUnitario(const Value: Double): iImpostoItem; overload;
    function ValorUnitario: Double; overload;

    function DescontoUnitario(const Value: Double): iImpostoItem; overload;
    function DescontoUnitario: Double; overload;

    function DescontoUnitarioPerc(const Value: Double): iImpostoItem; overload;
    function DescontoUnitarioPerc: Double; overload;

    function DescontoTotal(const Value: Double): iImpostoItem; overload;
    function DescontoTotal: Double; overload;

    function DescontoTotalPerc(const Value: Double): iImpostoItem; overload;
    function DescontoTotalPerc: Double; overload;

    function ICMS    : iImpostoICMS;
    function IPI     : iImpostoIPI;
    function PIS     : iImpostoPIS;
    function COFINS  : iImpostoCOFINS;

    function Recalcular: iImpostoItem;

    function Det: IImpostoTagDet;

    function Retorno : iImposto;
  end;

implementation

uses
  Imposto.Tag.Det;

{ TImpostoItem }

constructor TImpostoItem.Create(AImpostoCalc: iImposto);
begin
  FImpostoCalc := AImpostoCalc;
  ZerarValores;
end;

destructor TImpostoItem.Destroy;
begin

  inherited;
end;

class function TImpostoItem.New(AImpostoCalc: iImposto): iImpostoItem;
begin
  Result := Self.Create(AImpostoCalc);
end;

function TImpostoItem.OnChangeItem(const Value: TOnChangeItem): iImpostoItem;
begin
  Result := Self;
  FOnChangeItem := Value;
end;

procedure TImpostoItem.ZerarValores;
begin
  FQuantidade           := 0;
  FValorUnitario        := 0;
  FDescontoUnitario     := 0;
  FDescontoUnitarioPerc := 0;
  FDescontoTotal        := 0;
  FDescontoTotalPerc    := 0;
end;

procedure TImpostoItem.ZerarDescontos;
begin
  FDescontoUnitario     := 0;
  FDescontoUnitarioPerc := 0;
  FDescontoTotal        := 0;
  FDescontoTotalPerc    := 0;
end;

function TImpostoItem.Id(const Value: Integer): iImpostoItem;
begin
  Result := Self;
  FId := Value;
end;

function TImpostoItem.Id: Integer;
begin
  Result := FId;
end;

function TImpostoItem.CFOP(const Value: Integer): iImpostoItem;
begin
  Result := Self;
  FCFOP := Value;
end;

function TImpostoItem.CFOP(const Value: String): iImpostoItem;
begin
  Result := Self;
  CFOP( StrToInt( Value ) );
end;


function TImpostoItem.CFOP: Integer;
begin
  Result := FCFOP;
end;

function TImpostoItem.Quantidade(const Value: Double): iImpostoItem;
begin
  Result := Self;
  if Value <> FQuantidade then
    FQuantidade:= Value;
end;

function TImpostoItem.Quantidade: Double;
begin
  Result := FQuantidade;
end;

function TImpostoItem.ValorUnitario(const Value: Double): iImpostoItem;
begin
  Result := Self;
  if Value <> FValorUnitario then
    FValorUnitario := Value;
end;

function TImpostoItem.ValorUnitario: Double;
begin
  Result := FValorUnitario;
end;

function TImpostoItem.DescontoUnitario(const Value: Double): iImpostoItem;
begin
  Result := Self;
  if Value > 0 then ZerarDescontos;
  FDescontoUnitario := Value;
end;

function TImpostoItem.DescontoUnitario: Double;
begin
  Result := FDescontoUnitario;
end;

function TImpostoItem.DescontoUnitarioPerc(const Value: Double): iImpostoItem;
begin
  Result := Self;
  if Value > 0 then ZerarDescontos;
  FDescontoUnitarioPerc := Value;
end;

function TImpostoItem.DescontoUnitarioPerc: Double;
begin
  Result := FDescontoUnitarioPerc;
end;

function TImpostoItem.DescontoTotal(const Value: Double): iImpostoItem;
begin
  Result := Self;
  if Value > 0 then ZerarDescontos;
  FDescontoTotal := Value;
end;

function TImpostoItem.DescontoTotal: Double;
begin
  Result := FDescontoTotal;
end;

function TImpostoItem.DescontoTotalPerc(const Value: Double): iImpostoItem;
begin
  Result := Self;
  if Value > 0 then ZerarDescontos;
  FDescontoTotalPerc := Value;
end;

function TImpostoItem.DescontoTotalPerc: Double;
begin
  Result := FDescontoTotalPerc;
end;

function TImpostoItem.ICMS: iImpostoICMS;
begin
  if FImpostoICMS = nil then
    FImpostoICMS := TImpostoICMS.New(Self);
  Result := FImpostoICMS;
end;

function TImpostoItem.IPI: iImpostoIPI;
begin
  if FImpostoIPI = nil then
    FImpostoIPI := TImpostoIPI.New(Self);
  Result := FImpostoIPI;
end;

function TImpostoItem.PIS: iImpostoPIS;
begin
  if FImpostoPIS = nil then
    FImpostoPIS := TImpostoPIS.New(Self);
  Result := FImpostoPIS;
end;

function TImpostoItem.COFINS: iImpostoCOFINS;
begin
  if FImpostoCOFINS = nil then
    FImpostoCOFINS := TImpostoCOFINS.New(Self);
  Result := FImpostoCOFINS;
end;

function TImpostoItem.Det: IImpostoTagDet;
begin
  if not Assigned(FImpostoTagDet) then
    FImpostoTagDet := TImpostoTagDet.New(Self);
  Result := FImpostoTagDet;
end;

function TImpostoItem.Recalcular: iImpostoItem;
begin
  if Assigned(FOnChangeItem) then
    FOnChangeItem;
end;

function TImpostoItem.Retorno: iImposto;
begin
  Result := FImpostoCalc;
end;

end.
