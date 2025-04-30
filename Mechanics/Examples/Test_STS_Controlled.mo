within ScalableTranslationStatistics.Mechanics.Examples;
model Test_STS_Controlled
  parameter Integer Nin=8;
  parameter Integer Nout=Nin;
  parameter Integer num_NL_equations=5;
  parameter Integer num_NL_equation_systems=8;
  parameter Integer num_masses=50;
  parameter Modelica.Units.SI.TranslationalSpringConstant c_stiff = 1e6;
  extends Modelica.Icons.Example;
  Mechanics.Model.ScaleTranslationStatistics scalableModelicaModel(
    c=100,
    c_stiff=c_stiff,
    NL_equations=num_NL_equations*ones(num_NL_equation_systems),
    num_masses=num_masses)
    annotation (Placement(transformation(extent={{-10,0},{68,74}})));
  Modelica.Blocks.Interfaces.RealOutput outputs[Nout] "position signal outputs";

  Modelica.Blocks.Math.Feedback feedback[Nin]
    annotation (Placement(transformation(extent={{-8,-16},{-28,-36}})));
  Modelica.Blocks.Sources.Constant Sollposition[Nin](k=0.75*linspace(1,Nin,Nin)) "Sollposition Masse 4"
    annotation (Placement(transformation(extent={{28,-36},{8,-16}})));

  Modelica.Blocks.Continuous.PID PID[Nin](
    each k=100,
    each Ti=1,
    each Td=10,
    each Nd=10,
    each initType=Modelica.Blocks.Types.Init.NoInit)
    annotation (Placement(transformation(extent={{-40,-36},{-60,-16}})));
  Utilities.InputSignals inputSignals
    annotation (Placement(transformation(extent={{-90,32},{-70,52}})));
  Modelica.Blocks.Math.Add add[Nin]
    annotation (Placement(transformation(extent={{-50,26},{-30,46}})));
equation
  for i in 1:Nout loop
    connect(outputs[i], scalableModelicaModel.outputs[i]);
  end for;

  for k in 1:Nin loop
    connect(feedback[k].u2, scalableModelicaModel.outputs[k]) annotation (Line(
        points={{-18,-18},{-18,-6},{80,-6},{80,37},{70.34,37}},
                                                             color={0,0,127}));
    connect(Sollposition[k].y, feedback[k].u1)
    annotation (Line(points={{7,-26},{-10,-26}}, color={0,0,127}));
    connect(feedback[k].y, PID[k].u)
    annotation (Line(points={{-27,-26},{-38,-26}},
                                                 color={0,0,127}));

  end for;
  connect(PID.y, add.u2) annotation (Line(points={{-61,-26},{-66,-26},{-66,30},
          {-52,30}}, color={0,0,127}));
  connect(add.y, scalableModelicaModel.inputs)
    annotation (Line(points={{-29,36},{-29,37},{-12.34,37}}, color={0,0,127}));
  connect(inputSignals.outputs[1:Nin], add.u1)
    annotation (Line(points={{-69.4,42},{-52,42}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
This model extends <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Model.STS_Controlled>\"Control Loop Example </a>: The inputs of the model also depends on the outputs </li>
</html>"));
end Test_STS_Controlled;
