unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.Media, FMX.Ani,
  FMX.TabControl, System.ImageList, FMX.ImgList;

type
  TfrmTimer = class(TForm)
    layContent: TLayout;
    btnStart: TCornerButton;
    layBottom: TLayout;
    recTimer: TRectangle;
    labRestTime: TLabel;
    MediaPlayer1: TMediaPlayer;
    ColorAnimation1: TColorAnimation;
    TabControl1: TTabControl;
    tabTimer: TTabItem;
    tabTimers: TTabItem;
    ToolBar1: TToolBar;
    StyleBook1: TStyleBook;
    btnAddNewTimer: TSpeedButton;
    ImageList1: TImageList;
    btnDeleteTimer: TSpeedButton;
    btnBackFromViewTimers: TSpeedButton;
    tabSettings: TTabItem;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    function GetMediaDir: string;
    procedure labRestTimeClick(Sender: TObject);
    procedure btnBackFromViewTimersClick(Sender: TObject);
  private
    FTimer1: TTimer;
    /// <summary>
    /// Memory for the remaining time
    /// </summary>
    FCount: integer;
    procedure OnTimer1(Sender: TObject);
    procedure PlaySound;
  public
    { Public-Deklarationen }
  end;

var
  frmTimer: TfrmTimer;

implementation

uses
  uConstants, System.iOUtils;

{$R *.fmx}

procedure TfrmTimer.btnStartClick(Sender: TObject);

begin
  // Timer start
  FTimer1.Enabled := true;
  // the place to save target time
  FTimer1.Tag := 6; // min
  FCount := FTimer1.Tag;
end;

procedure TfrmTimer.FormCreate(Sender: TObject);
begin
  FCount := 0;
  FTimer1 := TTimer.Create(nil);
  FTimer1.Interval := TIMER_INTERVAL;
  FTimer1.Enabled := false;
  FTimer1.OnTimer := OnTimer1;
  TabControl1.ActiveTab:= tabTimer;
end;

procedure TfrmTimer.FormDestroy(Sender: TObject);
begin
  FTimer1.Free;
end;

procedure TfrmTimer.OnTimer1(Sender: TObject);
var
  min: integer;
  sec: extended;
  temp: double;
begin
  if FCount > 0 then
    FCount := FCount - 1
  else
  begin
    FTimer1.Enabled := false;
    PlaySound();

  end;

  temp := FCount / 60;
  min := FCount div 60;
  sec := (temp - min) * 60;
  // Display of the remaining time
  labRestTime.Text := min.ToString + ':' + sec.ToString;
end;

procedure TfrmTimer.PlaySound;
var
 fileName: string;
begin
{$IFDEF ANDROID}
  fileName := TPath.Combine(GetMediaDir,'tibetan bowl.3gp');
{$ENDIF}
{$IFDEF MSWINDOWS}
  fileName := GetMediaDir + '\tibetan bowl.wav';
{$ENDIF}
  if Assigned(MediaPlayer1)then
    MediaPlayer1.FileName:= fileName;
  if MediaPlayer1.Media <> nil then
  begin
    if (MediaPlayer1.State = TMediaState.Unavailable) or
      (MediaPlayer1.State = TMediaState.Stopped) then
    begin
      MediaPlayer1.Play;
    end;
  end;
end;

procedure TfrmTimer.btnBackFromViewTimersClick(Sender: TObject);
begin
  // go back
  TabControl1.ActiveTab:= tabTimer;
end;

function TfrmTimer.GetMediaDir: string;
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

procedure TfrmTimer.labRestTimeClick(Sender: TObject);
begin
  // go to the settings tab
  TabControl1.ActiveTab:= tabTimers;
end;

initialization

ReportMemoryLeaksOnShutdown := true;

end.
