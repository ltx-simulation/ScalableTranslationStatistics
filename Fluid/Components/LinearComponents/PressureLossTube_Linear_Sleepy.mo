within ScalableTranslationStatistics.Fluid.Components.LinearComponents;
model PressureLossTube_Linear_Sleepy

  Real delta_p(nominal=1e5) "pressure drop in tube";

  Real mdot(start=0.01, nominal = 100) "mass flow rate";
  parameter Real delta_p_nom = 200000 "pressure drop at nominal mass flow";
  parameter Real mdot_nom = 0.5 "nominal mass flow";

  Interfaces.FluidPortOut fluidPortIn "inlet port"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Interfaces.FluidPortIn fluidPortOut "outlet port"
    annotation (Placement(transformation(extent={{-108,-10},{-88,10}})));
  parameter Integer compiler_type = 1 "1=visual studio, 2=gcc";
  parameter Real waiting_time = 50 "waiting time in milliseconds";
protected
  function WaitingVS = Utilities.SleepVS "waiting function for Visual Studio Compiler";
  function WaitingGCC =Utilities.SleepGCC "waiting function for gcc Compiler";
equation
  if waiting_time>0 then
    if compiler_type==1 then
      WaitingVS(waiting_time*1000);
    else
      WaitingGCC(waiting_time*1000);
    end if;
  end if;

  // mass flow coming from inlet
  mdot=fluidPortIn.m_flow;
  // mass balance
  fluidPortIn.m_flow + fluidPortOut.m_flow = 0;
  // pressure drop between inlet and outlet
  fluidPortIn.p = fluidPortOut.p + delta_p;

  // mass flow - pressure drop relation
  mdot = ( mdot_nom / delta_p_nom)  * delta_p;

  annotation (                      Diagram(coordinateSystem(
          preserveAspectRatio=false)),
    experiment(Interval=0.4, __Dymola_Algorithm="Dassl"),
    Icon(graphics={Rectangle(
          extent={{-100,40},{100,-40}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={170,85,255}),
        Text(
          extent={{-88,8},{-6,-88}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="Z"),
        Text(
          extent={{-42,38},{42,-32}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="Z"),
        Text(
          extent={{16,60},{58,12}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="Z")}));
end PressureLossTube_Linear_Sleepy;
