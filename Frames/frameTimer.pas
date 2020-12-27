unit frameTimer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, System.ImageList, FMX.ImgList;

type
  TFrameSingleTimerData = class(TFrame)
    Rectangle1: TRectangle;
    labTimerTime: TLabel;
    labTimerNummer: TLabel;
    imglstTimerFrame: TImageList;
    Image1: TImage;
    btnGoToSettings: TSpeedButton;
    cbActive: TCheckBox;
    procedure btnGoToSettingsClick(Sender: TObject);
  private
    { Private-Deklarationen }
    FOnButtonClick: TNotifyEvent;
    function GetTimerNummer: string;
    procedure SetTimerNummer(const Value: string);
    function GetTimerTime: string;
    procedure SetTimerTime(const Value: string);
  public
    constructor Create(AOwner: TComponent) ; override;
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;
    property TimerNummer: string read GetTimerNummer write SetTimerNummer;
    property TimerTime: string read GetTimerTime write SetTimerTime;
  end;

implementation

{$R *.fmx}

procedure TFrameSingleTimerData.btnGoToSettingsClick(Sender: TObject);
begin
  if Assigned(FOnButtonClick) then
    FOnButtonClick(self);
end;

constructor TFrameSingleTimerData.Create(AOwner: TComponent);
begin
  inherited;

end;

{$REGION '< Properties >'}
function TFrameSingleTimerData.GetTimerNummer: string;
begin
  Result:= labTimerNummer.Text;
end;

function TFrameSingleTimerData.GetTimerTime: string;
begin
  Result:= labTimerTime.Text;
end;

procedure TFrameSingleTimerData.SetTimerNummer(const Value: string);
begin
  labTimerNummer.Text:= Value;
end;

procedure TFrameSingleTimerData.SetTimerTime(const Value: string);
begin
  labTimerTime.Text:= Value;
end;
{$ENDREGION}
end.
