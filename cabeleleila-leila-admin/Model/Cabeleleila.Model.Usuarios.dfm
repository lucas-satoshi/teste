object dmUsuarios: TdmUsuarios
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 600
  Width = 800
  object sqlUsuarios: TFDQuery
    Connection = dmConexao.SQLConexao
    Left = 237
    Top = 221
  end
end
