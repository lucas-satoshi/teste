inherited frmServicosCadastro: TfrmServicosCadastro
  Caption = 'Cadastro de Servi'#231'o'
  ClientHeight = 151
  ClientWidth = 280
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 296
  ExplicitHeight = 190
  TextHeight = 15
  inherited CardCadastro: TPanel
    Width = 280
    Height = 151
    StyleElements = [seFont, seClient, seBorder]
    object Label2: TLabel [0]
      Left = 15
      Top = 20
      Width = 38
      Height = 15
      Caption = 'Servi'#231'o'
    end
    object Label3: TLabel [1]
      Left = 15
      Top = 50
      Width = 44
      Height = 15
      Caption = 'Dura'#231#227'o'
    end
    inherited Panel1: TPanel
      Top = 84
      Width = 280
      StyleElements = [seFont, seClient, seBorder]
      inherited btnCancelar: TButton
        Left = 204
      end
      inherited btnSalvar: TButton
        OnClick = btnSalvarClick
        ExplicitLeft = 1
      end
    end
    object edtName: TEdit
      Left = 64
      Top = 20
      Width = 209
      Height = 23
      TabOrder = 1
    end
    object edtDuration: TEdit
      Left = 64
      Top = 47
      Width = 209
      Height = 23
      TabOrder = 2
    end
  end
end
