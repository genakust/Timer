unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.Media, FMX.Ani;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    btnStart: TCornerButton;
    layBottom: TLayout;
    recTimer: TRectangle;
    labRestTime: TLabel;
    MediaPlayer1: TMediaPlayer;
    ColorAnimation1: TColorAnimation;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FTimer1: TTimer;
    ///<summary>
    /// Memory for the remaining time
    ///</summary>
    FCount: integer;
    procedure OnTimer1(Sender: TObject);
    procedure PlaySound;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

uses
  uConstants;

{$R *.fmx}

procedure TForm1.btnStartClick(Sender: TObject);

begin
  // Timer start
  FTimer1.Enabled := true;
  // the place to save target time
  FTimer1.Tag := 60 * 1; // min
  FCount:= FTimer1.Tag;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FCount := 0;
  FTimer1 := TTimer.Create(nil);
  FTimer1.Interval := TIMER_INTERVAL;
  FTimer1.Enabled:= false;
  FTimer1.OnTimer := OnTimer1;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FTimer1.Free;
end;

procedure TForm1.OnTimer1(Sender: TObject);
var
  min: integer;
  sec: extended;
  temp: double;
begin
  if FCount > 0 then
    FCount := FCount -1
  else
  begin
    FTimer1.Enabled:= false;
    PlaySound();
  end;

  temp:= FCount / 60;
  min:= FCount div 60;
  sec:= (temp - min) *60;
  // Display of the remaining time
  labRestTime.Text := min.ToString + ':' + sec.ToString;
end;

procedure TForm1.PlaySound;
begin
  if MediaPlayer1.Media <> nil then
  begin
    if (MediaPlayer1.State = TMediaState.Unavailable) or
      (MediaPlayer1.State = TMediaState.Unavailable) then
    begin
      MediaPlayer1.Play;
    end;
  end;
end;

initialization
  ReportMemoryLeaksOnShutdown := true;

end.
