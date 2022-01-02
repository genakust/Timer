unit uTimerData;

interface

uses
  System.SysUtils, System.StrUtils;

type
  TTimerData = class
  private
    FMinutes: integer;
    FSeconds: integer;
  public
    constructor Create;
    destructor Destroy; override;

    function TimeAsString: string; overload;
    function TimeAsString(const AMinutes: integer; const ASeconds: integer): string; overload;
    function TotalSeconds: integer;

    property Minutes: integer read FMinutes write FMinutes;
    property Seconds: integer read FSeconds write FSeconds;
  end;

implementation

{ TTimerData }

constructor TTimerData.Create;
begin
  inherited;

  FMinutes := 1;
  FSeconds := 0;
end;

destructor TTimerData.Destroy;
begin

  inherited;
end;

function TTimerData.TimeAsString: string;
begin
  Result := TimeAsString(FMinutes, FSeconds);
end;

function TTimerData.TimeAsString(const AMinutes, ASeconds: integer): string;
var
  Min: string;
  Sec: string;
begin
  Min := IfThen((0 <= AMinutes) and (AMinutes <= 9),  '0' + AMinutes.ToString, AMinutes.ToString);
  Sec := IfThen((0 <= ASeconds) and (ASeconds <= 9),  '0' + ASeconds.ToString, ASeconds.ToString);
  Result := Format('%2s:%2s', [Min, Sec]);
end;

function TTimerData.TotalSeconds: integer;
begin
  Result := FMinutes * 60 + FSeconds;
end;

end.
