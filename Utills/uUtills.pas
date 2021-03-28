unit uUtills;

interface

uses
  System.Types, System.Classes;

type
  TMyUtills = class
  public
    class function IfThen<T>(aValue: boolean; aTrue: T; aFalse: T): T;
    class function IndexOfText(const aList: TStrings; aString: string): integer;
  end;

implementation

{ TMyUtills }

class function TMyUtills.IfThen<T>(aValue: boolean; aTrue, aFalse: T): T;
begin
  if aValue then
    Result := aTrue
  else
    Result := aFalse;
end;

class function TMyUtills.IndexOfText(const aList: TStrings;
  aString: string): integer;
var
  i: integer;
begin
 Result := -1;
  for i := 0 to aList.Count-1 do
  begin
    if aList[i] = aString then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

end.
