unit Imposto.Tag.Det;

interface

uses
  Imposto.Contract;

type
  TImpostoTagDet = class(TInterfacedObject, iImpostoTagDet)
    constructor Create(AImpostoItem: iImpostoItem);
    destructor Destroy; override;
    class function New(AImpostoItem: iImpostoItem): iImpostoTagDet;
  private
    [weak]
    FImpostoItem : iImpostoItem;

    FtagProd     : iImpostoTagDetProd;
    FtagImposto  : iImpostoTagDetImposto;
  public
    function tagProd    : iImpostoTagDetProd;
    function tagImposto : iImpostoTagDetImposto;
  end;

implementation

uses
  Imposto.Tag.Det.Prod,
  Imposto.Tag.Det.Imposto;

{ TImpostoTagDet }

constructor TImpostoTagDet.Create(AImpostoItem: iImpostoItem);
begin
  FImpostoItem := AImpostoItem;
end;

destructor TImpostoTagDet.Destroy;
begin

  inherited;
end;

class function TImpostoTagDet.New(AImpostoItem: iImpostoItem): iImpostoTagDet;
begin
  Result := Self.Create(AImpostoItem);
end;

function TImpostoTagDet.tagProd: iImpostoTagDetProd;
begin
  if not Assigned(FtagProd) then
    FtagProd := TImpostoTagDetProd.New(FImpostoItem);
  Result := FtagProd;
end;

function TImpostoTagDet.tagImposto: iImpostoTagDetImposto;
begin
  if not Assigned(FtagImposto) then
    FtagImposto := TImpostoTagDetImposto.New(FImpostoItem);
  Result := FtagImposto;
end;

end.
