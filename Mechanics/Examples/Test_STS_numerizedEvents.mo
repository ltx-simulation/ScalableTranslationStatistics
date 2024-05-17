within ScalableTranslationStatistics.Mechanics.Examples;
model Test_STS_numerizedEvents
  parameter Integer Nin=8;
  parameter Integer Nout=8;
  parameter Integer num_NL_equations=5;
  parameter Integer num_NL_equation_systems=8;
  parameter Integer num_masses=50;
  parameter Integer numStateEvents = 5 "number of state events per second";
  parameter Integer numModelTimeEvents = 20 "number of model time events per second";
  parameter Modelica.Units.SI.TranslationalSpringConstant c_stiff = 1e6;
  extends Modelica.Icons.Example;
  Mechanics.Model.STS_numerizeEvents scalableModelicaModel(
    c=100,
    c_stiff=c_stiff,
    NL_equations=num_NL_equations*ones(num_NL_equation_systems),
    num_masses=num_masses,
    NumEvents=numStateEvents)
    annotation (Placement(transformation(extent={{-34,-36},{32,36}})));
  Modelica.Blocks.Interfaces.RealOutput outputs[Nout] "position signal outputs" annotation (Placement(transformation(extent={{96,-10},
            {116,10}})));

  Mechanics.Components.Subcomponents.InputSignals inputSignals
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}})));
equation

  connect(inputSignals.outputs[1:min(Nin, 10)], scalableModelicaModel.inputs[1:
    min(Nin, 10)]) annotation (Line(points={{-65.4,0},{-35.98,0}},
        color={0,0,127}));
  connect(scalableModelicaModel.outputs, outputs)
    annotation (Line(points={{33.98,0},{106,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
This model <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Model.STS_numerizeEvents>\"numerizeEvents</a>  is fed with arbitrarily defined input signals. Parametrizable number of events per second simulation time; realized by turning on and off to apply a force on the single mass in the small system</li>
</html>"));
end Test_STS_numerizedEvents;
