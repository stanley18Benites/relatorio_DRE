unit unit_nextPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  Tfrm_nextPage = class(TForm)
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
    labelNomeEmpresa: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand2: TRLBand;
    dbConta: TRLDBText;
    dbSaldoTotal: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_nextPage: Tfrm_nextPage;

implementation

{$R *.dfm}

end.
