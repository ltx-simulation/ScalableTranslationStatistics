within ScalableTranslationStatistics.Fluid.Model;
model ScaleTranslationStatistics
  "baseline model with replaceable spring and mass components"

  parameter Integer NL_equations[:] = 5*ones(8) "sizes of nonlinear equation systems"; //array(2,3,5,11,14,3,8,4,1,1,1,1,1,1,1,1,1,1,1,1,1);
  parameter Integer Lin_equations[:]= {1, 14, 11, 2, 2, 5} "sizes of linear equation systems";
  parameter Integer num_volumes=8 "number of volumes with one continuous time state each";

  parameter Integer num_Inp=10 "number of inputs";
  parameter Integer num_Outp=8 "number of outputs";

  parameter Integer num_const=4 "number of additional constants";
  parameter Integer num_free_param=3 "number of additional free parameters";
  parameter Integer num_dep_param=3 "number of additional dependant parameters";
  parameter Integer num_time_var=1 "number of additional time-varying variables";
  parameter Integer num_alias=1 "number of additional aliases";
  parameter Integer num_Jacobian = 0 "number of numerical jacobians";

  // Parametrization of single mass spring subsystem
  parameter Real delta_p_stiff(final min=0, start=0)=1e9 "Stiffness of mass-flow pressure relationship";
  parameter Integer sleeping_time = 5 "time in [ms], the model will sleep in each time integration step to imitate longer simulation times ";
  parameter Integer compilerType = 1 "1 = Visual Studio;  2= GCC";

  // Inputs and Outputs
  Modelica.Blocks.Interfaces.RealInput inputs[num_Inp] "input signals for the forces" annotation (Placement(transformation(extent={{-122,
            -16},{-90,16}}), iconTransformation(extent={{-122,-16},{-90,16}})));

  Modelica.Blocks.Interfaces.RealOutput outputs[num_Outp]
    "output signals of the position measurement"                                                       annotation (Placement(transformation(extent={{96,-10},
            {116,10}})));

  // Volumes
  Components.TwoPortVolume[num_volumes] volume annotation (Placement(transformation(extent={{-10,30},
            {10,50}})));

  // Fixations / Boundaries
  Components.Boundaries.Boundary_Pressure fixed[num_NL-NumVariations+2](each use_input=true) if num_NL>NumVariations "fixation for surplus nonlinear spring chains" annotation (Placement(transformation(extent={{-90,30},
            {-70,50}})));
  Components.Boundaries.Boundary_MassFlow fixed_linear[num_Lin](each use_input=true) "fixation for linear spring chains" annotation (Placement(transformation(extent={{90,30},
            {70,50}})));

  // Tubes
  //   single linear tubes as default connection between volumes
  Components.LinearComponents.PressureLossTube_Linear simplePressureLossTube[num_volumes-2] "linear tubes as default connection between volumes";

  // nonlinear pump tube networks
  Components.AssembledComponents.TubePumpNetwork nonlinearTubePumpNetwork[num_NL](numNLequations=NL_equations,withNumericJacobian = include_Jacobi)
                                                                                                                                                   annotation (Placement(transformation(extent={{-58,22},
            {-22,58}})));

  //   linear parallel pump networks
  Components.AssembledComponents.ParallelPumps_Linear   linearTubePumpNetwork[num_Lin]( nParallel = Lin_equations)
                                      "linear tube pump network" annotation (Placement(transformation(extent={{58,22},
            {22,58}})));

  // dummy input for massflow and pressure boundaries, if there are not enough input signals
  Modelica.Blocks.Sources.Sine sine[num_Lin+NumSurplusNLEquations+2](each f=2);
  Components.LinearComponents.PressureLossTube_Linear_Sleepy sleepyStiffNetwork(delta_p_nom=delta_p_stiff, compiler_type = compilerType, waiting_time=sleeping_time)
                                                                                                                                                                    annotation (Placement(transformation(extent={{-48,-62},
            {-24,-38}})));

protected
  // Additional variables, constants, aliases
  Integer constantValue[num_const] = 1:num_const "additional constants";
  Real time_variable[num_time_var] "additional time dependent variables";
  Real alias[num_alias] "additional aliases";
  parameter Boolean include_Jacobi[num_NL]=cat(1,{true for i in (1:min(num_NL,num_Jacobian))},{false for i in (1:max(0,num_NL-num_Jacobian))});

  // Additional parameters
  parameter Integer additional_free_parameters[num_free_param]=ones(num_free_param);
  parameter Real additional_dep_parameters[num_dep_param]=fill(2*delta_p_stiff,num_dep_param);

  // Parametrization helpers
  parameter Integer NumVariations = sum(array(i for i in 1:num_volumes-2)) "number of possible connection between different volumes";
  parameter Integer NumSurplusNLEquations = max(0,num_NL-NumVariations) "number of nonlinear equation systems not located between volumes";
  parameter Integer num_Lin=size(Lin_equations,1) "number of linear equation systems";
  parameter Integer num_NL=size(NL_equations,1) "number of NL equation systems";

equation

  // additional time varying variables and aliases
  time_variable[:]=time*ones(num_time_var);
  alias=time_variable[1]*ones(num_alias);

  // linear springs between all subsequent volumes
  for i in 1:num_volumes-2 loop
    connect(simplePressureLossTube[i].fluidPortOut,volume[i+1].fluidPortIn);
  end for;
  for i in 1:num_volumes-2 loop
    connect(simplePressureLossTube[i].fluidPortIn, volume[i].fluidPortOut);
  end for;

  // Nonlinear tube-pump-networks
  // if enough NL-equations systems (num_NL) each volume is connected with each other
  for i in 1:min(num_NL,NumVariations) loop
    //Modelica.Utilities.Streams.print("connect volume"+String(Components.Functions.GetOneVariation_idx1(num_volumes-1,i))+" with volume"+ String(Components.Functions.GetOneVariation_idx2(num_volumes-1,i)));
    connect( nonlinearTubePumpNetwork[i].fluidPortIn, volume[Utilities.GetOneVariation_idx1(num_volumes-1,i)].fluidPortOut);
    connect( nonlinearTubePumpNetwork[i].fluidPortOut, volume[Utilities.GetOneVariation_idx2(num_volumes-1,i)].fluidPortIn);
  end for;

  // if there are more NL-equation systems than combination of masses, connect the first mass with a fixation (one per NL-spring)
  if num_NL > NumVariations then
    for i in NumVariations+1:num_NL loop
      connect( nonlinearTubePumpNetwork[i].fluidPortOut,volume[1].fluidPortIn);
      connect( nonlinearTubePumpNetwork[i].fluidPortIn,fixed[i-NumVariations].fluidPortOut);
    end for;
  end if;

  // apply the input signals as time dependent pressure boundaries
  for i in 1:min(num_Inp, num_NL-NumVariations+1) loop
    connect(inputs[i], fixed[i].p);
  end for;

  // if there are more boundaries than input signals, feed the boundaries with dummy sine curve
  for i in 1:NumSurplusNLEquations-num_Inp+2 loop
    connect(sine[i+num_Lin].y, fixed[i+min(num_Inp, num_NL-NumVariations+1)].p);
  end for;

  // feed the mass_flow boundaries for the linear systems with dummy sine curves
  for i in 1:num_Lin loop
    connect(sine[i].y,  fixed_linear[i].m_flow);
  end for;

  // measure mass inside the volumes and declare it as output signals
  for i in 1:min(num_Outp,num_volumes) loop
    connect(volume[i].m_Volume, outputs[i]);
  end for;

  // if there are more outputs than volumes, use the mass of the first volume multiple times as output
  if num_Outp >num_volumes then
    for i in num_volumes+1:num_Outp loop
      connect(volume[1].m_Volume, outputs[i]);
    end for;
  end if;

  // definition of linear systems:
  // add linear tube-pump-network: each network is connected the last volume with it own massflow boundary
  for i in 1:num_Lin loop
    connect(linearTubePumpNetwork[i].fluidPortIn,fixed_linear[i].fluidPortOut);
    connect(linearTubePumpNetwork[i].fluidPortOut,volume[end].fluidPortOut);
  end for;

  // small system
  // adapt the stiffness of the whole system by inserting a independent subsystem with largely different stiffness
  // where the stiffness of the whole system is defined as stiffness := max(abs(eigenvalues))/min(abs(eigenvalues))
  connect(fixed[end].fluidPortOut, sleepyStiffNetwork.fluidPortIn);
  connect(sleepyStiffNetwork.fluidPortOut, volume[end].fluidPortIn);

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-34,74},{76,-32}},
          lineColor={0,0,0},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          radius=20),
        Rectangle(
          extent={{-64,10},{6,-58}},
          lineColor={0,0,0},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid,
          radius=15),
        Rectangle(
          extent={{-80,-42},{-50,-72}},
          lineColor={0,0,0},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          radius=10)}),
    Diagram(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{-72,-50},{-10,-50}}, color={0,0,0}),
        Line(points={{-80,40},{78,40}}, color={128,0,255}),
        Line(points={{0,28},{0,0},{98,0}}, color={16,12,148}),
        Line(points={{-100,0},{-88,0},{-88,40},{-82,40}}, color={16,12,148}),
          Rectangle(
          extent={{-80,-42},{-78,-58}},
          lineColor={28,108,200},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),  Line(points={{-72,-50},{-76,-50},{-78,-50}},
            color={102,44,145}),
        Text(
          extent={{-88,-42},{-80,-46}},
          textColor={102,44,145},
          textString="p"),
        Polygon(
          points={{-84,-48},{-80,-50},{-84,-52},{-84,-48}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,127}),
        Ellipse(
          extent={{-10,-40},{10,-60}},
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),
        Ellipse(
          extent={{-11,-49.3},{-9,-51.3}},
          lineColor={102,44,145},
          fillColor={102,44,145},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{9,-49.3},{11,-51.3}},
          lineColor={102,44,145},
          fillColor={102,44,145},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{9.3,-49.5},{10.7,-51.1}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255},
          startAngle=0,
          endAngle=360),
        Ellipse(
          extent={{-73,-49.3},{-71,-51.3}},
          lineColor={102,44,145},
          fillColor={102,44,145},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-72.7,-49.5},{-71.3,-51.1}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255}),
        Line(points={{-100,0},{-88,0},{-88,-50},{-82,-50}}, color={0,0,0})}),
    experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=500,
      Tolerance=1e-5,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>In this Modelica model the user can determine most of the measures given in Dymola&lsquo;s translation statistics of the translated model (such as the size of nonlinear equation systems).</p>
<p>The model is built in the physical domain of fluid</p>
<p>A volume-tube-pump network is constructed, that represents the translation statistics </p>
<p><u><b><span style=\"font-size: 10pt;\">Steps to set the &bdquo;correct&ldquo; parameters for the wished translation statistics:</span></b></u></p>
<ol>
<li>set the values of these parameters as wished:</li>
<li><ul>
<li>num_Inp, num_Outp, num_volumes, NL_equations, Lin_equations and num_Jacobian</li>
</ul></li>
<li>set the value of all other parameters to 0</li>
<li>translate the model and set values the other parameters according to the difference between the wished values and the received values (a reduction of the values can not be determined)</li>
<li>translate the model again and check, that the statistics are &bdquo;correct&ldquo;.</li>
</ol>
<p>Example:</p>
<p><img src=\"modelica://ScalableTranslationStatistics/Resources/Example_FluidModel.png\"/> </p>
<p><u><b><span style=\"font-size: 12pt;\">remarks on the parameters: </span></b></u></p>
<ul>
<li><i><b>num_volumes:</b></i> each volume has one continuous state variable (mass in the volume), so the number continuous states by this parameter </li>
<li><i><b>Lin_equations:</b></i> Linear equation systems are created by parallel pumps with linear characteristics: 3 parallel pumps give a system of three linear equations after the tool-internal manipulation. </li>
<p>[One linear equation is not possible, cause it can be resolved by the manipulation, for zero linear equations type one, otherwise it disappears in the statistics ] This pump network connects the last volume with a mass-flow boundary. </p>
<li><i><b>NL_equations:</b></i> nonlinear equation systems are created by pump-tube networks with a pump followed by N parallel tubes, where N is the number of equations in the nonlinear system. Pump and tubes have a nonlinear massflow-pressuredrop-relationship.</li>
<p>In opposite to linear equation system there are no limitations on the values </p>
<p>The nonlinear pump-tube-networks connect all possible combinations of different volumes (e.g. for 3 volumes : v1-v2, v2-v3 and v1-v3). </p>
<p>If more equation systems are given than possible combinations , the first volume is connected with a pressure-boundary for each surplus system.</p>
<p>All volumes are connected with the neighboored volume by one linear tube (no equation system). So it doesn&lsquo;t matter, if less equation systems are given than needed to connect all volumes </p>
<li><i><b>num_Inp:</b></i> Inputs are used to define the dynamic pressure boundaries. Surplus inputs are not used. </li>
<li><i><b>num_Outp:</b></i> Outputs are measurements of the mass of the volumes. If more outputs are desired than volumes available, some outputs are duplicated. (more outputs than given can appear, if e.g. CPUtime and/or EventCounter are activated). </li>
<li><i><b>num_Jacobian:</b></i> Add numerical Jacobi matrices by a function with assert statements without the smooth-annotation according to Dymola User Manual, chapter 13.2.1 &bdquo;Analytic Jacobians&ldquo;. <br>The number of numerical Jacobians is limited by the number of nonlinear equation systems given by &bdquo;NL_equations&ldquo; </li>
<li><i><b>num_free_param, num_const :</b></i> All additional constants and free parameters have the value 1 </li>
<li><i><b>num_dep_param:</b></i> All additional dependent parameters depend on the massflow-pressuredrop relationship constant (e.g. 0.7 bar pressure drop at 1 kg/s). </li>
<li><i><b>num_time_var:</b></i> additional time-varying variables are copies of the variable &bdquo;time&ldquo; </li>
<li><i><b>delta_p_stiff:</b></i> stiff massflow-pressuredrop relationship constant used in the small subsystem.</li>
<li><i><b>sleeping_time:</b></i> each time the equation of the linear tube in the small subsystem (see delta_p_stiff) will be executed, the execution will pause this time [given in milliseconds].<br>In this way longer simulation times can be imitated </li>
<li><i><b>compilerType:</b></i> Type of the c-compiler used (&quot;1&quot; for Visual Studio and &quot;2&quot; for gcc). This information is necessary because the implementation of the sleeping routine depends on the compiler </li>
</ul>
</html>"));
end ScaleTranslationStatistics;
