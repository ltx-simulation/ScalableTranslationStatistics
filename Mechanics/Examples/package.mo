within ScalableTranslationStatistics.Mechanics;
package Examples
  extends Modelica.Icons.ExamplesPackage;

annotation (Documentation(info="<html>
<p>For this model there are various examples to scale 
<ul>
<li> <a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.ScaledNLEquationSys>the number of equation systems </a> </li>
<li> <a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.ScaledNLEquations>the number of equations in each equation system</a> </li>
<li> <a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.ScaledStates>the number of continuous time states </a></li>
<li> <a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.ScaledModels>all of the upper items simulteanously </a></li>
<li> <a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.ScaledSparsity>the sparsity of the ODE Jacobian (which is not a translation statistic)</a><li>
<li> <a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.ScaledStiffness>the stiffness (relation between smallest and largest eigenvalue, not a translation statistic)</a><li>
</ul>
<p> Futher Examples are given for special purposes enhancing the ScaleTranslationStatistics Model.
The following effects are also considered in these Examples:
</p>
<ul>
<li><a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.Test_STS_Controlled>Control Loop Example </a>: The inputs of the model also depends on the outputs </li>
<li><a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.Test_STS_ControlledDelay>Control Loop Example with Delay </a>: The inputs of the model also depends on former outputs of the model (more than a integrator step size ago) </li>
<li><a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.Test_STS_DiscreteSpring>DiscreteSpring </a>: The stiffness of the spring in the small (stiff) system changing discretely</li>
<li><a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.Test_STS_SpringCharacteristics>SpringCharacteristics </a>: The stiffness of the springs in the spring-chains between the masses must be read from a file and can be nonlinear or even discontinuous</li>
<li><a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.Test_STS_Friction>Friction </a>: Instead of a &quot; flying&quot; mass, the mass is slinding on the ground with friction and has hard stops (using <a href=modelica:\\\\Modelica.Mechanics.Translational.Components.MassWithStopAndFriction>MassWithStopAndFriction </a>)</li>
<li><a href=modelica:\\\\ScalableTranslationStatistics.Mechanics.Examples.Test_STS_numerizedEvents>numerizedEvents</a>:Parametrizable number of events per second simulation time; realized by turning on and off to apply a force on the single mass in the small system</li>
</ul>
</html>"));
end Examples;