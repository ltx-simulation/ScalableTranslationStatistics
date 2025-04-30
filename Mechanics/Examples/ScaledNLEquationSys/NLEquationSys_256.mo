within ScalableTranslationStatistics.Mechanics.Examples.ScaledNLEquationSys;
model NLEquationSys_256 "256 nonlinear equation systems"
  extends
    ScalableTranslationStatistics.Mechanics.Examples.Test_ScaleTranslationStatistics
                                                                          (
      num_NL_equation_systems=256);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end NLEquationSys_256;
