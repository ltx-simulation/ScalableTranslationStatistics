within ScalableTranslationStatistics.Fluid.Examples.ScaledStates;
model States_100 "100 continuous time states"
  extends
    ScalableTranslationStatistics.Fluid.Examples.Test_ScaleTranslationStatistics
                                                                          (num_volumes
      =100);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end States_100;
