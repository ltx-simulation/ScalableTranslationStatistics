within ScalableTranslationStatistics.Fluid.Examples.ScaledModels;
model TranslationStatistics_XS
  extends
    ScalableTranslationStatistics.Fluid.Examples.Test_ScaleTranslationStatistics
                                                                          (
    num_NL_equation_systems=8,
    num_NL_equations=5,
    num_volumes=10);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TranslationStatistics_XS;
