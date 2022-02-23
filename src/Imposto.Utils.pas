unit Imposto.Utils;

interface

uses
  System.Math,
  System.SysUtils;

type
  TUF = (ufAC, ufAL, ufAP, ufAM, ufBA, ufCE, ufDF, ufES, ufGO, ufMA, ufMT, ufMS, ufMG, ufPA, ufPB,
         ufPR, ufPE, ufPI, ufRJ, ufRN, ufRS, ufRO, ufRR, ufSC, ufSP, ufSE, ufTO);

  TCRT = (crtSimplesNacional, crtSimplesExcessoReceita, crtRegimeNormal);

  TCSOSNIcms = ( csosnVazio, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900 );
  TCSTIcms   = ( cstVazio, cst00, cst10, cst20, cst30, cst40, cst41, cst50, cst51, cst60, cst70,  cst90 );
  TCSTIpi    = (ipiVazio, ipi50);
  TCSTPis    = (pisVazio);
  TCSTCofins = (cofinsVazio);

  TIndIEDest = (inContribuinte, inIsento, inNaoContribuinte);

  function StrToEnumerado(const s: string; const AString: array of String; const AEnumerados: array of variant): variant;
  function EnumeradoToStr(const t: variant; const AMode: array of variant; const AEnumerados: array of String): String;

  function IntToEnumerado(const s: integer; const AInteger: array of Integer; const AEnumerados: array of variant): variant;
  function EnumeradoToInt(const t: variant; const AInteger: array of variant; const AEnumerados: array of variant): variant;

  function UFToStr(const AUF: TUF): string;
  function StrToUF(const AUF: string): TUF;
  function UFToInt(const AUF: TUF): Integer;
  function IntToUF(const AUF: Integer): TUF;

  function CRTToStr(const ACRT: TCRT): string;
  function StrToCRT(const ACRT: string): TCRT;
  function CRTToInt(const ACRT: TCRT): Integer;
  function IntToCRT(const ACRT: Integer): TCRT;

  function IndIEDestToStr(const AIndIEDest: TIndIEDest): string;
  function StrToIndIEDest(const AIndIEDest: string): TIndIEDest;
  function IndIEDestToInt(const AIndIEDest: TIndIEDest): Integer;
  function IntToIndIEDest(const AIndIEDest: Integer): TIndIEDest;

  function CSOSNICMSToStr(const ACSOSN: TCSOSNIcms): string;
  function StrToCSOSNICMS(const ACSOSN: string): TCSOSNIcms;
  function CSOSNToIntICMS(const ACSOSN: string): Integer;
  function IntToCSOSNICMS(const ACSOSN: Integer): TCSOSNIcms;

  function CSTICMSToStr(const ACST: TCSTIcms): string;
  function StrToCSTICMS(const ACST: string): TCSTIcms;
  function CSTICMSToInt(const ACST: string): Integer;
  function IntToCSTICMS(const ACST: Integer): TCSTIcms;

  function CSTIpiToStr(const ACSTIpi: TCSTIpi): string;
  function StrToCSTIpi(const ACSTIpi: string): TCSTIpi;
  function CSTIPIToInt(const ACSTIpi: string): Integer;
  function IntToCSTIpi(const ACSTIpi: Integer): TCSTIpi;

  function SimpleRoundToEX(const AValue: Extended; const ADigit: TRoundToRange): Extended;
  function RoundABNT(const AValue: Double; const Digits: TRoundToRange ): Double;
  function TruncFix( X : Extended ) : Int64;
  function TruncTo(const AValue: Double; const Digits: TRoundToRange): Double;
  function TruncWithStr(const X: Double): Double;

  procedure Increment(var Value: Extended; const AIncrement: Extended);
  procedure Decrement(var Value: Extended; const ADecrement: Extended);

  function ApplyResidual(AResidual: Extended; AValue: Extended): Extended;
  function GetResidual(AValue: Double; ADigits: Integer = 4): Extended;


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

function CRTToStr(const ACRT: TCRT): string;
begin
  Result :=
    EnumeradoToStr(
      ACRT,
      [crtSimplesNacional, crtSimplesExcessoReceita, crtRegimeNormal],
      ['Simples Nacional', 'Simples Nacional com Excesso de Receita', 'Regime Normal']
    );
end;

function StrToCRT(const ACRT: string): TCRT;
begin
  Result :=
    StrToEnumerado(
      ACRT,
      ['Simples Nacional', 'Simples Nacional com Excesso de Receita', 'Regime Normal'],
      [crtSimplesNacional, crtSimplesExcessoReceita, crtRegimeNormal]
    );
end;

function CRTToInt(const ACRT: TCRT): Integer;
begin
  Result :=
    EnumeradoToInt(
      ACRT,
      [crtSimplesNacional, crtSimplesExcessoReceita, crtRegimeNormal],
      [0, 1, 2]
    );
end;

function IntToCRT(const ACRT: Integer): TCRT;
begin
  Result :=
    IntToEnumerado(
      ACRT,
      [0, 1, 2],
      [crtSimplesNacional, crtSimplesExcessoReceita, crtRegimeNormal]
    );
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

function IndIEDestToStr(const AIndIEDest: TIndIEDest): string;
begin
  Result :=
    EnumeradoToStr(
      AIndIEDest,
      [inContribuinte, inIsento, inNaoContribuinte],
      ['Contribuinte', 'Isento', 'Não Contribuinte']
    );
end;

function StrToIndIEDest(const AIndIEDest: string): TIndIEDest;
begin
  Result :=
    StrToEnumerado(
      AIndIEDest,
      ['Contribuinte', 'Isento', 'Não Contribuinte'],
      [inContribuinte, inIsento, inNaoContribuinte]
    );
end;

function IndIEDestToInt(const AIndIEDest: TIndIEDest): Integer;
begin
  Result :=
    EnumeradoToInt(
      AIndIEDest,
      [inContribuinte, inIsento, inNaoContribuinte],
      [0, 1, 2]
    );
end;

function IntToIndIEDest(const AIndIEDest: Integer): TIndIEDest;
begin
  Result :=
    IntToEnumerado(
      AIndIEDest,
      [0, 1, 2],
      [inContribuinte, inIsento, inNaoContribuinte]
    );
end;

function CSOSNICMSToStr(const ACSOSN: TCSOSNIcms): string;
begin
  Result :=
    EnumeradoToStr(
      ACSOSN,
      [csosnVazio, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900],
      ['Vazio', '101', '102', '103', '201', '202', '203', '300', '400', '500', '900']
    );
end;

function StrToCSOSNICMS(const ACSOSN: string): TCSOSNIcms;
begin
  Result :=
    StrToEnumerado(
      ACSOSN,
      ['Vazio', '101', '102', '103', '201', '202', '203', '300', '400', '500', '900'],
      [csosnVazio, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900]
    );
end;

function CSOSNToIntICMS(const ACSOSN: string): Integer;
begin
  Result :=
    EnumeradoToInt(
      ACSOSN,
      [csosnVazio, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900],
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    );
end;

function IntToCSOSNICMS(const ACSOSN: Integer): TCSOSNIcms;
begin
  Result :=
    IntToEnumerado(
      ACSOSN,
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      [csosnVazio, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900]
    );
end;

function CSTICMSToStr(const ACST: TCSTIcms): string;
begin
  Result :=
    EnumeradoToStr(
      ACST,
      [cstVazio, cst00, cst10, cst20, cst30, cst40, cst41, cst50, cst51, cst60, cst70, cst90],
      ['Vazio', '00', '10', '20', '30', '40', '41', '50', '51', '60', '70', '90']
    );
end;

function StrToCSTICMS(const ACST: string): TCSTIcms;
begin
  Result :=
    StrToEnumerado(
      ACST,
      ['Vazio', '00', '10', '20', '30', '40', '41', '50', '51', '60', '70', '90'],
      [cstVazio, cst00, cst10, cst20, cst30, cst40, cst41, cst50, cst51, cst60, cst70, cst90]
    );
end;

function CSTICMSToInt(const ACST: string): Integer;
begin
  Result :=
    EnumeradoToInt(
      ACST,
      [cstVazio, cst00, cst10, cst20, cst30, cst40, cst41, cst50, cst51, cst60, cst70, cst90],
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    );
end;

function IntToCSTICMS(const ACST: Integer): TCSTIcms;
begin
  Result :=
    IntToEnumerado(
      ACST,
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
      [cstVazio, cst00, cst10, cst20, cst30, cst40, cst41, cst50, cst51, cst60, cst70, cst90]
    );
end;


function CSTIpiToStr(const ACSTIpi: TCSTIpi): string;
begin
  Result :=
    EnumeradoToStr(
      ACSTIpi,
      [ipiVazio, ipi50],
      ['Vazio', '50']
    );
end;

function StrToCSTIpi(const ACSTIpi: string): TCSTIpi;
begin
  Result :=
    StrToEnumerado(
      ACSTIpi,
      ['Vazio', '50'],
      [ipiVazio, ipi50]
    );
end;

function CSTIpiToInt(const ACSTIpi: string): Integer;
begin
  Result :=
    EnumeradoToInt(
      ACSTIpi,
      [ipiVazio, ipi50],
      [0, 1]
    );
end;

function IntToCSTIpi(const ACSTIpi: Integer): TCSTIpi;
begin
  Result :=
    IntToEnumerado(
      ACSTIpi,
      [0, 1],
      [ipiVazio, ipi50]
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

end.
