within ScalableTranslationStatistics.Examples;
model Test_ScaleTranslationStatistics "ScaleTranslationStatistics with arbitrary input signals"
  parameter Integer Nin=8 "number of input signals into the ScaleTranslationStatistics Model";
  parameter Integer Nout=8 "number of output signals of the ScaleTranslationStatistics Model";
  parameter Integer num_NL_equations=5 "number nonlinear equations in each equation system";
  parameter Integer num_NL_equation_systems=8 "number nonlinear equation systems";
  parameter Integer num_masses=50 "number of masses in the mass-spring system";
  parameter Modelica.Units.SI.TranslationalSpringConstant c_stiff = 1e6 "stiffness of the small system";
  extends Modelica.Icons.Example;
  Model.ScaleTranslationStatistics scalableModelicaModel(
    c=100,
    c_stiff=c_stiff,
    NL_equations=num_NL_equations*ones(num_NL_equation_systems),
    num_masses=num_masses)
    annotation (Placement(transformation(extent={{-28,-34},{40,34}})));
  Components.Subcomponents.InputSignals inputSignals
    annotation (Placement(transformation(extent={{-98,-18},{-64,18}})));
  Modelica.Blocks.Interfaces.RealOutput outputs[Nout] "position signal outputs" annotation (Placement(transformation(extent={{96,-10},
            {116,10}})));
equation

  connect(inputSignals.outputs[1:min(Nin,10)], scalableModelicaModel.inputs[1:min(Nin,10)]) annotation (Line(
        points={{-62.98,0},{-30.04,0}},                          color={0,0,127}));
  connect(scalableModelicaModel.outputs, outputs) annotation (Line(points={{42.04,0},
          {106,0}},                          color={0,0,127}));
  annotation (Documentation(info="<html>
<p>The model <a href=modelica://ScalableTranslationStatistics.Model.ScaleTranslationStatistics>ScaleTranslationStatistics</a> is fed with arbitrarily defined input signals.<br> Physically this means to apply forces on the masses.</p>
<p>In contrast to the scaleModelicaModel without input signals, the system is permanently in motion and won't reach a steady state</p>
<p>The result are the trajectories stored in \"outputs\", giving the position of the masses in the model. <br>If there are more outputs than masses, all supplementary outputs are the position of the first mass.</p>
</html>"), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end Test_ScaleTranslationStatistics;
