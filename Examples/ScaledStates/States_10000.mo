within ScalableTranslationStatistics.Examples.ScaledStates;
model States_10000 "10000 continuous time states"
  extends
    ScalableTranslationStatistics.Examples.Test_ScaleTranslationStatistics(
      num_masses=5000);
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end States_10000;
