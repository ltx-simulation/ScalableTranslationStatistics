within ScalableTranslationStatistics.Fluid.Components.LinearComponents;
model PressureIncreasePump_Linear

  Real delta_p(nominal=1e5) "pressure difference between inlet and outlet";
  Real mdot "mass flow through pump";
  Real vdot "volume flow through pump";

  parameter Real delta_p_nom = 200000 "nominal pressure increase in pump";
  parameter Real mdot_nom = 0.5 "nominal mass flow art nominal pressure increase";
  parameter Real rho = 1 "constant density of the fluid";
  Real vdot_nom = mdot_nom/rho "nominal volume flow";
  parameter Real n_nom = 10 "nominal rotational speed";
  parameter Boolean use_input = false;
  parameter Real n_const = 10 "constant rotational speed if no input given" annotation(Dialog(enable = not use_input));

  Interfaces.FluidPortIn fluidPortIn "inlet port"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  Interfaces.FluidPortOut fluidPortOut "outlet port"
    annotation (Placement(transformation(extent={{92,-10},{112,10}}),
        iconTransformation(extent={{92,-10},{112,10}})));

  Modelica.Blocks.Interfaces.RealInput n if use_input "rotational speed of pump" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,108})));
  /*replaceable function CalcDensity = Media.BaseDensityFunction
    constrainedby Media.BaseDensityFunction                                           annotation(choicesAllMatching=true);
    */
    protected
 Modelica.Blocks.Interfaces.RealInput n_internal;

equation
  // mass flow coming from inlet
  mdot=fluidPortIn.m_flow;

  // mass-flow-balance
  fluidPortIn.m_flow+fluidPortOut.m_flow=0;

  // "pressure difference"
  fluidPortIn.p=fluidPortOut.p-delta_p;

  // volume flow calculated from mass flow
  vdot = mdot/rho;

  // mass flow - pressure drop relation
  delta_p / delta_p_nom = (n_internal/n_nom) *
                          (1-((vdot*n_nom)/(vdot_nom*n_internal)));
  connect(n, n_internal);
  if not use_input then
    n_internal = n_const;
  end if;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,40},{100,-40}},
          lineColor={102,44,145},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={170,85,255}),
        Ellipse(
          extent={{-80,82},{80,-80}},
          lineColor={102,44,145},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255},
          lineThickness=1),
        Line(
          points={{-54,60},{80,10}},
          color={102,44,145},
          thickness=1),
        Line(
          points={{-52,-60},{80,-10}},
          color={102,44,145},
          thickness=1),
        Text(
          extent={{10,140},{68,92}},
          textColor={20,79,145},
          textString="n")}),                                     Diagram(coordinateSystem(
          preserveAspectRatio=false)),
    experiment(StopTime=1));
end PressureIncreasePump_Linear;
