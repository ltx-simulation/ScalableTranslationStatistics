within ScalableTranslationStatistics.Fluid.Model.Alternatives;
model ManuallyBuiltExample
  extends Modelica.Icons.Example;
  ScalableTranslationStatistics.Fluid.Components.TwoPortVolume twoPortVolume
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  ScalableTranslationStatistics.Fluid.Components.TwoPortVolume twoPortVolume1
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  ScalableTranslationStatistics.Fluid.Components.TwoPortVolume twoPortVolume2
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  ScalableTranslationStatistics.Fluid.Components.LinearComponents.PressureLossTube_Linear
    pressureLossTube_Linear
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  ScalableTranslationStatistics.Fluid.Components.LinearComponents.PressureLossTube_Linear
    pressureLossTube_Linear1
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  ScalableTranslationStatistics.Fluid.Components.AssembledComponents.TubePumpNetwork
    tubePumpNetwork(numNLequations=2, withNumericJacobian=true)
    annotation (Placement(transformation(extent={{-68,22},{-32,58}})));
  ScalableTranslationStatistics.Fluid.Components.AssembledComponents.TubePumpNetwork
    tubePumpNetwork1(numNLequations=1, withNumericJacobian=false)
    annotation (Placement(transformation(extent={{12,26},{48,62}})));
  ScalableTranslationStatistics.Fluid.Components.AssembledComponents.TubePumpNetwork
    tubePumpNetwork4(numNLequations=5, withNumericJacobian=true)
    annotation (Placement(transformation(extent={{-36,-58},{0,-22}})));
  ScalableTranslationStatistics.Fluid.Components.AssembledComponents.TubePumpNetwork
    tubePumpNetwork5(numNLequations=1)
    annotation (Placement(transformation(extent={{-158,22},{-122,58}})));
  ScalableTranslationStatistics.Fluid.Components.AssembledComponents.TubePumpNetwork
    tubePumpNetwork6(numNLequations=2, withNumericJacobian=true)
    annotation (Placement(transformation(extent={{-158,-18},{-122,18}})));
  ScalableTranslationStatistics.Fluid.Components.AssembledComponents.TubePumpNetwork
    tubePumpNetwork7(numNLequations=2)
    annotation (Placement(transformation(extent={{-158,-58},{-122,-22}})));
  ScalableTranslationStatistics.Fluid.Components.Boundaries.Boundary_Pressure
    boundary_Pressure(use_input=true)
    annotation (Placement(transformation(extent={{-184,30},{-164,50}})));
  ScalableTranslationStatistics.Fluid.Components.Boundaries.Boundary_Pressure
    boundary_Pressure1(use_input=true)
    annotation (Placement(transformation(extent={{-184,-10},{-164,10}})));
  ScalableTranslationStatistics.Fluid.Components.Boundaries.Boundary_Pressure
    boundary_Pressure2(use_input=true)
    annotation (Placement(transformation(extent={{-184,-50},{-164,-30}})));
  Modelica.Blocks.Sources.Sine sine(f=2)
    annotation (Placement(transformation(extent={{-198,34},{-186,46}})));
  Modelica.Blocks.Sources.Sine sine1(f=2)
    annotation (Placement(transformation(extent={{-198,-6},{-186,6}})));
  Modelica.Blocks.Sources.Sine sine2(f=2)
    annotation (Placement(transformation(extent={{-198,-46},{-186,-34}})));
  Components.AssembledComponents.ParallelPumps_Linear
    parallelPumps_Linear(nParallel=2)
    annotation (Placement(transformation(extent={{140,20},{102,58}})));
  ScalableTranslationStatistics.Fluid.Components.Boundaries.Boundary_MassFlow
    boundary_MassFlow1(use_input=true)
    annotation (Placement(transformation(extent={{168,30},{148,50}})));
  Modelica.Blocks.Sources.Sine sine5(f=2)
    annotation (Placement(transformation(extent={{186,34},{174,46}})));
  Components.AssembledComponents.ParallelPumps_Linear
    parallelPumps_Linear1(nParallel=3)
    annotation (Placement(transformation(extent={{142,-20},{102,20}})));
  ScalableTranslationStatistics.Fluid.Components.Boundaries.Boundary_MassFlow
    boundary_MassFlow2(use_input=true)
    annotation (Placement(transformation(extent={{168,-10},{148,10}})));
  Modelica.Blocks.Sources.Sine sine6(f=2)
    annotation (Placement(transformation(extent={{186,-6},{174,6}})));
  Components.AssembledComponents.ParallelPumps_Linear
    parallelPumps_Linear2(nParallel=2)
    annotation (Placement(transformation(extent={{142,-20},{102,-60}})));
  ScalableTranslationStatistics.Fluid.Components.Boundaries.Boundary_MassFlow
    boundary_MassFlow3(use_input=true)
    annotation (Placement(transformation(extent={{168,-50},{148,-30}})));
  Modelica.Blocks.Sources.Sine sine7(f=2)
    annotation (Placement(transformation(extent={{186,-46},{174,-34}})));
  Components.TwoPortVolume                                     twoPortVolume3
    annotation (Placement(transformation(extent={{-114,-100},{-94,-80}})));
  Components.Boundaries.Boundary_Pressure
    boundary_Pressure3(use_input=true)
    annotation (Placement(transformation(extent={{-184,-100},{-164,-80}})));
  Modelica.Blocks.Sources.Sine sine3(f=2)
    annotation (Placement(transformation(extent={{-198,-96},{-186,-84}})));
  Components.LinearComponents.PressureLossTube_Linear_Sleepy
    pressureLossTube_Linear_Sleepy
    annotation (Placement(transformation(extent={{-152,-100},{-132,-80}})));
equation
  connect(twoPortVolume.fluidPortOut, pressureLossTube_Linear.fluidPortOut)
    annotation (Line(points={{-80,0},{-59.8,0}}, color={102,44,145}));
  connect(twoPortVolume1.fluidPortIn, pressureLossTube_Linear.fluidPortIn)
    annotation (Line(points={{-20,0},{-40,0}}, color={102,44,145}));
  connect(twoPortVolume1.fluidPortOut, pressureLossTube_Linear1.fluidPortOut)
    annotation (Line(points={{0,0},{20.2,0}},   color={102,44,145}));
  connect(twoPortVolume2.fluidPortIn, pressureLossTube_Linear1.fluidPortIn)
    annotation (Line(points={{60,0},{40,0}}, color={102,44,145}));
  connect(twoPortVolume.fluidPortOut, tubePumpNetwork.fluidPortIn)
    annotation (Line(points={{-80,0},{-72,0},{-72,40},{-68.36,40}}, color={102,
          44,145}));
  connect(twoPortVolume1.fluidPortIn, tubePumpNetwork.fluidPortOut)
    annotation (Line(points={{-20,0},{-30,0},{-30,40},{-31.64,40}}, color={102,
          44,145}));
  connect(twoPortVolume1.fluidPortOut, tubePumpNetwork1.fluidPortIn)
    annotation (Line(points={{0,0},{8,0},{8,44},{11.64,44}},color={102,44,145}));
  connect(tubePumpNetwork1.fluidPortOut, twoPortVolume2.fluidPortIn)
    annotation (Line(points={{48.36,44},{50,44},{50,0},{60,0}}, color={102,44,
          145}));
  connect(tubePumpNetwork4.fluidPortIn, twoPortVolume.fluidPortOut)
    annotation (Line(points={{-36.36,-40},{-72,-40},{-72,0},{-80,0}}, color={
          102,44,145}));
  connect(tubePumpNetwork5.fluidPortOut, twoPortVolume.fluidPortIn)
    annotation (Line(points={{-121.64,40},{-110,40},{-110,0},{-100,0}}, color={
          102,44,145}));
  connect(tubePumpNetwork6.fluidPortOut, twoPortVolume.fluidPortIn)
    annotation (Line(points={{-121.64,0},{-100,0}},                     color={
          102,44,145}));
  connect(tubePumpNetwork7.fluidPortOut, twoPortVolume.fluidPortIn)
    annotation (Line(points={{-121.64,-40},{-110,-40},{-110,0},{-100,0}}, color
        ={102,44,145}));
  connect(tubePumpNetwork5.fluidPortIn, boundary_Pressure.fluidPortOut)
    annotation (Line(points={{-158.36,40},{-164,40}}, color={102,44,145}));
  connect(tubePumpNetwork6.fluidPortIn, boundary_Pressure1.fluidPortOut)
    annotation (Line(points={{-158.36,0},{-164,0}},   color={102,44,145}));
  connect(tubePumpNetwork7.fluidPortIn, boundary_Pressure2.fluidPortOut)
    annotation (Line(points={{-158.36,-40},{-164,-40}}, color={102,44,145}));
  connect(sine.y, boundary_Pressure.p)
    annotation (Line(points={{-185.4,40},{-176.4,40}}, color={0,0,127}));
  connect(sine1.y, boundary_Pressure1.p)
    annotation (Line(points={{-185.4,0},{-176.4,0}},   color={0,0,127}));
  connect(sine2.y, boundary_Pressure2.p)
    annotation (Line(points={{-185.4,-40},{-176.4,-40}}, color={0,0,127}));
  connect(boundary_MassFlow1.fluidPortOut, parallelPumps_Linear.fluidPortIn)
    annotation (Line(points={{147.8,40},{147.8,39},{140.38,39}}, color={102,44,
          145}));
  connect(sine5.y, boundary_MassFlow1.m_flow)
    annotation (Line(points={{173.4,40},{160.4,40}}, color={0,0,127}));
  connect(boundary_MassFlow2.fluidPortOut, parallelPumps_Linear1.fluidPortIn)
    annotation (Line(points={{147.8,0},{142.4,0}}, color={102,44,145}));
  connect(sine6.y, boundary_MassFlow2.m_flow)
    annotation (Line(points={{173.4,0},{160.4,0}},     color={0,0,127}));
  connect(sine7.y, boundary_MassFlow3.m_flow)
    annotation (Line(points={{173.4,-40},{160.4,-40}}, color={0,0,127}));
  connect(boundary_MassFlow3.fluidPortOut, parallelPumps_Linear2.fluidPortIn)
    annotation (Line(points={{147.8,-40},{142.4,-40}}, color={102,44,145}));
  connect(tubePumpNetwork4.fluidPortOut, twoPortVolume2.fluidPortIn)
    annotation (Line(points={{0.36,-40},{50,-40},{50,0},{60,0}}, color={102,
          44,145}));
  connect(parallelPumps_Linear.fluidPortOut, twoPortVolume2.fluidPortOut)
    annotation (Line(points={{101.62,39},{90,39},{90,0},{80,0}}, color={102,44,
          145}));
  connect(parallelPumps_Linear1.fluidPortOut, twoPortVolume2.fluidPortOut)
    annotation (Line(points={{101.6,0},{80,0}}, color={102,44,145}));
  connect(parallelPumps_Linear2.fluidPortOut, twoPortVolume2.fluidPortOut)
    annotation (Line(points={{101.6,-40},{90,-40},{90,0},{80,0}}, color={102,44,
          145}));
  connect(sine3.y,boundary_Pressure3. p)
    annotation (Line(points={{-185.4,-90},{-176.4,-90}}, color={0,0,127}));
  connect(boundary_Pressure3.fluidPortOut, pressureLossTube_Linear_Sleepy.fluidPortOut)
    annotation (Line(points={{-164,-90},{-151.8,-90}}, color={102,44,145}));
  connect(pressureLossTube_Linear_Sleepy.fluidPortIn, twoPortVolume3.fluidPortIn)
    annotation (Line(points={{-132,-90},{-114,-90}}, color={102,44,145}));
  annotation (Diagram(coordinateSystem(extent={{-200,-100},{220,100}}),
        graphics={
        Text(
          extent={{-150,58},{-116,44}},
          textColor={0,0,0},
          textString="1",
          fontSize=10),
        Text(
          extent={{-150,28},{-114,12}},
          textColor={0,0,0},
          fontSize=10,
          textString="2"),
        Text(
          extent={{-148,-14},{-114,-28}},
          textColor={0,0,0},
          fontSize=9,
          textString="2"),
        Text(
          extent={{-74,60},{-40,46}},
          textColor={0,0,0},
          fontSize=9,
          textString="2"),
        Text(
          extent={{0,62},{34,48}},
          textColor={0,0,0},
          textString="1",
          fontSize=10),
        Text(
          extent={{-46,-14},{-6,-34}},
          textColor={0,0,0},
          fontSize=10,
          textString="5"),
        Text(
          extent={{-36,18},{-2,4}},
          textColor={170,85,255},
          fontSize=10,
          textString="2"),
        Text(
          extent={{44,18},{78,4}},
          textColor={170,85,255},
          fontSize=10,
          textString="3"),
        Text(
          extent={{94,66},{128,52}},
          textColor={28,108,200},
          fontSize=10,
          textString="2"),
        Text(
          extent={{96,26},{130,12}},
          textColor={28,108,200},
          fontSize=9,
          textString="3"),
        Text(
          extent={{96,-24},{130,-38}},
          textColor={28,108,200},
          fontSize=9,
          textString="2"),
        Text(
          extent={{-176,96},{-10,86}},
          textColor={0,0,0},
          fontSize=12,
          textString="2 - number of equations in a nonlinear system"),
        Text(
          extent={{-176,88},{-24,74}},
          textColor={28,108,200},
          fontSize=12,
          textString="3 - number of equations in a linear system"),
        Text(
          extent={{-176,76},{-12,66}},
          textColor={170,85,255},
          fontSize=12,
          textString="2 - numerization of continuous state variables"),
        Text(
          extent={{-116,18},{-82,2}},
          textColor={170,85,255},
          fontSize=10,
          textString="1"),
        Text(
          extent={{-132,-72},{-98,-86}},
          textColor={170,85,255},
          fontSize=10,
          textString="4"),
        Text(
          extent={{-178,-64},{-108,-82}},
          textColor={0,0,0},
          textString="additional \"small\" system")}),                   Icon(
        coordinateSystem(extent={{-100,-100},{100,100}})));
end ManuallyBuiltExample;
