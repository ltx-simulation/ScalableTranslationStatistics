within ScalableTranslationStatistics;
package UsersGuide "Users Guide"
  extends Modelica.Icons.Information;

  annotation (Documentation(info="<html>
<p>This <b>Modelica</b> package contains - as a central part of the package - a generic model, with translation statistics (characteristics of the model given in Dymola&lsquo;s translation statistics), that can be set by parameters as shown in the following picture:</p>
<p><br><img src=\"modelica://ScalableTranslationStatistics/Resources/Statistics_Match.png\"/> </p>
<p>This is done in a mechanical example and - in a very limited edition - in a fluid example. In the following the mechanical example will be described:</p>
<p><br>A mechanical spring-mass system is built according to the translation statistics specified by the user </p>
<p>Hence, the central idea behind the model is that every mass has two continuous state variables (position and velocity) and a spring chain (chain of serial connected springs) gives an equation system with a size (number of equations in the system) dependent on the length of the chain. </p>
<p>By assembling masses and spring chains in a smart way, arbitrary translation statistics can be reached. </p>
<p>The central model is <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Model.ScaleTranslationStatistics\">ScalableTranslationStatistics.Mechanics.Model.ScaleTranslationStatistics</a> </p>
<p><br><br><img src=\"modelica://ScalableTranslationStatistics/Resources/Example_ScalableModel.png\"/> </p>
<p><br><u><b>Big (mass-spring) system</b></u> means the upper part of the figured system including masses 1 to 3.</p><p><br><u><b>Small (mass-spring) system</b></u> means the lower part of the figured system including mass4.</p>
<p>The model is built with replaceable components, that the masses and nonlinear springs in the big spring-mass-system as well as the spring of the small system can easily be exchanged, for example by springs with an other behaviour. </p>
</html>"));
end UsersGuide;
