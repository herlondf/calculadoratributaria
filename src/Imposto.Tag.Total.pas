unit Imposto.Tag.Total;

interface

uses
  Imposto.Utils,
  Imposto.Tag.Contract;

type
  TImpostoTagTotal = class(TInterfacedObject, iImpostoTagTotal)
    constructor Create;
    destructor Destroy; override;
    class function New: iImpostoTagTotal;
  private
    FTotalICMSTot : iImpostoTagTotalICMSTot;
    FISSQNtot     : iImpostoTagTotalISSQNtot;
    FretTrib      : iImpostoTagTotalretTrib;
  public
    function ICMSTot  : iImpostoTagTotalICMSTot;
    function ISSQNtot : iImpostoTagTotalISSQNtot;
    function retTrib  : iImpostoTagTotalretTrib;
  end;

implementation

uses
  System.SysUtils, {raise}
  Imposto.Tag.Total.ICMSTot;

{ TImpostoTagTotal }

constructor TImpostoTagTotal.Create;
begin

end;

destructor TImpostoTagTotal.Destroy;
begin

  inherited;
end;

class function TImpostoTagTotal.New: iImpostoTagTotal;
begin
  Result := Self.Create;
end;

function TImpostoTagTotal.ICMSTot  : iImpostoTagTotalICMSTot;
begin
  if not Assigned(FTotalICMSTot) then
    FTotalICMSTot := TImpostoTagTotalICMSTot.New(Self);
  Result := FTotalICMSTot;
end;

function TImpostoTagTotal.ISSQNtot : iImpostoTagTotalISSQNtot;
begin
  raise Exception.Create('Not implemented.');
end;

function TImpostoTagTotal.retTrib  : iImpostoTagTotalretTrib;
begin
  raise Exception.Create('Not implemented.');
end;

end.