unit frameTimer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, System.ImageList, FMX.ImgList;

type
  TFrame1 = class(TFrame)
    Rectangle1: TRectangle;
    Label1: TLabel;
    ImageControl1: TImageControl;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    imglstTimerFrame: TImageList;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

implementation

{$R *.fmx}

end.
