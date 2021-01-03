unit TestDM;
{

  Delphi DUnit-Testfall
  ----------------------
  Diese Unit enthält ein Skeleton einer Testfallklasse, das vom Experten für Testfälle erzeugt wurde.
  Ändern Sie den erzeugten Code so, dass er die Methoden korrekt einrichtet und aus der 
  getesteten Unit aufruft.

}

interface

uses
  TestFramework, FireDAC.Stan.Option, FireDAC.Stan.Async, FireDAC.FMXUI.Wait,
  FireDAC.DatS, FireDAC.Stan.Error, Data.DB, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  System.SysUtils, System.IOUtils, FireDAC.DApt, FireDAC.Stan.Intf,
  FireDAC.Comp.DataSet, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLite, FireDAC.Phys,
  FireDAC.Phys.SQLiteDef, FireDAC.DApt.Intf, FireDAC.Stan.Param, uDM,
  FireDAC.Stan.Pool, FireDAC.UI.Intf, FireDAC.Comp.Client, System.Classes;

type
  // Testmethoden für Klasse TDataModule1

  TestTDataModule1 = class(TTestCase)
  strict private
    FDataModule1: TDataModule1;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestFDConnection1BeforeConnect;
    procedure TestGetItemsCount;
  end;

implementation

procedure TestTDataModule1.SetUp;
begin
  FDataModule1 := TDataModule1.Create(nil);
end;

procedure TestTDataModule1.TearDown;
begin
  FDataModule1.Free;
  FDataModule1 := nil;
end;

procedure TestTDataModule1.TestFDConnection1BeforeConnect;
var
  Sender: TObject;
begin
  // TODO: Methodenaufrufparameter einrichten
  FDataModule1.FDConnection1BeforeConnect(Sender);
  // TODO: Methodenergebnisse prüfen
end;

procedure TestTDataModule1.TestGetItemsCount;
var
  ReturnValue: Integer;
begin
  ReturnValue := FDataModule1.GetItemsCount;
  // TODO: Methodenergebnisse prüfen
  CheckEquals(0,ReturnValue, 'Bad value should be equal');
end;

initialization
  // Alle Testfälle beim Testprogramm registrieren
  RegisterTest(TestTDataModule1.Suite);
end.

