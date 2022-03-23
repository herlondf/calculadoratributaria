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

  pcnConversao,
  Imposto,
  Imposto.Utils,
  Imposto.Log;

type

	TEditValue = class helper for TEdit
  private
    function GetValue: Double;
    procedure SetValue(AValue: Double);

    function GetAsInteger: Integer;
	public
	   property Value: Double read GetValue write SetValue;
     property AsInteger: Integer read GetAsInteger;
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
    procedure FormCreate(Sender: TObject);
    procedure edtOnChange(Sender: TObject);
  private
    { Private declarations }
    FImpostoInvoker: iImposto;

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

function TEditValue.GetAsInteger: Integer;
begin
  Result := StrToIntDef( Self.Text, 0 );
end;

function TEditValue.GetValue: Double;
begin
  Result := StrToFloatDef( Self.Text, 0 );
end;

procedure TEditValue.SetValue(AValue: Double);
begin
  Self.Text := FloatToStr(AValue);
end;

{ TFrmCalculadoraTributaria }

procedure TfrmCalculadoraTributaria.FormCreate(Sender: TObject);
begin
  Inicializar;
end;

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

procedure TfrmCalculadoraTributaria.edtOnChange(Sender: TObject);
begin
  AdicionarItem;
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
  I: TpcnCRT;
begin
  cmbCRT.Clear;
  for I := Low(TpcnCRT) to High(TpcnCRT) do
    cmbCRT.Items.Add( CRTToStr(I) );
end;

procedure TfrmCalculadoraTributaria.PreencherComboIndIEDest;
var
  I: TpcnIndIEDest;
begin
  cmbIndIEDest.Clear;
  for I := Low(TpcnIndIEDest) to High(TpcnIndIEDest) do
    cmbIndIEDest.Items.Add( IndIEDestToStr(I) );
end;

procedure TfrmCalculadoraTributaria.PreencherComboCST;
var
  I: TpcnCSTIcms;
begin
  cmbCST.Clear;
  for I := Low(TpcnCSTIcms) to High(TpcnCSTIcms) do
    cmbCST.Items.Add( CSTICMSToStr(I) );
end;

procedure TfrmCalculadoraTributaria.PreencherComboCSTIPI;
var
  I: TpcnCSTIpi;
begin
  cmbCSTIpi.Clear;
  for I := Low(TpcnCSTIpi) to High(TpcnCSTIpi) do
    cmbCSTIpi.Items.Add( CSTIPIToStr(I) );
end;

procedure TfrmCalculadoraTributaria.PreencherComboCSOSN;
var
  I: TpcnCSOSNIcms;
begin
  cmbCSOSN.Clear;
  for I := Low(TpcnCSOSNIcms) to High(TpcnCSOSNIcms) do
    cmbCSOSN.Items.Add( CSOSNICMSToStr(I) );
end;

procedure TfrmCalculadoraTributaria.Logar(Value: Variant);
begin
  mmoLog.Lines.Add(Value);
end;

procedure TfrmCalculadoraTributaria.ValidarInterface;
var
  LOk: Boolean;
begin
  cmbCST.Enabled             := StrToCRT( LOk, cmbCRT.Text ) in [crtSimplesExcessoReceita, crtRegimeNormal];
  cmbCSOSN.Enabled           := StrToCRT( LOk, cmbCRT.Text ) in [crtSimplesNacional];

  lblAliquotaSN.Visible      := StrToCRT( LOk, cmbCRT.Text ) in [crtSimplesNacional];
  edtAliquotaSN.Visible      := StrToCRT( LOk, cmbCRT.Text ) in [crtSimplesNacional];

  lblAliquotaICMSST.Visible  := StrToCRT( LOk, cmbCRT.Text ) in [crtSimplesExcessoReceita, crtRegimeNormal];
  edtAliquotaICMSST.Visible  := StrToCRT( LOk, cmbCRT.Text ) in [crtSimplesExcessoReceita, crtRegimeNormal];
//  lblValorICMSST.Visible     := IntToCRT( cmbCRT.ItemIndex ) in [crtSimplesExcessoReceita, crtRegimeNormal];
//  edtValorICMSST.Visible     := IntToCRT( cmbCRT.ItemIndex ) in [crtSimplesExcessoReceita, crtRegimeNormal];

  lblAliquotaIPI.Visible     := StrToCSTICMS( LOk, cmbCST.Text ) in [cst00];
  edtAliquotaIPI.Visible     := StrToCSTICMS( LOk, cmbCST.Text ) in [cst00];

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
var
  LOk: Boolean;
begin
  FImpostoInvoker := nil;
  FImpostoInvoker := ImpostoInvoker;

  FImpostoInvoker
    .OnRecalcular( AtualizarCampos )

    .UF        ( StrToUF( cmbUF.Text                    ) )
    .CRT       ( StrToCRT( LOk, cmbCRT.Text             ) )
    .IEDest    ( StrToIndIEDest( LOk, cmbIndIEDest.Text ) )

    {Necessario informar dados globais para fazer rateio proporcional}
    .Frete     ( edtFrete.Value       )
    .Seguro    ( edtSeguro.Value      )
    .Despesas  ( edtDespesas.Value    )
    .Desconto  ( edtDesconto.Value    );
end;

procedure TfrmCalculadoraTributaria.Simular;
begin
  FImpostoInvoker
    .OnRecalcular( AtualizarCampos )
    .Desconto    ( 11.44           );

  FImpostoInvoker
    .Item           ( 1         )
      .Quantidade   ( 1         )
      .ValorUnitario( 3.24      );

  FImpostoInvoker
    .Item           ( 2         )
      .Quantidade   ( 2         )
      .ValorUnitario( 7.16      );

  FImpostoInvoker
    .Item           ( 3         )
      .Quantidade   ( 3         )
      .ValorUnitario( 60.5      );

  FImpostoInvoker
    .Item           ( 4         )
      .Quantidade   ( 4         )
      .ValorUnitario( 8.22      );

  FImpostoInvoker
    .Item           ( 5         )
      .Quantidade   ( 5         )
      .ValorUnitario( 15.9      )
    .Recalcular;
end;

procedure TfrmCalculadoraTributaria.AdicionarItem;
var
  LOk: Boolean;
begin
  FImpostoInvoker
    .OnRecalcular( AtualizarCampos )

    .OnRecalcularCallBack(
      procedure(AImposto: iImposto)
      begin

      end
    )

    .UF        ( StrToUF ( cmbUF.Text                   ) )
    .CRT       ( StrToCRT( LOk, cmbCRT.Text             ) )
    .IEDest    ( StrToIndIEDest( LOk, cmbIndIEDest.Text ) )

    {Necessario informar dados globais para fazer rateio proporcional}
    .Frete     ( edtFrete.Value       )
    .Seguro    ( edtSeguro.Value      )
    .Despesas  ( edtDespesas.Value    )
    .Desconto  ( edtDesconto.Value    )

    {Dados do item a ser calculado}
    .Item               ( edtProdutoID.AsInteger     )
      .Quantidade       ( edtQuantidade.Value        )
      .ValorUnitario    ( edtValorUnitario.Value     )
      .DescontoUnitario ( edtDescontoUnitario.Value  )
      .DescontoTotal    ( edtDescontoTotalItem.Value )

      {Calculo do ICMS/ICMSST}
      .ICMS
        {Metodos abaixo são a base para realizar os calculos tributarios}
        .CST           ( StrToCSTICMS  ( LOk, cmbCST.Text )       )
        .CSOSN         ( StrToCSOSNICMS( LOk, cmbCSOSN.Text )     )
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
        .CST           ( StrToCSTIpi ( LOk, cmbCSTIPI.Text )      )
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
  edtTotalBC.Value     := FImpostoInvoker.TagTotal.ICMSTot.vBC;
  edtTotalICMS.Value   := FImpostoInvoker.TagTotal.ICMSTot.vICMS;
  edtTotalBCST.Value   := FImpostoInvoker.TagTotal.ICMSTot.vBCST;
  edtTotalICMSST.Value := FImpostoInvoker.TagTotal.ICMSTot.vST;

  edtTotalFrete.Value  := FImpostoInvoker.TagTotal.ICMSTot.vFrete;
  edtTotalSeg.Value    := FImpostoInvoker.TagTotal.ICMSTot.vSeg;
  edtTotalOutros.Value := FImpostoInvoker.TagTotal.ICMSTot.vOutro;
  edtTotalDesc.Value   := FImpostoInvoker.TagTotal.ICMSTot.vDesc;

  edtTotalProd.Value   := FImpostoInvoker.TagTotal.ICMSTot.vProd;
  edtTotalNF.Value     := FImpostoInvoker.TagTotal.ICMSTot.vNF;

  for LImpostoItem in FImpostoInvoker.Items do
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
