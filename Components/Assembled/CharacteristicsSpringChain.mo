within ScalableTranslationStatistics.Components.Assembled;
model CharacteristicsSpringChain
  extends Partial.Partial_SpringChain(
                              redeclare Subcomponents.CharacteristicsSpring
  spring[N](each StiffnessFile=StiffnessFile,
  each tableName=tableName,
  each s_rel( start=s_start),
  each insert_Jacobian=insert_Jacobian));

  parameter String StiffnessFile="modelica://ScalableTranslationStatistics/Resources/SpringStiffness.txt" "File with the definition of the stiffness over deflection(way)";
  parameter String tableName="c_spring" "table inside the StiffnessFile to be read";
  annotation (Placement(transformation(extent={{-60,-8},{-40,12}})),
              Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{-58,-20},{-58,24}},
          color={0,0,0},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
    Line(points={{-58,-20},{-12,-20},{-12,14},{-12,14},{-12,-20},{-26,-20},{-26,
              14},{-12,14},{-12,14},{-12,14},{-12,2},{-58,2},{-58,-8},{-12,-8},
              {-12,-20},{-58,-20},{-58,14},{-26,14},{-26,-20}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-58,0},{-40,14}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-58,-8},{-40,2}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-58,-20},{-40,-8}}),
        Line(
          points={{-58,-20},{-4,-20}},
          color={0,0,0},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-52,0},{-48,-10},{-42,10},{-34,-10},{-28,10},{-20,-10},{-16,
              0}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{6,-20},{6,24}},
          color={0,0,0},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
    Line(points={{6,-20},{52,-20},{52,14},{52,14},{52,-20},{38,-20},{38,14},{52,
              14},{52,14},{52,14},{52,2},{6,2},{6,-8},{52,-8},{52,-20},{6,-20},
              {6,14},{38,14},{38,-20}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{6,0},{24,14}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{6,-8},{24,2}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{6,-20},{24,-8}}),
        Line(
          points={{6,-20},{60,-20}},
          color={0,0,0},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{12,0},{16,-10},{22,10},{30,-10},{36,10},{44,-10},{48,0}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{-16,0},{12,0}},
          color={0,140,72},
          thickness=0.5)}),                                      Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>builds a chain of <a href=\"modelica://ScalableTranslationStatistics.Components.Subcomponents.DiscreteStiffnessSpring\">springs with characteristics</a> in a row </p>
<p>each spring element in the chain has the same characteristic from the file given by the parameter StiffnessFile</p>
</html>"));
end CharacteristicsSpringChain;
