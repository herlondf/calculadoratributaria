program BraveCalculadoraTributaria;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  CalculadoraTributaria in 'CalculadoraTributaria.pas' {frmCalculadoraTributaria},
  Imposto.Contract in '..\src\Imposto.Contract.pas',
  Imposto in '..\src\Imposto.pas',
  Imposto.Item in '..\src\Imposto.Item.pas',
  Imposto.ICMS in '..\src\Imposto.ICMS.pas',
  Imposto.BaseICMS in '..\src\Imposto.BaseICMS.pas',
  Imposto.ICMS.CSOSN101 in '..\src\Imposto.ICMS.CSOSN101.pas',
  Imposto.ICMS.CSOSN102 in '..\src\Imposto.ICMS.CSOSN102.pas',
  Imposto.ICMS.CSOSN103 in '..\src\Imposto.ICMS.CSOSN103.pas',
  Imposto.ICMS.CSOSN201 in '..\src\Imposto.ICMS.CSOSN201.pas',
  Imposto.ICMS.CSOSN202 in '..\src\Imposto.ICMS.CSOSN202.pas',
  Imposto.ICMS.CSOSN203 in '..\src\Imposto.ICMS.CSOSN203.pas',
  Imposto.ICMS.CSOSN300 in '..\src\Imposto.ICMS.CSOSN300.pas',
  Imposto.ICMS.CSOSN400 in '..\src\Imposto.ICMS.CSOSN400.pas',
  Imposto.ICMS.CSOSN500 in '..\src\Imposto.ICMS.CSOSN500.pas',
  Imposto.ICMS.CSOSN900 in '..\src\Imposto.ICMS.CSOSN900.pas',
  Imposto.ICMS.CST00 in '..\src\Imposto.ICMS.CST00.pas',
  Imposto.ICMS.CST10 in '..\src\Imposto.ICMS.CST10.pas',
  Imposto.ICMS.CST20 in '..\src\Imposto.ICMS.CST20.pas',
  Imposto.ICMS.CST30 in '..\src\Imposto.ICMS.CST30.pas',
  Imposto.ICMS.CST51 in '..\src\Imposto.ICMS.CST51.pas',
  Imposto.ICMS.CST70 in '..\src\Imposto.ICMS.CST70.pas',
  Imposto.IPI in '..\src\Imposto.IPI.pas',
  Imposto.IPI.IPI50 in '..\src\Imposto.IPI.IPI50.pas',
  Imposto.PIS in '..\src\Imposto.PIS.pas',
  Imposto.COFINS in '..\src\Imposto.COFINS.pas',
  Imposto.Utils in '..\src\Imposto.Utils.pas',
  Imposto.Tag.Total in '..\src\Imposto.Tag.Total.pas',
  Imposto.Log in '..\src\Imposto.Log.pas',
  Imposto.Tag.Total.ICMSTot in '..\src\Imposto.Tag.Total.ICMSTot.pas',
  Imposto.Tag.Contract in '..\src\Imposto.Tag.Contract.pas',
  Imposto.Tag.Det in '..\src\Imposto.Tag.Det.pas',
  Imposto.Tag.Det.Prod in '..\src\Imposto.Tag.Det.Prod.pas',
  Imposto.Tag.Det.Imposto in '..\src\Imposto.Tag.Det.Imposto.pas',
  Imposto.Tag.Det.Imposto.ICMS in '..\src\Imposto.Tag.Det.Imposto.ICMS.pas',
  pcnConversao in '..\src\pcnConversao.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Black Rock');
  Application.CreateForm(TfrmCalculadoraTributaria, frmCalculadoraTributaria);
  Application.Run;
end.
