package ScalableTranslationStatistics "Scalable Translation Statistics - Version 1.2.0"




  annotation (
          version="1.2.0",
          uses(Modelica(version="4.0.0")),

Documentation(info="<html>
<p> This Modelica package offers the possibility to create  models with <u>user-specified</u> TranslationStatistics such as the number and size of nonlinear equation systems in the model.</p>
<p>The Translation statistics of Dymola describes statistic measures of the Modelica model after symbolic manipulation and translation.<br>This process is e.g. described in: <a href=https://www.claytex.com/tech-blog/model-translation-and-symbolic-manipulation>www.claytex.com/tech-blog/model-translation-and-symbolic-manipulation</a> 
<p>For a more detailed description of the idea behind this package and the realization see the <b><a href=modelica://ScalableTranslationStatistics.UsersGuide>UsersGuide</a></b>.</p> 

<p> This idea is realized in a mechanical and - in a limited edition - in a fluid representation

<p>For the mechanical model there are various examples to scale 
<ul>
<li> <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.ScaledNLEquationSys\">the number of equation systems </a> </li>
<li> <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.ScaledNLEquations\">the number of equations in each equation system</a> </li>
<li> <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.ScaledStates\">the number of continuous time states </a></li>
<li> <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.ScaledModels\">all of the upper items simulteanously </a></li>
<li> <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.ScaledSparsity\">the sparsity of the ODE Jacobian (which is not a translation statistic)</a></li>
<li> <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.ScaledStiffness\">the stiffness (relation between smallest and largest eigenvalue, not a translation statistic)</a></li>
</ul>
<p> Futher Examples are given for special purposes enhancing the ScaleTranslationStatistics Model.
The following effects are additionally considered in these Examples:
</p>
<ul>
<li><a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.Test_STS_Controlled\">Control Loop Example </a>The inputs of the model also depends on the outputs </li>
<li><a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.Test_STS_ControlledDelay\">Control Loop Example with Delay </a>The inputs of the model also depends on former outputs of the model (more than a integrator step size ago) </li>
<li><a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.Test_STS_DiscreteSpring\">DiscreteSpring </a>The stiffness of the spring in the small (stiff) system changing discretely</li>
<li><a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.Test_STS_SpringCharacteristics\">SpringCharacteristics </a>The stiffness of the springs in the spring-chains between the masses must be read from a file and can be nonlinear or even discontinuous</li>
<li><a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.Test_STS_Friction\">Friction </a>Instead of a &quot; flying&quot; mass, the mass is slinding on the ground with friction and has hard stops (using <a href=modelica://Modelica.Mechanics.Translational.Components.MassWithStopAndFriction>MassWithStopAndFriction </a></li>
<li><a href=\"modelica://ScalableTranslationStatistics.Mechanics.Examples.Test_STS_numerizedEvents\">numerizedEvents</a>Parametrizable number of events per second simulation time; realized by turning on and off to apply a force on the single mass in the small system</li>
</ul>
</html>"),
Icon(graphics={
        Rectangle(
          extent={{-36,76},{74,-30}},
          lineColor={0,0,0},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          radius=20),
        Rectangle(
          extent={{-66,12},{4,-56}},
          lineColor={0,0,0},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid,
          radius=18),
        Rectangle(
          extent={{-82,-40},{-52,-70}},
          lineColor={0,0,0},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          radius=10)}));
end ScalableTranslationStatistics;
