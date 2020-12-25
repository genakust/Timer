unit frameTimer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, System.ImageList, FMX.ImgList;

type
  TFrameSingleTimerData = class(TFrame)
    Rectangle1: TRectangle;
    labTimeframe: TLabel;
    Label2: TLabel;
    imglstTimerFrame: TImageList;
    Image1: TImage;
  private
    { Private-Deklarationen }
  public
    btnGoToSettings: TSpeedButton;
    constructor Create(AOwner: TComponent) ; override;

    //property OnButtonClick: TNotifyEvent read FOnClick write FOnClick;
  end;

implementation

{$R *.fmx}

constructor TFrameSingleTimerData.Create(AOwner: TComponent);
begin
  inherited;

end;

end.
