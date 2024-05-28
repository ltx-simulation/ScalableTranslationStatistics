within ScalableTranslationStatistics;
package Fluid "fluid representation of scalable translation statistics"

  annotation (Icon(graphics={
        Line(
          points={{-98,48},{-78,68},{-60,78},{-34,78},{-2,56},{20,38},{36,30},{
              60,28},{80,34},{98,44},{100,46}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Line(
          points={{-98,-4},{-78,16},{-60,26},{-34,26},{-2,4},{20,-14},{36,-22},
              {60,-24},{80,-18},{98,-8},{100,-6}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Line(
          points={{-96,-54},{-76,-34},{-58,-24},{-32,-24},{0,-46},{22,-64},{38,
              -72},{62,-74},{82,-68},{100,-58},{102,-56}},
          color={28,108,200},
          smooth=Smooth.Bezier)}), Documentation(info="<html>
<p>This is a fluid representation of the Scalable Translation Statistics model.</p>
<p><br><u><span style=\"color: #ee2e2f;\">ATTENTION:</span></u> The Fluid Components defined in this package are strongly simplified and <b>do not represent real physics</b> ! They are intended to demonstrate numerical problems in a physically understandable matter. </p>
<p><br>The fluid representation is almoust analogous to the mechanical representation.</p>
<p><br>A system of equations is created by a pump and N parallel tubes, where N corresponds the size of the system. Both - pump and tubes - have a nonlinear massflow-pressuredrop-relationship. In case of linear systems the pump is also parallel to the tubes, while in nonlinear systems the pump is in series to the parallel tubes. By an assertation in the pump model, nonlinear equation systems with a numerical Jacobian can be created.</p>
<p>The continuous time states are represented by a volume with variable mass. In contrary to the mass in the mechanical representation the volume has only one state variable.</p>
<p>The model for the parametrization:</p>
<p><span style=\"color: #662c91;\">NL_equations = {2,1,5,1,2,2};</span></p>
<p><span style=\"color: #0055ff;\">Lin_equations = {2,3,2};</span></p>
<p><span style=\"color: #aa55ff;\">Num_volumes = 4;</span></p>
<p>looks like this:</p>
<p><img src=\"modelica://ScalableTranslationStatistics/Resources/Example_FluidModel.png\"/></p>
</html>"));
end Fluid;
