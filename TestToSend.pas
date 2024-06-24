unit TestToSend;

interface

uses
  Math;

type
  TProcNDS = 0..99;
  TRange = -2..0;

procedure CalcPrices(InputPriceWithNDS: double; ProcNDS: TProcNDS; out CorrectedPriceWithNDS, CorrectedPriceWithoutNDS: double);
function PriceRound(PriceToRound: Double; Range: TRange): Double;

implementation

procedure CalcPrices(InputPriceWithNDS: double; ProcNDS: TProcNDS; out CorrectedPriceWithNDS, CorrectedPriceWithoutNDS: double);
var
  InputPriceWithoutNDS, Rate: Double;
begin
//  ���� �������:
//  [���� � ���] = [���� ��� ���] * (1 + [������� ���] / 100)
//  ��� ������� �����
//  CorrectedPriceWithNDS = CorrectedPriceWithoutNDS * (1 + ProcNDS / 100)

//  ������� ��������� ���������:
//  1. ������� ������� ������������ � �������� ��� ��������������� ���� � ��� - InputPriceWithNDS,
//  ���������� �� 20 ������ ����� ��������
//  2. ������� ���  -  ProcNDS : 0..99

//  ������: ��������� ������ ���������� �������� ��� � ��� � ��� ��� (CorrectedPriceWithNDS,
//  CorrectedPriceWithoutNDS) ���, ����� CorrectedPriceWithNDS ���� ��������� ������
//  � InputPriceWithNDS: |CorrectedPriceWithNDS-InputPriceWithNDS| -> min ...  � ��� ����
//  CorrectedPriceWithNDS � CorrectedPriceWithoutNDS ��������� �������� 2 ����� �����
//  ������� � �� ��������� ����������.

//  �������� -
//  CalcPrices(1.81, 20, CorrectedPriceWithNDS, CorrectedPriceWithoutNDS)
//  ������ ������� -
//  CorrectedPriceWithNDS     = 1.8
//  CorrectedPriceWithoutNDS  = 1.5
//
//  CalcPrices(1.81, 18, CorrectedPriceWithNDS, CorrectedPriceWithoutNDS)
//  ������ ������� -
//  CorrectedPriceWithNDS     = 1.77
//  CorrectedPriceWithoutNDS  = 1.5
//  CalcPrices(5.05 27, CorrectedPriceWithNDS, CorrectedPriceWithoutNDS)
//  ������ ������� -
//  CorrectedPriceWithNDS     = 5.08
//  CorrectedPriceWithoutNDS  = 4
//  3. ������� ��������� ��� �������� ������������ ������ �������.
  Rate := 1+ProcNDS/100;
  InputPriceWithoutNDS := InputPriceWithNDS / Rate;
  CorrectedPriceWithoutNDS := PriceRound(InputPriceWithoutNDS, -2);
  CorrectedPriceWithNDS := SimpleRoundTo(CorrectedPriceWithoutNDS * Rate, -2);
end;

function PriceRound(PriceToRound: Double; Range: TRange): Double;
var
  IntPrice: Int64;
begin
// ���� � ��������� ����� �� ������� ������, �� ����� �� ��������� ���������� -
// ��� ����� ����� � ������� � ������� ����� ����� ��������������� ���������� �������� 5 (��������, 1.55; 2.5),
// �, ��������, ����� 1.56 (���� ��� ��� �� ������� ����) ������� ���������� �� 1.6, ����� �� 2
// � ����� ������� CorrectedPriceWithNDS ��� �� ����� ��������� ������ � InputPriceWithNDS,
// �� ��������� � ������� ����������� �� 2 ������

//������� ����������, ������� ������ ���������� ��������� ���������� ����������,
//�.�. ������� 5 � ������� �����. ���������� �� ����������
  while Range < 0 do
    begin
      PriceToRound := SimpleRoundTo(PriceToRound, Range);
      IntPrice :=  Trunc(PriceToRound * IntPower(10, Abs(Range)));
      if ((IntPrice mod 10) = 5) then
        Break;
      Range := Range + 1;
    end;
  PriceToRound := SimpleRoundTo(PriceToRound, Range);
  Result := PriceToRound;
end;

end.

