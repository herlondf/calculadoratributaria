//*************************************************************************//
// Atualizado em 18/03/2022                                                //
// Fonte: https://www.taxgroup.com.br/intelligence/tabela-icms-atualizada  //
//*************************************************************************//

unit Imposto.Aliquota;

interface

uses
  Imposto.Utils;

  function BuscarAliquota(AUFOrigem: String; AUFDestino: String): Double; overload;
  function BuscarAliquota(AUFOrigem: TUF; AUFDestino: TUF): Double; overload;

implementation

function BuscarAliquota(AUFOrigem: String; AUFDestino: String): Double;
begin
  Result := BuscarAliquota( StrToUF(AUFOrigem), StrToUF(AUFDestino) );
end;

function BuscarAliquota(AUFOrigem: TUF; AUFDestino: TUF): Double;
var
  LAliquota: array[0..26] of array [0..26] of Double;
begin
    LAliquota[Ord(ufAC)][Ord(ufAC)] := 17.00;

  LAliquota[Ord(ufAC)][Ord(ufAL)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufAP)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufAM)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufBA)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufCE)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufDF)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufES)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufGO)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufMA)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufMT)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufMS)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufAC)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufAL)][Ord(ufAL)] := 18.00;

  LAliquota[Ord(ufAL)][Ord(ufAP)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufAM)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufBA)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufCE)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufDF)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufES)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufGO)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufMA)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufMT)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufMS)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufAL)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufAP)][Ord(ufAP)] := 18.00;

  LAliquota[Ord(ufAP)][Ord(ufAM)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufBA)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufCE)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufDF)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufES)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufGO)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufMA)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufMT)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufMS)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufAP)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufAM)][Ord(ufAM)] := 18.00;

  LAliquota[Ord(ufAM)][Ord(ufBA)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufCE)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufDF)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufES)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufGO)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufMA)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufMT)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufMS)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufAM)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufBA)][Ord(ufBA)] := 18.00;

  LAliquota[Ord(ufBA)][Ord(ufCE)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufDF)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufES)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufGO)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufMA)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufMT)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufMS)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufBA)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufCE)][Ord(ufCE)] := 18.00;

  LAliquota[Ord(ufCE)][Ord(ufDF)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufES)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufGO)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufMA)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufMT)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufMS)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufCE)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufDF)][Ord(ufDF)] := 18.00;

  LAliquota[Ord(ufDF)][Ord(ufES)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufGO)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufMA)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufMT)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufMS)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufDF)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufES)][Ord(ufES)] := 17.00;

  LAliquota[Ord(ufES)][Ord(ufGO)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufMA)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufMT)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufMS)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufES)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufGO)][Ord(ufGO)] := 17.00;

  LAliquota[Ord(ufGO)][Ord(ufMA)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufMT)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufMS)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufGO)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufMA)][Ord(ufMA)] := 18.00;

  LAliquota[Ord(ufMA)][Ord(ufMT)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufMS)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufMA)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufMT)][Ord(ufMT)] := 17.00;

  LAliquota[Ord(ufMT)][Ord(ufMS)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufMT)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufMS)][Ord(ufMS)] := 17.00;

  LAliquota[Ord(ufMS)][Ord(ufMG)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufPA)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufMS)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufMG)][Ord(ufMG)] := 18.00;

  LAliquota[Ord(ufMG)][Ord(ufPA)] := 07.00;
  LAliquota[Ord(ufMG)][Ord(ufPB)] := 07.00;
  LAliquota[Ord(ufMG)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufMG)][Ord(ufPE)] := 07.00;
  LAliquota[Ord(ufMG)][Ord(ufPI)] := 07.00;
  LAliquota[Ord(ufMG)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufMG)][Ord(ufRN)] := 07.00;
  LAliquota[Ord(ufMG)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufMG)][Ord(ufRO)] := 07.00;
  LAliquota[Ord(ufMG)][Ord(ufRR)] := 07.00;
  LAliquota[Ord(ufMG)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufMG)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufMG)][Ord(ufSE)] := 07.00;
  LAliquota[Ord(ufMG)][Ord(ufTO)] := 07.00;

    LAliquota[Ord(ufPA)][Ord(ufPA)] := 17.00;

  LAliquota[Ord(ufPA)][Ord(ufPB)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufPA)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufPB)][Ord(ufPB)] := 18.00;

  LAliquota[Ord(ufPB)][Ord(ufPR)] := 12.00;
  LAliquota[Ord(ufPB)][Ord(ufPE)] := 12.00;
  LAliquota[Ord(ufPB)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufPB)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufPB)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufPB)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufPB)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufPB)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufPB)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufPB)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufPB)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufPB)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufPR)][Ord(ufPR)] := 18.00;

  LAliquota[Ord(ufPR)][Ord(ufPE)] := 07.00;
  LAliquota[Ord(ufPR)][Ord(ufPI)] := 07.00;
  LAliquota[Ord(ufPR)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufPR)][Ord(ufRN)] := 07.00;
  LAliquota[Ord(ufPR)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufPR)][Ord(ufRO)] := 07.00;
  LAliquota[Ord(ufPR)][Ord(ufRR)] := 07.00;
  LAliquota[Ord(ufPR)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufPR)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufPR)][Ord(ufSE)] := 07.00;
  LAliquota[Ord(ufPR)][Ord(ufTO)] := 07.00;

    LAliquota[Ord(ufPE)][Ord(ufPE)] := 18.00;

  LAliquota[Ord(ufPE)][Ord(ufPI)] := 12.00;
  LAliquota[Ord(ufPE)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufPE)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufPE)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufPE)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufPE)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufPE)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufPE)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufPE)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufPE)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufPI)][Ord(ufPI)] := 18.00;

  LAliquota[Ord(ufPI)][Ord(ufRJ)] := 12.00;
  LAliquota[Ord(ufPI)][Ord(ufRN)] := 12.00;
  LAliquota[Ord(ufPI)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufPI)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufPI)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufPI)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufPI)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufPI)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufPI)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufRJ)][Ord(ufRJ)] := 20.00;

  LAliquota[Ord(ufRJ)][Ord(ufRN)] := 07.00;
  LAliquota[Ord(ufRJ)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufRJ)][Ord(ufRO)] := 07.00;
  LAliquota[Ord(ufRJ)][Ord(ufRR)] := 07.00;
  LAliquota[Ord(ufRJ)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufRJ)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufRJ)][Ord(ufSE)] := 07.00;
  LAliquota[Ord(ufRJ)][Ord(ufTO)] := 07.00;

    LAliquota[Ord(ufRN)][Ord(ufRN)] := 18.00;

  LAliquota[Ord(ufRN)][Ord(ufRS)] := 12.00;
  LAliquota[Ord(ufRN)][Ord(ufRO)] := 12.00;
  LAliquota[Ord(ufRN)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufRN)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufRN)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufRN)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufRN)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufRS)][Ord(ufRS)] := 18.00;

  LAliquota[Ord(ufRS)][Ord(ufRO)] := 07.00;
  LAliquota[Ord(ufRS)][Ord(ufRR)] := 07.00;
  LAliquota[Ord(ufRS)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufRS)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufRS)][Ord(ufSE)] := 07.00;
  LAliquota[Ord(ufRS)][Ord(ufTO)] := 07.00;

    LAliquota[Ord(ufRO)][Ord(ufRO)] := 17.50;

  LAliquota[Ord(ufRO)][Ord(ufRR)] := 12.00;
  LAliquota[Ord(ufRO)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufRO)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufRO)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufRO)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufRR)][Ord(ufRR)] := 17.00;

  LAliquota[Ord(ufRR)][Ord(ufSC)] := 12.00;
  LAliquota[Ord(ufRR)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufRR)][Ord(ufSE)] := 12.00;
  LAliquota[Ord(ufRR)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufSC)][Ord(ufSC)] := 17.00;

  LAliquota[Ord(ufSC)][Ord(ufSP)] := 12.00;
  LAliquota[Ord(ufSC)][Ord(ufSE)] := 07.00;
  LAliquota[Ord(ufSC)][Ord(ufTO)] := 07.00;

    LAliquota[Ord(ufSP)][Ord(ufSP)] := 18.00;

  LAliquota[Ord(ufSP)][Ord(ufSE)] := 07.00;
  LAliquota[Ord(ufSP)][Ord(ufTO)] := 07.00;

    LAliquota[Ord(ufSE)][Ord(ufSE)] := 18.00;

  LAliquota[Ord(ufSE)][Ord(ufTO)] := 12.00;

    LAliquota[Ord(ufTO)][Ord(ufTO)] := 18.00;


  Result := LAliquota[Ord(AUFOrigem)][Ord(AUFDestino)];

  if Result = 0 then
    Result := LAliquota[Ord(AUFDestino)][Ord(AUFOrigem)];
end;


end.
