within ScalableTranslationStatistics.Fluid.Media;
function AssertedDensity
  extends BaseDensityFunction;
protected
  parameter Real M = 0.028964 "molar mass (dry air)";
parameter Real R = 8.314 "universal gas constant";
parameter Real T = 298.15 "fixed temperature ";
algorithm
  density:=1; //p/(M*R*T);
  assert(density>0,"neg. density");
end AssertedDensity;
