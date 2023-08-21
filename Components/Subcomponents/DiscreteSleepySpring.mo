within ScalableTranslationStatistics.Components.Subcomponents;
model DiscreteSleepySpring
  extends Partial.PartialSleepySpring;
  parameter Integer stiffness_steps= 5 "number of discrete changes of the stiffness";
  parameter Modelica.Units.SI.Position scale_steps = 1 "distance of the steps in the stiffness-displacement-curve, default = each 1mm of deflection";
  DiscreteStiffnessSpring discreteSpring(s_steps=s_steps, stiffness=stiffness, s_rel0=s_unstreched)
    annotation (Placement(transformation(extent={{-8,-42},{12,-22}})));
protected
    parameter Modelica.Units.SI.Position s_steps[stiffness_steps]=scale_steps*linspace(1,stiffness_steps,stiffness_steps);
    parameter Modelica.Units.SI.TranslationalSpringConstant stiffness[stiffness_steps+1]=0.1*c*array(i-2*floor(i/2) for i in 1:stiffness_steps+1)+c*array(i+1-2*floor((i+1)/2) for i in 1:stiffness_steps+1);
equation
    connect(flange_a, discreteSpring.flange_a) annotation (Line(points={{-100,
          0},{-44,0},{-44,-32},{-8,-32}}, color={0,127,0}));
    connect(discreteSpring.flange_b, flange_b) annotation (Line(points={{12,
          -32},{32,-32},{32,0},{100,0}}, color={0,127,0}));
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
          points={{-64,-30},{-38,-30},{-38,28},{-8,28},{-8,-30},{18,-30},{18,28},
              {58,28}},
          color={28,108,200},
          thickness=1),
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
<p>Spring with discrete stiffness steps and a waiting / sleeping time to imitate longer simulation times</p>
<p>The <a href=\"modelica://ScalableTranslationStatistics.Components.Partial.PartialSleepySpring\">PartialSleepySpring</a> is extended by the component <a href=\"modelica://ScalableTranslationStatistics.Components.Subcomponents.DiscreteStiffnessSpring\"> DiscreteStiffnessSpring</a>.</p>
</html>"));
end DiscreteSleepySpring;
