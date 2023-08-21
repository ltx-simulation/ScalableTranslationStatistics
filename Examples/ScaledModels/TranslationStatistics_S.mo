within ScalableTranslationStatistics.Examples.ScaledModels;
model TranslationStatistics_S
  extends
    ScalableTranslationStatistics.Examples.Test_ScaleTranslationStatistics(
    num_NL_equation_systems=16,
    num_NL_equations=10,
    num_masses=15);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TranslationStatistics_S;
