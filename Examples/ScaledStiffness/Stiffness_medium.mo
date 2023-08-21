within ScalableTranslationStatistics.Examples.ScaledStiffness;
model Stiffness_medium "Model with a medium system stiffness"
  extends
    ScalableTranslationStatistics.Examples.Test_ScaleTranslationStatistics(
      c_stiff=1.4e6, num_masses=20);
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end Stiffness_medium;
