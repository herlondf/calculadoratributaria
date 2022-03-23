unit Imposto.Utils;

interface

uses
  {ACBr}
  pcnConversao,

  {System}
  System.Math,
  System.SysUtils;

type
  TpcnCstCOFINS = pcnConversao.TpcnCstCOFINS;
  TpcnCRT = pcnConversao.TpcnCRT;
  TpcnindIEDest = pcnConversao.TpcnindIEDest;
  TpcnCSTIcms = pcnConversao.TpcnCSTIcms;
  TpcnCSOSNIcms = pcnConversao.TpcnCSOSNIcms;
  TpcnCstIpi = pcnConversao.TpcnCstIpi;
  TpcnCstPis = pcnConversao.TpcnCstPis;
  PpcnCstCofins = pcnConversao.TpcnCstCofins;

  TTipoPercentual = ( tpDesconto, tpAcrescimo );

  TUF = (ufAC, ufAL, ufAP, ufAM, ufBA, ufCE, ufDF, ufES, ufGO, ufMA, ufMT, ufMS, ufMG, ufPA, ufPB,
         ufPR, ufPE, ufPI, ufRJ, ufRN, ufRS, ufRO, ufRR, ufSC, ufSP, ufSE, ufTO);

  function StrToEnumerado(const s: string; const AString: array of String; const AEnumerados: array of variant): variant;
  function EnumeradoToStr(const t: variant; const AMode: array of variant; const AEnumerados: array of String): String;

  function IntToEnumerado(const s: integer; const AInteger: array of Integer; const AEnumerados: array of variant): variant;
  function EnumeradoToInt(const t: variant; const AInteger: array of variant; const AEnumerados: array of variant): variant;

  function UFToStr(const AUF: TUF): string;
  function StrToUF(const AUF: string): TUF;
  function UFToInt(const AUF: TUF): Integer;
  function IntToUF(const AUF: Integer): TUF;
  function cUFToUF(const AUF: Integer): TUF;

  function SimpleRoundToEX(const AValue: Extended; const ADigit: TRoundToRange): Extended;
  function RoundABNT(const AValue: Double; const Digits: TRoundToRange ): Double;
  function TruncFix( X : Extended ) : Int64;
  function TruncTo(const AValue: Double; const Digits: TRoundToRange): Double;
  function TruncWithStr(const X: Double): Double;

  procedure Increment(var Value: Extended; const AIncrement: Extended);
  procedure Decrement(var Value: Extended; const ADecrement: Extended);

  function ApplyResidual(AResidual: Extended; AValue: Extended): Extended;
  function GetResidual(AValue: Double; ADigits: Integer = 4): Extended;

  ///<summary>                   Realiza um somatorio entre dois numeros e retorna um valor arredondado no padrao ABNT.       </summary>
  ///<param name="aValor1">      Valor que será acrescido ao segundo parâmetro;                                               </param>
  ///<param name="aValor2">      Valor que sera acrescido ao primeiro parâmetro;                                              </param>
  ///<returns>                   Ex.: Somar(5.321546, 10.65445675, 2) retorna "15,98".                                        </returns>
  function Somar      ( aValor1, aValor2: Double; aRound: Integer = 2 ): Double;

  ///<summary>                   Realiza a subtração entre dois numeros e retorna um valor arredondado no padrao ABNT.        </summary>
  ///<param name="aValor1">      Valor que será subtraído ao segundo parâmetro;                                               </param>
  ///<param name="aValor2">      Valor que será subtraído ao primeiro parâmetro;                                              </param>
  ///<returns>                   Ex.: Subtrair(10.65445675, 5.321546, 2) retorna "5,33".                                      </returns>
  function Subtrair   ( aValor1, aValor2: Double; aRound: Integer = 2 ): Double;

  ///<summary>                   Realiza a multiplicação entre dois numeros e retorna um valor arredondado no padrao ABNT.    </summary>
  ///<param name="aValor1">      Valor que será multiplicado ao segundo parâmetro;                                            </param>
  ///<param name="aValor2">      Valor que será multiplicado ao primeiro parâmetro;                                           </param>
  ///<returns>                   Ex.: Multiplicar(10.65445675, 5.321546, 2) retorna "56,70".                                  </returns>
  function Multiplicar( aValor1, aValor2: Double; aRound: Integer = 2 ): Double;

  ///<summary>                   Realiza uma divisão entre dois numeros e retorna um valor arredondado no padrao ABNT.       </summary>
  ///<param name="aValor1">      Valor que será dividido pelo segundo parâmetro;                                             </param>
  ///<param name="aValor2">      Valor que será dividido primeiro parâmetro;                                                 </param>
  ///<returns>                   Ex.: Dividir(10.65445675, 5.321546, 2) retorna "2,00".                                      </returns>
  function Dividir    ( aValor1, aValor2: Double; aRound: Integer = 2 ): Double;

  ///<summary>                   Calcula o valor do desconto monetario e retorna o percentual equivalente ao monetario        </summary>
  ///<summary>                   arredondado no padrao ABNT.                                                                  </summary>
  ///<param name="aTotal">       Valor total que servirá de base para o cálculo;                                              </param>
  ///<param name="aValor">       Valor monetário do desconto que será calculado ao valor base e retornado o percentual;       </param>
  ///<returns>                   Ex.: CalcularValorPercentual(5.46, 1.90, 2) retorna "35,00".                                 </returns>
  function CalcularValorPercentual(const aTotal, aValor: Double; const aRound: Integer = 3): Double;

  ///<summary>                   Calcula o valor do desconto percentual e retorna o valor monetario do desconto               </summary>
  ///<summary>                   arredondado no padrao ABNT.                                                                  </summary>
  ///<param name="aTotal">       Valor total que servirá de base para o cálculo;                                              </param>
  ///<param name="aPorcentagem"> Valor percentual que será calculado ao valor base e retornado o valor monetario;             </param>
  ///<returns>                   Ex.: CalcularPercentualValor(10.00, 50.00, 2) retorna "5,00".                                </returns>
  function CalcularPercentualValor( const aTotal, aPorcentagem  : Double ; const aRound: Integer = 2 ): Double;

  ///<summary>                   Calcula a variação percentual entre dois números.                                            </summary>
  ///<summary>                   Variação percentual é a diferença do desconto entre dois números.                            </summary>
  ///<param name="aValor1">      Valor que será calculado a variação com o segundo parâmetro;                                 </param>
  ///<param name="aValor2">      Valor que será calculado a variação com o primeiro parâmetro;                                </param>
  ///<returns>                   Ex.: CalcularVariacaoPercentual(50, 30, 2) retorna "60,00".                                  </returns>
  function CalcularVariacaoPercentual(const aValor1, aValor2: Double; const aRound: Integer = 3): Double;

  ///<summary>                    Aplicar o percentual informado e retorna o valor com o percentual aplicado.                  </summary>
  ///<param name="aTotal">        Valor que deseja aplicar o percentual;                                                       </param>
  ///<param name="aPorcentagem">  Valor percentual para ser aplicado no "aTotal" e obter resultado;                            </param>
  ///<param name="aTpPercentual"> Tipo da aplicacao do percentual (tpDesconto ou tpAcrescimo).                                 </param>
  ///<param name="aRound">        Arredondamento do retorno do calculo, por padrao com 2 casas decimais;                       </param>
  ///<remarks>                    Ex.: AplicarPercentual( 10, 5, tpDesconto , 2 ) retorna 9,50                                 </remarks>
  ///<remarks>                    Ex.: AplicarPercentual( 10, 5, tpAcrescimo, 3 ) retorna 10,500                               </remarks>
  function AplicarPercentual( const aTotal, aPorcentagem : Double; aTpPercentual: TTipoPercentual; const aRound: Integer = 2 ): Double;


implementation

function StrToEnumerado(const s: string; const AString: array of String; const AEnumerados: array of variant): variant;
var
  i: integer;
begin
  result := -1;
  for i := Low(AString) to High(AString) do
    if s = AString[i] then
    begin
      result := AEnumerados[i];
      exit;
    end;

  if result <> -1 then
    result := AEnumerados[0];
end;

function EnumeradoToStr(const t: variant; const AMode: array of variant; const AEnumerados: array of String): String;
var
  i: integer;
begin
  result := '';
  for i := Low(AMode) to High(AMode) do
    if t = AMode[i] then
    begin
      result := AEnumerados[i];
      Break;
    end;
end;

function IntToEnumerado(const s: integer; const AInteger: array of Integer; const AEnumerados: array of variant): variant;
var
  i: integer;
begin
  result := -1;
  for i := Low(AInteger) to High(AInteger) do
    if s = AInteger[i] then
    begin
      result := AEnumerados[i];
      exit;
    end;

  if result <> -1 then
    result := AEnumerados[0];
end;

function EnumeradoToInt(const t: variant; const AInteger: array of variant; const AEnumerados: array of variant): variant;
var
  i: integer;
begin
  result := '';
  for i := Low(AEnumerados) to High(AEnumerados) do
    if t = AEnumerados[i] then
      result := AInteger[i];
end;

function UFToStr(const AUF: TUF): string;
begin
  Result :=
    EnumeradoToStr(
      AUF,
      [
       ufAC, ufAL, ufAP, ufAM, ufBA, ufCE, ufDF, ufES, ufGO, ufMA, ufMT, ufMS, ufMG, ufPA, ufPB,
       ufPR, ufPE, ufPI, ufRJ, ufRN, ufRS, ufRO, ufRR, ufSC, ufSP, ufSE, ufTO
      ],
      [
       'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB',
       'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'
      ]
    );
end;

function StrToUF(const AUF: string): TUF;
begin
  Result :=
    StrToEnumerado(
      AUF,
      [
       'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB',
       'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'
      ],
      [
       ufAC, ufAL, ufAP, ufAM, ufBA, ufCE, ufDF, ufES, ufGO, ufMA, ufMT, ufMS, ufMG, ufPA, ufPB,
       ufPR, ufPE, ufPI, ufRJ, ufRN, ufRS, ufRO, ufRR, ufSC, ufSP, ufSE, ufTO
      ]
    );
end;

function UFToInt(const AUF: TUF): Integer;
begin
  Result :=
    EnumeradoToInt(
      AUF,
      [
       ufAC, ufAL, ufAP, ufAM, ufBA, ufCE, ufDF, ufES, ufGO, ufMA, ufMT, ufMS, ufMG, ufPA, ufPB,
       ufPR, ufPE, ufPI, ufRJ, ufRN, ufRS, ufRO, ufRR, ufSC, ufSP, ufSE, ufTO
      ],
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
    );
end;

function IntToUF(const AUF: Integer): TUF;
begin
  Result :=
    IntToEnumerado(
      AUF,
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26],
      [
       ufAC, ufAL, ufAP, ufAM, ufBA, ufCE, ufDF, ufES, ufGO, ufMA, ufMT, ufMS, ufMG, ufPA, ufPB,
       ufPR, ufPE, ufPI, ufRJ, ufRN, ufRS, ufRO, ufRR, ufSC, ufSP, ufSE, ufTO
      ]
    );
end;

function cUFToUF(const AUF: Integer): TUF;
begin
  Result :=
    IntToEnumerado(
      AUF,
      [11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31, 32, 33, 35, 41, 42, 43, 50, 51, 52, 53],
      [
        ufRO, ufAC, ufAM, ufRR, ufPA, ufAP, ufTO, ufMA, ufPI, ufCE, ufRN, ufPB, ufPE, ufAL,
        ufSE, ufBA, ufMG, ufES, ufRJ, ufSP, ufPR, ufSC, ufRS, ufMS, ufMT, ufGO, ufDF
      ]
    );
end;

function SimpleRoundToEX(const AValue: Extended; const ADigit: TRoundToRange): Extended;
var
  LFactor: Extended;
begin
  LFactor := IntPower(10.0, ADigit);
  if AValue < 0 then
    Result := Int((AValue / LFactor) - 0.5) * LFactor
  else
    Result := Int((AValue / LFactor) + 0.5) * LFactor;
end;


function RoundABNT(const AValue: Double;  const Digits: TRoundToRange): Double;
const
  Delta = 0.00001;
var
  Pow, FracValue, PowValue : Extended;
  RestPart: Double;
  IntCalc, FracCalc, LastNumber, IntValue : Int64;
  Negativo: Boolean;
Begin
  Negativo  := (AValue < 0);

  Pow       := intpower(10, abs(Digits) );
  PowValue  := abs(AValue) / 10 ;
  IntValue  := trunc(PowValue);
  FracValue := frac(PowValue);

  PowValue := SimpleRoundToEX( FracValue * 10 * Pow, -9);
  IntCalc  := trunc( PowValue );
  FracCalc := trunc( frac( PowValue ) * 100 );

  if (FracCalc > 50) then
    Inc( IntCalc )

  else if (FracCalc = 50) then
  begin
    LastNumber := round( frac( IntCalc / 10) * 10);

    if odd(LastNumber) then
      Inc( IntCalc )
    else
    begin
      RestPart := frac( PowValue * 10 ) ;

      if RestPart > Delta then
        Inc( IntCalc );
    end ;
  end ;

  Result := ((IntValue*10) + (IntCalc / Pow));
  if Negativo then
    Result := -Result;
end;

function TruncFix( X : Extended ) : Int64 ;
begin
  Result := Trunc( SimpleRoundToEX( X, -9) ) ;
end;

function TruncTo(const AValue: Double; const Digits: TRoundToRange): Double;
var
 VFrac : Double;
 Pow: Extended;
begin
  Result := AValue;
  VFrac  := Frac(Result);

  if VFrac <> 0 then
  begin
    Pow    := intpower(10, abs(Digits) );
    VFrac  := TruncFix(VFrac * Pow);
    VFrac  := VFrac / Pow;
    Result := Int(Result) + VFrac  ;
  end;
end;

procedure Increment(var Value: Extended; const AIncrement: Extended);
begin
  Value := Value + AIncrement;
end;

procedure Decrement(var Value: Extended; const ADecrement: Extended);
begin
  Value := Value - ADecrement;
end;

function ApplyResidual(AResidual: Extended; AValue: Extended): Extended;
begin
  Result := 0;
  if (AResidual) >= 0.01 then
  begin
    Increment( AValue,    (0.01) );
    Decrement( AResidual, (0.01) );
  end;
end;

function GetResidual(AValue: Double; ADigits: Integer = 4): Extended;
var
  LFrac: Double;
begin
  LFrac  := Frac(AValue);
  LFrac  := LFrac * 100;
  LFrac  := Frac(LFrac) / 100;
  Result := TruncWithStr( LFrac );
end;

function TruncWithStr(const X: Double): Double;
var
  S: string;
  P: integer;
begin
  S := FloatToStr(X);
  P := Pos(',', S);
  if P > 0 then
  S := Copy(S, 1, P-1) + ',' + Copy(S, P+1, 4);
  Result := StrToFloat(S);
end;

function Somar      ( aValor1, aValor2: Double; aRound: Integer = 2 ): Double;
begin
  Result := RoundABNT( aValor1 + aValor2, aRound );
end;

function Subtrair   ( aValor1, aValor2: Double; aRound: Integer = 2 ): Double;
begin
  Result := RoundABNT( aValor1 - aValor2, aRound );
end;

function Multiplicar( aValor1, aValor2: Double; aRound: Integer = 2 ): Double;
begin
  Result := RoundABNT( aValor1 * aValor2, aRound );
end;

function Dividir    ( aValor1, aValor2: Double; aRound: Integer = 2 ): Double;
begin
  Result := RoundABNT( aValor1 / aValor2, aRound );
end;

function CalcularValorPercentual(const aTotal, aValor: Double; const aRound: Integer = 3): Double;
begin
  if aValor > aTotal then
    raise Exception.Create('O valor não pode ser maior que o total.');


    Result :=
      RoundABNT(
        Multiplicar(
          Dividir(
              aValor,
              aTotal,
              ARound
          ),
          100,
          aRound
        ),
      aRound);
end;

function CalcularPercentualValor( const aTotal, aPorcentagem: Double; const aRound: Integer = 2 ): Double;
begin
  Result :=
    RoundABNT(
      Dividir(
        Multiplicar(
            aTotal,
            aPorcentagem,
            aRound
        ),
        100,
        aRound
      ),
  aRound);

  if Result < 0 then
    Result := Multiplicar( Result, -1, aRound );
end;

function CalcularVariacaoPercentual(const aValor1, aValor2: Double; const aRound: Integer = 3): Double;
begin
  if aValor1 > aValor2 then
  Result :=
    RoundABNT(
      Subtrair(
        Multiplicar(
          Dividir(
              aValor2,
              aValor1,
              aRound
          ),
          100,
          aRound
        ),
        100,
        aRound
      ),
    aRound)
  else
  if aValor2 > aValor1 then
  Result :=
    RoundABNT(
      Subtrair(
        Multiplicar(
          Dividir(
              aValor1,
              aValor2,
              aRound
          ),
          100,
          aRound
        ),
        100,
        aRound
      ),
    aRound);

  if aValor1 = aValor2 then
    Result := 0;

  if Result < 0 then
    Result := Multiplicar( Result, -1, aRound );
end;

function AplicarPercentual( const aTotal, aPorcentagem : Double; aTpPercentual: TTipoPercentual; const aRound: Integer = 2 ): Double;
begin
  if aPorcentagem = 0 then
    Result := RoundABNT( aTotal, aRound )
  else
  case aTpPercentual of
    tpDesconto :
    begin
      Result := Subtrair( aTotal,
                          CalcularPercentualValor( aTotal, aPorcentagem ),
                          aRound
      );
    end;
    tpAcrescimo:
    begin
      Result := Somar( aTotal,
                       CalcularPercentualValor( aTotal, aPorcentagem ),
                       aRound
      );
    end;
  end;
end;

end.
