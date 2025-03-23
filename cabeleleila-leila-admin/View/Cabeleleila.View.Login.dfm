object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login Cabeleleila Leila'
  ClientHeight = 441
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlEsquerda: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 441
    Align = alLeft
    BevelOuter = bvNone
    Color = clIndianred
    ParentBackground = False
    TabOrder = 0
  end
  object pnlPrincipal: TPanel
    Left = 185
    Top = 0
    Width = 641
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 641
      Height = 121
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 20
      Padding.Top = 30
      TabOrder = 0
      object lblNomeAplicacao: TLabel
        Left = 20
        Top = 63
        Width = 621
        Height = 23
        Align = alTop
        Caption = 'Preencha as informa'#231#245'es abaixo para entrar no sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 465
      end
      object Label1: TLabel
        Left = 20
        Top = 30
        Width = 621
        Height = 33
        Align = alTop
        Caption = 'Bem vindo ao Sistema Cabeleleila Administrador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clIndianred
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 570
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 121
      Width = 641
      Height = 320
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 60
      Padding.Right = 60
      TabOrder = 1
      object Panel3: TPanel
        Left = 60
        Top = 73
        Width = 521
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 521
          Height = 19
          Align = alTop
          Caption = 'Senha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 43
        end
        object edtSenha: TEdit
          Left = 0
          Top = 19
          Width = 521
          Height = 23
          Align = alTop
          PasswordChar = '*'
          TabOrder = 0
        end
      end
      object Panel4: TPanel
        Left = 60
        Top = 0
        Width = 521
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 521
          Height = 19
          Align = alTop
          Caption = 'Usu'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 54
        end
        object edtLogin: TEdit
          Left = 0
          Top = 19
          Width = 521
          Height = 23
          Align = alTop
          TabOrder = 0
        end
      end
      object btnEntrar: TButton
        Left = 60
        Top = 146
        Width = 521
        Height = 47
        Align = alTop
        Caption = 'Entrar'
        TabOrder = 2
        OnClick = btnEntrarClick
      end
    end
  end
end
