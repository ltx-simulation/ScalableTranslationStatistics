within ScalableTranslationStatistics.Fluid.Components.Boundaries;
model Boundary_MassFlow

  parameter Modelica.Units.SI.MassFlowRate m_flow_const = -1 "constant mass flow across this boundary" annotation(Dialog(enable= not use_input));
    parameter Boolean use_input=false   "use pressure input";
  Modelica.Blocks.Interfaces.RealInput m_flow if use_input
    annotation (Placement(transformation(extent={{-40,-16},{-8,16}}),
        iconTransformation(extent={{-40,-16},{-8,16}})));

  Interfaces.FluidPortIn fluidPortOut
    annotation (Placement(transformation(extent={{92,-10},{112,10}})));
protected
  Modelica.Blocks.Interfaces.RealInput m_flow_internal;
equation
  // fixed mass flow used as boundary
  fluidPortOut.m_flow= if use_input then m_flow_internal else m_flow_const;
  connect(m_flow,m_flow_internal);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{0,80},{20,-80}},
          lineColor={102,44,145},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),  Line(
          points={{100,0},{20,0},{18,0}},
          color={102,44,145},
          thickness=1),
        Text(
          extent={{-42,76},{-14,26}},
          textColor={102,44,145},
          textString="m")}),        Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end Boundary_MassFlow;
