within ScalableTranslationStatistics.Mechanics.Components.Subcomponents;
model DiscreteStiffnessSpring
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
  parameter Modelica.Units.SI.Position s_steps[:] "spring deflection at which the stiffness changes discretly (step)";

  parameter Modelica.Units.SI.TranslationalSpringConstant[size(s_steps,1)+1] stiffness "vector of different stiffness between the steps, this vector must be one element larger than 's_steps'";

  discrete Modelica.Units.SI.TranslationalSpringConstant c(final min=0)
    "Spring constant";

  parameter Modelica.Units.SI.Position s_rel0=0 "Unstretched spring length";

  parameter Boolean include_Jacobi = false "introduce a numerical jacobian";
protected
  Modelica.Units.SI.Position s_abscissa;
  Modelica.Units.SI.Velocity v_rel;
  Integer mode;
    parameter Modelica.Units.SI.Position s_fullsteps[:]=cat(1,{0},s_steps);
  parameter Modelica.Units.SI.Force maxForce = 1e20 "upper limit for the spring force";
  //parameter Modelica.Units.SI.Force initialForce;
  function limit = Utilities.LimitationFunction;
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(table=transpose({s_fullsteps,1:size(s_fullsteps,1)}),
      extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-22,18},{-2,38}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=abs(s_rel-s_rel0))
    annotation (Placement(transformation(extent={{-56,18},{-36,38}})));
initial equation
    c = stiffness[mode];
    s_abscissa=Utilities.InitialForce(
            mode,
            stiffness,
            s_fullsteps,
            s_rel0)/c - s_rel0;
equation
  //  mode = number of section in the stiffness table
  mode=integer(combiTable1Ds.y[1]+1e-4);
  if include_Jacobi then
    limit(f,maxForce)  = c*(s_rel-s_abscissa-s_rel0);
  else
    // spring stiffness depends on the deflection of the spring
    f  = c*(s_rel-s_abscissa-s_rel0);
  end if;
  der(s_abscissa) = 0;
  // reinitialization when mode changes
  v_rel=der(s_rel);

  when change(mode) then

    c = stiffness[mode];
    reinit(s_abscissa,
    if mode>1 then
      if s_rel-s_rel0 >=0 then
        if v_rel>0 then
          s_fullsteps[mode] - pre(f) / stiffness[mode]
        else
          s_fullsteps[mode+1] - pre(f) / stiffness[mode]
      else
        if v_rel>0 then
          (-1)*s_fullsteps[mode+1] - pre(f) / stiffness[mode]
        else
          (-1)*s_fullsteps[mode] - pre(f) / stiffness[mode]
    else
       0);
 end when;
  connect(realExpression.y, combiTable1Ds.u)
    annotation (Line(points={{-35,28},{-24,28}}, color={0,0,127}));
  annotation (Icon(graphics={
        Line(
          points={{-62,-48},{-36,-48},{-36,28},{-6,28},{-6,-18},{20,-18},{20,10},
              {60,10}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-64,70},{-64,-66},{76,-66}},
          color={0,0,0},
          thickness=0.5,
          arrow={Arrow.Filled,Arrow.Filled}),
        Text(
          extent={{-78,72},{-66,60}},
          textColor={0,0,0},
          textString="c"),
        Text(
          extent={{68,-68},{80,-80}},
          textColor={0,0,0},
          textString="s")}), Documentation(info="<html>
<p>This model represents a spring with discrete characteristics (stiffness over deflection)</p>
<p>at given deflections (s_steps) the stiffness changes discretely. Thus, reinitializations of the stiffness are necessary.</p>
<p><img src=\"modelica://ScalableTranslationStatistics/Resources/parametrize_discreteStiffness.png\", width=1000> </p>
<p>The same stiffness is applied for positive and negative deflections of the spring.</p>
</html>"));
end DiscreteStiffnessSpring;
