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
    FUF              : TUF;
    FCRT             : TCRT;
    FIndIEDEST       : TIndIEDest;

    FFrete           : Extended;
    FSeguro          : Extended;
    FDespesas        : Extended;
    FDesconto        : Extended;
    FAliquotaSN      : Extended;
    FvNF             : Extended;
    FValorTotalICMS  : Extended;

    FImpostoTagTotal : iImpostoTagTotal;

    FImpostoValores  : iImpostoValores;

    FOnRecalcular      : TOnRecalcular;

    procedure RecalcularTotalizadores;
  public
    function Clear: iImposto;

    function OnRecalcular(AOnRecalcular: TOnRecalcular): iImposto;

    function UF( AUF: TUF ): iImposto; overload;
    function UF: TUF; overload;

    function CRT( ACRT : TCRT ) : iImposto; overload;
    function CRT: TCRT; overload;

    function IEDest( AIndIEDest : TIndIEDest ) : iImposto; overload;
    function IEDest: TIndIEDest; overload;

    function Frete( const Value: Extended ) : iImposto; overload;
    function Frete: Extended; overload;

    function Seguro( const Value: Extended ) : iImposto; overload;
    function Seguro: Extended; overload;

    function Despesas( const Value: Extended ) : iImposto; overload;
    function Despesas: Extended; overload;

    function Desconto( const Value: Extended ) : iImposto; overload;
    function Desconto: Extended; overload;

    ///<summary> Aliquota de ICMS no Simples Nacional <pCredSN> </summary>
    function AliquotaSN(const pCredSN: Extended): iImposto; overload;
    function AliquotaSN: Extended; overload;

    function ValorTotalICMS( vICMS: Extended ) : iImposto; overload;
    function ValorTotalICMS: Extended; overload;

    function vNF( const Value: Extended ) : iImposto; overload;
    function vNF: Extended; overload;


    function Items: TImpostoItens;

    function TryGetItem(AId: Double): iImpostoItem;

    function Total: iImpostoTagTotal;
  end;

  function ImpostoCalc: iImposto;

implementation

uses
  Imposto.Tag.Det.Prod,
  Imposto.Tag.Total.ICMSTot;

var
  FInstance: iImposto;

function ImpostoCalc: iImposto;
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
  FvNF             := 0;
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

function TImposto.UF(AUF: TUF): iImposto;
begin
  Result := Self;
  FUF := AUF;
end;

function TImposto.UF: TUF;
begin
  Result := FUF;
end;

function TImposto.CRT(ACRT: TCRT): iImposto;
begin
  Result := Self;
  FCRT := ACRT;
end;

function TImposto.CRT: TCRT;
begin
  Result := FCRT;
end;

function TImposto.IEDest(AIndIEDest: TIndIEDest ): iImposto;
begin
  Result := Self;
  FIndIEDEST := AIndIEDest;
end;

function TImposto.IEDest: TIndIEDest;
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

function TImposto.AliquotaSN(const pCredSN: Extended): iImposto;
begin
  Result := Self;
  FAliquotaSN := pCredSN;
end;

function TImposto.AliquotaSN: Extended;
begin
  Result := FAliquotaSN;
end;

function TImposto.ValorTotalICMS( vICMS: Extended ) : iImposto;
begin
  Result := Self;
  vICMS  := FValorTotalICMS;
end;

function TImposto.ValorTotalICMS: Extended;
begin
  Result := FValorTotalICMS;
end;

function TImposto.vNF( const Value: Extended ) : iImposto;
begin
  Result := Self;
  FvNF   := Value;
end;

function TImposto.vNF: Extended;
begin
  Result := FvNF;
end;


function TImposto.Items: TImpostoItens;
begin
  Result := FImpostoItens;
end;

function TImposto.TryGetItem(AId: Double): iImpostoItem;
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

function TImposto.Total: iImpostoTagTotal;
begin
  if not Assigned(FImpostoTagTotal) then
    FImpostoTagTotal := TImpostoTagTotal.New;
  Result := FImpostoTagTotal;
end;

procedure TImposto.RecalcularTotalizadores;
var
  LImpostoItem   : iImpostoItem;
begin
  if not Assigned(FImpostoTagTotal) then
    FImpostoTagTotal := TImpostoTagTotal.New;

  { Percorre a lista para ter o totalizador de produto  }
  for LImpostoItem in FImpostoItens do
    FvNF := FvNF + LImpostoItem.Det.tagProd.vProdComDescUnit;

  { Percorre a lista para calcular a proporcao de cada item e fazer o rateio }
  for LImpostoItem in FImpostoItens do
    TImpostoTagDetProd( LImpostoItem.Det.tagProd ).Recalcular( Self, FvNF );

  { Recalcula totalizadores de ICMS <ICMSTot> }
  TImpostoTagTotalICMSTot( FImpostoTagTotal.ICMSTot ).Recalcular( Self, FvNF );

  {Recalcula totalizadores de tributos retidos <retTrib> }

  {Recalcula totalizadores do ISSQN <ISSQNtot> }


  if Assigned(FOnRecalcular) then
    FOnRecalcular;
end;

end.

