within ScalableTranslationStatistics.Mechanics.Model;
model STS_numerizeEvents
  "ScaleTranslationStatistics with parametrizable number of state events"
  extends ScaleTranslationStatistics(
    redeclare Mechanics.Components.Assembled.NonLinearSpringChain springChain(
      each c_1=c,
      each c_2=c,
      each s_start=s_initial,
      num_springs=NL_equations,
      insert_Jacobian=include_Jacobi[:]),
    redeclare Modelica.Mechanics.Translational.Components.Mass mass[num_masses
       - 1](each m=m),
    redeclare Mechanics.Components.Subcomponents.LinearSleepySpring
      stiffSleepySpring(compiler_type=compilerType, waiting_time=sleeping_time));

  parameter Integer NumEvents= 100 "number of state events per second";
  Modelica.Mechanics.Translational.Sources.Force singleForce "force on the single mass" annotation (Placement(transformation(extent={{38,-40},
            {56,-22}})));
  Modelica.Blocks.Sources.RealExpression forceSignal( y= if sin(time*Modelica.Constants.pi*NumEvents)>0 then 10 else 0) "force signal for singleForce"
  annotation (Placement(transformation(extent={{-12,-44},{16,-20}})));
equation
  connect(forceSignal.y, singleForce.f) annotation (Line(points={{17.4,-32},{17.4,
          -31},{36.2,-31}}, color={0,0,127}));
  connect(singleForce.flange, stiffMass.flange_b) annotation (Line(points={{56,-31},
          {62,-31},{62,-62},{58,-62}}, color={0,127,0}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
        experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=500,
      Tolerance=1e-5,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
This is an extension of <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Model.ScaleTranslationStatistics>\"ScaleTranslationStatistics</a>.<br>
In this model pulsative forces are applied of the mass in the small mass spring system (stiffMass). <br>
This causes each time an event, when the force is put on of off. Thus, the number of events can be defined by the frequency of the pulsative force.<br>
The additional parameter &quot;<b><i>numEvents</i></b>&quot; defines the number of Events per second simulation time.
</html>"));
end STS_numerizeEvents;
