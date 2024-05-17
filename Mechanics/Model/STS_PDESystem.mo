within ScalableTranslationStatistics.Mechanics.Model;
model STS_PDESystem
  "ScaleTranslationStatistics with restricted sliding mass"

  extends ScaleTranslationStatistics(
    NL_equations={5,4,6,8,3,10,6,7,7},
    num_Jacobian=8,
    redeclare Mechanics.Components.Assembled.NonLinear2DSpringChain springChain(
      each c_1=c,
      each c_2=c,
      num_springs=NL_equations,
      insert_Jacobian=include_Jacobi[:]),
    redeclare Mechanics.Components.Subcomponents.LinearSleepySpring
      stiffSleepySpring);

      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
        experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=500,
      Tolerance=1e-5,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
This is an extension of <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Model.ScaleTranslationStatistics>\"ScaleTranslationStatistics</a>.<br>
In this model the &quot;normal&quot; masses are replaced by masses sliding on the ground with friction and have only restricted space to move 
(using the Model <a href=modelica://Modelica.Mechanics.Translational.Components.MassWithStopAndFriction> Modelica.Mechanics.Translational.Components.MassWithStopAndFriction</a>).
The masses stopping at the limits of their restricted movement space causing events in the model and is leading to higher model-complexity.
</html>"));
end STS_PDESystem;
