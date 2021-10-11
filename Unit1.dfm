object Form1: TForm1
  Left = 263
  Top = 133
  BorderStyle = bsNone
  Caption = '3DShape'
  ClientHeight = 317
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 120
  TextHeight = 16
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 145
    Height = 137
    Visible = False
  end
  object Timer1: TTimer
    Interval = 15
    OnTimer = Timer1Timer
    Left = 112
    Top = 16
  end
end
