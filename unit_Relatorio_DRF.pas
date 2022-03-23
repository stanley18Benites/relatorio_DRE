unit unit_Relatorio_DRF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, DBClient, DB, FireDAC.Comp.Client;

type
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
    RLLabel8: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand4: TRLBand;
    dbTipoConta: TRLDBText;
    dbConta: TRLDBText;
    RLBand3: TRLBand;
    labelNomeEmpresa: TRLLabel;
    RLDBText1: TRLDBText;
    labelTipo: TRLLabel;
    function montar_Relatorio(dataini, datafin : TDateTime; nItem : Integer) : TClientDataSet;
  private
  //
  public
    class procedure criarRelatorio(dataini, datafin: TDate; nItem : Integer);
  end;

implementation
 uses unit_DataModule_DRF;
{$R *.dfm}

class procedure TfrmTelaRelatorio.criarRelatorio(dataini, datafin : TDate; nItem : Integer);
// PROCEDURE PARA CHAMAR FUNCAO DE MONTAR DADOS E APOS, IMPRIMIR O RELATORIO PRONTO
var frmTelaRelatorio : TfrmTelaRelatorio;
  begin
    try

      frmTelaRelatorio := TfrmTelaRelatorio.Create(Application);
      frmTelaRelatorio.labelPeriodo.Caption := DateToStr(dataini) + ' � ' + DateToStr(datafin);
      //frmTelaRelatorio.montar_Relatorio(dataini,datafin); //CHAMANDO FUNCAO PARA MONTAR O SELECT DOS DADOS
      frmTelaRelatorio.dsDRF.DataSet := frmTelaRelatorio.montar_Relatorio(dataini, datafin, nItem);
      frmTelaRelatorio.rpRelatorioDRF.Preview;  //IMPRIMINDO O RELATORIO

    finally
      frmTelaRelatorio.Free;
  end;
end;

//---------------------------------------------------------------------------------------------------------------------------

function TfrmTelaRelatorio.montar_Relatorio(dataini, datafin : TDateTime; nItem : Integer) : TClientDataSet;
var cds : TClientDataSet;
var qry : TFDQuery ;

  begin
    try   //funcao para criar o clientdataset
      cds := TClientDataSet.Create(nil);
      cds.Close;
      CDS.FieldDefs.Clear;
      cds.FieldDefs.Add('TIPO',ftString,2);
      cds.FieldDefs.Add('TIPODESC',ftString,120);
      cds.FieldDefs.Add('SUBTIPO',ftString,100);
      cds.FieldDefs.Add('DESCRICAO',ftString,100);
      cds.FieldDefs.Add('SALDO',ftFloat);
      cds.FieldDefs.Add('PORCENTAGEM',ftFloat);
      cds.CreateDataSet;  //criando o clientdataset com os fileds

      //------- INSTANCIANDO A QUERY E CONECTANDO NO FDCONECTION DO DATAMODULE ------------------

      qry := TFDQuery.Create(nil);
      qry.Connection := frm_dataModule.FDConnection1;

      //-----------------------------------------------------------------------------------------     
      qry.Close;
      qry.SQL.Clear;
      //SQL PARA BUSCAR O NOME DA EMPRESA
      qry.SQL.Add('SELECT estabelecimento.NOME');
      qry.SQL.Add('FROM estabelecimento');
      qry.Open;
      labelNomeEmpresa.Caption := qry.FieldByName('NOME').AsString; // ATRIBUIR O NOME DA VARIAVEL COM O NOME DA EMRPESA
                                                                    //
      qry.Close;
      qry.SQL.Clear;

      if nItem = 0  then   // SE O USUARIO SELECIONAR PARA FILTRAR POR DATA DE VENCIMENTO, IRA USAR ESSE SQL
      begin
        qry.SQL.Add('SELECT sum(provisao_parc.VALOR) as VALORPAGO, provisao_parc.NUMEROPARCFATURA,');
        qry.SQL.Add('provisao_parc.VENCIMENTO, provisao_parc.NUMERODOCUMENTO,');
        qry.SQL.Add('provisao_parc.CONTA_ID, cadplanoconta.NOMECONTA');
        qry.SQL.Add('FROM provisao_parc');
        qry.SQL.Add('LEFT JOIN provisao ON provisao.ID = provisao_parc.PROVISAO_ID');
        qry.SQL.Add('LEFT JOIN cadplanoconta ON cadplanoconta.ID = provisao_parc.CONTA_ID');
        qry.SQL.Add('WHERE provisao_parc.STATUS = "pago" AND provisao_parc.NUMERODOCUMENTO <> 0 ');
        qry.SQL.Add('AND provisao_parc.VENCIMENTO >= :dataini AND provisao_parc.VENCIMENTO <= :datafin');
        qry.SQL.Add('AND provisao_parc.TIPO = "E"');
        qry.SQL.Add('GROUP BY provisao_parc.CONTA_ID');
        qry.SQL.Add('ORDER BY provisao_parc.VENCIMENTO DESC ');

        qry.ParamByName('dataini').AsDate := dataini;
        qry.ParamByName('datafin').AsDate := datafin;
        qry.Open;
        cds.Open;
        while not qry.EOF do   // ADICIONAR OS DADOS DO SELECT NO CLIENTDATASET
          begin
            cds.Append;
            cds.FieldByName('TIPO').AsString := 'R';
            cds.FieldByName('TIPODESC').AsString := 'RECEITAS';
            cds.FieldByName('SUBTIPO').AsString := qry.FieldByName('NOMECONTA').AsString;
            cds.FieldByName('DESCRICAO').AsString := qry.FieldByName('nomeconta').AsString;
            cds.FieldByName('SALDO').AsString := qry.FieldByName('VALORPAGO').AsString;
            //cds.FieldByName('PORCENTAGEM').AsString := qry.FieldByName('nomeconta').AsString;
            cds.Post;
            qry.Next;
          end;

      if nItem = 1  then   // SE O USUARIO SELECIONAR PARA FILTRAR POR DATA DE LAN�AMENTO IRA USAR ESSE SQL
        begin
          qry.SQL.Add('SELECT sum(provisao_parc.VALOR) as VALORPAGO, provisao_parc.NUMEROPARCFATURA,');
          qry.SQL.Add('provisao_parc.VENCIMENTO, provisao_parc.NUMERODOCUMENTO,');
          qry.SQL.Add('provisao_parc.CONTA_ID, cadplanoconta.NOMECONTA');
          qry.SQL.Add('FROM provisao_parc');
          qry.SQL.Add('LEFT JOIN provisao ON provisao.ID = provisao_parc.PROVISAO_ID');
          qry.SQL.Add('LEFT JOIN cadplanoconta ON cadplanoconta.ID = provisao_parc.CONTA_ID');
          qry.SQL.Add('WHERE provisao_parc.STATUS = "pago" AND provisao_parc.NUMERODOCUMENTO <> 0 ');
          qry.SQL.Add('AND provisao_parc.DATALANCAMENTO >= :DATAINI AND provisao_parc.DATALANCAMENTO <= :DATAfin');
          qry.SQL.Add('AND provisao_parc.TIPO = "E"');
          qry.SQL.Add('GROUP BY provisao_parc.CONTA_ID');
          qry.SQL.Add('ORDER BY provisao_parc.VENCIMENTO DESC ');

          qry.ParamByName('dataini').AsDate := dataini;
          qry.ParamByName('datafin').AsDate := datafin;
          qry.Open;
          cds.Open;
          while not qry.EOF do   // ADICIONAR OS DADOS DO SELECT NO CLIENTDATASET
            begin
              cds.Append;
              cds.FieldByName('TIPO').AsString := 'R';
              cds.FieldByName('TIPODESC').AsString := 'RECEITAS';
              cds.FieldByName('SUBTIPO').AsString := qry.FieldByName('nomeconta').AsString;
              cds.FieldByName('DESCRICAO').AsString := qry.FieldByName('nomeconta').AsString;
              cds.FieldByName('SALDO').AsString := qry.FieldByName('VALORPAGO').AsString;
              //cds.FieldByName('PORCENTAGEM').AsString := qry.FieldByName('nomeconta').AsString;
              cds.Post;
              qry.Next;
            end;
        end;
      end;

    if nItem = 1  then   // SE O USUARIO SELECIONAR PARA FILTRAR POR DATA DE PAGAMENTO IRA USAR ESSE SQL
      begin
        qry.SQL.Add('SELECT sum(provisao_parc.VALOR) as VALORPAGO, provisao_parc.NUMEROPARCFATURA,');
        qry.SQL.Add('provisao_parc.VENCIMENTO, provisao_parc.NUMERODOCUMENTO,');
        qry.SQL.Add('provisao_parc.CONTA_ID, cadplanoconta.NOMECONTA');
        qry.SQL.Add('FROM provisao_parc');
        qry.SQL.Add('LEFT JOIN provisao ON provisao.ID = provisao_parc.PROVISAO_ID');
        qry.SQL.Add('LEFT JOIN cadplanoconta ON cadplanoconta.ID = provisao_parc.CONTA_ID');
        qry.SQL.Add('WHERE provisao_parc.STATUS = "pago" AND provisao_parc.NUMERODOCUMENTO <> 0 ');
        qry.SQL.Add('AND provisao_parc.DATAPAGTO >= :DATAINI AND provisao_parc.DATAPAGTO <= :DATAfin');
        qry.SQL.Add('AND provisao_parc.TIPO = "E"');
        qry.SQL.Add('GROUP BY provisao_parc.CONTA_ID');
        qry.SQL.Add('ORDER BY provisao_parc.VENCIMENTO DESC ');

        qry.ParamByName('dataini').AsDate := dataini;
        qry.ParamByName('datafin').AsDate := datafin;
        qry.Open;
        cds.Open;
        while not qry.EOF do   // ADICIONAR OS DADOS DO SELECT NO CLIENTDATASET
          begin
            cds.Append;
            cds.FieldByName('TIPO').AsString := 'R';
            cds.FieldByName('TIPODESC').AsString := 'RECEITAS';
            cds.FieldByName('SUBTIPO').AsString := qry.FieldByName('nomeconta').AsString;
            cds.FieldByName('DESCRICAO').AsString := qry.FieldByName('nomeconta').AsString;
            cds.FieldByName('SALDO').AsString := qry.FieldByName('VALORPAGO').AsString;
            //cds.FieldByName('PORCENTAGEM').AsString := qry.FieldByName('nomeconta').AsString;
            cds.Post;
            qry.Next;
          end;
        end;
    finally

    end;
  result := cds;
  end;

end.
