within ScalableTranslationStatistics.Mechanics.Components.Subcomponents;
model LinearSleepySpring
  extends Partial.PartialSleepySpring;
  Modelica.Mechanics.Translational.Components.Spring spring(c=c, s_rel0=s_unstreched)
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
equation
    connect(flange_a, spring.flange_a) annotation (Line(points={{-100,0},{-44,0},{
          -44,50},{-10,50}}, color={0,127,0}));
    connect(spring.flange_b, flange_b) annotation (Line(points={{10,50},{32,50},{32,
          0},{100,0}}, color={0,127,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{-60,-90},{20,-90}}, color={95,127,95}),
        Polygon(
          points={{50,-90},{20,-80},{20,-100},{50,-90}},
          lineColor={95,127,95},
          fillColor={95,127,95},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-98,0},{-60,0},{-44,-30},{-16,30},{14,-30},{44,30},{60,0},
              {100,0}},       color={0,127,0}),
              Line(
          points={{-66,28},{56,28}},
          color={28,108,200},
          thickness=1),
        Text(
          extent={{-148,-49},{152,-79}},
          textString="c=%c"),
        Line(
          points={{-66,42},{-66,-48},{74,-48}},
          color={0,0,0},
          thickness=0.5,
          arrow={Arrow.Filled,Arrow.Filled}),
        Text(
          extent={{-80,52},{-68,40}},
          textColor={0,0,0},
          textString="c"),
        Text(
          extent={{66,-50},{78,-62}},
          textColor={0,0,0},
          textString="s")}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Linear spring with a waiting / sleeping time to imitate longer simulation times</p>
<p>The <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Components.Partial.PartialSleepySpring\">PartialSleepySpring</a> is extended by <a href=\"modelica://Modelica.Mechanics.Translational.Components.Spring\"> Modelica.Mechanics.Translational.Components.Spring</a>.</p>
</html>"));
end LinearSleepySpring;
