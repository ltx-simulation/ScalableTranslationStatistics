within ScalableTranslationStatistics.Mechanics.Examples.ScaledNLEquations;
model NLEquations_160 "160 equations per equation system"
  extends
    ScalableTranslationStatistics.Mechanics.Examples.Test_ScaleTranslationStatistics
                                                                          (
      num_NL_equations=160);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end NLEquations_160;
