within ScalableTranslationStatistics.Fluid.Components.AssembledComponents;
model TubePumpNetwork
  parameter Integer numNLequations=3;
  parameter Boolean withNumericJacobian = false;

  NonlinearComponents.PressureIncreasePump analytic_pump(redeclare replaceable
      function CalcDensity = Media.CalcDensitySimple) if not
    withNumericJacobian annotation (Placement(transformation(
        extent={{15,-16},{-15,16}},
        rotation=180,
        origin={-47,0})));
  NonlinearComponents.PressureIncreasePump numeric_pump(redeclare replaceable
      function CalcDensity = Media.AssertedDensity) if withNumericJacobian
    annotation (Placement(transformation(
        extent={{15,-16},{-15,16}},
        rotation=180,
        origin={-47,0})));

  Interfaces.FluidPortOut fluidPortOut annotation (Placement(transformation(
          rotation=0, extent={{92,-10},{112,10}})));
  Interfaces.FluidPortIn fluidPortIn annotation (Placement(transformation(
          rotation=0, extent={{-112,-10},{-92,10}})));
  AssembledComponents.ParallelResistors parallelResistors(nParallel=
        NumNL) if NumNL>0
    annotation (Placement(transformation(extent={{12,-32},{76,32}})));
  Components.LinearComponents.PressureLossTube_Linear linearTube if withNumericJacobian and numNLequations==1;
    //
protected
  parameter Integer NumNL = if withNumericJacobian and numNLequations==1 then 0 else numNLequations;

equation
  connect(parallelResistors.fluidPortOut, fluidPortOut)
    annotation (Line(points={{76.64,0},{102,0}}, color={102,44,145}));
  connect(numeric_pump.fluidPortOut, parallelResistors.fluidPortIn)
    annotation (Line(points={{-31.7,0},{11.36,0}}, color={102,44,145}));
  connect(analytic_pump.fluidPortOut, parallelResistors.fluidPortIn)
    annotation (Line(points={{-31.7,0},{11.36,0}}, color={102,44,145}));
  connect(fluidPortIn, numeric_pump.fluidPortIn)
    annotation (Line(points={{-102,0},{-62,0}}, color={102,44,145}));
  connect(fluidPortIn, analytic_pump.fluidPortIn)
    annotation (Line(points={{-102,0},{-62,0}}, color={102,44,145}));
  connect(numeric_pump.fluidPortOut, linearTube.fluidPortIn);
  connect(linearTube.fluidPortOut, fluidPortOut);

  annotation (Icon(graphics={
        Rectangle(
          extent={{8,76},{82,44}},
          lineColor={102,44,145},
          fillPattern=FillPattern.HorizontalCylinder,
          visible=numNLequations > 1),
        Rectangle(
          extent={{8,-44},{82,-76}},
          lineColor={102,44,145},
          fillPattern=FillPattern.HorizontalCylinder,
          visible=numNLequations > 2),
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
          visible=numNLequations > 1),
        Line(
          points={{100,0},{90,0},{90,60},{82,60}},
          color={127,0,127},
          thickness=0.5,
          visible=numNLequations > 1),
        Line(
          points={{82,-62},{90,-62},{90,0},{100,0}},
          color={127,0,127},
          thickness=0.5,
          visible=numNLequations > 2),
        Line(
          points={{8,-60},{0,-60},{0,0},{-8,0}},
          color={127,0,127},
          thickness=0.5,
          visible=numNLequations > 2),
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
          lineColor={102,44,145},
          fillPattern=FillPattern.HorizontalCylinder),
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
          visible=numNLequations > 3),
        Line(
          points={{90,-100},{90,100}},
          color={127,0,127},
          thickness=0.5,
          visible=numNLequations > 3),
        Rectangle(
          extent={{8,96},{82,100}},
          lineColor={102,44,145},
          fillColor={102,44,145},
          fillPattern=FillPattern.Solid,
          visible=numNLequations > 3),
        Rectangle(
          extent={{8,-100},{82,-96}},
          lineColor={102,44,145},
          fillColor={102,44,145},
          fillPattern=FillPattern.Solid,
          visible=numNLequations > 3)}));
end TubePumpNetwork;
