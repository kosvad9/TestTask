object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 332
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lbl1: TLabel
    Left = 8
    Top = 35
    Width = 176
    Height = 25
    Caption = #1042#1093#1086#1076#1085#1072#1103' '#1094#1077#1085#1072' '#1089' '#1053#1044#1057
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 8
    Top = 83
    Width = 38
    Height = 25
    Caption = #1053#1044#1057
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object edt1: TEdit
    Left = 190
    Top = 32
    Width = 155
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edt1KeyPress
  end
  object edt2: TEdit
    Left = 190
    Top = 80
    Width = 155
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = edt2KeyPress
  end
  object grp1: TGroupBox
    Left = 8
    Top = 136
    Width = 337
    Height = 113
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
    TabOrder = 2
    object lbl11: TLabel
      Left = 16
      Top = 27
      Width = 102
      Height = 25
      Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbl21: TLabel
      Left = 16
      Top = 67
      Width = 122
      Height = 25
      Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edt11: TEdit
      Left = 164
      Top = 25
      Width = 155
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edt21: TEdit
      Left = 164
      Top = 64
      Width = 155
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object btn1: TButton
    Left = 104
    Top = 280
    Width = 153
    Height = 44
    Caption = #1056#1072#1089#1095#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btn1Click
  end
end
