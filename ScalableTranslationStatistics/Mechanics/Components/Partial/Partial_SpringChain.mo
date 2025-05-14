within ScalableTranslationStatistics.Mechanics.Components.Partial;
model Partial_SpringChain
  //extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
  extends Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges;
  parameter Integer num_springs=2 "number of springs";
  parameter Modelica.Units.SI.Position s_start=0 "initial deflection";
  parameter Boolean insert_Jacobian = false "introduce a numerical jacobian";
  replaceable Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges spring[N];

protected
  parameter Integer N=if insert_Jacobian==true then num_springs else num_springs+1;
  // without a implied numeric Jacobian, Dymola gets resolved one equation
  // (e.g. 3 springs gives a system of 2 equations), with numeric Jacobian each spring gives an equation. So one spring less is needed then.
equation
  for i in 2:N loop
    connect(spring[i - 1].flange_b, spring[i].flange_a);
  end for;
  connect(spring[1].flange_a, flange_a);
  connect(spring[N].flange_b, flange_b);
  annotation (Icondetail_switch(components(subcomponents(
              nonlinearSpring(                                           coordinateSystem(preserveAspectRatio=false))))),
      Diagram(coordinateSystem(preserveAspectRatio=false)),
    Icon(graphics={
        Line(
          points={{-98,0},{-50,0}},
          color={0,127,0},
          thickness=0.5),
        Line(
          points={{48,0},{100,0}},
          color={0,127,0},
          thickness=0.5),
        Rectangle(
          extent={{-62,38},{64,-40}},
          lineColor={0,0,0},
          pattern=LinePattern.Dash),
        Text(
          extent={{-34,50},{32,38}},
          textColor={0,0,0},
          textString="%num_springs% springs")}),
    Documentation(info="<html>
<p>partial model to build a chain of springs in a row</p>
<p>the model of the springs itself (e.g. linear, nonlinear, ... springs) can be redefined </p>
<p>The number of springs in the chain is defined by the parameter &quot;num_springs&quot;</p>
</html>"));
end Partial_SpringChain;
