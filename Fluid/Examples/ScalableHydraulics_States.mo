within ScalableTranslationStatistics.Fluid.Examples;
model ScalableHydraulics_States
  "Scale Nonlinear Systems of euqations for a liquid circuit"
  extends Modelica.Icons.Example;
  parameter Integer numNLequations[:] = {2,5,3,4} "sizes of each nonlinear system of equations";
  parameter Integer numJacobians = 8 "number of numerical Jacobians to be inserted (maximum: number of nonlinear equation systems -1)";
  parameter Integer numStates = 6;

  Components.Boundaries.Boundary_Pressure boundary_Pressure[max(0,
    numNLequationSystems - numStates)] annotation (Placement(transformation(
        extent={{12,-11},{-12,11}},
        rotation=0,
        origin={86,61})));

  Components.LinearComponents.PressureLossTube_Linear pressureLossTube_Linear[
    max(0, numStates - numNLequationSystems)]
    annotation (Placement(transformation(extent={{-12,-62},{12,-36}})));

  Components.AssembledComponents.TubePumpNetworkAlt tubePumpNetwork[
    numNLequationSystems](numNLequations=numNLequations, withNumericJacobian=
        insertJacobian)
    annotation (Placement(transformation(extent={{-60,40},{-18,82}})));

  Components.TwoPortVolume twoPortVolume[numStates]
    annotation (Placement(transformation(extent={{4,40},{24,60}})));
protected

  parameter Integer numNLequationSystems=size(numNLequations,1);
  parameter Integer numberNumericJacobians = min([numJacobians,numNLequationSystems]);
  parameter Boolean[numNLequationSystems] insertJacobian = cat(1,fill(true,numberNumericJacobians), fill(false,numNLequationSystems-numberNumericJacobians));
equation
  for i in 1:min(numNLequationSystems, numStates)  loop
    connect(tubePumpNetwork[i].fluidPortOut, twoPortVolume[i].fluidPortIn);
  end for;
  for i in 1:min(numNLequationSystems, numStates)-1  loop
    connect(twoPortVolume[i].fluidPortOut, tubePumpNetwork[i+1].fluidPortIn);
  end for;
  connect(twoPortVolume[end].fluidPortOut, tubePumpNetwork[1].fluidPortIn);

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
        preserveAspectRatio=false)),
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
</ul>
<p><br>These attributes can be set by the parameters :</p>
<p><span style=\"font-family: Courier New;\">numNLequations[:]&nbsp;=&nbsp;{2,5,3,4}&nbsp;==&gt; This will result in four nonlinear equation systems with 2,5,3 or 4 iteration variables after tearing</span></p>
<p><span style=\"font-family: Courier New;\">numJacobians = 2 ; ==&gt; Two of the nonlinear equation systems defined by numNLequations will have numeric Jacobians</span></p>
<p><br><br><span style=\"font-family: Courier New;\">In the Fluid representation this is done by a parallel order of tubes with a nonlinear pressure-drop - massflow relationship.</span></p>
<p><span style=\"font-family: Courier New;\">The number of parallel tubes (always serial with a pump-model) gives the size one nonlinear equation system.</span></p>
<p><span style=\"font-family: Courier New;\">These tube-pump-system can be serially repeated to get more nonlinear equation systems. Therefore - contrary to the mechanical example - a state (represented by a volume) must be inserted to separate the single systems of equations. That&apos;s why in the fluid representation the continuous time states can not be parametrized indepenently.</span></p>
</html>"));
end ScalableHydraulics_States;
