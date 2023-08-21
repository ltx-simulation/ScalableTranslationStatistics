within ScalableTranslationStatistics.Examples;
model Test_STS_Damped
  parameter Integer Nin=8;
  parameter Integer Nout=8;
  parameter Integer num_NL_equations=5;
  parameter Integer num_NL_equation_systems=8;
  parameter Integer num_masses=50;
  parameter Modelica.Units.SI.TranslationalSpringConstant c_stiff = 1e6;
  parameter Modelica.Units.SI.TranslationalDampingConstant d = 5 "Damping Constant";
  extends Modelica.Icons.Example;
  Model.STS_Damped scalableModelicaModel(
    c=100,
    d=d,
    c_stiff=c_stiff,
    num_Inp=Nin,
    num_Outp=Nout,
    NL_equations=num_NL_equations*ones(num_NL_equation_systems),
    num_masses=num_masses)
    annotation (Placement(transformation(extent={{-20,-32},{36,32}})));
  Modelica.Blocks.Interfaces.RealOutput outputs[Nout] "position signal outputs" annotation (Placement(transformation(extent={{96,-10},
            {116,10}})));

  Components.Subcomponents.InputSignals inputSignals
    annotation (Placement(transformation(extent={{-88,-10},{-68,10}})));
equation

  connect(scalableModelicaModel.outputs, outputs) annotation (Line(points={{37.68,0},
          {106,0}},                    color={0,0,127}));
  connect(inputSignals.outputs[1:min(Nin, 10)], scalableModelicaModel.inputs[1:
    min(Nin, 10)])
    annotation (Line(points={{-67.4,0},{-21.68,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
This model <a href=modelica://ScalableTranslationStatistics.Model.STS_Damped>ScaleTranslationStatistics_Damped</a> is fed with arbitrarily defined input signals. The spring chains have a damper in parallel to reach a steady state at constant forces</li>
</html>"));
end Test_STS_Damped;
