within ScalableTranslationStatistics.Fluid.Examples.ScaledModels;
model TranslationStatistics_XXL
  extends
    ScalableTranslationStatistics.Fluid.Examples.Test_ScaleTranslationStatistics
                                                                          (
    num_NL_equation_systems=256,
    num_NL_equations=160,
    num_volumes=3000);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TranslationStatistics_XXL;
