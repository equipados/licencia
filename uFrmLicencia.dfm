object frmLicencia: TfrmLicencia
  Left = 0
  Top = 0
  Caption = 'Licencia de uso'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object wbLicencia: TWebBrowser
    Left = 0
    Top = 0
    Width = 800
    Height = 560
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C0000001A0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000
      00000000}
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 560
    Width = 800
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnAceptar: TButton
      Left = 608
      Top = 8
      Width = 85
      Height = 25
      Caption = 'Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCerrar: TButton
      Left = 699
      Top = 8
      Width = 85
      Height = 25
      Caption = 'Cerrar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
