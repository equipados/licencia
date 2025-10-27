program Licencia;

uses
  Forms,
  uFrmLicencia in 'uFrmLicencia.pas' {frmLicencia};

{$R *.res}
{$R licencia.rc}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.CreateForm(TfrmLicencia, frmLicencia);
  Application.Run;
end.
