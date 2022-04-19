program DRE;

uses
  Vcl.Forms,
  unit_principal_DRF in 'unit_principal_DRF.pas' {frmTelaInicial_DRF},
  unit_Relatorio_DRF in 'unit_Relatorio_DRF.pas' {frmTelaRelatorio},
  unit_DataModule_DRF in 'unit_DataModule_DRF.pas' {frm_dataModule},
  unit_nextPage in 'unit_nextPage.pas' {frm_nextPage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTelaInicial_DRF, frmTelaInicial_DRF);
  Application.CreateForm(Tfrm_dataModule, frm_dataModule);
  Application.CreateForm(Tfrm_nextPage, frm_nextPage);
  Application.Run;
end.
