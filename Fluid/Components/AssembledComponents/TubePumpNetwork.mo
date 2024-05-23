within ScalableTranslationStatistics.Fluid.Components.AssembledComponents;
model TubePumpNetwork
  parameter Integer numNLequations = 3;
  parameter Boolean withNumericJacobian = false;

  Components.TwoPortVolume volume
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  NonlinearComponents.PressureIncreasePump analytic_pump(redeclare replaceable
      function CalcDensity = Media.CalcDensitySimple) if not
    withNumericJacobian annotation (Placement(transformation(
        extent={{15,-16},{-15,16}},
        rotation=180,
        origin={55,3.55271e-15})));
  NonlinearComponents.PressureIncreasePump numeric_pump(redeclare replaceable
      function CalcDensity = Media.AssertedDensity) if withNumericJacobian
    annotation (Placement(transformation(
        extent={{15,-16},{-15,16}},
        rotation=180,
        origin={55,3.55271e-15})));

  Modelica.Blocks.Sources.RealExpression realExpression1(y=if time < 0.5
         then 50 else 100)
    annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
  Interfaces.FluidPortOut fluidPortOut annotation (Placement(transformation(
          rotation=0, extent={{92,-10},{112,10}})));
  Interfaces.FluidPortIn fluidPortIn annotation (Placement(transformation(
          rotation=0, extent={{-112,-10},{-92,10}})));
  ParallelResistors parallelResistors(nParallel = numNLequations)
    annotation (Placement(transformation(extent={{-80,-32},{-16,32}})));
    //
equation

    connect(volume.fluidPortOut, analytic_pump.fluidPortIn)
    annotation (Line(points={{20,0},{40,0}}, color={28,108,200}));
  connect(realExpression1.y, analytic_pump.n)
    annotation (Line(points={{31,-30},{55,-30},{55,-17.28}}, color={0,0,127}));
  connect(fluidPortOut, analytic_pump.fluidPortOut)
    annotation (Line(points={{102,0},{70.3,0}}, color={28,108,200}));

  connect(volume.fluidPortOut, numeric_pump.fluidPortIn)
    annotation (Line(points={{20,0},{40,0}}, color={28,108,200}));
  connect(realExpression1.y, numeric_pump.n)
    annotation (Line(points={{31,-30},{55,-30},{55,-17.28}}, color={0,0,127}));
  connect(fluidPortOut, numeric_pump.fluidPortOut)
    annotation (Line(points={{102,0},{70.3,0}}, color={28,108,200}));
  connect(parallelResistors.fluidPortIn, fluidPortIn)
    annotation (Line(points={{-80.64,0},{-102,0}}, color={102,44,145}));
  connect(parallelResistors.fluidPortOut, volume.fluidPortIn)
    annotation (Line(points={{-15.36,0},{0,0}}, color={102,44,145}));
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
end TubePumpNetwork;
