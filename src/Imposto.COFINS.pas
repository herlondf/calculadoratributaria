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
  public
    function Retorno: iImpostoItem;
  end;

implementation


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

function TImpostoCOFINS.Retorno: iImpostoItem;
begin
  Result := FImpostoItem;
end;

end.
