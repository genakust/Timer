unit uTimerModel;

interface

uses
  uUtills;

type
  TTimerModel = class
  private
    FHours: integer;
    FMinutes: integer;
    FSeconds: integer;
    FIsActive: boolean;
    function GetHours: integer;
    function GetMinutes: integer;
    procedure SetHours(const Value: integer);
    procedure SetMinutes(const Value: integer);
    function GetSeconds: integer;
    procedure SetSeconds(const Value: integer);
    function GetIsActive: boolean;
    procedure SetIsActive(const Value: boolean);
  public
    constructor Create(aHours, aMinutes, aSeconds, aIsActive: integer);
    destructor Destroy; override;
    {Properties}
    property Hours: integer read GetHours write SetHours;
    property Minutes: integer read GetMinutes write SetMinutes;
    property Seconds: integer read GetSeconds write SetSeconds;
    property IsActive: boolean read GetIsActive write SetIsActive;
  end;
implementation

{ TTimerModel }

constructor TTimerModel.Create(aHours, aMinutes, aSeconds, aIsActive: integer);
begin
  SetHours(aHours);
  SetMinutes(aMinutes);
  SetSeconds(aSeconds);
  if aIsActive >= 1 then
    SetIsActive(true)
  else
    SetIsActive(false);
end;

destructor TTimerModel.Destroy;
begin

  inherited;
end;

function TTimerModel.GetHours: integer;
begin
  Result:= FHours;
end;

function TTimerModel.GetIsActive: boolean;
begin
  Result:= FIsActive;
end;

function TTimerModel.GetMinutes: integer;
begin
  Result:= FMinutes;
end;

function TTimerModel.GetSeconds: integer;
begin
  Result:= FSeconds;
end;

procedure TTimerModel.SetHours(const Value: integer);
begin
  FHours:= Value;
end;

procedure TTimerModel.SetIsActive(const Value: boolean);
begin
  FIsActive:= Value;
end;

procedure TTimerModel.SetMinutes(const Value: integer);
begin
  FMinutes:= Value;
end;

procedure TTimerModel.SetSeconds(const Value: integer);
begin
  FSeconds:= Value;
end;

end.
