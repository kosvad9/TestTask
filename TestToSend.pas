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
//  Есть правило:
//  [Цена с НДС] = [Цена без НДС] * (1 + [Процент НДС] / 100)
//  Или запишем иначе
//  CorrectedPriceWithNDS = CorrectedPriceWithoutNDS * (1 + ProcNDS / 100)

//  Входные параметры процедуры:
//  1. Внешняя система рассчитывает и передает нам рекомендованную цену с НДС - InputPriceWithNDS,
//  содержащую до 20 знаков после зарпятой
//  2. Процент НДС  -  ProcNDS : 0..99

//  ЗАДАЧА: Процедура должна рассчитать значение цен с НДС и без НДС (CorrectedPriceWithNDS,
//  CorrectedPriceWithoutNDS) так, чтобы CorrectedPriceWithNDS была предельно близко
//  к InputPriceWithNDS: |CorrectedPriceWithNDS-InputPriceWithNDS| -> min ...  и при этом
//  CorrectedPriceWithNDS и CorrectedPriceWithoutNDS содержали максимум 2 знака после
//  запятой и не требовали округлений.

//  Например -
//  CalcPrices(1.81, 20, CorrectedPriceWithNDS, CorrectedPriceWithoutNDS)
//  должна вернуть -
//  CorrectedPriceWithNDS     = 1.8
//  CorrectedPriceWithoutNDS  = 1.5
//
//  CalcPrices(1.81, 18, CorrectedPriceWithNDS, CorrectedPriceWithoutNDS)
//  должна вернуть -
//  CorrectedPriceWithNDS     = 1.77
//  CorrectedPriceWithoutNDS  = 1.5
//  CalcPrices(5.05 27, CorrectedPriceWithNDS, CorrectedPriceWithoutNDS)
//  должна вернуть -
//  CorrectedPriceWithNDS     = 5.08
//  CorrectedPriceWithoutNDS  = 4
//  3. Сделать интерфейс для проверки корректности вашего решения.
  Rate := 1+ProcNDS/100;
  InputPriceWithoutNDS := InputPriceWithNDS / Rate;
  CorrectedPriceWithoutNDS := PriceRound(InputPriceWithoutNDS, -2);
  CorrectedPriceWithNDS := SimpleRoundTo(CorrectedPriceWithoutNDS * Rate, -2);
end;

function PriceRound(PriceToRound: Double; Range: TRange): Double;
var
  IntPrice: Int64;
begin
// если я правильно понял из условия задачи, то числа не требующие округления -
// это такие числа у которых в дробной части после математического округления остается 5 (например, 1.55; 2.5),
// а, например, число 1.56 (цена без ндс из входной цены) сначала округлится до 1.6, потом до 2
// и таким образом CorrectedPriceWithNDS уже не будет предельно близка к InputPriceWithNDS,
// по сравнению с обычным округлением до 2 знаков

//функция округления, которая помимо округления проверяет требование округления,
//т.е. наличия 5 в дробной части. Округление до ближайшего
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

