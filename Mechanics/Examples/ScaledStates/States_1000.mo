within ScalableTranslationStatistics.Mechanics.Examples.ScaledStates;
model States_1000 "1000 continuous time states"
  extends
    ScalableTranslationStatistics.Mechanics.Examples.Test_ScaleTranslationStatistics
                                                                          (num_masses
      =500);
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end States_1000;
