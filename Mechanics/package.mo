within ScalableTranslationStatistics;
package Mechanics "mechanical representation of scalable translation statistics"

annotation(Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(
          extent={{-60,60},{60,-60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=360),
        Polygon(
          points={{-14,58},{-6,78},{6,78},{14,58},{-14,58}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=36,
          origin={-94,128}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=72,
          origin={-150,50}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=108,
          origin={-150,-50}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=144,
          origin={-94,-128}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=180,
          origin={0,-158}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=216,
          origin={94,-127}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=252,
          origin={150,-49}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=288,
          origin={150,51}),
        Polygon(
          points={{10,48},{18,68},{30,68},{38,48},{10,48}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=-36,
          origin={-12,22})}),
    Documentation(info="<html>
<p>In this Modelica model the user can determine most of the measures given in Dymola&lsquo;s translation statistics of the translated model (such as the size of nonlinear equation systems).</p>
<p>The model is built in the physical domain of mechanics</p>
<p>A spring-mass system is constructed, that represents the translation statistics</p>
 
<p><u><b><span style=\"font-size: 10pt;\">Steps to set the &bdquo;correct&ldquo; parameters for the wished translation statistics:</span></b></u></p>
<ol><li><p>set the values of these parameters as wished:</p></li>
<ul>
<p><li>num_Inp, num_Outp, num_masses, NL_equations, Lin_equations and num_Jacobian</li> </p>
</ul>
<p><li>set the value of all other parameters to 0</li> </p>
<p><li>translate the model and set values the other parameters according to the difference between the wished values and the received values (a reduction of the values can not be determined)</li> </p>
<p><li>translate the model again and check, that the statistics are &bdquo;correct&ldquo;.</li> </p></ol>
<p><br><br><img src=\"modelica://ScalableTranslationStatistics/Resources/Example_ScalableModel.png\"> </p>
<p>The masses and nonlinear springs in the big spring-mass-system and the spring of the small system are replaceable to apply different kind of springs/masses there </p>
<p><u><b><span style=\"font-size: 10pt;\">remarks on the parameters: </span></b></u></p>
<ul>
<li><p><b><i>num_masses:</i></b> each mass has two state variables (position, velocity), so the number of masses in the system is set here </p></li>
<li><p><b><i>Lin_equations:</i></b> Linear equation systems are created by chains of linear springs: 3 springs in a row e.g. give two linear equations after the tool-internal manipulation. </p>
<p>[One linear equation is not possible, cause it can be resolved by the manipulation, for zero linear equations type one, otherwise it disappears in the statistics ] The spring chains connects the last mass with one fixation point per spring chain </p></li>
<li><p><b><i>NL_equations:</i></b> nonlinear equation systems are created by chains of nonlinear springs with increasing stiffness dependent on the deflection.</p>
<p>In opposite to linear equation system there are no limitations on the values </p>
<p>The nonlinear spring chains connect all possible combinations of different masses (e.g. for 3 masses: m1-m2, m2-m3 and m1-m3). </p>
<p>If more equation systems are given than possible combinations , the first mass is connected with one fixation point per spring chain. </p>
<p>All masses are connected with the neighboored masses by one linear spring (no equation system). So it doesn&lsquo;t matter, if less equation systems are given than possible combinations </p></li>
<li><p><b><i>num_Inp:</i></b> Inputs is a vector of forces, applied on different masses in the system </p></li>
<li><p><b><i>num_Outp:</i></b> Outputs are measurements of the position of the masses (more outputs can appear, if e.g. CPUtime and/or EventCounter are activated) </p></li>
<li><p><b><i>num_Jacobian:</i></b> Add numerical Jacobi matrices by a function with assert statements without the smooth-annotation according to Dymola User Manual, chapter 13.2.1 &bdquo;Analytic Jacobians&ldquo;. <br> The number of numerical Jacobians is limited by the number of nonlinear equation systems given by &bdquo;NL_equations&ldquo;   </p></li>
<li><p><b><i>num_free_param, num_const :</i></b> All additional constants and free parameters have the value 1 </p></li>
<li><p><b><i>num_dep_param:</i></b> All additional dependent parameters depend on the spring stiffness. </p></li>
<li><p><b><i>num_time_var:</i></b> additional time-varying variables are copies of the variable &bdquo;time&ldquo; </p></li>
<li><p><b><i>c:</i></b> spring stiffness of all springs in the big mass spring subsystem </p></li>
<li><p><b><i>m:</i></b> weight of all masses<br> the parameters c and m influence the eigenvalues of the big subsystem which are all in roughly the same range</p></li>
<li><p><b><i>s_start:</i></b> initial distance between the masses of the big system and so the initial deflection of the linear springs inbetween. <br> If no input signals are given and this parameter is set to 0, there is no movement in the total system implying the possibility of large integrator steps</p></li>
<li><p><b><i>c_stiff:</i></b> spring stiffness of the spring in the small subsystem.<br> the eigenvalue of this subsystem is +-sqrt(c_stiff/m) <br> by defining c_stiff largly different than \"c\", the total system can be made stiff </p></li>
<li><p><b><i>sleeping_time:</i></b> each time the equation of the spring in the small subsystem (see c_stiff) will be executed, the execution will pause this time [given in milliseconds].<br> In this way longer simulation times can be imitated </p></li>
<li><p><b><i>compilerType:</i></b> Type of the c-compiler used (\"1\" for Visual Studio and \"2\" for gcc). This information is necessary because the implementation of the sleeping routine depends on the compiler </p></li>

</ul>
</html>"),
    Diagram(graphics={
        Ellipse(
          extent={{-60,60},{60,-60}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=360),
        Polygon(
          points={{-14,58},{-6,78},{6,78},{14,58},{-14,58}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=36,
          origin={-94,128}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=72,
          origin={-150,50}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=108,
          origin={-150,-50}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=144,
          origin={-94,-128}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=180,
          origin={0,-158}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=216,
          origin={94,-127}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=252,
          origin={150,-49}),
        Polygon(
          points={{-14,-100},{-6,-80},{6,-80},{14,-100},{-14,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=288,
          origin={150,51}),
        Polygon(
          points={{10,48},{18,68},{30,68},{38,48},{10,48}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          rotation=-36,
          origin={-12,22})}));
end Mechanics;
