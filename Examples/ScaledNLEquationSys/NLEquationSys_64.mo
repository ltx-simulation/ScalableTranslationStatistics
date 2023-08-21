within ScalableTranslationStatistics.Examples.ScaledNLEquationSys;
model NLEquationSys_64 "64 nonlinear equation systems"
  extends
    ScalableTranslationStatistics.Examples.Test_ScaleTranslationStatistics(
      num_NL_equation_systems=64);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end NLEquationSys_64;
