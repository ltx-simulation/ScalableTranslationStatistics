within ScalableTranslationStatistics.Fluid.Interfaces;
connector FluidPort
  "Interface for quasi one-dimensional fluid flow in a piping network (incompressible or compressible, one or more phases, one or more substances)"
  Modelica.Units.SI.AbsolutePressure p "Thermodynamic pressure in the connection point";
  flow Modelica.Units.SI.MassFlowRate m_flow
    "Mass flow rate from the connection point into the component";

  annotation();
end FluidPort;
