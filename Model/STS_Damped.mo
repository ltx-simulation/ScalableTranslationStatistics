within ScalableTranslationStatistics.Model;
model STS_Damped
  "ScaleTranslationStatistics with damped mass-spring oscillators"
  extends ScaleTranslationStatistics(
    redeclare Components.Assembled.DampedSpringChain springChain(
      each c_1=c,
      each c_2=c,
      each d=d,
      each s_start=s_initial,
      num_springs=NL_equations,
      insert_Jacobian=include_Jacobi[:]),
    redeclare Modelica.Mechanics.Translational.Components.Mass mass[num_masses
       - 1](each m=m),
    stiffMass(v(start=1), s(start=1)),
    redeclare Components.Subcomponents.LinearSleepySpring stiffSleepySpring);
    parameter Modelica.Units.SI.TranslationalDampingConstant d(final min=0, start=0)=5 "Damping constant of the damper parallel to spring chain";
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
        experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=500,
      Tolerance=1e-5,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
This is an extension of <a href=modelica://ScalableTranslationStatistics.Model.ScaleTranslationStatistics>ScaleTranslationStatistics</a>.<br>
In this model there are dampers parallel to the nonlinear spring chains. Hence, the model will reach a steady state, if the input signals are constant.
</html>"));
end STS_Damped;
