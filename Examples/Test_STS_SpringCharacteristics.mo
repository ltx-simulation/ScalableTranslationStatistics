within ScalableTranslationStatistics.Examples;
model Test_STS_SpringCharacteristics
  parameter Integer Nin=8;
  parameter Integer Nout=8;
  parameter Integer num_NL_equations=5;
  parameter Integer num_NL_equation_systems=8;
  parameter Integer num_masses=50;
  parameter Modelica.Units.SI.TranslationalSpringConstant c_stiff = 1e6;
  extends Modelica.Icons.Example;
  Model.STS_springCharacteristics scalableModelicaModel(
    c=100,
    c_stiff=c_stiff,
    NL_equations=num_NL_equations*ones(num_NL_equation_systems),
    num_masses=num_masses)
    annotation (Placement(transformation(extent={{-28,-40},{42,40}})));

  Modelica.Blocks.Interfaces.RealOutput outputs[Nout] "position signal outputs" annotation (Placement(transformation(extent={{96,-10},
            {116,10}})));

  Components.Subcomponents.InputSignals inputSignals
    annotation (Placement(transformation(extent={{-84,-12},{-64,12}})));
equation

  connect(inputSignals.outputs[1:min(Nin, 10)], scalableModelicaModel.inputs[1:
    min(Nin, 10)])
    annotation (Line(points={{-63.4,0},{-30.1,0}},  color={0,0,127}));
  connect(scalableModelicaModel.outputs, outputs)
    annotation (Line(points={{44.1,0},{106,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
The model <a href=modelica://ScalableTranslationStatistics.Model.STS_SpringCharacteristics>SpringCharacteristics </a> is fed with arbitrarily defined input signals. The stiffness of the springs in the spring-chains between the masses must be read from a file and can be nonlinear or even discontinuous</li>
</html>"));
end Test_STS_SpringCharacteristics;
