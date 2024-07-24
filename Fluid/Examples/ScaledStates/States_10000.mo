within ScalableTranslationStatistics.Fluid.Examples.ScaledStates;
model States_10000 "10000 continuous time states"
  extends
    ScalableTranslationStatistics.Fluid.Examples.Test_ScaleTranslationStatistics
                                                                          (num_volumes
      =10000);
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end States_10000;
