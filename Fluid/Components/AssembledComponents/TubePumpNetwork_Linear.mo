within ScalableTranslationStatistics.Fluid.Components.AssembledComponents;
model TubePumpNetwork_Linear
  parameter Integer numLinEquations=4;
  Modelica.Blocks.Sources.Sine sine(f=2, offset=1)
    annotation (Placement(transformation(extent={{-140,74},{-120,94}})));
  Components.LinearComponents.PressureIncreasePump_Linear
    pressureIncreasePump_Linear(use_input=true)
    annotation (Placement(transformation(extent={{-48,30},{-28,50}})));
  Components.AssembledComponents.ParallelResistors_Linear
    parallelResistors_Linear(nParallel=numLinEquations)
    annotation (Placement(transformation(extent={{-52,-10},{-32,10}})));
  Interfaces.FluidPortIn fluidPortIn "inlet port"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Interfaces.FluidPortOut fluidPortOut
    annotation (Placement(transformation(extent={{92,-10},{112,10}})));
equation
  connect(pressureIncreasePump_Linear.fluidPortIn, fluidPortIn) annotation (
      Line(points={{-48,40},{-74,40},{-74,0},{-100,0}}, color={102,44,145}));
  connect(fluidPortIn, parallelResistors_Linear.fluidPortIn)
    annotation (Line(points={{-100,0},{-52.2,0}}, color={102,44,145}));
  connect(parallelResistors_Linear.fluidPortOut, fluidPortOut)
    annotation (Line(points={{-31.8,0},{102,0}}, color={102,44,145}));
  connect(pressureIncreasePump_Linear.fluidPortOut, fluidPortOut) annotation (
      Line(points={{-27.8,40},{62,40},{62,0},{102,0}}, color={102,44,145}));
  connect(sine.y, pressureIncreasePump_Linear.n)
    annotation (Line(points={{-119,84},{-38,84},{-38,50.8}}, color={0,0,127}));
  annotation (Icon(graphics={
        Rectangle(
          extent={{8,76},{82,44}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          visible=numLinEquations > 1,
          fillColor={170,85,255}),
        Rectangle(
          extent={{8,-44},{82,-76}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          visible=numLinEquations > 2,
          fillColor={170,85,255}),
        Ellipse(
          extent={{-88,40},{-8,-40}},
          lineColor={102,44,145},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255},
          lineThickness=1),
        Line(
          points={{-80,24},{-8,6}},
          color={102,44,145},
          thickness=1),
        Line(
          points={{-76,-28},{-10,-10}},
          color={102,44,145},
          thickness=1),
        Line(
          points={{-8,0},{0,0},{0,60},{8,60}},
          color={127,0,127},
          thickness=0.5,
          visible=numLinEquations > 1),
        Line(
          points={{100,0},{90,0},{90,60},{82,60}},
          color={127,0,127},
          thickness=0.5,
          visible=numLinEquations > 1),
        Line(
          points={{82,-62},{90,-62},{90,0},{100,0}},
          color={127,0,127},
          thickness=0.5,
          visible=numLinEquations > 2),
        Line(
          points={{8,-60},{0,-60},{0,0},{-8,0}},
          color={127,0,127},
          thickness=0.5,
          visible=numLinEquations > 2),
        Line(
          points={{-8,0},{0,0}},
          color={127,0,127},
          thickness=0.5),
        Line(
          points={{-100,0},{-88,0}},
          color={127,0,127},
          thickness=0.5),
        Rectangle(
          extent={{8,16},{82,-16}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={170,85,255}),
        Line(
          points={{-8,0},{8,0}},
          color={127,0,127},
          thickness=0.5),
        Line(
          points={{82,0},{98,0}},
          color={127,0,127},
          thickness=0.5),
        Line(
          points={{0,-100},{0,100}},
          color={127,0,127},
          thickness=0.5,
          visible=numLinEquations > 3),
        Line(
          points={{90,-100},{90,100}},
          color={127,0,127},
          thickness=0.5,
          visible=numLinEquations > 3),
        Rectangle(
          extent={{8,96},{82,100}},
          lineColor={0,0,0},
          fillColor={170,85,255},
          fillPattern=FillPattern.Solid,
          visible=numLinEquations > 3),
        Rectangle(
          extent={{8,-100},{82,-96}},
          lineColor={0,0,0},
          fillColor={170,85,255},
          fillPattern=FillPattern.Solid,
          visible=numLinEquations > 3)}),
    Diagram(coordinateSystem(preserveAspectRatio=false)));
end TubePumpNetwork_Linear;
