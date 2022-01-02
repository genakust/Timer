unit uCommonTools;

interface

///<summary>Function for scaling a value </summary>
///<param name="In_Value">Value to scale (actual timer vale)</param>
///<returns>Scaled value </returns>
function Scale(
  In_Value,
  In_Low,
  In_Hi,
  Out_Low,
  Out_Hi : double) : double;

implementation

function Scale(
  In_Value,
  In_Low,
  In_Hi,
  Out_Low,
  Out_Hi : double) : double;
begin
  Result := ((Out_HI - Out_LOW) / (In_HI - in_LOW)) * (In_Value - in_LOW) + Out_LOW ;
end;

end.
