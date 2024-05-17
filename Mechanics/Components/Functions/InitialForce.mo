within ScalableTranslationStatistics.Mechanics.Components.Functions;
function InitialForce
  input Integer mode "current step of the discrete stiffness";
  input Real[:] stiffness_steps "array of stiffness in order of increasing deflection";
  input Real[:] s_fullsteps "array of deflections, where the stiffness is changing discretely";
  input Real s_rel0 "initial deflection for which the force should be calculated";
  output Real f0 "force of the spring at s_rel0";
protected
  Integer n;
algorithm
    f0:=0;
    n:=1;
    while n < mode loop
      f0:=f0 + stiffness_steps[n]*(s_fullsteps[n + 1] - s_fullsteps[n]);
      n:=n+1;
    end while;
    f0:=f0 + stiffness_steps[n]*(s_rel0 - s_fullsteps[n]);
  annotation (Documentation(info="<html>
<p>function to calculate the initial force of a spring with discrete stiffness steps, if the unstreched length of the spring is not zero. The function is only used for the initialization of <a href=\"modelica://ScalableTranslationStatistics.Mechanics.Components.Subcomponents.DiscreteStiffnessSpring\">DiscreteStiffnessSprings</a>. </p>
</html>"));
end InitialForce;
