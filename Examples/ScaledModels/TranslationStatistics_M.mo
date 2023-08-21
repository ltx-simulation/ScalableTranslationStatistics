within ScalableTranslationStatistics.Examples.ScaledModels;
model TranslationStatistics_M
  extends
    ScalableTranslationStatistics.Examples.Test_ScaleTranslationStatistics(
    num_NL_equation_systems=32,
    num_NL_equations=20,
    num_masses=50);
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TranslationStatistics_M;
