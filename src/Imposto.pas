{TODO -oHerlon -cBrvImposto : Implementar conversao de StrToCRT }
{TODO -oHerlon -cBrvImposto : Implementar conversao de StrToIndIEDest }
{TODO -oHerlon -cBrvImposto : Analisar implementacao de evento "OnChange" para a cada calculo de um item somar com um totalizador para confrontar }
{TODO -oHerlon -cBrvImposto : Analisar implementacao de evento "OnErroConferencia" para possibilitar o usuario tratar com mensagem qualquer falha de calculo }
{TODO -oHerlon -cBrvImposto : Analisar possibilidade de adicionar o atributo CFOP para validar de acordo com o CST/CSOSN  }
unit Imposto;

interface

uses
  System.SysUtils,
  Imposto.Utils,
  Imposto.Item,
  Imposto.Contract,
  Imposto.Tag.Total,
  Imposto.Log;

type
   iImposto     = Imposto.Contract.iImposto;
   iImpostoItem = Imposto.Contract.iImpostoItem;

   TImposto = class(TInterfacedObject, iImposto)
    constructor Create;
    destructor Destroy; override;
    class function New: iImposto;
  strict private
    FImpostoItens    : TImpostoItens;
  private
    FUFOrigem        : TUF;
    FUFDestino       : TUF;
    FCRT             : TpcnCRT;
    FIndIEDEST       : TpcnIndIEDest;

    FFrete           : Extended;
    FSeguro          : Extended;
    FDespesas        : Extended;
    FDesconto        : Extended;
    FValorTotal      : Extended;
    FValorTotalICMS  : Extended;

    FImpostoTagTotal : iImpostoTagTotal;

    FImpostoValores  : iImpostoValores;

    FOnRecalcular        : TOnRecalcular;
    FOnRecalcularCallback: TOnRecalcularCallback;

    function  TryGetItem(AId: Integer): iImpostoItem;
    procedure RecalcularTotalizadores;
  public
    function Clear: iImposto;

    function OnRecalcular(AOnRecalcular: TOnRecalcular): iImposto;
    function OnRecalcularCallBack(ACallback: TOnRecalcularCallback): iImposto;

    function UFOrigem( AUF: TUF ) : iImposto; overload;
    function UFOrigem: TUF; overload;

    function UFDestino( AUF: TUF ) : iImposto; overload;
    function UFDestino: TUF; overload;

    function CRT( ACRT : TpcnCRT ) : iImposto; overload;
    function CRT: TpcnCRT; overload;

    function IEDest( AIndIEDest : TpcnindIEDest ) : iImposto; overload;
    function IEDest: TpcnindIEDest; overload;

    function Frete( const Value: Extended ) : iImposto; overload;
    function Frete: Extended; overload;

    function Seguro( const Value: Extended ) : iImposto; overload;
    function Seguro: Extended; overload;

    function Despesas( const Value: Extended ) : iImposto; overload;
    function Despesas: Extended; overload;

    function Desconto( const Value: Extended ) : iImposto; overload;
    function Desconto: Extended; overload;

    function ValorTotalICMS( vICMS: Extended ) : iImposto; overload;
    function ValorTotalICMS: Extended; overload;

    function Recalcular: iImposto;

    function Items: TImpostoItens;
    function Item(AId: Integer): iImpostoItem;
    function ItemDelete(AId: Integer): iImpostoItem;

    function TagTotal: iImpostoTagTotal;
  end;

  function ImpostoInvoker: iImposto;

implementation

uses
  Imposto.Tag.Det.Prod,
  Imposto.Tag.Total.ICMSTot;

var
  FInstance: iImposto;

function ImpostoInvoker: iImposto;
begin
  if FInstance = nil then
    FInstance := TImposto.New;
  Result := FInstance;
end;

{ TImposto }

constructor TImposto.Create;
begin
  FImpostoItens    := TImpostoItens.Create;

  FFrete           := 0;
  FSeguro          := 0;
  FDespesas        := 0;
  FDesconto        := 0;
  FValorTotal      := 0;
  FValorTotalICMS  := 0;
end;

destructor TImposto.Destroy;
begin
  FreeAndNil(FImpostoItens);

  inherited;
end;

class function TImposto.New: iImposto;
begin
  Result := Self.Create;
end;

function TImposto.TryGetItem(AId: Integer): iImpostoItem;
var
  LImpostoItem: iImpostoItem;
begin
  Result := nil;

  for LImpostoItem in FImpostoItens do
  begin
    if LImpostoItem.Id = AId then
    begin
      Result := LImpostoItem;
      Break;
    end;
  end;

  if Result = nil then
  begin
    LImpostoItem := TImpostoItem.New(Self);
    LImpostoItem.Id(AId);
    LImpostoItem.OnChangeItem( RecalcularTotalizadores );

    Result := FImpostoItens.Items[ FImpostoItens.Add( LImpostoItem ) ];
  end;
end;

procedure TImposto.RecalcularTotalizadores;
var
  LTotalProduto  : Double;
  LImpostoItem   : iImpostoItem;
begin
  LTotalProduto  := 0;

  if not Assigned(FImpostoTagTotal) then
    FImpostoTagTotal := TImpostoTagTotal.New;

  { Percorre a lista para ter o totalizador de produto  }
  for LImpostoItem in FImpostoItens do
    LTotalProduto := LTotalProduto + LImpostoItem.Det.tagProd.vProdComDescUnit;

  { Percorre a lista para calcular a proporcao de cada item e fazer o rateio }
  for LImpostoItem in FImpostoItens do
    TImpostoTagDetProd( LImpostoItem.Det.tagProd ).Recalcular( Self, LTotalProduto );

  { Recalcula totalizadores de ICMS <ICMSTot> }
  TImpostoTagTotalICMSTot( FImpostoTagTotal.ICMSTot ).Recalcular( Self, LTotalProduto );

  {Recalcula totalizadores de tributos retidos <retTrib> }

  {Recalcula totalizadores do ISSQN <ISSQNtot> }

  if Assigned(FOnRecalcularCallback) then
    FOnRecalcularCallback(Self);

  if Assigned(FOnRecalcular) then
    FOnRecalcular;
end;

function TImposto.Clear: iImposto;
begin
  Result := Self;
  FInstance := nil;
end;

function TImposto.OnRecalcular(AOnRecalcular: TOnRecalcular): iImposto;
begin
  Result := Self;
  FOnRecalcular := AOnRecalcular;
end;

function TImposto.OnRecalcularCallBack(ACallback: TOnRecalcularCallback): iImposto;
begin
  Result := Self;
  FOnRecalcularCallback := ACallback;
end;

function TImposto.UFOrigem(AUF: TUF): iImposto;
begin
  Result := Self;
  FUFOrigem := AUF;
end;

function TImposto.UFOrigem: TUF;
begin
  Result := FUFOrigem;
end;

function TImposto.UFDestino(AUF: TUF): iImposto;
begin
  Result := Self;
  FUFDestino := AUF;
end;

function TImposto.UFDestino: TUF;
begin
  Result := FUFDestino;
end;

function TImposto.CRT(ACRT: TpcnCRT): iImposto;
begin
  Result := Self;
  FCRT := ACRT;
end;

function TImposto.CRT: TpcnCRT;
begin
  Result := FCRT;
end;

function TImposto.IEDest(AIndIEDest: TpcnIndIEDest ): iImposto;
begin
  Result := Self;
  FIndIEDEST := AIndIEDest;
end;

function TImposto.IEDest: TpcnIndIEDest;
begin
  Result := FIndIEDEST;
end;

function TImposto.Frete( const Value: Extended ): iImposto;
begin
  Result := Self;
  FFrete := Value;
end;

function TImposto.Frete: Extended;
begin
  Result := FFrete;
end;

function TImposto.Seguro( const Value: Extended ): iImposto;
begin
  Result := Self;
  FSeguro := Value;
end;

function TImposto.Seguro: Extended;
begin
  Result := FSeguro;
end;

function TImposto.Despesas( const Value: Extended ): iImposto;
begin
  Result := Self;
  FDespesas := Value;
end;

function TImposto.Despesas: Extended;
begin
  Result := FDespesas;
end;

function TImposto.Desconto( const Value: Extended ): iImposto;
begin
  Result := Self;
  FDesconto := Value;
end;

function TImposto.Desconto: Extended;
begin
  Result := FDesconto;
end;

function TImposto.ValorTotalICMS( vICMS: Extended ) : iImposto;
begin
  Result := Self;
  vICMS := FValorTotalICMS;
end;

function TImposto.ValorTotalICMS: Extended;
begin
  Result := FValorTotalICMS;
end;

function TImposto.Items: TImpostoItens;
begin
  Result := FImpostoItens;
end;

function TImposto.Item(AId: Integer): iImpostoItem;
begin
  Result := TryGetItem(AId);
end;

function TImposto.ItemDelete(AId: Integer): iImpostoItem;
begin
  FImpostoItens.Remove( TryGetItem(AId) );
end;


function TImposto.TagTotal: iImpostoTagTotal;
begin
  if not Assigned(FImpostoTagTotal) then
    FImpostoTagTotal := TImpostoTagTotal.New;
  Result := FImpostoTagTotal;
end;

function TImposto.Recalcular: iImposto;
begin
  RecalcularTotalizadores;
end;

end.

