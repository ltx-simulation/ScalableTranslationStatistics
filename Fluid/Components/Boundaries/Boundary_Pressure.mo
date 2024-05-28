within ScalableTranslationStatistics.Fluid.Components.Boundaries;
model Boundary_Pressure

  parameter Modelica.Units.SI.Pressure p_const=101300   "pressure boundary value" annotation(Dialog(enable=not use_input));
  parameter Boolean allow_massflow = true "is mass flow allowed across the boundary";
  parameter Boolean use_input=false   "use pressure input";
  Interfaces.FluidPortOut fluidPortOut
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput p if use_input
    annotation (Placement(transformation(extent={{-40,-16},{-8,16}}),
        iconTransformation(extent={{-40,-16},{-8,16}})));
protected
  Modelica.Blocks.Interfaces.RealInput p_internal;

equation
  // set pressure boundary
  fluidPortOut.p =  if not use_input then p_const else p_internal;

  // if no mass flow across the boundry is allowed, set m_flow to zero.
  if not allow_massflow then
    fluidPortOut.m_flow = 0;
  end if;
  connect(p,p_internal);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{0,80},{20,-80}},
          lineColor={28,108,200},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={170,85,255}),  Line(
          points={{100,0},{20,0},{18,0}},
          color={102,44,145},
          thickness=1),
        Text(
          extent={{-40,68},{-14,38}},
          textColor={102,44,145},
          textString="p")}),        Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end Boundary_Pressure;
