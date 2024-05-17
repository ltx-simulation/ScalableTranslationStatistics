within ScalableTranslationStatistics.Mechanics.Components.Subcomponents;
model InputSignals
  Modelica.Blocks.Sources.Sine sine(
    amplitude=100,
    f=200,
    offset=1) annotation (Placement(transformation(extent={{-96,42},{-76,62}})));
  Modelica.Blocks.Sources.Step step(height=100, startTime=0.1)
    annotation (Placement(transformation(extent={{-64,-4},{-44,16}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=0.1)
    annotation (Placement(transformation(extent={{6,-4},{26,16}})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent={{-14,-38},{6,-18}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T=1)
    annotation (Placement(transformation(extent={{16,-38},{36,-18}})));
  Modelica.Blocks.Sources.Constant const(k=-20)
    annotation (Placement(transformation(extent={{-64,26},{-44,46}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{18,80},
            {38,100}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(k=5, T=1)
    annotation (Placement(transformation(extent={{16,-96},{36,-76}})));
  Modelica.Blocks.Math.Gain gain(k=-0.5) annotation (Placement(transformation(extent={{20,-66},
            {32,-54}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{-62,-54},
            {-42,-34}})));
  Modelica.Blocks.Noise.UniformNoise uniformNoise(
    samplePeriod=0.1,
    y_min=-50,
    y_max=20)
    annotation (Placement(transformation(extent={{-98,-94},{-78,-74}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-88,86},{-76,96}})));
  Modelica.Blocks.Interfaces.RealOutput outputs[10] "position signal outputs" annotation (Placement(transformation(extent={{96,-10},
            {116,10}})));
  Modelica.Blocks.Sources.SawTooth sawTooth(
    amplitude=100,
    period=1,
    startTime=1)
    annotation (Placement(transformation(extent={{-36,58},{-16,78}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder3(T=0.1)
    annotation (Placement(transformation(extent={{18,54},{38,74}})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(extent={{18,24},
            {38,44}})));
equation
  connect(step.y,firstOrder. u) annotation (Line(points={{-43,6},{4,6}},     color={0,0,127}));
  connect(step.y,integrator. u)
    annotation (Line(points={{-43,6},{-22,6},{-22,-28},{-16,-28}},     color={0,0,127}));
  connect(integrator.y,firstOrder1. u) annotation (Line(points={{7,-28},{14,-28}},    color={0,0,127}));
  connect(sine.y,add. u2)
    annotation (Line(points={{-75,52},{10,52},{10,84},{16,84}},                      color={0,0,127}));
  connect(const.y,add. u1)
    annotation (Line(points={{-43,36},{6,36},{6,96},{16,96}},         color={0,0,127}));
  connect(const.y,gain. u) annotation (Line(points={{-43,36},{-26,36},{-26,-60},
          {18.8,-60}},
                 color={0,0,127}));
  connect(sine.y,add1. u1) annotation (Line(points={{-75,52},{-72,52},{-72,-38},
          {-64,-38}}, color={0,0,127}));
  connect(add.y,outputs[1]) annotation (Line(points={{39,90},{86,90},{86,-4.5},
          {106,-4.5}},                      color={0,0,127}));
  connect(sine.y,outputs[2]) annotation (Line(points={{-75,52},{86,52},{86,-3.5},
          {106,-3.5}},                          color={0,0,127}));
  connect(const.y,outputs[3]) annotation (Line(points={{-43,36},{-26,36},{-26,
          24},{86,24},{86,-2.5},{106,-2.5}},    color={0,0,127}));
  connect(firstOrder.y,outputs[4]) annotation (Line(
        points={{27,6},{86,6},{86,-1.5},{106,-1.5}},color={0,0,127}));
  connect(firstOrder1.y,outputs[5]) annotation (Line(
        points={{37,-28},{44,-28},{44,-0.5},{106,-0.5}},color={0,0,127}));
  connect(add1.y,outputs[6]) annotation (Line(points={{-41,-44},{-28,-44},{-28,
          -70},{44,-70},{44,0.5},{106,0.5}},      color={0,0,127}));
  connect(gain.y,outputs[7]) annotation (Line(points={{32.6,-60},{44,-60},{44,
          1.5},{106,1.5}},                         color={0,0,127}));
  connect(firstOrder2.y,outputs[8]) annotation (Line(
        points={{37,-86},{86,-86},{86,2.5},{106,2.5}},  color={0,0,127}));
  connect(uniformNoise.y,add1. u2) annotation (Line(points={{-77,-84},{-70,-84},
          {-70,-50},{-64,-50}}, color={0,0,127}));
  connect(uniformNoise.y,firstOrder2. u) annotation (Line(points={{-77,-84},{-12,
          -84},{-12,-86},{14,-86}},color={0,0,127}));
  connect(sawTooth.y, firstOrder3.u) annotation (Line(points={{-15,68},{-2,68},
          {-2,64},{16,64}}, color={0,0,127}));
  connect(firstOrder3.y, outputs[9]) annotation (Line(points={{39,64},{54,64},{
          54,68},{68,68},{68,3.5},{106,3.5}}, color={0,0,127}));
  connect(sawTooth.y, add2.u1) annotation (Line(points={{-15,68},{-2,68},{-2,40},
          {16,40}}, color={0,0,127}));
  connect(step.y, add2.u2) annotation (Line(points={{-43,6},{-6,6},{-6,28},{16,
          28}}, color={0,0,127}));
  connect(add2.y, outputs[10]) annotation (Line(points={{39,34},{60,34},{60,4.5},
          {106,4.5}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Offers 10 arbitrary input signals for ScalableTranslation Statistics</p>
</html>"));
end InputSignals;
