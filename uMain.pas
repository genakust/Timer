unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox,
  System.Actions, FMX.ActnList, FMX.Media, System.IOUtils,

  {$IFDEF ANDROID}
  FMX.Helpers.Android, Androidapi.Helpers, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App,
  {$ENDIF}

  uTimerData, uCommonTools;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    imgBackground: TImage;
    labTime: TLabel;
    progbarTime: TProgressBar;
    layTop: TLayout;
    layBottom: TLayout;
    cirStartStop: TCircle;
    imgStartStop: TImage;
    recSettings: TRectangle;
    cbMinutes: TComboBox;
    imgImageStart: TImage;
    cbSeconds: TComboBox;
    layComboBoxes: TLayout;
    labMin: TLabel;
    labSec: TLabel;
    imgImageStop: TImage;
    layProgBar: TLayout;
    layBtnStartStop: TLayout;
    cirClosePanel: TCircle;
    ActionList1: TActionList;
    actCloseSettings: TAction;
    actOpenSettings: TAction;
    imgClose: TImage;
    actStartStop: TAction;
    Timer: TTimer;
    MediaPlayer1: TMediaPlayer;
    actStartTimer: TAction;
    procedure FormShow(Sender: TObject);
    procedure labTimeClick(Sender: TObject);
    procedure actCloseSettingsExecute(Sender: TObject);
    procedure actOpenSettingsExecute(Sender: TObject);
    procedure actStartStopExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FStart: Boolean;
    FTimerValues: TTimerData;
    FRemainingSec: integer;
    procedure PlaySound;
    function GetMediaDir: string;
    procedure TimerStartStop(const AStart: boolean);
    {$IFDEF ANDROID}
    procedure KeepAndroidScreenOn(const AStart: boolean);
    {$ENDIF}
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$REGION '< Actions >'}
procedure TForm1.actCloseSettingsExecute(Sender: TObject);
begin
  recSettings.Visible := false;
  cirStartStop.Enabled := true;

  FTimerValues.Minutes := cbMinutes.Items[cbMinutes.ItemIndex].ToInteger;
  FTimerValues.Seconds := cbSeconds.Items[cbSeconds.ItemIndex].ToInteger;

  labTime.Text := FTimerValues.TimeAsString;

  FRemainingSec := FTimerValues.TotalSeconds;
end;

procedure TForm1.actOpenSettingsExecute(Sender: TObject);
begin
  if not recSettings.Visible and not FStart then
  begin
    recSettings.Visible:= true;
    cirStartStop.Enabled := false;
  end;
end;

procedure TForm1.actStartStopExecute(Sender: TObject);
begin
  FStart := not FStart;
  imgStartStop.BeginUpdate;
  try
    if FStart then
    begin
      imgStartStop.Bitmap := imgImageStop.Bitmap;
      progbarTime.Visible := true;
      progbarTime.Value := 0;
    end
    else
    begin
      imgStartStop.Bitmap := imgImageStart.Bitmap;
      progbarTime.Visible := false;
    end;
  finally
    imgStartStop.EndUpdate;
  end;

  TimerStartStop(FStart);
  {$IFDEF ANDROID}
  KeepAndroidScreenOn(FStart);
  {$ENDIF}
end;

{$endregion}

{$REGION '< Create/Show and Co. >'}
procedure TForm1.FormCreate(Sender: TObject);
begin
  FStart := false;
  FTimerValues := TTimerData.Create;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  recSettings.Visible:= false;
  progbarTime.Visible := false;

  imgImageStart.Visible:= false;
  imgImageStop.Visible:= false;

  imgStartStop.Bitmap := imgImageStart.Bitmap;

  labTime.Text := FTimerValues.TimeAsString;
  FRemainingSec := FTimerValues.TotalSeconds;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FTimerValues.DisposeOf;
end;
{$endregion}

procedure TForm1.labTimeClick(Sender: TObject);
begin
  actOpenSettingsExecute(nil);
end;

{$REGION '< Platform dependent functions >'}
{$IFDEF ANDROID}
procedure TForm1.KeepAndroidScreenOn(const AStart: boolean);
begin
  if AStart then
    TAndroidHelper.Activity.getWindow.addFlags(
      TJWindowManager_LayoutParams.JavaClass.FLAG_KEEP_SCREEN_ON)
  else
    TAndroidHelper.Activity.getWindow.clearFlags(
      TJWindowManager_LayoutParams.JavaClass.FLAG_KEEP_SCREEN_ON);
end;
{$ENDIF}
{$endregion}

{$REGION '< Timer >'}
procedure TForm1.TimerTimer(Sender: TObject);
var
  min: Integer;
  sec: integer;
  temp: double;
begin
  if FRemainingSec > 0 then
    FRemainingSec := FRemainingSec - 1
  else
  begin
    TimerStartStop(False);
    imgStartStop.Bitmap := imgImageStart.Bitmap;
    PlaySound();
    FStart := false;
    Exit;
  end;

  temp := FRemainingSec / 60;
  min := FRemainingSec div 60;
  sec := Round((temp - min) * 60);
  // Display of the remaining time
  labTime.Text := FTimerValues.TimeAsString(min, sec);
  // Progress
  progbarTime.Value := Scale(FRemainingSec, 0, FTimerValues.TotalSeconds,
    progbarTime.Min, progbarTime.Max);
end;

procedure TForm1.TimerStartStop(const AStart: boolean);
begin
  Timer.Enabled := AStart;
  if not AStart then
  begin
    progbarTime.Value := progbarTime.Min;
    labTime.Text := FTimerValues.TimeAsString;
    FRemainingSec := 0;
  end;
end;
{$endregion}

{$REGION '< Mediaplayer >'}

procedure TForm1.PlaySound;
var
  fileName: string;
begin
{$IFDEF ANDROID}
  fileName := TPath.Combine(GetMediaDir, 'tibetan bowl.3gp');
{$ENDIF}
{$IFDEF MSWINDOWS}
  fileName := GetMediaDir + '\tibetan bowl.wav';
{$ENDIF}
  if Assigned(MediaPlayer1) then
    MediaPlayer1.fileName := fileName;
  if MediaPlayer1.Media <> nil then
  begin
    if (MediaPlayer1.State = TMediaState.Unavailable) or
      (MediaPlayer1.State = TMediaState.Stopped) then
    begin
      MediaPlayer1.Play;
    end;
  end;
end;

function TForm1.GetMediaDir: string;
begin
  case TOSVersion.Platform of
    TOSVersion.TPlatform.pfWindows:
      Result := '..\..\Assets\';
    TOSVersion.TPlatform.pfMacOS:
      Result := TPath.GetFullPath('../Resources/StartUp');
    TOSVersion.TPlatform.pfiOS:
      Result := TPath.GetHomePath + '/Documents';
    TOSVersion.TPlatform.pfAndroid:
      Result := TPath.GetDocumentsPath;
    TOSVersion.TPlatform.pfWinRT, TOSVersion.TPlatform.pfLinux:
      raise Exception.Create('Unexpected platform');
  end;
end;

{$ENDREGION}
end.
