within ScalableTranslationStatistics.Fluid.Components.Boundaries;
model Boundary_Pressure

  parameter Modelica.Units.SI.Pressure p = 101300 "pressure boundary value";
  parameter Boolean allow_massflow = true "is mass flow allowed across the boundary";

  Interfaces.FluidPortOut fluidPortOut
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  // set pressure boundary
  fluidPortOut.p= p;

  // if no mass flow across the boundry is allowed, set m_flow to zero.
  if not allow_massflow then
    fluidPortOut.m_flow = 0;
  end if;

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
          extent={{-42,98},{66,84}},
          textColor={102,44,145},
          textString="p")}),        Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end Boundary_Pressure;
