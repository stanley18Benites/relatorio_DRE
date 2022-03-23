unit unit_principal_DRF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmTelaInicial_DRF = class(TForm)
    btImprimir: TButton;
    dataini: TMaskEdit;
    datafin: TMaskEdit;
    Label1: TLabel;
    comboBoxPeriodo: TComboBox;
    Label2: TLabel;
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaInicial_DRF: TfrmTelaInicial_DRF;

implementation
uses unit_Relatorio_DRF;
{$R *.dfm}

procedure TfrmTelaInicial_DRF.btImprimirClick(Sender: TObject);
begin
  TfrmTelaRelatorio.criarRelatorio(StrToDateDef(dataini.Text,2000-01-01),StrToDateDef(datafin.Text,2000-01-02),comboBoxPeriodo.ItemIndex);
end;

end.
