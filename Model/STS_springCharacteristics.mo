within ScalableTranslationStatistics.Model;
model STS_springCharacteristics
  "ScaleTranslationStatistics with spring stiffness read from table/file"
  extends ScaleTranslationStatistics(
    redeclare Components.Assembled.CharacteristicsSpringChain springChain(
      each StiffnessFile=StiffnessFile,
      each tableName=tableName,
      each s_start=s_initial,
      num_springs=NL_equations,
      insert_Jacobian=include_Jacobi[:]),
    redeclare Modelica.Mechanics.Translational.Components.Mass mass[num_masses
       - 1](each m=m),
    redeclare Components.Subcomponents.LinearSleepySpring stiffSleepySpring);
  parameter String StiffnessFile="modelica://ScalableTranslationStatistics/Resources/SpringStiffness.txt" "Filename of the characteristics of the spring stiffness for all springs in the mass-spring system";
  parameter String tableName="c_spring";

  Modelica.Blocks.Interfaces.RealOutput Stiffness_Outputs[size(NL_equations,1)]
    "output signals of the position measurement"
    annotation (Placement(transformation(extent={{96,-36},{116,-16}})));
  Modelica.Blocks.Sources.RealExpression realExpression[size(NL_equations,1)](y=springChain[:].spring[1].c_spring)
    annotation (Placement(transformation(extent={{56,-36},{76,-16}})));
equation
  connect(realExpression.y, Stiffness_Outputs)
    annotation (Line(points={{77,-26},{106,-26}}, color={0,0,127}));
   // realExpression[:].y;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=500,
      Tolerance=1e-5,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>This is an extension of <a href=modelica://ScalableTranslationStatistics.Model.ScaleTranslationStatistics>ScaleTranslationStatistics</a>.<br>
In this model the spring stiffness is defined via a characteristics table read from a file. (Instead of the equation-based spring-stiffness in the basis model).<br>
This leads to higher numerical complexity and the necessity of access to the disk.<br>
The additional parameters:
<ul>
<li>
<i>StiffnessFile</i>:File containing the stiffness characteristics, defined according to the specifications in <a href=modelica://Modelica.Blocks.Tables.CombiTable1Ds> Modelica.Blocks.Tables.CombiTable1Ds </a>
</li><li>
<i>tableName</i>: name of the table to be read from the <i>StiffnessFile</i>
</li>
</ul>
are needed for the characteristics spring.
</p>
<p>The model also offers a second output array containing these spring stiffnesses of the spring chains. This output is discontinuous due to the interpolation setting made in <a href=modelica://Modelica.Blocks.Tables.CombiTable1Ds> Modelica.Blocks.Tables.CombiTable1Ds </a>.
Discontinuous output signals can increase the model complexity.  
</p>
</html>"));
end STS_springCharacteristics;
