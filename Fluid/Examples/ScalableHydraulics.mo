within ScalableTranslationStatistics.Fluid.Examples;
model ScalableHydraulics "Scale Nonlinear Systems of euqations for a liquid circuit"
  extends Modelica.Icons.Example;
  parameter Integer numNLequations[:] = {2,5,3,4} "sizes of each nonlinear system of equations";
  parameter Integer numJacobians = 2 "number of numerical Jacobians to be inserted (maximum: number of nonlinear equation systems -1)";

  Components.AssembledComponents.ParallelResistors parallelResistors(nParallel=
        numNLequations[end])
    annotation (Placement(transformation(extent={{16,-84},{44,-56}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=100)
  annotation (Placement(transformation(extent={{-48,40},{-28,60}})));
  Components.NonlinearComponents.PressureIncreasePump pressureIncreasePump3(
      redeclare function CalcDensity = Media.CalcDensitySimple) annotation (
      Placement(transformation(
        extent={{-16,16},{16,-16}},
        rotation=180,
        origin={2,20})));
  Components.Boundaries.Boundary_Pressure boundary_Pressure annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={60,34})));
  Components.AssembledComponents.TubePumpNetwork[numNLequationSystems - 1]
    nLSystem(numNLequations=numNLequations_sys, withNumericJacobian=
        insertJacobian) annotation (Placement(transformation(rotation=0, extent
          ={{-54,-98},{2,-42}})));

protected
  parameter Integer numNLequations_sys[:] = numNLequations[1:end-1];
  parameter Integer numNLequationSystems=size(numNLequations,1);
  parameter Integer numberNumericJacobians = min([numJacobians,numNLequationSystems-1]);
  parameter Boolean[numNLequationSystems-1] insertJacobian = cat(1,fill(true,numberNumericJacobians), fill(false,numNLequationSystems-numberNumericJacobians-1));
equation
  for i in 2:numNLequationSystems-1 loop

connect(nLSystem[i].fluidPortIn,nLSystem[i-1].fluidPortOut);
  end for;

  connect(realExpression.y, pressureIncreasePump3.n)
    annotation (Line(points={{-27,50},{2,50},{2,37.28}},  color={0,0,127}));
  connect(parallelResistors.fluidPortOut, boundary_Pressure.fluidPortOut)
    annotation (Line(points={{44.28,-70},{60,-70},{60,24}},  color={102,44,145}));
  connect(boundary_Pressure.fluidPortOut, pressureIncreasePump3.fluidPortIn)
    annotation (Line(points={{60,24},{60,20},{18,20}}, color={102,44,145}));
  connect(pressureIncreasePump3.fluidPortOut, nLSystem[1].fluidPortIn)
    annotation (Line(points={{-14.32,20},{-64,20},{-64,-70},{-54.56,-70}},
                                                                     color={102,
          44,145}));
  connect(nLSystem[numNLequationSystems-1].fluidPortOut, parallelResistors.fluidPortIn)
    annotation (Line(points={{2.56,-70},{15.72,-70}},color={102,44,145}));
annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
        preserveAspectRatio=false), graphics={Text(
          extent={{-56,-40},{-12,-54}},
          textColor={127,0,127},
          textString="%numNLequationSystems%x")}),
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
end ScalableHydraulics;
