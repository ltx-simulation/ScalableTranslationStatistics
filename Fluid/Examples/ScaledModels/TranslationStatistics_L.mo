within ScalableTranslationStatistics.Fluid.Examples.ScaledModels;
model TranslationStatistics_L
  extends
    ScalableTranslationStatistics.Fluid.Examples.Test_ScaleTranslationStatistics
                                                                          (
    num_NL_equation_systems=64,
    num_NL_equations=40,
    num_volumes=300);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TranslationStatistics_L;
