unit unit_Relatorio_DRF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, DBClient, DB, FireDAC.Comp.Client;

type
  TContaBct = record
    conta: integer;
    classificacao: string;
    nome: string;
    valor : Currency ;
    nivel : Integer ;
    porcentagem : Double;
  end;
type
  TPorcentagem = record
    porcentagem: Double ;
    conta: Integer;
end;
  TContasBct = array of TContaBct;
  Tporcentage = array of TPorcentagem ;
  TfrmTelaRelatorio = class(TForm)
    rpRelatorioDRF: TRLReport;
    RLBand1: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel1: TRLLabel;
    RLPanel2: TRLPanel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    labelPeriodo: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel9: TRLLabel;
    dsDRF: TDataSource;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    labelNomeEmpresa: TRLLabel;
    RLLabel12: TRLLabel;
    RLBand2: TRLBand;
    dbConta: TRLDBText;
    dbSaldoTotal: TRLDBText;
    db_porcentagem: TRLDBText;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure dbContaBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
  private
    function sBuscarReceitas(dataini, datafin : TDate; nItem : Integer) : TClientDataSet;
    function buscarClasse(sClasse : String): String;
    function pegarContas( sClass: string; var contas : TContasBct; valor : Currency ): Integer;
    function atualizaSaldo(classificacao: string; var contas : TContasBct; valor : Currency) : boolean ;
//    procedure sPercentual(nConta : String; vAnalitica : Double);
    procedure buscarPercentual;
  public
    class procedure criarRelatorio(dataini, datafin: TDate; nItem : Integer);
  end;

implementation
 uses unit_DataModule_DRF, unit_nextPage;
 var cds : TClientDataSet;
 var saldo, saldoT : Double;
{$R *.dfm}

class procedure TfrmTelaRelatorio.criarRelatorio(dataini, datafin : TDate; nItem : Integer);
// PROCEDURE PARA CHAMAR FUNCAO DE MONTAR DADOS E APOS, IMPRIMIR O RELATORIO PRONTO
var frmTelaRelatorio : TfrmTelaRelatorio;
begin
try
  frmTelaRelatorio := TfrmTelaRelatorio.Create(Application);
  frmTelaRelatorio.labelPeriodo.Caption := DateToStr(dataini) + ' � ' + DateToStr(datafin);
  frmTelaRelatorio.dsDRF.DataSet := frmTelaRelatorio.sBuscarReceitas(dataini, datafin, nItem);
  frmTelaRelatorio.rpRelatorioDRF.Preview;  //IMPRIMINDO O RELATORIO
finally
  frmTelaRelatorio.Free;
end;
end;
//---------------------------------------------------------------------------------------------------------------------------
function TfrmTelaRelatorio.sBuscarReceitas(dataini, datafin : TDate; nItem : Integer) : TClientDataSet;
var
sPos,sDescricao : String;
saldoTotal : Double;
qry : TFDQuery ;
contas : TContasBct;
i : Integer ;
begin
  contas := nil ;
  try   //funcao para criar o clientdataset
    cds := TClientDataSet.Create(nil);
    cds.Close;
    CDS.FieldDefs.Clear;
    cds.FieldDefs.Add('AS',ftString,1);
    CDS.FieldDefs.Add('NIVEL',ftInteger);
    CDS.FieldDefs.Add('CONTA',ftInteger);
    cds.FieldDefs.Add('CLASSE',ftString,50);
    cds.FieldDefs.Add('DESCRICAO',ftString,100);
    cds.FieldDefs.Add('SALDO',ftFloat);
    cds.FieldDefs.Add('PERC',ftFloat);
    cds.CreateDataSet;  //criando o clientdataset com os fileds
    cds.IndexFieldNames := 'CLASSE' ;
  //------- INSTANCIANDO A QUERY E CONECTANDO NO FDCONECTION DO DATAMODULE ------------------
    qry := TFDQuery.Create(nil);
    qry.Connection := frm_dataModule.FDConnection1;
  //-----------------------------------------------------------------------------------------
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT estabelecimento.NOME'); //SQL PARA BUSCAR O NOME DA EMPRESA
    qry.SQL.Add('FROM estabelecimento');
    qry.Open;
    labelNomeEmpresa.Caption := qry.FieldByName('NOME').AsString; //ATRIBUIR O NOME DA VARIAVEL COM O NOME DA EMPRESA

    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('select caixa.CONTA_ID,cadplanoconta.NOMECONTA as DESCRICAO ,sum(CASE WHEN caixa.TIPO="E" THEN coalesce(caixa.VALORPAGO,0) ELSE ');
    qry.SQL.Add('coalesce(caixa.VALORPAGO,0) END) as SALDO, cadplanoconta.CLASS  AS classe');
    qry.SQL.Add('from caixa ');
    qry.SQL.Add('left join CADPLANOCONTA on caixa.CONTA_ID=cadplanoconta.ID ');
    if nItem = 0  then   //FILTRAR POR DATA DE PAGAMENTO
    qry.SQL.Add('where caixa.DATAPAGTO>=:dataini and caixa.DATAPAGTO<=:datafin '); //AND caixa.TIPO="E"
    if nItem = 1  then   //FILTRAR POR DATA DE LANCAMENTO
    qry.SQL.Add('where caixa.DATALANC>=:dataini and caixa.DATALANC<=:datafin '); // AND caixa.TIPO="E".
    qry.SQL.Add('group by caixa.CONTA_ID ');
    qry.SQL.Add('order by cadplanoconta.CLASS ');
    qry.ParamByName('dataini').AsDate := dataini;
    qry.ParamByName('datafin').AsDate := datafin;
    qry.Open;
    cds.Open;

    while not qry.EOF do    // ADICIONAR OS DADOS DO SELECT NO CLIENTDATASET
    begin
      pegarContas(qry.FieldByName('classe').AsString,contas, qry.FieldByName('SALDO').AsFloat);
      cds.Append;
      cds.FieldByName('AS').AsString        := 'A';
      cds.FieldByName('CONTA').AsInteger    := qry.FieldByName('conta_id').AsInteger;
      cds.FieldByName('CLASSE').AsString    := qry.FieldByName('classe').AsString;
      cds.FieldByName('DESCRICAO').AsString := qry.FieldByName('descricao').AsString;
      cds.FieldByName('SALDO').AsFloat      := qry.FieldByName('SALDO').AsFloat;
      cds.FieldByName('NIVEL').AsInteger    := 2 ;
      cds.Post;
      qry.Next;
    end;
    for I := 0 to Length(contas)-1 do
    begin
    if contas[i].valor > 0 then
    begin
      cds.Append;
      cds.FieldByName('AS').AsString          := 'S';
      cds.FieldByName('CONTA').asInteger      := contas[i].conta;
      cds.FieldByName('CLASSE').AsString      := contas[i].classificacao;
      cds.FieldByName('DESCRICAO').AsString   := contas[i].nome;
      cds.FieldByName('SALDO').AsFloat        := contas[i].valor;
      cds.FieldByName('NIVEL').AsInteger      := contas[i].nivel ;
      cds.Post;
    end;
    end;
    buscarPercentual();
  finally
  end;
result := cds;
end;
function TfrmTelaRelatorio.atualizaSaldo(classificacao: string; var contas : TContasBct; valor : Currency) : boolean;
var i : integer ;
begin
  result := false;
  for I := 0 to Length(contas) - 1 do
  begin
  if copy(classificacao,1,length(contas[i].classificacao)) = contas[i].classificacao then
  begin
    contas[i].valor := contas[i].valor + valor;
  end;
  end;
end;

function TfrmTelaRelatorio.pegarContas(sClass: string; var contas : TContasBct; valor : Currency): Integer;
var qry: TFDQuery;
  p : String;
  idx : Integer ;
  i : Integer ;
  bOk : boolean ;

begin
if Length(contas)=0 then
begin
  qry := TFDQuery.Create(nil);
  qry.Connection := frm_dataModule.FDConnection1;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT conta, class, nomeconta');
  qry.SQL.Add('FROM cadplanoconta');
  qry.SQL.Add('WHERE cadplanoconta.SA = "S"');
  qry.Open;
  i := 0 ;
  while NOT qry.Eof do
  begin
    SetLength( contas, length(contas) + 1 );
    idx                       := length(contas)-1 ;
    contas[idx].conta         := qry.FieldByName('conta').AsInteger;
    contas[idx].classificacao := qry.FieldByName('class').AsString;
    contas[idx].nome          := qry.FieldByName('nomeconta').AsString;
    contas[idx].valor         := 0.00;
    contas[idx].nivel         := Length(qry.FieldByName('class').AsString);
    qry.Next;
  end;
  qry.free;
  end ;
  for I := 0 to Length(contas) - 1 do
  begin
  if copy(sClass,1,length(contas[i].classificacao)) = contas[i].classificacao then
  begin
    contas[i].valor := contas[i].valor + valor;
  end;
  end;
  result := 0;
end;

function TfrmTelaRelatorio.buscarClasse(sClasse : String) : String ;
var qry : TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := frm_dataModule.FDConnection1;

    qry.Close;
    qry.SQL.Clear;

    qry.SQL.Add('SELECT cadplanoconta.NOMECONTA as descricao');
    qry.SQL.Add('FROM cadplanoconta');
    qry.SQL.Add('WHERE cadplanoconta.class like :sClasse');
    qry.ParamByName('sClasse').Value := sClasse;
    qry.Open;
    finally
      result := qry.FieldByName('descricao').AsString;
    end;
end;

procedure TfrmTelaRelatorio.buscarPercentual();
var bm: TBookmark;
    sClass: string;
    dValor,dPerc, dPercSintetica: double;
    iConta : Integer;
begin
  cds.First;
  while not cds.Eof do
  begin
    sClass := cds.FieldByName('CLASSE').AsString;
    iConta := cds.FieldByName('CONTA').asInteger;
    dValor := cds.FieldByName('SALDO').AsFloat;
    //if cds.FieldByName('AS').AsString='S' then
    //begin
      bm := cds.GetBookmark;
      cds.First;
      while not cds.Eof do
      begin
        //if iConta <> cds.FieldByName('CONTA').AsInteger then
        //begin
          if (copy(cds.FieldByName('CLASSE').AsString,1,length(sClass))=sClass) and (cds.FieldByName('PERC').AsFloat = 0 )  then
          begin
          //if cds.FieldByName('PERC').AsFloat = 0 then
          //begin
            dPerc := 0.00;
            if (dValor <>0) then
            begin
            //    if cds.FieldByName('NIVEL').AsInteger  > 2 then
            //    begin
                dPerc := (cds.FieldByName('SALDO').AsFloat/dValor)*100;
    //           end
    {            else then
              begin
    //              dPerc := ;
              end;}
              cds.edit;
              cds.FieldByName('PERC').AsFloat := dPerc;
              cds.Post;
              cds.Next;
            //     end;
            end;

          end;
        //end
        //else
        //begin
          //cds.edit;
          //cds.FieldByName('PERC').AsFloat := 100;
          //cds.Post;
        //end;
        cds.Next;
      end;
      cds.GoToBookmark(bm);
      cds.Next;
    //end;
  end;
end;


procedure TfrmTelaRelatorio.dbContaBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  if cds.FieldByName('NIVEL').AsInteger = 2 then
  begin
    dbConta.Left := 9 ;
  end
  else if cds.FieldByName('NIVEL').AsInteger = 1 then
  begin
    dbConta.Left := 0 ;
  end
  else
    dbConta.Left := 5 ;
end;

procedure TfrmTelaRelatorio.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if dsDrf.DataSet.FieldByName('AS').AsString = 'S' then
  begin
    dbConta.Font.Style := [fsBold];
    dbSaldoTotal.Font.Style := [fsBold];
    db_porcentagem.Font.Style:= [fsBold];
  end
  else
  begin
    dbConta.Font.Style := [];
    dbSaldoTotal.Font.Style := [];
    db_porcentagem.Font.Style:= [];
  end;
end;

end.
