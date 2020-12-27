program ProjectTimer;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {frmTimer},
  uConstants in 'uConstants.pas',
  frameTimer in 'Frames\frameTimer.pas' {FrameSingleTimerData: TFrame},
  uDM in 'DB\uDM.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTimer, frmTimer);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
