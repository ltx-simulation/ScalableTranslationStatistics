within ScalableTranslationStatistics.Examples.ScaledStates;
model States_300 "300 continuous time states"
  extends
    ScalableTranslationStatistics.Examples.Test_ScaleTranslationStatistics(
      num_masses=150);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end States_300;
