within ScalableTranslationStatistics.Model;
model STS_Friction "ScaleTranslationStatistics with restricted sliding mass"
  extends ScaleTranslationStatistics(
    redeclare Components.Assembled.NonLinearSpringChain springChain(
      each c_1=c,
      each c_2=c,
      each s_start=s_initial,
      num_springs=NL_equations,
      insert_Jacobian=include_Jacobi[:]),
    redeclare
      Modelica.Mechanics.Translational.Components.MassWithStopAndFriction mass[
      num_masses - 1](
      each m=m,
      s(start=s_initial*linspace(
            1,
            num_masses - 1,
            num_masses - 1)),
      each v(start=1),
      each L=0,
      smax=s_initial*linspace(
          1,
          num_masses - 1,
          num_masses - 1) + 0.5*linspace(
          1,
          1,
          num_masses - 1),
      smin=s_initial*linspace(
          1,
          num_masses - 1,
          num_masses - 1) - 0.5*linspace(
          1,
          1,
          num_masses - 1),
      each F_prop=10,
      each F_Coulomb=2,
      each F_Stribeck=0.5,
      each fexp=0.1),
    redeclare Components.Subcomponents.LinearSleepySpring stiffSleepySpring);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
        experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=500,
      Tolerance=1e-5,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
This is an extension of <a href=modelica://ScalableTranslationStatistics.Model.ScaleTranslationStatistics>ScaleTranslationStatistics</a>.<br>
In this model the &quot;normal&quot; masses are replaced by masses sliding on the ground with friction and have only restricted space to move 
(using the Model <a href=modelica://Modelica.Mechanics.Translational.Components.MassWithStopAndFriction> Modelica.Mechanics.Translational.Components.MassWithStopAndFriction</a>).
The masses stopping at the limits of their restricted movement space causing events in the model and is leading to higher model-complexity.
</html>"));
end STS_Friction;
