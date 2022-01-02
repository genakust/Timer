program ProjMeditationstimer;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form1},
  uCommonTools in 'Tools\uCommonTools.pas',
  uTimerData in 'Model\uTimerData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
