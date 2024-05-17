within ScalableTranslationStatistics.Mechanics.Examples.ScaledSparsity;
model MediumDense "medium density matrix"
  extends
    ScalableTranslationStatistics.Mechanics.Examples.Test_ScaleTranslationStatistics
                                                                          (
      scalableModelicaModel(
      c=100,
      num_masses=21,
      NL_equations=3*ones(99)));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end MediumDense;
