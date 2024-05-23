within ScalableTranslationStatistics.Fluid.Components.AssembledComponents;
model TubePumpNetworkAlt
  parameter Integer numNLequations = 3;
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

  Modelica.Blocks.Sources.RealExpression realExpression1(y=if time < 0.5
         then 50 else 100)
    annotation (Placement(transformation(extent={{-78,-60},{-58,-40}})));
  Interfaces.FluidPortOut fluidPortOut annotation (Placement(transformation(
          rotation=0, extent={{92,-10},{112,10}})));
  Interfaces.FluidPortIn fluidPortIn annotation (Placement(transformation(
          rotation=0, extent={{-112,-10},{-92,10}})));
  AssembledComponents.ParallelResistors parallelResistors(nParallel=
        numNLequations)
    annotation (Placement(transformation(extent={{12,-32},{76,32}})));
    //
equation

  connect(realExpression1.y, analytic_pump.n)
    annotation (Line(points={{-57,-50},{-47,-50},{-47,-17.28}},
                                                             color={0,0,127}));

  connect(realExpression1.y, numeric_pump.n)
    annotation (Line(points={{-57,-50},{-47,-50},{-47,-17.28}},
                                                             color={0,0,127}));
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
  annotation (Icon(graphics={
        Rectangle(
          extent={{-58,60},{-12,38}},
          lineColor={102,44,145},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-58,10},{-12,-12}},
          lineColor={102,44,145},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-58,-40},{-12,-62}},
          lineColor={102,44,145},
          fillPattern=FillPattern.HorizontalCylinder),
        Ellipse(
          extent={{20,20},{68,-24}},
          lineColor={102,44,145},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255},
          lineThickness=1),
        Line(
          points={{28,14},{68,2}},
          color={102,44,145},
          thickness=1),
        Line(
          points={{26,-16},{68,-4}},
          color={102,44,145},
          thickness=1),
        Line(
          points={{-100,0},{-66,0},{-66,50},{-58,50}},
          color={127,0,127},
          thickness=0.5),
        Line(
          points={{-12,0},{2,0},{2,50},{-12,50}},
          color={127,0,127},
          thickness=0.5),
        Line(
          points={{-12,-50},{2,-50},{2,0},{20,0}},
          color={127,0,127},
          thickness=0.5),
        Line(
          points={{-58,-50},{-66,-50},{-66,0},{-58,0}},
          color={127,0,127},
          thickness=0.5),
        Line(
          points={{68,0},{94,0}},
          color={127,0,127},
          thickness=0.5)}));
end TubePumpNetworkAlt;
