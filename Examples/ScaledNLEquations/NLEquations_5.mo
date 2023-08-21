within ScalableTranslationStatistics.Examples.ScaledNLEquations;
model NLEquations_5 "5 equations per equation system"
  extends
    ScalableTranslationStatistics.Examples.Test_ScaleTranslationStatistics(
      num_NL_equations=5);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end NLEquations_5;
