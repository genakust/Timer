unit uUtills;

interface
uses
  System.Types;

type
  TMyUtills = class
  public
     class function IfThen<T>(aValue: boolean; aTrue: T; aFalse: T): T;
  end;

implementation

{ TMyUtills }

class function TMyUtills.IfThen<T>(aValue: boolean; aTrue, aFalse: T): T;
begin
  if aValue then
    Result:= aTrue
  else
    Result:= aFalse;
end;

end.
