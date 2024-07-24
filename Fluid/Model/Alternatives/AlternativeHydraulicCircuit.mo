within ScalableTranslationStatistics.Fluid.Model.Alternatives;
model AlternativeHydraulicCircuit
  "Scale Nonlinear Systems of euqations for a liquid circuit"
  extends Modelica.Icons.Example;
  parameter Integer numNLequations[:] = {2,5,3,4} "sizes of each nonlinear system of equations";
  parameter Integer numJacobians = 8 "number of numerical Jacobians to be inserted (maximum: number of nonlinear equation systems -1)";
  parameter Integer numStates = 6;

  Components.Boundaries.Boundary_Pressure boundary_Pressure[max(0,
    numNLequationSystems - numStates)] annotation (Placement(transformation(
        extent={{12,-11},{-12,11}},
        rotation=0,
        origin={90,-35})));
  Components.LinearComponents.PressureLossTube_Linear pressureLossTube_Linear[
    max(0, numStates - numNLequationSystems)]
    annotation (Placement(transformation(extent={{30,-100},{66,-64}})));

  Components.AssembledComponents.TubePumpNetwork tubePumpNetwork[
    numNLequationSystems](numNLequations=numNLequations, withNumericJacobian=
        insertJacobian)
    annotation (Placement(transformation(extent={{-68,-12},{0,56}})));

  Components.TwoPortVolume twoPortVolume[numStates]
    annotation (Placement(transformation(extent={{40,12},{60,32}})));
  Components.AssembledComponents.TubePumpNetwork tubePumpNetwork1[0]
    annotation (Placement(transformation(extent={{-70,-102},{-26,-58}})));
  Components.TwoPortVolume twoPortVolume1[0]
    annotation (Placement(transformation(extent={{36,-44},{56,-24}})));
protected

  parameter Integer numNLequationSystems=size(numNLequations,1);
  parameter Integer SerialSetup = min(numNLequationSystems, numStates);
  parameter Integer numberNumericJacobians = min([numJacobians,numNLequationSystems]);
  parameter Boolean[numNLequationSystems] insertJacobian = cat(1,fill(true,numberNumericJacobians), fill(false,numNLequationSystems-numberNumericJacobians));
equation
  for i in 1:SerialSetup  loop
    connect(tubePumpNetwork[i].fluidPortOut, twoPortVolume[i].fluidPortIn) annotation (Line(points={{0.68,22},
            {40,22}},                                                                                                 color={102,44,145}));
  end for;
  for i in 1:SerialSetup-1  loop
    connect(twoPortVolume[i].fluidPortOut, tubePumpNetwork[i+1].fluidPortIn);
  end for;
  connect(twoPortVolume[end].fluidPortOut, tubePumpNetwork[1].fluidPortIn)   annotation (Line(points={{60,22},
          {84,22},{84,80},{-90,80},{-90,22},{-68.68,22}},
        color={102,44,145}));

  for i in 1:(numNLequationSystems-numStates) loop
    connect(boundary_Pressure[i].fluidPortOut,tubePumpNetwork[i+numStates].fluidPortIn);
    connect(boundary_Pressure[i].fluidPortOut,tubePumpNetwork[i+numStates].fluidPortOut);
  end for;
  for i in 1:(numStates-numNLequationSystems) loop
    connect(pressureLossTube_Linear[i].fluidPortOut,twoPortVolume[i+numNLequationSystems].fluidPortIn);
    connect(pressureLossTube_Linear[i].fluidPortIn, twoPortVolume[i +
      numNLequationSystems].fluidPortOut);
  end for;

annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
        preserveAspectRatio=false), graphics={
        Line(points={{56,-34},{78,-34},{78,-82},{60,-82}}, color={102,44,145}),
        Line(points={{36,-34},{14,-34},{14,-82},{32,-82}}, color={102,44,145}),
        Line(points={{-24,-80},{-8,-80},{-8,-40},{-82,-40},{-82,-80},{-72,-80}},
            color={102,44,145}),
        Rectangle(extent={{-80,66},{74,-10}}, lineColor={238,46,47}),
        Text(
          extent={{-70,70},{64,50}},
          textColor={238,46,47},
          textString="%SerialSetup% x in series"),
        Rectangle(extent={{-94,-22},{2,-100}},lineColor={238,46,47}),
        Text(
          extent={{-100,-14},{10,-22}},
          textColor={238,46,47},
          textString="for additional nonlinear systems of equations"),
        Rectangle(extent={{8,-22},{96,-100}},lineColor={238,46,47}),
        Text(
          extent={{4,-14},{114,-22}},
          textColor={238,46,47},
          textString="for additional states")}),
  experiment(StopTime=1, __Dymola_Algorithm="Dassl"),
  __Dymola_experimentSetupOutput(equidistant=false),
  __Dymola_experimentFlags(
    Advanced(GenerateVariableDependencies=false, OutputModelicaCode=true),
    Evaluate=false,
    OutputCPUtime=true,
    OutputFlatModelica=false),
    Documentation(info="<html>
<p>This is a fluid representation of the Scalable Translation Statistics model.</p>
<p>It is limited to the parametric variation of:</p>
<ul>
<li>Number of nonlinear equation systems</li>
<li>Size of each nonlinear equation system</li>
<li>Number of numeric Jacobians for the equation systems</li>
<li>Number of states</li>
</ul>
<p><br>These attributes can be set by the parameters :</p>
<p><span style=\"font-family: Courier New;\">numNLequations[:]&nbsp;=&nbsp;{2,5,3,4}&nbsp;==&gt; This will result in four nonlinear equation systems with 2,5,3 or 4 iteration variables after tearing</span></p>
<p><span style=\"font-family: Courier New;\">numJacobians = 2 ; ==&gt; Two of the nonlinear equation systems defined by numNLequations will have numeric Jacobians</span></p>
<p><span style=\"font-family: Courier New;\">numStates = 6 ; ==&gt; The model will have six continuous state variables</span></p>
<p><br><br><span style=\"font-family: Courier New;\">In the Fluid representation this is done by a parallel order of tubes with a nonlinear pressure-drop - massflow relationship.</span></p>
<p><span style=\"font-family: Courier New;\">The number of parallel tubes (always serial with a pump-model) gives the size one nonlinear equation system.</span></p>
<p><span style=\"font-family: Courier New;\">These tube-pump-system can be serially repeated to get more nonlinear equation systems. Therefore a state (represented by a volume) must be inserted to separate the single systems of equations.</span></p>
<p><span style=\"font-family: Courier New;\">If the number of equation systems and the number of states are not equal, for each surplus equation system a small independent fluid circuit with parallel pipes and a pump will be added, each giving one nonlinear equation system. For each surplus state a single independent fluid circuit with a volume and a linear pipe is added to the system.</span></p>
</html>"));
end AlternativeHydraulicCircuit;
