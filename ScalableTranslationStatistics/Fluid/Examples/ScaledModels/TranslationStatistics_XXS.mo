within ScalableTranslationStatistics.Fluid.Examples.ScaledModels;
model TranslationStatistics_XXS
  extends Modelica.Icons.Example;
  Modelica.Blocks.Interfaces.RealOutput outputs[size(scaleTranslationStatistics.outputs,
    1)] "output signals of the position measurement"
    annotation (Placement(transformation(extent={{98,-10},{118,10}})));
  Utilities.InputSignals inputSignals
    annotation (Placement(transformation(extent={{-94,-18},{-60,18}})));
  ScalableTranslationStatistics.Fluid.Model.ScaleTranslationStatistics scaleTranslationStatistics(    NL_equations={1},
    Lin_equations={2},
    num_volumes=2,
    num_Inp=0,
    num_Outp=0,
    num_const=0,
    num_free_param=0,
    num_dep_param=0,
    num_alias=0,
    num_Jacobian=0)
    annotation (Placement(transformation(extent={{-24,-40},{50,40}})));
equation
  connect(scaleTranslationStatistics.outputs, outputs)
    annotation (Line(points={{52.22,0},{108,0}}, color={0,0,127}));
  connect(inputSignals.outputs[1:0], scaleTranslationStatistics.inputs[1:0])
    annotation (Line(points={{-58.98,0},{-26.22,0}}, color={0,0,127}));
 annotation(IconMap(primitivesVisible=false),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TranslationStatistics_XXS;
