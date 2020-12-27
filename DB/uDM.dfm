object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 228
  Width = 291
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\Dokumente\Embarcadero\Studio\Projekte\Timer\DB\DbTim' +
        'ers.db'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 56
    Top = 40
  end
  object qryCreateTable: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'create table if not EXISTS Timers(ID integer PRIMARY KEY,'
      'Hours integer default 0,'
      'Minutes integer default 10,'
      'Seconds integer default 0,'
      'IsActive integer not null);')
    Left = 56
    Top = 96
  end
  object qryAddTimerItem: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'INSERT INTO Timers(Hours, Minutes, Seconds, IsActive)'
      'VALUES (:Hours, :Minutes, :Seconds, :IsActive)')
    Left = 56
    Top = 160
    ParamData = <
      item
        Name = 'HOURS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'MINUTES'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SECONDS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ISACTIVE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryDeleteItem: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'delete from Timers where Id (:Id)')
    Left = 136
    Top = 96
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
