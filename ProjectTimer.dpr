program ProjectTimer;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {frmTimer},
  uConstants in 'uConstants.pas',
  frameTimer in 'Frames\frameTimer.pas' {FrameSingleTimerData: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTimer, frmTimer);
  Application.Run;
end.
