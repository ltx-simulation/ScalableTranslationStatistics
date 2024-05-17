within ScalableTranslationStatistics.Mechanics.Components.Assembled;
model DampedSpringChain
  extends NonLinearSpringChain;
  parameter Modelica.Units.SI.TranslationalDampingConstant d(final min=0, start=0)=0.1 "Damping constant of the damper parallel to spring chain";
  Modelica.Mechanics.Translational.Components.Damper damper(d=d) if d>0;
equation
  if d>0 then
  connect(damper.flange_a, flange_a) annotation (Line(points={{-14,-20},{-64,-20},
          {-64,0},{-100,0}}, color={0,127,0}));
  connect(damper.flange_b, flange_b) annotation (Line(points={{6,-20},{46,-20},{
          46,0},{100,0}}, color={0,127,0}));
  end if;
    annotation (Placement(transformation(extent={{-14,-30},{6,-10}})),
              Icondetail_switch(components(subcomponents(
              nonlinearSpring(                                           coordinateSystem(preserveAspectRatio=false))))),
      Diagram(coordinateSystem(preserveAspectRatio=false)),
    Icon(graphics={
        Line(
          points={{-98,0},{-50,0}},
          color={0,127,0},
          thickness=0.5),
        Line(
          points={{48,0},{100,0}},
          color={0,127,0},
          thickness=0.5),         Line(points={{-64,-66},{70,-66}},
                                                                 color={0,127,0}),
          Line(points={{-34,-88},{-34,-50}}),                   Rectangle(
              extent={{-34,-50},{26,-88}},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid,
          lineColor={0,127,0}), Line(points={{42,-88},{-34,-88},{-34,-50},{42,-50}},
                                                                                   color={0,127,0}),
        Line(points={{-64,-66},{-64,0}}, color={0,140,72}),
        Line(points={{70,-66},{70,0}}, color={0,140,72})}),
    Documentation(info="<html>
<p> extends the <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Components.Assembled.NonLinearSpringChain\">nonlinear spring chain </a> by adding a damper in parallel to the whole spring chain</p>
</html>"));
end DampedSpringChain;
