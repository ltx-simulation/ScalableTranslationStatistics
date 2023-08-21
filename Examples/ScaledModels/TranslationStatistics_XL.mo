within ScalableTranslationStatistics.Examples.ScaledModels;
model TranslationStatistics_XL
  extends
    ScalableTranslationStatistics.Examples.Test_ScaleTranslationStatistics(
    num_NL_equation_systems=128,
    num_NL_equations=80,
    num_masses=500);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TranslationStatistics_XL;
