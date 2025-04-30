within ScalableTranslationStatistics.Mechanics.Components.Assembled;
model Linear2DSpringChain
  extends Partial.Partial_SpringChain( N= integer(ceil((num_springs+1)/2)),
  redeclare Subcomponents.TwoDimSpring spring[N](c=c,insert_Jacobian=Jacs));
  parameter Modelica.Units.SI.TranslationalSpringConstant c_1(final min=0, start=0)=1 "Spring constant of first, third, fifth,... spring in chain";
  parameter Modelica.Units.SI.TranslationalSpringConstant c_2(final min=0, start=0)=1e6 "Spring constant of second, fourth, sixt,... spring in chain";
protected
  parameter Modelica.Units.SI.TranslationalSpringConstant c[N]=c_1*array(i-2*floor(i/2) for i in 1:N)+c_2*array(i+1-2*floor((i+1)/2) for i in 1:N);
  parameter Boolean Jacs[N] = if insert_Jacobian then cat(1,{true},fill(false, N-1)) else fill(false,N);
  // without a implied numeric Jacobian, Dymola gets resolved one equation
  // (e.g. 3 springs gives a system of 2 equations), with numeric Jacobian each spring gives an equation. So one spring less is needed then.
equation

  for i in 1:N loop
    connect(spring[i].flange_b2, flange_b);
  end for;

  annotation (Placement(transformation(extent={{-60,-8},{-40,12}})),
              Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{-20,0},{-2,0}},
          color={0,127,0},
          thickness=0.5),
        Line(
          points={{-90,0},{-72,0}},
          color={0,127,0},
          thickness=0.5),
        Line(
          points={{74,0},{92,0}},
          color={0,127,0},
          thickness=0.5),
        Ellipse(
          extent={{-52,8},{-40,-8}},
          lineColor={28,108,200},
          fillPattern=FillPattern.CrossDiag,
          fillColor={0,140,72}),
        Line(
          points={{-58,4},{-54,8},{-50,-2},{-44,8},{-40,2}},
          color={0,140,72},
          thickness=0.5,
          origin={-42,66},
          rotation=90),
        Line(
          points={{-72,0},{-66,20},{-60,-20},{-56,20},{-48,0}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{-44,0},{-38,-20},{-32,20},{-28,-20},{-20,0}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{-58,4},{-54,8},{-50,-2},{-44,8},{-40,2}},
          color={0,140,72},
          thickness=0.5,
          origin={-44,32},
          rotation=90),
        Line(
          points={{64,0},{82,0}},
          color={0,127,0},
          thickness=0.5),
        Line(
          points={{-6,0},{12,0}},
          color={0,127,0},
          thickness=0.5),
        Ellipse(
          extent={{32,8},{44,-8}},
          lineColor={28,108,200},
          fillPattern=FillPattern.CrossDiag,
          fillColor={0,140,72}),
        Line(
          points={{-58,4},{-54,8},{-50,-2},{-44,8},{-40,2}},
          color={0,140,72},
          thickness=0.5,
          origin={42,66},
          rotation=90),
        Line(
          points={{12,0},{18,20},{24,-20},{28,20},{36,0}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{40,0},{46,-20},{52,20},{56,-20},{64,0}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{-58,4},{-54,8},{-50,-2},{-44,8},{-40,2}},
          color={0,140,72},
          thickness=0.5,
          origin={40,32},
          rotation=90),
        Line(
          points={{-44,26},{-44,48},{90,48},{90,0}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{40,26},{40,36},{90,36}},
          color={0,140,72},
          thickness=0.5),
        Text(
          extent={{-82,96},{76,66}},
          textColor={0,140,72},
          textString="2dimSprings
N=%num_springs%")}),                                                             Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>builds a chain of <a href=\"modelica://Modelica.Mechanics.Translational.Components.Spring\">linear springs</a> in a row with alternating stiffness (c_1, c_2) of the single springs.</p>
</html>"));
end Linear2DSpringChain;
