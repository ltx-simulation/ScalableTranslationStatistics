within ScalableTranslationStatistics.Components.Subcomponents;
model AssertedSpring "Linear 1D translational spring"
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
  parameter Modelica.Units.SI.TranslationalSpringConstant c(final min=0, start=1) "Spring constant";
  parameter Modelica.Units.SI.Distance s_rel0=0 "Unstretched spring length";
  function limit =
      ScalableTranslationStatistics.Components.Functions.LimitationFunction;
  parameter Boolean insert_Jacobian = false "Add a numerical Jacobian";
equation
  if insert_Jacobian then
    limit(f,1e20) = c*(s_rel - s_rel0);
  else
    f = c*(s_rel - s_rel0);
  end if;
  annotation (
    Documentation(info="<html>
<p>
This is a <em>linear 1D translational spring</em> with limited forces.
The force limit is fixed to 1e20 N, so it'll probably never reached. The sense is, that this assertation induces a Jacobi matrix, which must be solved numerically, which is one property of the translation statistics
</p>

</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={
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
        Line(points={{-98,0},{-60,0},{-44,-30},{-16,30},{14,-30},{44,30},{
              60,0},{100,0}}, color={0,127,0}),
        Text(
          extent={{-150,-45},{150,-75}},
          textString="c=%c")}));
end AssertedSpring;
