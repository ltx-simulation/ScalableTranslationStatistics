within ScalableTranslationStatistics.Mechanics.Components.Subcomponents;
model CharacteristicsSpring
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
  parameter String StiffnessFile="modelica://ScalableTranslationStatistics/Resources/SpringStiffness.txt" "Name of File, where the Stiffness-Table is defined";
  parameter String tableName="c_spring" "name of the table inside the File";
  parameter Modelica.Units.SI.Distance s_rel0=0 "Unstretched spring length";
  parameter Boolean insert_Jacobian = false "introduce a numerical jacobian";
  parameter Modelica.Units.SI.Force maxForce = 1e20 "upper limit for the spring force";
  function limit = Utilities.LimitationFunction;
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(
    tableOnFile=true,
    tableName=tableName,
    fileName=StiffFile,
    verboseRead=false,
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-36,14},{-16,34}})));
    Modelica.Units.SI.TranslationalSpringConstant c_spring(final min=0, start=0) "Spring constant";
protected
  parameter String StiffFile=Modelica.Utilities.Files.loadResource(StiffnessFile);

equation
  combiTable1Ds.u=(s_rel - s_rel0);
  c_spring=combiTable1Ds.y[1];
  if insert_Jacobian then
    limit(f,maxForce)  = c_spring*(s_rel - s_rel0);
  else
  // spring stiffness depends quadratically on the way
  f  = c_spring* (s_rel - s_rel0);
  end if;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{-44,0},{-98,0},{-100,-2}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{54,0},{102,0}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{-76,-60},{-76,54}},
          color={0,0,0},
          thickness=0.5),
        Polygon(
          points={{-76,56},{-78,50},{-74,50},{-76,56}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,3},{-2,-3},{2,-3},{0,3}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          origin={72,-60},
          rotation=270),
        Line(
          points={{-76,-60},{70,-60}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-88,60},{-80,46}},
          textColor={0,0,0},
          textString="F"),
        Text(
          extent={{66,-44},{74,-58}},
          textColor={0,0,0},
          textString="s"),
        Line(
          points={{-44,0},{-40,-20},{-32,20},{-20,-20},{-10,20},{0,-20},
              {10,20},{20,-20},{30,20},{40,-20},{47.9766,19.8828},{54,0}},
          color={0,140,72},
          thickness=0.5),
        Text(
          extent={{-84,106},{82,72}},
          textColor={28,108,200},
          textString="spring with characteristics"),
    Line(points={{-76,20},{-76,-60},{44,-60},{44,20},{14,20},{14,-60},{-46,-60},
              {-46,20},{-76,20},{-76,0},{44,0},{44,-20},{-76,-20},{-76,-40},{44,
              -40},{44,-60},{-76,-60},{-76,20},{44,20},{44,-60}}),
    Line(points={{-16,40},{-16,-60}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-76,0},{-46,20}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-76,-20},{-46,0}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-76,-40},{-46,-20}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-76,-60},{-46,-40}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-76,20},{-46,40}}),
    Line(points={{-76,40},{-76,-40},{44,-40},{44,40},{14,40},{14,-40},{-46,-40},
              {-46,40},{-76,40},{-76,20},{44,20},{44,0},{-76,0},{-76,-20},{44,
              -20},{44,-40},{-76,-40},{-76,40},{44,40},{44,-40}})}),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>This model represents a spring with nonlinear characteristics </p>
<p>The nonlinear characteristics (stiffness over deflection) is defined via table using <a href=modelica://Modelica.Blocks.Tables.CombiTable1Ds> Modelica.Blocks.Tables.CombiTable1Ds </a></p>
<p>An example for a stiffness table can be found under: <a href=modelica://ScalableTranslationStatistics/Resources/SpringStiffness.txt> Stiffness.txt </a></p>
<p>This file is the default parametrization</p>
<p> example:</p>
<div>
<i>
<table>
<tr>  <td>double</td> <td>c_spring(5,2)</td>   <td># spring stiffness over deflection (way)</td> </tr>
<tr>  <td>-1.5</td>      <td>128</td></tr>
<tr>  <td>-1 </td>       <td>32</td></tr>
<tr>  <td>0 </td>        <td>16</td></tr>
<tr>  <td>1 </td>        <td>32</td></tr>
<tr>  <td>1.5</td>       <td>128</td></tr>
</i>
</table>
</div>

</html>"));
end CharacteristicsSpring;
