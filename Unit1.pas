unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TestToSend;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    edt2: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    grp1: TGroupBox;
    lbl11: TLabel;
    edt11: TEdit;
    lbl21: TLabel;
    edt21: TEdit;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure keyFilter(var Key: Char);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  CorrectedPriceWithNDS, CorrectedPriceWithoutNDS: double;
begin
try
  CalcPrices(Double.Parse(edt1.Text), Integer.Parse(edt2.Text), CorrectedPriceWithNDS, CorrectedPriceWithoutNDS);
  edt11.Text := CorrectedPriceWithNDS.ToString;
  edt21.Text := CorrectedPriceWithoutNDS.ToString;
except
  ShowMessage('Ошибка рассчета');
end;
end;

procedure TForm1.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  keyFilter(Key);
end;

procedure TForm1.edt2KeyPress(Sender: TObject; var Key: Char);
begin
  keyFilter(Key);
end;

procedure TForm1.keyFilter(var Key: Char);
begin
  case Key of
    '0'..'9', #8, ',':;
  else
    Key := Char(0);
  end;
end;

end.
