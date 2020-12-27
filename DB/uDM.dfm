object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 228
  Width = 291
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\Dokumente\Embarcadero\Studio\Projekte\Timer\DB\DbTim' +
        'ers'
      'DriverID=SQLite')
    Left = 56
    Top = 40
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 56
    Top = 96
  end
end
