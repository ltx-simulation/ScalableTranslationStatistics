within ScalableTranslationStatistics.Fluid.Components;
model ParallelResistors
  parameter Integer nParallel = 3;
  Components.PressureLossTube pressureLossTube[nParallel]
    annotation (Placement(transformation(extent={{18,-22},{-26,22}})));

  Interfaces.FluidPortOut fluidPortOut annotation (Placement(transformation(
          rotation=0, extent={{92,-10},{112,10}})));
  Interfaces.FluidPortIn fluidPortIn annotation (Placement(transformation(
          rotation=0, extent={{-112,-10},{-92,10}})));
equation
  for i in 1:nParallel loop
    connect(fluidPortIn, pressureLossTube[i].fluidPortIn) annotation (Line(points={{-102,0},
            {-26,0}},                          color={102,44,145}));
  connect(pressureLossTube[i].fluidPortOut, fluidPortOut)
    annotation (Line(points={{17.56,0},{102,0}}, color={102,44,145}));
  end for;

  annotation (Icon(graphics={
        Rectangle(
          extent={{-40,80},{40,40}},
          lineColor={102,44,145},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-40,20},{40,-20}},
          lineColor={102,44,145},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-40,-40},{40,-80}},
          lineColor={102,44,145},
          fillPattern=FillPattern.HorizontalCylinder),
        Line(points={{-96,0},{-60,0},{-60,60},{60,60},{60,0},{100,0}}, color={
              102,44,145}),
        Line(points={{-100,0},{-60,0},{-60,-60},{60,-60},{60,0},{102,0}}, color
            ={102,44,145}),
        Line(points={{-100,0},{104,0}}, color={102,44,145})}));
end ParallelResistors;
