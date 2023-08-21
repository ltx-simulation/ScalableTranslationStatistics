within ScalableTranslationStatistics.Examples.ScaledModels;
model TranslationStatistics_XS
  extends
    ScalableTranslationStatistics.Examples.Test_ScaleTranslationStatistics(
    num_NL_equation_systems=8,
    num_NL_equations=5,
    num_masses=5);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TranslationStatistics_XS;
