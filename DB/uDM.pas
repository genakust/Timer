unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.IOUtils;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qryCreateTable: TFDQuery;
    qryAddTimerItem: TFDQuery;
    qryDeleteItem: TFDQuery;
    qryGetItemsCount: TFDQuery;
    FDQuery1: TFDQuery;
    qrySelectAll: TFDQuery;
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    function GetItemsCount: integer;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.FDConnection1BeforeConnect(Sender: TObject);
begin
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  FDConnection1.Params.Values['Database'] :=
      TPath.Combine(TPath.GetDocumentsPath, 'shoplist.s3db');
  {$ENDIF}
end;

function TDataModule1.GetItemsCount: integer;
begin
  qryGetItemsCount.Active;
  try
    qryGetItemsCount.ExecSQL;
    Result:= qryGetItemsCount.RecordCount;
  finally
    qryGetItemsCount.Close;
  end;
end;

end.
