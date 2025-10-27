unit uFrmLicencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, StdCtrls;

type
  TfrmLicencia = class(TForm)
    pnlBottom: TPanel;
    btnAceptar: TButton;
    btnCerrar: TButton;
    wbLicencia: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FTemporaryPdf: string;
    procedure MostrarLicencia;
    procedure EliminarPdfTemporal;
  public
  end;

var
  frmLicencia: TfrmLicencia;

implementation

{$R *.dfm}

const
  cPdfResourceName = 'LICPDF';
  cPdfResourceType = 'PDF';

function ExtraerRecursoAPdfTemporal(const Recurso, TipoRecurso: string): string;
var
  RutaTemp: array[0..MAX_PATH] of Char;
  NombreTemp: array[0..MAX_PATH] of Char;
  NombreTempStr: string;
  Destino: string;
  RecursoStream: TResourceStream;
begin
  if GetTempPath(MAX_PATH, RutaTemp) = 0 then
    raise Exception.Create('No fue posible obtener la carpeta temporal.');

  if GetTempFileName(RutaTemp, 'LIC', 0, NombreTemp) = 0 then
    raise Exception.Create('No fue posible generar un archivo temporal.');

  NombreTempStr := StrPas(NombreTemp);
  DeleteFile(NombreTempStr);
  Destino := ChangeFileExt(NombreTempStr, '.pdf');

  RecursoStream := TResourceStream.Create(HInstance, PChar(Recurso), PChar(TipoRecurso));
  try
    RecursoStream.SaveToFile(Destino);
  finally
    RecursoStream.Free;
  end;

  Result := Destino;
end;

procedure TfrmLicencia.EliminarPdfTemporal;
begin
  if (FTemporaryPdf <> '') and FileExists(FTemporaryPdf) then
    DeleteFile(FTemporaryPdf);
end;

procedure TfrmLicencia.FormCreate(Sender: TObject);
begin
  MostrarLicencia;
end;

procedure TfrmLicencia.FormDestroy(Sender: TObject);
begin
  EliminarPdfTemporal;
end;

procedure TfrmLicencia.MostrarLicencia;
begin
  EliminarPdfTemporal;
  FTemporaryPdf := ExtraerRecursoAPdfTemporal(cPdfResourceName, cPdfResourceType);
  wbLicencia.Navigate(WideString(FTemporaryPdf));
end;

end.
