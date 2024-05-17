within ScalableTranslationStatistics.Fluid.Media;
function CalcDensityPhaseChange
  extends BaseDensityFunction;

protected
parameter Real M = 0.028964 "molar mass (dry air)";
parameter Real R = 8.314 "universal gas constant";
parameter Real T = 298.15 "fixed temperature ";

algorithm
if p<200000 then
  // ideal gas equation
  density:=p/(M*R*T);

else
  // not physical, immitates a sudden phase change
  density:= p^2/(M*R*T)^2;
end if;
end CalcDensityPhaseChange;
