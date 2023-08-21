within ScalableTranslationStatistics.Examples;
model Test_STS_ControlledDelay
  parameter Integer Nin=8;
  parameter Integer Nout=Nin;
  parameter Integer num_NL_equations=5;
  parameter Integer num_NL_equation_systems=8;
  parameter Integer num_masses=50;
  parameter Modelica.Units.SI.TranslationalSpringConstant c_stiff = 1e6;
  extends Modelica.Icons.Example;
  Model.ScaleTranslationStatistics scalableModelicaModel(
    c=100,
    c_stiff=c_stiff,
    NL_equations=num_NL_equations*ones(num_NL_equation_systems),
    num_masses=num_masses)
    annotation (Placement(transformation(extent={{-14,4},{72,102}})));
  Modelica.Blocks.Interfaces.RealOutput outputs[Nout] "position signal outputs";

  Modelica.Blocks.Math.Feedback feedback[Nin]
    annotation (Placement(transformation(extent={{20,-26},{0,-46}})));
  Modelica.Blocks.Sources.Constant Sollposition[Nin](k=0.75*linspace(1,Nin,Nin)) "Sollposition Masse 4"
    annotation (Placement(transformation(extent={{56,-46},{36,-26}})));

  Modelica.Blocks.Continuous.PID PID[Nin](
    each k=100,
    each Ti=1,
    each Td=0.1,
    each Nd=10,
    each initType=Modelica.Blocks.Types.Init.NoInit)
    annotation (Placement(transformation(extent={{-64,-30},{-84,-10}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay[Nin](each delayTime=0.05)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-30,-34})));
  Modelica.Blocks.Math.Add add[Nin]
    annotation (Placement(transformation(extent={{-56,44},{-36,64}})));
  Components.Subcomponents.InputSignals inputSignals
    annotation (Placement(transformation(extent={{-90,50},{-70,70}})));
equation
  for i in 1:Nout loop
    connect(outputs[i], scalableModelicaModel.outputs[i]);
  end for;

  for k in 1:Nin loop
    connect(feedback[k].u2, scalableModelicaModel.outputs[k]) annotation (Line(
        points={{10,-28},{10,0},{84,0},{84,53},{74.58,53}},  color={0,0,127}));
    connect(Sollposition[k].y, feedback[k].u1)
    annotation (Line(points={{35,-36},{18,-36}}, color={0,0,127}));
  end for;
  connect(feedback.y, fixedDelay.u) annotation (Line(points={{1,-36},{-8,-36},{
          -8,-34},{-18,-34}}, color={0,0,127}));
  connect(fixedDelay.y, PID.u) annotation (Line(points={{-41,-34},{-46,-34},{
          -46,-20},{-62,-20}}, color={0,0,127}));
  connect(add.y, scalableModelicaModel.inputs) annotation (Line(points={{-35,54},
          {-25.79,54},{-25.79,53},{-16.58,53}}, color={0,0,127}));
  connect(PID.y, add.u2) annotation (Line(points={{-85,-20},{-90,-20},{-90,48},
          {-58,48}}, color={0,0,127}));
  connect(inputSignals.outputs[1:Nin], add.u1)
    annotation (Line(points={{-69.4,60},{-58,60}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
This model extends <a href=modelica://ScalableTranslationStatistics.Model.STS_ControlledDelay>Control Loop Example with Delay </a>: The inputs of the model also depends on former outputs of the model (more than a integrator step size ago) </li>
</html>"));
end Test_STS_ControlledDelay;
