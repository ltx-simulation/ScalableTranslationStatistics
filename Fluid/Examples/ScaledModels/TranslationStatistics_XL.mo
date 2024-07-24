within ScalableTranslationStatistics.Fluid.Examples.ScaledModels;
model TranslationStatistics_XL
  extends
    ScalableTranslationStatistics.Fluid.Examples.Test_ScaleTranslationStatistics
                                                                          (
    num_NL_equation_systems=128,
    num_NL_equations=80,
    num_volumes=1000);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TranslationStatistics_XL;
