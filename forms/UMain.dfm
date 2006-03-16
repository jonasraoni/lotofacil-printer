object frmMain: TfrmMain
  Left = 0
  Top = 0
  ActiveControl = btnFind
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Impressor de Canhotos'
  ClientHeight = 214
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 173
    Width = 287
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnPrint: TBitBtn
      Left = 192
      Top = 8
      Width = 83
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = btnPrintClick
      Glyph.Data = {
        36010000424D3601000000000000760000002800000012000000100000000100
        040000000000C000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888000000888000000000008888C24C6A880888888888080888F03AAF8000
        00000000008088001000808888888888800088FFFFFF80888888899980808888
        8888800000000000008808000000808888888888080808000000880000000000
        8080080000008880FFFFFFFF08080800000088880F00000F0000880000008888
        0FFFFFFFF08888000000888880F00000F08888000000888880FFFFFFFF088877
        7766888888000000000888190910888888888888888888F865F0}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 287
    Height = 41
    Align = alTop
    Color = clWhite
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 151
      Height = 16
      Caption = 'Impressor de Canhotos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 287
    Height = 132
    Align = alClient
    TabOrder = 2
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 201
      Height = 13
      Caption = 'Caminho do arquivo contendo os n'#250'meros'
    end
    object Label1: TLabel
      Left = 24
      Top = 72
      Width = 63
      Height = 13
      Caption = 'Margem topo'
    end
    object Label4: TLabel
      Left = 152
      Top = 72
      Width = 86
      Height = 13
      Caption = 'Margem esquerda'
    end
    object Label5: TLabel
      Left = 256
      Top = 88
      Width = 17
      Height = 21
      AutoSize = False
      Caption = 'cm'
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 128
      Top = 88
      Width = 13
      Height = 21
      AutoSize = False
      Caption = 'cm'
      Layout = tlCenter
    end
    object ePath: TEdit
      Left = 24
      Top = 40
      Width = 217
      Height = 21
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 1
      Text = 'a.txt'
    end
    object btnFind: TBitBtn
      Left = 240
      Top = 40
      Width = 25
      Height = 21
      Default = True
      TabOrder = 0
      OnClick = btnFindClick
      Glyph.Data = {
        66030000424D6603000000000000360000002800000010000000110000000100
        18000000000030030000C30E0000C30E00000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
        00000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBF000000000000000000BFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000000000000000
        00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F0000000000000000007F
        7F7FBFBFBF00FFFF7F7F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        0000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00000000000000FFFFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBF0000007F7F7FFFFFFFBFBFBFFFFFFFBFBFBFFF
        FFFF7F7F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F
        FFFFFFBFBFBFFFFFFF0000FFFFFFFFBFBFBFFFFFFF7F7F7F7F7F7FBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBF0000007F7F7FBFBFBFFFFFFFBFBFBF0000FFBFBFBFFF
        FFFFBFBFBF7F7F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000007F7F7F
        FFFFFF0000FF0000FF0000FF0000FF0000FFFFFFFF7F7F7F000000BFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBF0000007F7F7FBFBFBFFFFFFFBFBFBF0000FFBFBFBFFF
        FFFFBFBFBF7F7F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F
        FFFFFFBFBFBFFFFFFF0000FFFFFFFFBFBFBFFFFFFF7F7F7F7F7F7FBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBF0000007F7F7FFFFFFFBFBFBFFFFFFFBFBFBFFF
        FFFF7F7F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        0000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000BFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F0000000000000000007F
        7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBF}
    end
    object eTop: TEdit
      Left = 24
      Top = 88
      Width = 97
      Height = 21
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 2
      Text = '0.4'
      OnExit = eTopExit
    end
    object eLeft: TEdit
      Left = 152
      Top = 88
      Width = 97
      Height = 21
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 3
      Text = '0.25'
      OnExit = eTopExit
    end
  end
  object XPManifest1: TXPManifest
    Left = 240
    Top = 48
  end
end
