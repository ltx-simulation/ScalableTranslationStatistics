within ScalableTranslationStatistics.Fluid.Components.AssembledComponents;
model ParallelPumps_Linear
  parameter Integer nParallel=4;
  LinearComponents.PressureIncreasePump_Linear
                                       pressureIncreasePump_Linear
                                                       [nParallel]
    annotation (Placement(transformation(extent={{-26,-22},{18,22}})));

  Interfaces.FluidPortOut fluidPortOut annotation (Placement(transformation(
          rotation=0, extent={{92,-10},{112,10}})));
  Interfaces.FluidPortIn fluidPortIn annotation (Placement(transformation(
          rotation=0, extent={{-112,-10},{-92,10}})));
equation
  for i in 1:nParallel loop
    connect(fluidPortIn, pressureIncreasePump_Linear[i].fluidPortIn)
      annotation (Line(points={{-102,0},{-26,0}}, color={102,44,145}));
    connect(pressureIncreasePump_Linear[i].fluidPortOut, fluidPortOut)
      annotation (Line(points={{18.44,0},{102,0}}, color={102,44,145}));
  end for;

  annotation (Icon(graphics={
        Line(points={{-96,0},{-60,0},{-60,60},{-26,60}},               color={102,44,
              145},        visible=nParallel >1,
          thickness=0.5),
        Line(points={{-100,0},{104,0}}, color={102,44,145}),
        Line(points={{-60,100},{-60,-102}}, color={102,44,145}, visible=nParallel >3,
          thickness=0.5),
        Line(points={{60,100},{60,-102}}, color={102,44,145}, visible=nParallel >3,
          thickness=0.5),
        Ellipse(
          extent={{-26,-34},{26,-86}},
          lineColor={170,85,255},
          lineThickness=0.5, visible=nParallel >2),
        Ellipse(
          extent={{-26,94},{26,146}},
          lineColor={170,85,255},
          lineThickness=0.5,
          startAngle=225,
          endAngle=315,
          closure=EllipseClosure.None, visible=nParallel >3),
        Ellipse(
          extent={{-26,-94},{26,-146}},
          lineColor={170,85,255},
          lineThickness=0.5,
          startAngle=225,
          endAngle=315,
          closure=EllipseClosure.None, visible=nParallel >3),
        Line(
          points={{-19,-42},{25.5,-56}},
          color={170,85,255},
          thickness=0.5,
          visible=nParallel > 2),
        Line(
          points={{-19,-78},{25.5,-64}},
          color={170,85,255},
          thickness=0.5,
          visible=nParallel > 2),
        Line(points={{-96,0},{-60,0},{-60,-60},{-26,-60}},             color={102,44,
              145},        visible=nParallel >2,
          thickness=0.5),
        Line(
          points={{-102,0},{-26,0}},
          color={102,44,145},
          thickness=0.5),
        Line(
          points={{26,0},{102,0}},
          color={102,44,145},
          thickness=0.5),
        Line(points={{26,-60},{60,-60},{60,0},{102,0}},                color={102,44,
              145},        visible=nParallel >2,
          thickness=0.5),
        Line(
          points={{26,60},{60,60},{60,0},{100,0}},
          color={102,44,145},
          visible=nParallel > 1,
          thickness=0.5),
        Ellipse(
          extent={{-26,26},{26,-26}},
          lineColor={170,85,255},
          lineThickness=0.5),
        Line(
          points={{-19,-18},{25.5,-4}},
          color={170,85,255},
          thickness=0.5),
        Line(
          points={{-19,18},{25.5,4}},
          color={170,85,255},
          thickness=0.5),
        Ellipse(
          extent={{-26,86},{26,34}},
          lineColor={170,85,255},
          lineThickness=0.5, visible=nParallel >1),
        Line(
          points={{-19,42},{25.5,56}},
          color={170,85,255},
          thickness=0.5,
          visible=nParallel > 1),
        Line(
          points={{-19,78},{25.5,64}},
          color={170,85,255},
          thickness=0.5,
          visible=nParallel > 1)}));
end ParallelPumps_Linear;
