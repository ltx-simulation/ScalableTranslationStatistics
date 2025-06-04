within ScalableTranslationStatistics.Fluid.Examples.ScaledModels;
model TranslationStatistics_XXS "minimal example"
  extends Modelica.Icons.Example;
  extends
    ScalableTranslationStatistics.Fluid.Examples.Test_ScaleTranslationStatistics(
    Nout=2,
    Nin=0,
    num_NL_equation_systems=1,
    num_NL_equations=1,
    num_volumes=2,
    scalableModelicaModel(
      Lin_equations={2},
      num_const=0,
      num_free_param=0,
      num_dep_param=0,
      num_alias=0,
      num_Jacobian=0));
 annotation(IconMap(primitivesVisible=false),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end TranslationStatistics_XXS;
