object dm_ProjetoFinal: Tdm_ProjetoFinal
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 288
  Width = 411
  object FDFinal: TFDConnection
    Params.Strings = (
      'Database=pedro_delphiii'
      'User_Name=root'
      'Password=root'
      'DriverID=MySQL')
    Left = 104
    Top = 48
  end
  object qrFinal: TFDQuery
    Connection = FDFinal
    Left = 200
    Top = 144
  end
  object FDTrFinal: TFDTransaction
    Connection = FDFinal
    Left = 264
    Top = 56
  end
  object Ibagensmainmenu: TImageList
    Left = 296
    Top = 160
  end
end
