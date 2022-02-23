unit Imposto.Item;

interface

uses
  Imposto.Utils,
  Imposto.Contract,
  Imposto.ICMS,
  Imposto.IPI,
  Imposto.PIS,
  Imposto.COFINS,
  System.Generics.Collections;

type
  TImpostoItem = class(TInterfacedObject, iImpostoItem)
    constructor Create(AImpostoCalc: iImposto);
    destructor Destroy; override;
    class function New(AImpostoCalc: iImposto): iImpostoItem;
  private
    [weak]
    FImpostoCalc     : iImposto;

    FOnChangeItem    : TOnChangeItem;

    FId              : Double;
    FQuantidade      : Extended;
    FValorUnitario   : Extended;
    FDescontoUnitario: Extended;
    FDescontoTotal   : Extended;

    FImpostoICMS     : iImpostoICMS;
    FImpostoIPI      : iImpostoIPI;
    FImpostoPIS      : iImpostoPIS;
    FImpostoCOFINS   : iImpostoCOFINS;

    FImpostoTagDet   : IImpostoTagDet;
  public
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
  FQuantidade       := 0;
  FValorUnitario    := 0;
  FDescontoUnitario := 0;
  FDescontoTotal    := 0;
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

function TImpostoItem.Id(const Value: Double): iImpostoItem;
begin
  Result := Self;
  FId := Value;
end;

function TImpostoItem.Id: Double;
begin
  Result := FId;
end;

function TImpostoItem.Quantidade(const Value: Extended): iImpostoItem;
begin
  Result := Self;
  if Value <> FQuantidade then
    FQuantidade:= Value;
end;

function TImpostoItem.Quantidade: Extended;
begin
  Result := FQuantidade;
end;

function TImpostoItem.ValorUnitario(const Value: Extended): iImpostoItem;
begin
  Result := Self;
  if Value <> FValorUnitario then
    FValorUnitario := Value;
end;

function TImpostoItem.ValorUnitario: Extended;
begin
  Result := FValorUnitario;
end;

function TImpostoItem.DescontoUnitario(const Value: Extended): iImpostoItem;
begin
  Result := Self;
  if Value > 0 then
    FDescontoTotal := 0;
  FDescontoUnitario := Value;
end;

function TImpostoItem.DescontoUnitario: Extended;
begin
  Result := FDescontoUnitario;
end;

function TImpostoItem.DescontoTotal(const Value: Extended): iImpostoItem;
begin
  Result := Self;
  if Value > 0 then
    FDescontoUnitario := 0;
  FDescontoTotal := Value;
end;

function TImpostoItem.DescontoTotal: Extended;
begin
  Result := FDescontoTotal;
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
