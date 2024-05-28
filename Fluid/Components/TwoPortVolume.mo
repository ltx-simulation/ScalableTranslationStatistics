within ScalableTranslationStatistics.Fluid.Components;
model TwoPortVolume

  parameter Modelica.Units.SI.Volume V = 1 "Volume";
  Modelica.Units.SI.Mass m "mass of Medium in Volume";
  Modelica.Units.SI.Pressure p( start=p_start, nominal =1e5) "pressure of volume";
  parameter Modelica.Units.SI.Pressure p_start =101300 "initial pressure";
  parameter Modelica.Units.SI.Temperature T = 298.15 "fixed Temperature";
  parameter Real M = 0.028964 "molar mass of medium (value for air)";

  Interfaces.FluidPortIn fluidPortIn annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}), iconTransformation(
          extent={{-110,-10},{-90,10}})));
  Interfaces.FluidPortOut fluidPortOut
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput m_Volume annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-106})));
initial equation
  //initial pressure
  p=p_start;
equation
  // mass balance
  der(m)= fluidPortIn.m_flow+fluidPortOut.m_flow;
  //ideal gas equation
   p * V = m * Modelica.Constants.R/M * T;

   fluidPortIn.p=p;
   fluidPortOut.p=p;

   m_Volume=m;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                Ellipse(
        extent={{-100,100},{100,-100}},
        fillPattern=FillPattern.Sphere,
        fillColor={170,85,255})}),  Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end TwoPortVolume;
