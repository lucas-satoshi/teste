inherited frmRelatorioSemanal: TfrmRelatorioSemanal
  Caption = 'Relat'#243'rio Semanal'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited CardPesquisa: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited pnlPesquisarBotoes: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited btnIncluir: TButton
        Enabled = False
        Visible = False
      end
      inherited btnAlterar: TButton
        Enabled = False
        Visible = False
      end
      inherited btnExcluir: TButton
        Enabled = False
        Visible = False
      end
    end
    inherited PnlPesquisa: TPanel
      Enabled = False
      Visible = False
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
            FieldName = 'semana'
            Title.Caption = 'Semana'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'total_agendamentos'
            Title.Caption = 'Atendimentos'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'total_aguardando'
            Title.Caption = 'Aguardando'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'total_confirmado'
            Title.Caption = 'Confirmado'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'total_finalizado'
            Title.Caption = 'Finalizado'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'total_cancelado'
            Title.Caption = 'Cancelado'
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = dmConexao.sqlRelatorio
    Left = 521
    Top = 417
  end
end
