within ScalableTranslationStatistics.Utilities;
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
  Modelica.Blocks.Sources.TimeTable timeTable(table=[0,77.81572498; 0.1,
        49.92136412; 0.2,91.05449788; 0.3,43.71585253; 0.4,27.17517194; 0.5,
        84.52322358; 0.6,67.95894293; 0.7,36.47218865; 0.8,62.33798504; 0.9,
        15.27389118; 1,54.94649305; 1.1,93.17343607; 1.2,63.54796475; 1.3,
        21.48599972; 1.4,50.11945314; 1.5,18.19451275; 1.6,97.57907381; 1.7,
        13.68820658; 1.8,72.63035533; 1.9,27.97418616; 2,13.0386654; 2.1,
        99.23798489; 2.2,85.90420234; 2.3,13.22970169; 2.4,72.77508816; 2.5,
        82.26997284; 2.6,93.76592083; 2.7,73.80479102; 2.8,86.18174921; 2.9,
        96.86753541; 3,72.46820722; 3.1,98.30613484; 3.2,4.009049839; 3.3,
        72.03943263; 3.4,88.76707059; 3.5,75.96632306; 3.6,19.41900378; 3.7,
        67.9209259; 3.8,33.93034085; 3.9,31.77691475; 4,13.84572311; 4.1,
        12.74374224; 4.2,48.92997885; 4.3,84.65600762; 4.4,53.85926215; 4.5,
        50.76483754; 4.6,19.57522522; 4.7,95.34823404; 4.8,8.052569133; 4.9,
        87.18770161; 5,93.83524536; 5.1,45.39322222; 5.2,47.62507869; 5.3,
        7.43545578; 5.4,20.74090959; 5.5,4.401541688; 5.6,64.28569497; 5.7,
        59.28700749; 5.8,38.34553091; 5.9,18.476051; 6,72.066614; 6.1,
        49.21430956; 6.2,15.04752452; 6.3,19.36395632; 6.4,44.74662828; 6.5,
        48.64339229; 6.6,7.307291351; 6.7,34.31352556; 6.8,59.34743239; 6.9,
        24.54311269; 7,3.95976543; 7.1,18.09606447; 7.2,24.15728593; 7.3,
        64.66323066; 7.4,85.64326065; 7.5,72.73864081; 7.6,12.50956455; 7.7,
        30.75099696; 7.8,44.01746037; 7.9,29.80305913; 8,41.93714399; 8.1,
        55.51055853; 8.2,40.84236026; 8.3,93.54965486; 8.4,69.12664075; 8.5,
        7.641733; 8.6,12.94974158; 8.7,43.29800385; 8.8,59.00639407; 8.9,
        72.19000603; 9,14.77937531; 9.1,4.488950344; 9.2,88.13133283; 9.3,
        68.51366657; 9.4,43.26253149; 9.5,5.621384679; 9.6,70.49286768; 9.7,
        36.90860251; 9.8,28.56836846; 9.9,55.77931168; 10,55.77931168])
    annotation (Placement(transformation(extent={{-126,-84},{-106,-64}})));
  Modelica.Blocks.Math.Gain gain1(k=0.1) annotation (Placement(transformation(extent={{-90,-56},
            {-78,-44}})));
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
  connect(timeTable.y, firstOrder2.u) annotation (Line(points={{-105,-74},{6,
          -74},{6,-86},{14,-86}}, color={0,0,127}));
  connect(add1.u2, gain1.y)
    annotation (Line(points={{-64,-50},{-77.4,-50}}, color={0,0,127}));
  connect(gain1.u, timeTable.y) annotation (Line(points={{-91.2,-50},{-100,-50},
          {-100,-74},{-105,-74}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Offers 10 arbitrary input signals for ScalableTranslation Statistics</p>
</html>"));
end InputSignals;
