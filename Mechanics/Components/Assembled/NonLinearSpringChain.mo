within ScalableTranslationStatistics.Mechanics.Components.Assembled;
model NonLinearSpringChain
  extends Partial.Partial_SpringChain(
                              redeclare Subcomponents.NonlinearSpring spring[N](c=c, each insert_Jacobian=insert_Jacobian));
  parameter Modelica.Units.SI.TranslationalSpringConstant c_1(final min=0, start=0)=1 "Spring constant of first, third, fifth,... spring in chain";
  parameter Modelica.Units.SI.TranslationalSpringConstant c_2(final min=0, start=0)=1e6 "Spring constant of second, fourth, sixt,... spring in chain";
protected
  parameter Modelica.Units.SI.TranslationalSpringConstant c[N]=c_1*array(i-2*floor(i/2) for i in 1:N)+c_2*array(i+1-2*floor((i+1)/2) for i in 1:N);

  annotation (Placement(transformation(extent={{-60,-8},{-40,12}})),
              Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{-52,-18},{-46,-6},{-40,-2},{-30,0},{-20,10},{-10,18}},
          color={238,46,47},
          thickness=1,
          smooth=Smooth.Bezier),
        Line(
          points={{-50,0},{-46,-20},{-38,20},{-26,-20},{-16,20},{-10,0}},
          color={0,127,0},
          thickness=0.5),
        Line(
          points={{8,0},{12,-20},{20,20},{32,-20},{42,20},{48,0}},
          color={0,127,0},
          thickness=0.5),
        Line(
          points={{-10,0},{8,0}},
          color={0,127,0},
          thickness=0.5),
        Line(
          points={{6,-20},{12,-8},{18,-4},{28,-2},{38,8},{48,16}},
          color={238,46,47},
          thickness=1,
          smooth=Smooth.Bezier)}),                                               Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>builds a chain of <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Components.Subcomponents.NonlinearSpring\">nonlinear springs</a> in a row with alternating stiffness (c_1, c_2) of the single springs</p>

</html>"));
end NonLinearSpringChain;
