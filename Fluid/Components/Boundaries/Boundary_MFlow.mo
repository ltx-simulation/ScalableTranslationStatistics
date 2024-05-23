within ScalableTranslationStatistics.Fluid.Components.Boundaries;
model Boundary_MFlow

  parameter Modelica.Units.SI.MassFlowRate m_flow = -1;
  Interfaces.FluidPortIn fluidPortOut
    annotation (Placement(transformation(extent={{92,-10},{112,10}})));
equation
  // fixed mass flow used as boundary
  fluidPortOut.m_flow= m_flow;
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
        Polygon(
          points={{4,72},{6,72},{10,68},{16,72},{16,56},{14,56},{14,68},{10,66},
              {6,70},{6,56},{4,56},{4,72}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={238,46,47})}), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end Boundary_MFlow;
