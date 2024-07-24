within ScalableTranslationStatistics.Fluid.Examples.ScaledModels;
model TranslationStatistics_XXS
  extends Modelica.Icons.Example;
  extends
    ScalableTranslationStatistics.Fluid.Model.ScaleTranslationStatistics(
    NL_equations={1},
    Lin_equations={2},
    num_volumes=2,
    num_Inp=0,
    num_Outp=0,
    num_const=0,
    num_free_param=0,
    num_dep_param=0,
    num_alias=0,
    num_Jacobian=0) annotation(IconMap(primitivesVisible=false));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TranslationStatistics_XXS;
