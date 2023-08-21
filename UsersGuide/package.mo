within ScalableTranslationStatistics;
package UsersGuide "Users Guide"
  extends Modelica.Icons.Information;

  annotation (Documentation(info="<html>
<p>This <b>Modelica</b> package contains - as a central part of the package - a generic model, with translation statistics (characteristics of the model given in Dymola&lsquo;s translation statistics), that can be set by parameters as shown in the following picture:</p>
<p><br><img src=\"modelica://ScalableTranslationStatistics/Resources/Statistics_Match.png\"/> </p>
<p>Therefore, a mechanical spring-mass system is built according to the translation statistics specified by the user </p>
<p>Hence, the central idea behind the model is that every mass has two continuous state variables (position and velocity) and a spring chain (chain of serial connected springs) gives an equation system with a size (number of equations in the system) dependent on the length of the chain. </p>
<p>By assembling masses and spring chains in a smart way, arbitrary translation statistics can be reached. </p>
<p>The central model is <a href=\"modelica://ScalableTranslationStatistics.Model.ScaleTranslationStatistics\">ScalableTranslationStatistics.Model.ScaleTranslationStatistics</a> </p>
<p><br><br><img src=\"modelica://ScalableTranslationStatistics/Resources/Example_ScalableModel.png\"/> </p>
<p><b><u>Big (mass-spring) system</u></b> means the upper part of the figured system including masses 1 to 3.<br>
<b><u>Small (mass-spring) system</u></b> means the lower part of the figured system including mass4.<br></p>
<p>The model is built with replaceable components, that the masses and nonlinear springs in the big spring-mass-system as well as the spring of the small system can easily be exchanged, for example by springs with an other behaviour.</p>

</html>"));
end UsersGuide;
