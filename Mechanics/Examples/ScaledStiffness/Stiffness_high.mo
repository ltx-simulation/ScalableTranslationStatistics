within ScalableTranslationStatistics.Mechanics.Examples.ScaledStiffness;
model Stiffness_high "Model with a high system stiffness"
  extends
    ScalableTranslationStatistics.Mechanics.Examples.Test_ScaleTranslationStatistics
                                                                          (c_stiff=
        1e8, num_masses=20);
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end Stiffness_high;
