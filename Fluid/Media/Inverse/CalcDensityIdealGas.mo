within ScalableTranslationStatistics.Fluid.Media.Inverse;
function CalcDensityIdealGas
  extends BaseDensityFunction;

protected
parameter Real M = 0.028964 "molar mass (dry air)";
parameter Real R = 8.314 "universal gas constant";
parameter Real T = 298.15 "fixed temperature ";

algorithm
  // ideal gas equation
  //density:=p/(M*R*T);
  p:= density*(M*R*T);
annotation(inverse(p=Media.CalcDensityIdealGas(density)));
end CalcDensityIdealGas;