object frmEscolherCliente: TfrmEscolherCliente
  Left = 0
  Top = 0
  Caption = 'Escolher cliente'
  ClientHeight = 282
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 321
    Height = 257
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Cliente'
        Width = 300
        Visible = True
      end>
  end
  object btnEscolher: TButton
    Left = 0
    Top = 257
    Width = 321
    Height = 25
    Align = alBottom
    Caption = 'Selecionar este cliente'
    TabOrder = 1
    OnClick = btnEscolherClick
  end
  object DataSource1: TDataSource
    DataSet = dmUsuarios.sqlUsuarios
    Left = 245
    Top = 190
  end
end
