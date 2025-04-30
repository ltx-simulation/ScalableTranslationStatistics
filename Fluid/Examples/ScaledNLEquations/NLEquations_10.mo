within ScalableTranslationStatistics.Fluid.Examples.ScaledNLEquations;
model NLEquations_10 "10 equations per equation system"
  extends
    ScalableTranslationStatistics.Fluid.Examples.Test_ScaleTranslationStatistics
                                                                          (
      num_NL_equations=10);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end NLEquations_10;
