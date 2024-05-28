within ScalableTranslationStatistics.Mechanics.Model;
model ScaleTranslationStatistics
  "baseline model with replaceable spring and mass components"

  parameter Integer NL_equations[:] = 5*ones(8) "sizes of nonlinear equation systems"; //array(2,3,5,11,14,3,8,4,1,1,1,1,1,1,1,1,1,1,1,1,1);
  parameter Integer Lin_equations[:]= {1, 14, 11, 2, 2, 5} "sizes of linear equation systems";
  parameter Integer num_masses=8 "number of masses: will generate 2 state variables per mass";

  parameter Integer num_Inp=8 "number of inputs";
  parameter Integer num_Outp=8 "number of outputs";

  parameter Integer num_const=4 "number of additional constants";
  parameter Integer num_free_param=3 "number of additional free parameters";
  parameter Integer num_dep_param=3 "number of additional dependant parameters";
  parameter Integer num_time_var=1 "number of additional time-varying variables";
  parameter Integer num_alias=1 "number of additional aliases";
  parameter Integer num_Jacobian = 7 "number of numerical jacobians";

  // Parametrization of mass spring chain
  parameter Modelica.Units.SI.TranslationalSpringConstant c(final min=0, start=0)=1 "Spring constant for all springs in the mass-spring system";
  parameter Modelica.Units.SI.Mass m=5 "weight of all Masses";
  parameter Modelica.Units.SI.Position s_initial=0.1 "initial distance between the masses = initial spring deflection";

  // Parametrization of single mass spring subsystem
  parameter Modelica.Units.SI.TranslationalSpringConstant c_stiff(final min=0, start=0)=1e6 "Spring constant for a spring in a separate stiff subsystem";
  parameter Real sleeping_time = 0 "time in [ms], the model will sleep in each time integration step to imitate longer simulation times ";
  parameter Integer compilerType = 1 "1 = Visual Studio;  2= GCC";

  // Inputs and Outputs
  Modelica.Blocks.Interfaces.RealInput inputs[num_Inp] "input signals for the forces" annotation (Placement(transformation(extent={{-122,
            -16},{-90,16}}), iconTransformation(extent={{-122,-16},{-90,16}})));

  Modelica.Blocks.Interfaces.RealOutput outputs[num_Outp]
    "output signals of the position measurement"                                                       annotation (Placement(transformation(extent={{96,-10},
            {116,10}})));

  Modelica.Mechanics.Translational.Sources.Force force[num_Inp] "forces on the mass-spring-system" annotation (Placement(transformation(extent={{-50,-10},
            {-30,10}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor Sensor[num_Outp] "position measurement" annotation (Placement(transformation(extent={{32,-10},
            {52,10}})));

  // Masses
  replaceable Modelica.Mechanics.Translational.Components.Mass mass[num_masses-1](each m=m) constrainedby
    Modelica.Mechanics.Translational.Interfaces.PartialRigid                                                                                                       "masses in the mass-spring chain" annotation (Placement(transformation(extent={{14,46},
            {54,86}})));
  Modelica.Mechanics.Translational.Components.Mass stiffMass(m = m) "single mass for stiff subsystem" annotation (Placement(transformation(extent={{18,-82},
            {58,-42}})));

  // Fixations
  Modelica.Mechanics.Translational.Components.Fixed stiffFixed "fixation of a single mass"
                                                                                          annotation (Placement(transformation(extent={{-88,-82},
            {-48,-42}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 "fixation of the first mass"
                                                                                       annotation (Placement(transformation(extent={{-90,46},
            {-50,86}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed[num_NL-NumVariations+1] if num_NL>NumVariations "fixation for surplus nonlinear spring chains";
  Modelica.Mechanics.Translational.Components.Fixed fixed_linear[num_Lin] "fixation for linear spring chains";

  // Springs
  //   single linear springs
  replaceable Mechanics.Components.Subcomponents.LinearSleepySpring
    stiffSleepySpring(
    c=c_stiff,
    waiting_time=sleeping_time,
    compiler_type=compilerType) constrainedby
    Mechanics.Components.Partial.PartialSleepySpring
    "linear spring connecting a single mass"
    annotation (Placement(transformation(extent={{-40,-82},{0,-42}})));
  //

  Modelica.Mechanics.Translational.Components.Spring simpleSpring[num_masses-1](
    each c=c,
    each s_rel(start=s_initial, fixed=true)) "linear springs connecting the masses";
  //   nonlinear spring chains
  replaceable Mechanics.Components.Assembled.NonLinearSpringChain springChain[
    num_NL](
    each c_1=c,
    each c_2=c,
    each s_start=s_initial,
    num_springs=NL_equations,
    insert_Jacobian=include_Jacobi[:]) constrainedby
    Mechanics.Components.Partial.Partial_SpringChain "nonlinear spring chains"
    annotation (Placement(transformation(extent={{-46,46},{-6,86}})));

  //   linear spring chains
  Mechanics.Components.Assembled.LinearSpringChain linearSpringChain[num_Lin](
    each c_1=c,
    each c_2=c,
    each s_start=s_initial,
    num_springs=Lin_equations[:]) "linear spring chains";
    //s_start=s_initial,+ ones(size(Lin_equations, 1)),
    // insert_Jacobian=include_Jacobian
  // Additional variables, constants, aliases
protected
  Integer constantValue[num_const] = 1:num_const                                                  "additional constants";
  Real time_variable[num_time_var]                                                                "additional time dependent variables";
  Real alias[num_alias]                                                      "additional aliases";
  parameter Boolean include_Jacobi[num_NL]=cat(1,{true for i in (1:min(num_NL,num_Jacobian))},{false for i in (1:max(0,num_NL-num_Jacobian))});

  parameter Boolean include_Jacobian[num_Lin]=cat(1,{true for i in (1:min(num_Lin,max(0,num_Jacobian-num_NL)))},{false for i in (min(num_Lin,max(0,num_Jacobian-num_NL))+1:num_Lin)});
  // Additional parameters
  parameter Integer additional_free_parameters[num_free_param]=ones(num_free_param);
  parameter Real additional_dep_parameters[num_dep_param]=fill(2*c,num_dep_param);

  // Parametrization helpers
  parameter Integer NumVariations = sum(array(i for i in 1:num_masses-2)) "number of possible connection between different masses";
  parameter Integer num_Lin=size(Lin_equations,1) "number of linear equation systems";
  parameter Integer num_NL=size(NL_equations,1) "number of NL equation systems";

equation

  // additional time varying variables and aliases
  time_variable[:]=time*ones(num_time_var);
  alias=time_variable[1]*ones(num_alias);

  // linear springs between all subsequent masses
  for i in 1:num_masses-1 loop
    connect(simpleSpring[i].flange_b,mass[i].flange_a);
  end for;
  for i in 2:num_masses-1 loop
    connect(simpleSpring[i].flange_a, mass[i-1].flange_b);
  end for;
  // first linear spring between first mass and fixation
  connect( simpleSpring[1].flange_a, fixed1.flange) annotation (Line(points={{-48,66},
          {-70,66}},                                                                           color={0,127,0}));

  // Nonlinear Spring Chains
  // if enough NL-equations systems (num_NL) each mass is connected with each other
  for i in 1:min(num_NL,NumVariations) loop
    //Modelica.Utilities.Streams.print("connect mass"+String(Utilities.GetOneVariation_idx1(num_masses-1,i))+" with mass"+ String(Utilities.GetOneVariation_idx2(num_masses-1,i)));
    connect( springChain[i].flange_a, mass[Utilities.GetOneVariation_idx1(num_masses-1,i)].flange_b);
    connect( springChain[i].flange_b, mass[Utilities.GetOneVariation_idx2(num_masses-1,i)].flange_a);
  end for;
  // if there are more NL-equation systems than combination of masses, connect the first mass with a fixation (one per NL-spring)
  if num_NL > NumVariations then
    for i in NumVariations+1:num_NL loop
      connect( springChain[i].flange_b,mass[1].flange_a) annotation (Line(points={{-6,66},
              {14,66}},                                                                             color={0,127,0}));
      connect( springChain[i].flange_a,fixed[i-NumVariations].flange);
    end for;
  end if;

  // adapt the stiffness of the whole system by inserting a independent subsystem with largely different stiffness
  // where the stiffness of the whole system is defined as stiffness := max(abs(eigenvalues))/min(abs(eigenvalues))
  connect(stiffMass.flange_a,stiffSleepySpring.flange_b)
                                                        annotation (Line(points={{18,-62},
          {0,-62}},                                                                               color={0,127,0}));
  connect(stiffFixed.flange,stiffSleepySpring.flange_a)
                                                       annotation (Line(points={{-68,-62},
          {-40,-62}},                                                                              color={0,127,0}));

  // apply forces on the masses and feed them with input signals
  for i in 1:min(num_Inp,num_masses-1) loop
    connect(mass[i].flange_a,force[i].flange) annotation (Line(points={{14,66},{
            14,0},{-30,0}},                                                                    color={0,127,0}));
  end for;
  if num_Inp >num_masses-1 then
    for i in num_masses:num_Inp loop
      connect(mass[1].flange_a,force[i].flange);
    end for;
  end if;

  for i in 1:num_Inp loop
    connect(inputs[i],force[i].f) annotation (Line(points={{-106,0},{-52,0}},                  color={0,127,0}));
  end for;

  // measure position of masses and declare then as output signals
  for i in 1:min(num_Outp,num_masses-1) loop
    connect(mass[i].flange_b,Sensor[i].flange) annotation (Line(points={{54,66},
            {74,66},{74,28},{20,28},{20,0},{32,0}},                                            color={0,127,0}));
  end for;
  if num_Outp >num_masses-1 then
    for i in num_masses:num_Outp loop
      connect(mass[1].flange_b,Sensor[i].flange);
    end for;
  end if;

  for i in 1:num_Outp loop
    connect(outputs[i],Sensor[i].s) annotation (Line(points={{106,0},{80,0},{80,
            0},{53,0}},                                                                        color={0,127,0}));
  end for;

  // definition of linear systems:
  // add linear springs: each one from the last mass to its own fixation
  for i in 1:num_Lin loop
    connect(mass[num_masses-1].flange_b, linearSpringChain[i].flange_a);
    connect(linearSpringChain[i].flange_b,fixed_linear[i].flange);
  end for;
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
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=500,
      Tolerance=1e-5,
      __Dymola_Algorithm="Dassl"),
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
</html>"));
end ScaleTranslationStatistics;
