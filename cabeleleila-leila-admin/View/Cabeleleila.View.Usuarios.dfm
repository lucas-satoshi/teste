inherited frmUsuarios: TfrmUsuarios
  Caption = 'Usu'#225'rios'
  Position = poScreenCenter
  WindowState = wsMaximized
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited CardPesquisa: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited pnlPesquisarBotoes: TPanel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited PnlPesquisa: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited Label1: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited edtPesquisar: TEdit
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited btnPesquisar: TButton
        OnClick = btnPesquisarClick
      end
    end
    inherited pnlGrid: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited DBGrid1: TDBGrid
        DataSource = DataSource1
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'ID'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = 'Nome'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'username'
            Title.Caption = 'Usu'#225'rio'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Title.Caption = 'E-mail'
            Width = 300
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'phone'
            Title.Caption = 'Telefone'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'password'
            Title.Caption = 'Senha'
            Width = 200
            Visible = True
          end>
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = dmUsuarios.sqlUsuarios
    Left = 521
    Top = 417
  end
end
