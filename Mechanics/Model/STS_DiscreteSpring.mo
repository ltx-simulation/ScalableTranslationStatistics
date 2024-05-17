within ScalableTranslationStatistics.Mechanics.Model;
model STS_DiscreteSpring
  "ScaleTranslationStatistics with discrete steps in spring stiffness"
  extends ScaleTranslationStatistics(
    redeclare Mechanics.Components.Assembled.NonLinearSpringChain springChain(
      each c_1=c,
      each c_2=c,
      each s_start=s_initial,
      num_springs=NL_equations,
      insert_Jacobian=include_Jacobi[:]),
    redeclare Modelica.Mechanics.Translational.Components.Mass mass[num_masses
       - 1](each m=m),
    redeclare
      ScalableTranslationStatistics.Mechanics.Components.Subcomponents.DiscreteSleepySpring
      stiffSleepySpring(scale_steps=0.1, stiffness_steps=10),
    stiffMass(v(start=1)),
    c_stiff=10);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
        experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=500,
      Tolerance=1e-5,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
This is an extension of <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Model.ScaleTranslationStatistics>\"ScaleTranslationStatistics</a>.<br>
In this model the linear &quot;sleepy&quot; spring in the small mass-spring system  is replaced by a spring with discrete stiffness steps.
When the stiffness changes, a reinitialization is necessary. This increases the model complexity.
</html>"));
end STS_DiscreteSpring;
