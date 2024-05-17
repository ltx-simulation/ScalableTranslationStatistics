within ScalableTranslationStatistics.Mechanics.Components.Subcomponents;
model TwoDimSpring
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a2
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b2
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(extent={{92,-10},{112,10}})));
  Modelica.Units.SI.Position s_rel[2](each start=0)
    "Relative distance (= flange_b.s - flange_a.s)";
  Modelica.Units.SI.Force f[2]
    "Force between flanges (positive in direction of flange axis R)";
    Modelica.Units.SI.Force f_res[2];
  parameter Modelica.Units.SI.TranslationalSpringConstant c(final min=0, start=1)
    "Spring constant";
  function limit =Functions.LimitationFunction;
  parameter Boolean insert_Jacobian = false "Add a numerical Jacobian";

equation
  s_rel[1] =flange_b.s - flange_a.s;
  s_rel[2] = flange_b2.s - flange_a2.s;
  flange_b.f = f[1];
  flange_a.f = -f[1];
  flange_b2.f = f[2];
  flange_a2.f = -f[2];

  f_res = [c,0.1*c;0.2*c,c]*(s_rel);

  if insert_Jacobian then
    f[1]=limit(f_res[1],1e20);
    f[2]=f_res[2];
  else
    f=f_res;
  end if;
  annotation (                                 Icon(graphics={
        Ellipse(
          extent={{-20,40},{20,-40}},
          lineColor={28,108,200},
          fillPattern=FillPattern.CrossDiag,
          fillColor={0,140,72}),
        Line(
          points={{-34,-2},{-24,30},{-4,-32},{16,30},{26,-2}},
          color={0,140,72},
          thickness=0.5,
          origin={-2,74},
          rotation=90),
        Line(
          points={{-6,-2},{2,30},{22,-30},{42,30},{52,6.32115e-15}},
          color={0,140,72},
          thickness=0.5,
          origin={0,-92},
          rotation=90),
        Line(
          points={{-100,0},{-90,30},{-70,-30},{-50,30},{-30,-30},{-20,0}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{20,0},{30,32},{50,-32},{70,32},{90,-30},{100,0}},
          color={0,140,72},
          thickness=0.5)}));
end TwoDimSpring;
