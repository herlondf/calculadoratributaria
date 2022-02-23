unit Imposto.PIS;

interface

uses
  Imposto.Utils,
  Imposto.Contract;

type
  TImpostoPIS = class(TInterfacedObject, iImpostoPIS)
    constructor Create(AImpostoItem: iImpostoItem);
    destructor Destroy; override;
    class function New(AImpostoItem: iImpostoItem): iImpostoPIS;
  private
    [weak]
    FImpostoItem: iImpostoItem;
  public
    function Retorno: iImpostoItem;
  end;

implementation

{ TImpostoPIS }

constructor TImpostoPIS.Create(AImpostoItem: iImpostoItem);
begin
  FImpostoItem := AImpostoItem;
end;

destructor TImpostoPIS.Destroy;
begin

  inherited;
end;

class function TImpostoPIS.New(AImpostoItem: iImpostoItem): iImpostoPIS;
begin
  Result := Self.Create(AImpostoItem);
end;

function TImpostoPIS.Retorno: iImpostoItem;
begin
  Result := FImpostoItem;
end;

end.
