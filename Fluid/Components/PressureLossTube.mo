within ScalableTranslationStatistics.Fluid.Components;
model PressureLossTube

  Real delta_p(nominal=1e5) "pressure drop in tube";

  Real mdot(start=0.01, nominal = 100) "mass flow rate";
  parameter Real delta_p_nom = 200000 "pressure drop at nominal mass flow";
  parameter Real mdot_nom = 0.5 "nominal mass flow";
  Interfaces.FluidPortOut fluidPortIn "inlet port"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Interfaces.FluidPortIn fluidPortOut "outlet port"
    annotation (Placement(transformation(extent={{-108,-10},{-88,10}})));
equation

  // mass flow coming from inlet
  mdot=fluidPortIn.m_flow;
  // mass balance
  fluidPortIn.m_flow + fluidPortOut.m_flow = 0;
  // pressure drop between inlet and outlet
  fluidPortIn.p = fluidPortOut.p + delta_p;

  // mass flow - pressure drop relation
  delta_p / delta_p_nom = (mdot/mdot_nom)^3;

  annotation (                      Diagram(coordinateSystem(
          preserveAspectRatio=false)),
    experiment(Interval=0.4, __Dymola_Algorithm="Dassl"),
    Icon(graphics={Rectangle(
          extent={{-100,40},{100,-40}},
          lineColor={102,44,145},
          fillPattern=FillPattern.HorizontalCylinder), Text(
          extent={{-42,34},{38,-38}},
          textColor={255,255,255},
          textString="R")}));
end PressureLossTube;
