object frmTemplateCadastro: TfrmTemplateCadastro
  Left = 0
  Top = 0
  Caption = 'Template Cadastro'
  ClientHeight = 548
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object CardCadastro: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 548
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 481
      Width = 624
      Height = 67
      Align = alBottom
      TabOrder = 0
      object btnCancelar: TButton
        Left = 548
        Top = 1
        Width = 75
        Height = 65
        Align = alRight
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = btnCancelarClick
      end
      object btnSalvar: TButton
        Left = 473
        Top = 1
        Width = 75
        Height = 65
        Align = alRight
        Caption = 'Salvar'
        TabOrder = 1
      end
    end
  end
end
