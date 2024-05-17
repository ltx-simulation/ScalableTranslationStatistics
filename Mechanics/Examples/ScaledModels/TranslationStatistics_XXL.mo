within ScalableTranslationStatistics.Mechanics.Examples.ScaledModels;
model TranslationStatistics_XXL
  extends
    ScalableTranslationStatistics.Mechanics.Examples.Test_ScaleTranslationStatistics
                                                                          (
    num_NL_equation_systems=256,
    num_NL_equations=160,
    num_masses=1500);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TranslationStatistics_XXL;
