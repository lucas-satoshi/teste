object dmConexao: TdmConexao
  OnCreate = DataModuleCreate
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object SQLConexao: TFDConnection
    LoginPrompt = False
    Left = 168
    Top = 153
  end
  object sqlAgendamentos: TFDQuery
    Connection = SQLConexao
    Left = 312
    Top = 152
  end
  object sqlServicos: TFDQuery
    Connection = SQLConexao
    Left = 459
    Top = 152
  end
  object sqlRelatorio: TFDQuery
    Connection = SQLConexao
    Left = 307
    Top = 264
  end
end
