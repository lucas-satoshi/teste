inherited frmServicos: TfrmServicos
  Caption = 'Servi'#231'os'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited CardPesquisa: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited pnlPesquisarBotoes: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited btnIncluir: TButton
        OnClick = btnIncluirClick
      end
      inherited btnAlterar: TButton
        OnClick = btnAlterarClick
      end
      inherited btnExcluir: TButton
        OnClick = btnExcluirClick
      end
    end
    inherited PnlPesquisa: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited Label1: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited edtPesquisar: TEdit
        Height = 23
        StyleElements = [seFont, seClient, seBorder]
        ExplicitHeight = 23
      end
      inherited btnPesquisar: TButton
        OnClick = btnPesquisarClick
        ExplicitLeft = 525
        ExplicitTop = 0
      end
    end
    inherited pnlGrid: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited DBGrid1: TDBGrid
        DataSource = DataSource1
        Columns = <
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = 'Servi'#231'o'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'duration'
            Title.Caption = 'Dura'#231#227'o'
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = dmConexao.sqlServicos
    Left = 521
    Top = 417
  end
end
