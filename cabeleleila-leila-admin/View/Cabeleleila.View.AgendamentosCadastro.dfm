inherited frmAgendamentosCadastro: TfrmAgendamentosCadastro
  Caption = 'Cadastro de Agendamento'
  ClientHeight = 241
  ClientWidth = 285
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 301
  ExplicitHeight = 280
  TextHeight = 15
  inherited CardCadastro: TPanel
    Width = 285
    Height = 241
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 285
    ExplicitHeight = 241
    object Label2: TLabel [0]
      Left = 15
      Top = 20
      Width = 37
      Height = 15
      Caption = 'Cliente'
    end
    object Label3: TLabel [1]
      Left = 15
      Top = 50
      Width = 43
      Height = 15
      Caption = 'Servi'#231'os'
    end
    object Label4: TLabel [2]
      Left = 15
      Top = 77
      Width = 24
      Height = 15
      Caption = 'Data'
    end
    object Label1: TLabel [3]
      Left = 15
      Top = 104
      Width = 40
      Height = 15
      Caption = 'Hor'#225'rio'
    end
    inherited Panel1: TPanel
      Top = 174
      Width = 285
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 174
      ExplicitWidth = 285
      inherited btnCancelar: TButton
        Left = 209
        ExplicitLeft = 209
      end
      inherited btnSalvar: TButton
        OnClick = btnSalvarClick
        ExplicitLeft = 1
      end
    end
    object edtServices: TEdit
      Left = 64
      Top = 47
      Width = 209
      Height = 23
      TabOrder = 1
    end
    object edtNome: TEdit
      Left = 64
      Top = 20
      Width = 209
      Height = 23
      Enabled = False
      TabOrder = 2
    end
    object edtDate: TDateEdit
      Left = 64
      Top = 76
      Width = 209
      Height = 23
      NumGlyphs = 2
      TabOrder = 3
    end
    object rgStatus: TRadioGroup
      Left = 15
      Top = 125
      Width = 258
      Height = 44
      Caption = 'Status'
      Columns = 3
      Items.Strings = (
        'confirmado'
        'cancelado'
        'finalizado')
      TabOrder = 4
    end
    object edtTime: TDateTimePicker
      Left = 64
      Top = 105
      Width = 209
      Height = 21
      Date = 44286.000000000000000000
      Time = 44286.000000000000000000
      Kind = dtkTime
      TabOrder = 5
    end
  end
end
