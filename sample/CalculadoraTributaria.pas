unit CalculadoraTributaria;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,

  Imposto,
  Imposto.Utils,
  Imposto.Log;

type

	TEditValue = class helper for TEdit
  private
    function GetValue: Double;
    procedure SetValue(AValue: Double);
	public
	   property Value: Double read GetValue write SetValue;
	end;

  TfrmCalculadoraTributaria = class(TForm)
    cmbCRT: TComboBox;
    cmbUF: TComboBox;
    cmbCST: TComboBox;
    cmbCSOSN: TComboBox;
    edtFrete: TEdit;
    lblFrete: TLabel;
    lblUF: TLabel;
    lblCRT: TLabel;
    lblCST: TLabel;
    lblCSOSN: TLabel;
    edtSeguro: TEdit;
    lblSeguro: TLabel;
    edtDespesas: TEdit;
    lblDespesas: TLabel;
    edtDesconto: TEdit;
    lblDesconto: TLabel;
    cmbIndIEDest: TComboBox;
    lblIndIEDest: TLabel;
    lblDadosGlobaisNota: TLabel;
    lblDadosItemNota: TLabel;
    edtQuantidade: TEdit;
    lblQuantidade: TLabel;
    edtValorUnitario: TEdit;
    lblValorUnitario: TLabel;
    edtDescontoUnitario: TEdit;
    lblDescontoUnitario: TLabel;
    edtTotalProd: TEdit;
    lblTotalProd: TLabel;
    edtTotalNF: TEdit;
    lblTotalNF: TLabel;
    edtAliquotaICMS: TEdit;
    lblAliquotaICMS: TLabel;
    edtAliquotaICMSST: TEdit;
    lblAliquotaICMSST: TLabel;
    edtAliquotaST: TEdit;
    lblAliquotaST: TLabel;
    edtAliquotaIPI: TEdit;
    lblAliquotaIPI: TLabel;
    edtMVA: TEdit;
    lblMVA: TLabel;
    edtReducaoBC: TEdit;
    lblReducaoBC: TLabel;
    edtReducaoBCST: TEdit;
    lblReducaoBCST: TLabel;
    edtDiferimento: TEdit;
    lblDiferimento: TLabel;
    edtBCSTRetido: TEdit;
    lblBCSTRetido: TLabel;
    edtICMSSTRetido: TEdit;
    lblICMSSTRetido: TLabel;
    lblAliquotaSN: TLabel;
    edtAliquotaSN: TEdit;
    lblCSTIPI: TLabel;
    cmbCSTIPI: TComboBox;
    btnAdicionar: TButton;
    lblDescontoTotalItem: TLabel;
    edtDescontoTotalItem: TEdit;
    lblProdutoID: TLabel;
    edtProdutoID: TEdit;
    btnInicializar: TButton;
    mmoLog: TMemo;
    lblTotalizadorNota: TLabel;
    lblTotalBC: TLabel;
    edtTotalBC: TEdit;
    lblTotalICMS: TLabel;
    edtTotalICMS: TEdit;
    lblTotalBCST: TLabel;
    edtTotalBCST: TEdit;
    lblTotalICMSST: TLabel;
    edtTotalICMSST: TEdit;
    lblTotalFrete: TLabel;
    lblTotalSeg: TLabel;
    lblTotalOutros: TLabel;
    lblTotalDesconto: TLabel;
    edtTotalFrete: TEdit;
    edtTotalSeg: TEdit;
    edtTotalOutros: TEdit;
    edtTotalDesc: TEdit;
    btnSimular: TButton;
    procedure FormShow(Sender: TObject);
    procedure OnSelect(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnInicializarClick(Sender: TObject);
    procedure btnSimularClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarCampos;
    procedure ValidarInterface;
    procedure Logar(Value: Variant);

    procedure PreencherComboUF;
    procedure PreencherComboCRT;
    procedure PreencherComboIndIEDest;
    procedure PreencherComboCST;
    procedure PreencherComboCSOSN;
    procedure PreencherComboCSTIPI;

    procedure Inicializar;
    procedure AdicionarItem;
    procedure Simular;
  public
    { Public declarations }
  end;

var
  frmCalculadoraTributaria: TfrmCalculadoraTributaria;

implementation

{$R *.dfm}

{ TEditValue }

function TEditValue.GetValue: Double;
begin
  Result := StrToFloatDef( Self.Text, 0 );
end;

procedure TEditValue.SetValue(AValue: Double);
begin
  Self.Text := FloatToStr(AValue);
end;

{ TFrmCalculadoraTributaria }

procedure TfrmCalculadoraTributaria.FormShow(Sender: TObject);
begin
  PreencherComboUF;
  PreencherComboIndIEDest;
  PreencherComboCRT;
  PreencherComboCST;
  PreencherComboCSOSN;
  PreencherComboCSTIPI;

  ImpostoLog.OnImpostoLog(Logar);
end;

procedure TfrmCalculadoraTributaria.btnInicializarClick(Sender: TObject);
begin
  Inicializar;
end;

procedure TfrmCalculadoraTributaria.btnSimularClick(Sender: TObject);
begin
  Simular;
end;

procedure TfrmCalculadoraTributaria.btnAdicionarClick(Sender: TObject);
begin
  AdicionarItem;
end;

procedure TfrmCalculadoraTributaria.OnSelect(Sender: TObject);
begin
  ValidarInterface;
end;

procedure TfrmCalculadoraTributaria.PreencherComboUF;
var
  I: TUF;
begin
  cmbUF.Clear;
  for I := Low(TUF) to High(TUF) do
    cmbUF.Items.Add( UFToStr(I) );
end;

procedure TfrmCalculadoraTributaria.PreencherComboCRT;
var
  I: TCRT;
begin
  cmbCRT.Clear;
  for I := Low(TCRT) to High(TCRT) do
    cmbCRT.Items.Add( CRTToStr(I) );
end;

procedure TfrmCalculadoraTributaria.PreencherComboIndIEDest;
var
  I: TIndIEDest;
begin
  cmbIndIEDest.Clear;
  for I := Low(TIndIEDest) to High(TIndIEDest) do
    cmbIndIEDest.Items.Add( IndIEDestToStr(I) );
end;

procedure TfrmCalculadoraTributaria.PreencherComboCST;
var
  I: TCSTIcms;
begin
  cmbCST.Clear;
  for I := Low(TCSTIcms) to High(TCSTIcms) do
    cmbCST.Items.Add( CSTICMSToStr(I) );
end;

procedure TfrmCalculadoraTributaria.PreencherComboCSTIPI;
var
  I: TCSTIpi;
begin
  cmbCSTIpi.Clear;
  for I := Low(TCSTIpi) to High(TCSTIpi) do
    cmbCSTIpi.Items.Add( CSTIPIToStr(I) );
end;

procedure TfrmCalculadoraTributaria.PreencherComboCSOSN;
var
  I: TCSOSNIcms;
begin
  cmbCSOSN.Clear;
  for I := Low(TCSOSNIcms) to High(TCSOSNIcms) do
    cmbCSOSN.Items.Add( CSOSNICMSToStr(I) );
end;

procedure TfrmCalculadoraTributaria.Logar(Value: Variant);
begin
  mmoLog.Lines.Add(Value);
end;

procedure TfrmCalculadoraTributaria.ValidarInterface;
begin
  cmbCST.Enabled             := IntToCRT( cmbCRT.ItemIndex ) in [crtSimplesExcessoReceita, crtRegimeNormal];
  cmbCSOSN.Enabled           := IntToCRT( cmbCRT.ItemIndex ) in [crtSimplesNacional];

  lblAliquotaSN.Visible      := IntToCRT( cmbCRT.ItemIndex ) in [crtSimplesNacional];
  edtAliquotaSN.Visible      := IntToCRT( cmbCRT.ItemIndex ) in [crtSimplesNacional];

  lblAliquotaICMSST.Visible  := IntToCRT( cmbCRT.ItemIndex ) in [crtSimplesExcessoReceita, crtRegimeNormal];
  edtAliquotaICMSST.Visible  := IntToCRT( cmbCRT.ItemIndex ) in [crtSimplesExcessoReceita, crtRegimeNormal];
//  lblValorICMSST.Visible     := IntToCRT( cmbCRT.ItemIndex ) in [crtSimplesExcessoReceita, crtRegimeNormal];
//  edtValorICMSST.Visible     := IntToCRT( cmbCRT.ItemIndex ) in [crtSimplesExcessoReceita, crtRegimeNormal];

  lblAliquotaIPI.Visible     := IntToCSTICMS( cmbCST.ItemIndex ) in [cst00];
  edtAliquotaIPI.Visible     := IntToCSTICMS( cmbCST.ItemIndex ) in [cst00];
//  lblValorBaseICMS.Visible   := IntToCSTICMS( cmbCST.ItemIndex ) in [cst00, cst10, cst20, cst51, cst60, cst90];
//  edtValorBaseICMS.Visible   := IntToCSTICMS( cmbCST.ItemIndex ) in [cst00, cst10, cst20, cst51, cst60, cst90];
//  lblValorICMS.Visible       := IntToCSTICMS( cmbCST.ItemIndex ) in [cst00, cst10, cst20, cst51, cst60, cst90];
//  edtValorICMS.Visible       := IntToCSTICMS( cmbCST.ItemIndex ) in [cst00, cst10, cst20, cst51, cst60, cst90];
//  lblValorICMSOp.Visible     := IntToCSTICMS( cmbCST.ItemIndex ) in [cst51];
//  edtValorICMSOp.Visible     := IntToCSTICMS( cmbCST.ItemIndex ) in [cst51];
//  lblValorBaseICMSST.Visible := IntToCSTICMS( cmbCST.ItemIndex ) in [cst10, cst30, cst70, cst90];
//  edtValorBaseICMSST.Visible := IntToCSTICMS( cmbCST.ItemIndex ) in [cst10, cst30, cst70, cst90];
//  lblValorICMSST.Visible     := IntToCSTICMS( cmbCST.ItemIndex ) in [cst10, cst30, cst70, cst90];
//  edtValorICMSST.Visible     := IntToCSTICMS( cmbCST.ItemIndex ) in [cst10, cst30, cst70, cst90];
end;

procedure TfrmCalculadoraTributaria.Inicializar;
begin
  ImpostoCalc
    .OnRecalcular( AtualizarCampos )

    .UF        ( StrToUF( cmbUF.Text   ) )
    .CRT       ( StrToCRT( cmbCRT.Text ) )
    .IEDest    ( StrToIndIEDest( cmbIndIEDest.Text ) )

    .AliquotaSN( edtAliquotaSN.Value  )

    {Necessario informar dados globais para fazer rateio proporcional}
    .Frete     ( edtFrete.Value       )
    .Seguro    ( edtSeguro.Value      )
    .Despesas  ( edtDespesas.Value    )
    .Desconto  ( edtDesconto.Value    );
end;

procedure TfrmCalculadoraTributaria.Simular;
begin
 ImpostoCalc
    .OnRecalcular( AtualizarCampos )
    .Desconto    ( 11.44           );

  ImpostoCalc
    .TryGetItem        ( 1         )
      .Quantidade      ( 1         )
      .ValorUnitario   ( 3.24      );

  ImpostoCalc
    .TryGetItem        ( 2         )
      .Quantidade      ( 2         )
      .ValorUnitario   ( 7.16      );

  ImpostoCalc
    .TryGetItem        ( 3         )
      .Quantidade      ( 3         )
      .ValorUnitario   ( 60.5      );

  ImpostoCalc
    .TryGetItem        ( 4         )
      .Quantidade      ( 4         )
      .ValorUnitario   ( 8.22      );

  ImpostoCalc
    .TryGetItem        ( 5         )
      .Quantidade      ( 5         )
      .ValorUnitario   ( 15.9      )
    .Recalcular;
end;

procedure TfrmCalculadoraTributaria.AdicionarItem;
begin
  ImpostoCalc
    .OnRecalcular( AtualizarCampos )

    .UF        ( StrToUF( cmbUF.Text   ) )
    .CRT       ( StrToCRT( cmbCRT.Text ) )
    .IEDest    ( StrToIndIEDest( cmbIndIEDest.Text ) )

    .AliquotaSN( edtAliquotaSN.Value  )

    {Necessario informar dados globais para fazer rateio proporcional}
    .Frete     ( edtFrete.Value       )
    .Seguro    ( edtSeguro.Value      )
    .Despesas  ( edtDespesas.Value    )
    .Desconto  ( edtDesconto.Value    )

    {Dados do item a ser calculado}
    .TryGetItem        ( edtProdutoID.Value         )
      .Quantidade      ( edtQuantidade.Value        )
      .ValorUnitario   ( edtValorUnitario.Value     )
      .DescontoUnitario( edtDescontoUnitario.Value  )
      .DescontoTotal   ( edtDescontoTotalItem.Value )

      {Calculo do ICMS/ICMSST}
      .ICMS
        {Metodos abaixo são a base para realizar os calculos tributarios}
        .CST           ( IntToCSTICMS( cmbCST.ItemIndex )         )
        .CSOSN         ( IntToCSOSNICMS( cmbCSOSN.ItemIndex )     )
        .AliquotaSN    ( edtAliquotaST.Value                      )
        .AliquotaICMS  ( edtAliquotaICMS.Value                    )
        .AliquotaICMSST( edtAliquotaICMSST.Value                  )
        .AliquotaST    ( edtAliquotaST.Value                      )
        .MVA           ( edtMVA.Value                             )
        .ReducaoBC     ( edtReducaoBC.Value                       )
        .ReducaoBCST   ( edtReducaoBCST.Value                     )
        .Diferimento   ( edtDiferimento.Value                     )
        .BCSTRet       ( edtBCSTRetido.Value                      )
        .ICMSSTRet     ( edtICMSSTRetido.Value                    )
        .Retorno

      .IPI
        .CST           ( IntToCSTIpi (cmbCSTIPI.ItemIndex )       )
        .AliquotaIPI   ( edtAliquotaIPI.Value                     )
        .Retorno

      .PIS
        .Retorno

      .COFINS
        .Retorno

    .Recalcular;
end;

procedure TfrmCalculadoraTributaria.AtualizarCampos;
var
  LImpostoItem: iImpostoItem;
begin
  mmoLog.Clear;

  { Dados de totalizador }
  edtTotalBC.Value     := ImpostoCalc.Total.ICMSTot.vBC;
  edtTotalICMS.Value   := ImpostoCalc.Total.ICMSTot.vICMS;
  edtTotalBCST.Value   := ImpostoCalc.Total.ICMSTot.vBCST;
  edtTotalICMSST.Value := ImpostoCalc.Total.ICMSTot.vST;

  edtTotalFrete.Value  := ImpostoCalc.Total.ICMSTot.vFrete;
  edtTotalSeg.Value    := ImpostoCalc.Total.ICMSTot.vSeg;
  edtTotalOutros.Value := ImpostoCalc.Total.ICMSTot.vOutro;
  edtTotalDesc.Value   := ImpostoCalc.Total.ICMSTot.vDesc;

  edtTotalProd.Value   := ImpostoCalc.Total.ICMSTot.vProd;
  edtTotalNF.Value     := ImpostoCalc.Total.ICMSTot.vNF;

  for LImpostoItem in ImpostoCalc.Items do
  begin
    Logar( Format( 'Id: %f'                 , [LImpostoItem.Id])                           );
    Logar( Format( '- vProd: %n'            , [LImpostoItem.Det.tagProd.vProd])            );
    Logar( Format( '- vProdComDesc: %n'     , [LImpostoItem.Det.tagProd.vProdComDescUnit]) );
    Logar( Format( '- vFrete: %n'           , [LImpostoItem.Det.tagProd.vFrete])           );
    Logar( Format( '- vSeg: %n'             , [LImpostoItem.Det.tagProd.vSeg])             );
    Logar( Format( '- vOutro: %n'           , [LImpostoItem.Det.tagProd.vOutro])           );
    Logar( Format( '- vDesc: %n'            , [LImpostoItem.Det.tagProd.vDesc])            );
    Logar( '----'                                                                          );
    Logar( Format( '- ICMS %s'              , [CSTICMSToStr(LImpostoItem.ICMS.CST)])       );
    Logar( Format( '  - vBC: %n'            , [LImpostoItem.Det.tagImposto.ICMS.vBC])      );
    Logar( Format( '  - vICMS: %n'          , [LImpostoItem.Det.tagImposto.ICMS.vICMS])    );
    Logar( Format( '  - vICMSOp: %n'        , [LImpostoItem.Det.tagImposto.ICMS.vICMSOp])  );
    Logar( Format( '  - vCredSN: %n'        , [LImpostoItem.Det.tagImposto.ICMS.vCredSN])  );
    Logar( Format( '  - vBCST: %n'          , [LImpostoItem.Det.tagImposto.ICMS.vBCST])    );
    Logar( Format( '  - vICMSST: %n'        , [LImpostoItem.Det.tagImposto.ICMS.vICMSST])  );

    Logar( '-------------------------' );
  end;
end;


end.
