object frmTemplatePadrao: TfrmTemplatePadrao
  Left = 0
  Top = 0
  Caption = 'Template Padr'#227'o'
  ClientHeight = 548
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object CardPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 548
    Align = alClient
    TabOrder = 0
    object pnlPesquisarBotoes: TPanel
      Left = 1
      Top = 480
      Width = 622
      Height = 67
      Align = alBottom
      TabOrder = 0
      object btnFechar: TButton
        Left = 546
        Top = 1
        Width = 75
        Height = 65
        Align = alRight
        Caption = 'Fechar'
        TabOrder = 0
        OnClick = btnFecharClick
      end
      object btnIncluir: TButton
        Left = 1
        Top = 1
        Width = 75
        Height = 65
        Align = alLeft
        Caption = 'Incluir'
        TabOrder = 1
      end
      object btnAlterar: TButton
        Left = 76
        Top = 1
        Width = 75
        Height = 65
        Align = alLeft
        Caption = 'Alterar'
        TabOrder = 2
      end
      object btnExcluir: TButton
        Left = 151
        Top = 1
        Width = 75
        Height = 65
        Align = alLeft
        Caption = 'Excluir'
        TabOrder = 3
      end
    end
    object PnlPesquisa: TPanel
      Left = 1
      Top = 1
      Width = 622
      Height = 56
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 1
        Top = 0
        Width = 50
        Height = 15
        Caption = 'Pesquisar'
      end
      object edtPesquisar: TEdit
        Left = 0
        Top = 21
        Width = 280
        Height = 20
        TabOrder = 0
      end
      object btnPesquisar: TButton
        Left = 525
        Top = 0
        Width = 97
        Height = 56
        Align = alRight
        Caption = 'Pesquisar'
        TabOrder = 1
        ExplicitLeft = 368
        ExplicitTop = 1
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 57
      Width = 622
      Height = 423
      Align = alClient
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 620
        Height = 421
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
  end
end
